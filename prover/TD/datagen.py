import random
from enum import Enum, auto
import secrets

import pandas as pd
import numpy as np


class DataGenEnum(Enum):
    # 保存策略
    Data_toexcel= auto()
    # 不保存
    Data_nosave=auto()
    # 保存时文件名
    Data_Name=auto()
    #     基本策略：好节点的只给对的数据，错误节点只给错误数据
    Basepolicy = auto()
    #     攻击策略，错误节点给出的结果，并不全是错误数据。
    Halfpolicy= auto()
    # 攻击策略，生成不平衡的攻击数据
    NoBlacnepolicy=auto()



class DataGen(object):
    def __init__(self,
                 totalsources=100,
                 badsources=10,
                 tasks=100,
                 data_epoch=1000,
                 genpolicy=DataGenEnum.Basepolicy,
                 taskpre="task",
                 sourcepre="source",
                 factpre="fact",
                 truth_len=8,
                 bad_value= "____",
                 null_value="---",
                 data_save= DataGenEnum.Data_nosave,
                 data_name=DataGenEnum.Data_Name,
                 gen_badrate=0.5,
                 balance_rate=0.5,
                 columns=None):
        # 总节点数
        if columns is None:
            columns = ["source", "fact", "task"]
        self.totalsources = totalsources
        self.badsources = badsources
        self.tasks = tasks
        self.data_save=data_save
        self.data_name = data_name
        self.data_epoch=data_epoch
        self.genpolicy = genpolicy
        self.taskpre = taskpre
        self.sourcepre = sourcepre
        self.factpre = factpre
        self.columns = columns
        self.truth_len=truth_len
        self.bad_value=bad_value
        self.gen_badrate=gen_badrate
        self.balance_rate=balance_rate
        self.null_value=null_value

    def generate_random_hex_string(self, length):
        # 生成二进制数据
        random_bytes = secrets.token_bytes(length // 2)
        # 将二进制数据转换为16进制字符串
        random_hex_string = random_bytes.hex()
        return random_hex_string

    # 生成错误数据  +self.generate_random_hex_string(8)
    def gen_badvalue(self,i,j,flag=None):
        if self.genpolicy == DataGenEnum.Basepolicy:
            return ["bad_" + self.sourcepre + str(i), self.bad_value, self.taskpre + str(j)]
        else:
            if flag[j-1]==0:
                return ["bad_" + self.sourcepre + str(i), self.bad_value, self.taskpre + str(j)]
            else:
                return ["bad_" + self.sourcepre + str(i), self.real_truth[self.taskpre+str(j)], self.taskpre + str(j)]


    # 生成需要的数据
    def gendata(self):
        data = []
        # 数据真值生成
        # 生成数据列表，并给定真值
        self.real_truth = {}
        for i in range(1,self.tasks+1):
            self.real_truth[self.taskpre + str(i)] = self.generate_random_hex_string(self.truth_len)
        # print(self.real_truth)
        # 生成错误数据
        # flag=[random.sample([ 0 for ts in range(int(self.tasks*self.gen_badrate))]+
        #       [1 for t in range(self.tasks-int(self.tasks*self.gen_badrate))],self.tasks)
        #       for bs in range(self.badsources)]
        flag = random.sample([0 for ts in range(int(self.tasks * self.gen_badrate))] +
                              [1 for t in range(self.tasks - int(self.tasks * self.gen_badrate))], self.tasks)
        for i in range(self.badsources):
            for j in range(1,self.tasks+1):
                data.append(self.gen_badvalue(i,j,flag))
        # 生成正确数据
        for i in range(self.totalsources-self.badsources):
            for j in range(1,self.tasks+1):
                # 构建不平衡数据
                if i< (self.totalsources-self.badsources)*self.balance_rate and j<self.tasks*self.gen_badrate*self.balance_rate and self.genpolicy == DataGenEnum.NoBlacnepolicy:
                    # data.append(
                    #     [self.sourcepre + str(i), self.null_value, self.taskpre + str(j)])
                    cal=1
                else:
                    data.append([self.sourcepre+str(i),self.real_truth[self.taskpre+str(j)],self.taskpre+str(j)])
        # 数据保存，根据参数确认是否保存进excel文件
        df = pd.DataFrame(data,columns=self.columns)
        # df = df.sample(frac=1, random_state=42)
        if self.data_save==DataGenEnum.Data_toexcel:
            df.to_excel(self.data_name)
        # 返回数据
        return df

#     返回真值
    def getreal_truth(self):
        return self.real_truth

#     多轮数据生成
    def gen_multidata(self):
        data = []
        # 数据真值生成
        # 生成数据列表，并给定真值
        self.real_truth = {}
        for i in range(1, self.tasks + 1):
            self.real_truth[self.taskpre + str(i)] = self.generate_random_hex_string(self.truth_len)
        # print(self.real_truth)
        # 生成错误数据
        # flag=[random.sample([ 0 for ts in range(int(self.tasks*self.gen_badrate))]+
        #       [1 for t in range(self.tasks-int(self.tasks*self.gen_badrate))],self.tasks)
        #       for bs in range(self.badsources)]
        flag = random.sample([0 for ts in range(int(self.tasks * self.gen_badrate))] +
                             [1 for t in range(self.tasks - int(self.tasks * self.gen_badrate))], self.tasks)
        for i in range(self.badsources):
            for j in range(1, self.tasks + 1):
                data.append(self.gen_badvalue(i, j, flag))
        # 生成正确数据
        for i in range(self.totalsources - self.badsources):
            for j in range(1, self.tasks + 1):
                data.append([self.sourcepre + str(i), self.real_truth[self.taskpre + str(j)], self.taskpre + str(j)])
        # 数据保存，根据参数确认是否保存进excel文件
        df = pd.DataFrame(data, columns=self.columns)
        # df = df.sample(frac=1, random_state=42)
        if self.data_save == DataGenEnum.Data_toexcel:
            df.to_excel(self.data_name)
        # 返回数据
        return df

class MdataGen(object):
    def __init__(self,
                 totalsources=100,
                 badsources=10,
                 tasks=100,
                 data_epoch=1000,
                 genpolicy=DataGenEnum.Basepolicy,
                 taskpre="task",
                 sourcepre="source",
                 factpre="fact",
                 truth_len=8,
                 bad_value="___",
                 balancerate=0.5,
                 data_save=DataGenEnum.Data_nosave,
                 data_name=DataGenEnum.Data_Name,
                 gen_badrate_list=None,
                 columns=None):
        if gen_badrate_list==None:
            gen_badrate_list = [0,0,0,0,0.5,0.5,0,0,0]
        self.badratelist=gen_badrate_list
        self.mdatagen=DataGen(badsources=badsources, totalsources=totalsources, tasks=tasks,
                           genpolicy=genpolicy, gen_badrate=self.badratelist[0],balance_rate=balancerate,
                           data_save=data_save, data_name=data_name)

    def genmutildata(self):
        data =[]
        data_truth=[]
        for i in range(len(self.badratelist)):
            self.mdatagen.gen_badrate=self.badratelist[i]
            self.mdatagen.data_name=str(i)+"data.xlsx"
            data.append(self.mdatagen.gendata())
            data_truth.append(self.mdatagen.getreal_truth())
        return data,data_truth



if __name__== "__main__":
    datagen=DataGen()
    dd=datagen.gendata()
    print(dd)
    datagen.DataGen(badsources=5, totalsources=10, tasks=100,
                           genpolicy=datagen.DataGenEnum.Halfpolicy, gen_badrate=0.1,
                           data_save=datagen.DataGenEnum.Data_toexcel, data_name="data.xlsx")
