import random

import pandas as pd
import numpy as np
from numpy.linalg import norm
import math
# from sklearn.feature_extraction.text import TfidfVectorizer
import warnings
from tqdm import tqdm

warnings.filterwarnings('ignore')


def compute_similarity(w1, w2, word_model):
    # 可以根据需要调整
    V = word_model.transform([w1, w2])
    v1, v2 = np.asarray(V.todense())
    return np.dot(v1, v2) / (norm(v1) * norm(v2))

# 基于信誉改进的CRH算法
class RCRH(object):
    def __init__(self,
                 source_col='src_id',
                 fact_col='state',
                 task_col='contract_id',
                 null_value="---",
                 mu=0.5,
                 rho=0.6,
                 gamma=0.8,
                 rep=None,
                 roll=0.5,
                 fi=0.5,
                 fa=1):
        if rep is None:
            rep = {}
        self.Rep=rep
        self.source_col = source_col
        self.fact_col = fact_col
        self.task_col = task_col
        self.rho = rho
        self.gamma = gamma
        self.NULL_Value = null_value
        # 增加一个调整参数
        self.mu = mu
        # 增加对信誉值的调节参数
        self.roll=roll
        self.fi = fi
        self.fa = fa

        # 后续需要使用词向量计算事实项之间相似度
        # vectorizer = TfidfVectorizer(min_df=1)
        # self.word_model = vectorizer

    # 设置初始化的一个真值表，随机选择
    def setinit_x_m(self):
        self.x_m = {}

        maxv = max(self.Rep.values())
        maxul=""
        for ul in self.Rep:
            if self.Rep[ul] == maxv and len(self.data[self.data["source"]== ul])==len(self.task_list):
                maxul=ul


        for key in self.task_list:
            keyvals = self.data.groupby(self.task_col).get_group(key)
            if keyvals.size == 0:
                self.x_m[key] = self.NULL_Value
            else:
                self.x_m[key] = keyvals.query('source==@maxul & task==@key')["fact"].values[0]


    def sum_data(self, vals,ul, func):
        sum_x = 0
        for key in vals:
            sum_x += func(*key)/self.Rep[ul]
            # print(func(*key))
        return sum_x

    # 计算距离，这里默认为分类类型的数据
    def dis(self, x1, x2):
        # print(x1,x2)
        return self.min_lamda if x1 == x2 and x1 != self.NULL_Value else 1

    def cal_wk(self, data):
        vals = []
        groups = self.data.groupby(self.source_col)
        allsum = 0
        for userl in self.user_list:
            ga = groups.get_group(userl)
            for index, taskl in enumerate(self.task_list):
                gga = ga.loc[ga[self.task_col] == taskl, self.fact_col]
                x_km = self.NULL_Value
                if len(gga) != 0:
                    x_km = gga.iloc[0]
                if x_km != self.NULL_Value and self.x_m[taskl] != self.NULL_Value:
                    vals.append([x_km, self.x_m[taskl]])
            sum_x_k = self.sum_data(vals,userl, self.dis)
            if sum_x_k<=0:
                print(3543654)
            self.user_list[userl] = sum_x_k
            allsum += sum_x_k
            # print(vals)
            # print(sum_x_k)
            vals = []
        # print(self.user_list)
        for key in self.user_list:
            self.user_weight[key] = math.log2(allsum) - math.log2(self.user_list[key])
        # print(self.user_weight)

    def cal_x_weight(self):
        res = []
        for key in self.user_list:
            res.append(self.user_weight[key])
        return np.array(res)

    def update(self):
        # self.x_m = []
        keygroup = self.data.groupby([self.task_col, self.fact_col])
        keyvals = keygroup.count()
        keyvals["weight"] = 0
        for index, row in keyvals.iterrows():
            for key, row in keygroup.get_group(index).iterrows():
                # print(row[self.source_col])
                keyvals.loc[index, "weight"] += self.user_weight[row[self.source_col]]

        keyvals = keyvals.reset_index()
        # print(keyvals)
        for index, key in enumerate(self.task_list):
            ii = keyvals.loc[keyvals[self.task_col] == key, :]["weight"].idxmax()
            # print(self.x_m)
            self.x_m[key] = keyvals.loc[ii, self.fact_col]

    # 计算单个贡献度
    def con(self, x1, x2):
        # print(x1,x2)
        return 1 if x1 == x2 and x1 != self.NULL_Value else 0
    # 计算数据源整体贡献度
    def sum_rep(self, vals, func):
        sum_x = 0
        for key in vals:
            sum_x += func(*key)
        return sum_x

    # 计算最终贡献值
    def cal_EMA_rep(self,max):
    #     对中间rep进行归一化
        for urp in self.user_rep:
            self.user_rep[urp] = self.user_rep[urp]/max
    # 对根据EMA计算信誉值
        maxx=-100000000000
        # 使用动态阈值
        for urp in self.user_rep:
            if self.user_rep[urp] >= self.user_fa[urp]/max:
                self.Rep[urp] = (1-self.roll)*self.Rep[urp] + self.roll*self.user_rep[urp]
            else:
                self.Rep[urp] = (1 - self.roll) * self.Rep[urp] - self.roll *(1-self.user_rep[urp])* self.fi

            if self.Rep[urp] <= 0:
                self.Rep[urp]=0.1

        for urp in self.Rep:
            self.Rep[urp] = self.Rep[urp]

    # 更新信誉值
    def update_rep(self):
        vals = []
        groups = self.data.groupby(self.source_col)
        # 保留所有贡献度
        allsum = []
        max=-1
        self.user_fa={}

        for userl in self.user_list:
            ga = groups.get_group(userl)
            faa=0
            for index, taskl in enumerate(self.task_list):
                gga = ga.loc[ga[self.task_col] == taskl, self.fact_col]
                x_km = self.NULL_Value
                if len(gga) != 0:
                    x_km = gga.iloc[0]
                vals.append([x_km, self.x_m[taskl]])
                if x_km != self.NULL_Value:
                    faa+=1
            #     计算单个贡献度
            sigma = self.sum_rep(vals, self.con)
            if sigma>max:
                max=sigma
            self.user_rep[userl] = sigma
            self.user_fa[userl] = faa
            vals = []
        self.cal_EMA_rep(len(self.task_list))

    def train(self, data, task_list=None, user_list=None, init_weight=0.9, min_d=0.00000001, max_iter=200, thresh=1e-6):
        # 初始化数据
        if task_list == None:
            task_list = list(data[self.task_col].unique())
        if user_list == None:
            user_list = list(data[self.source_col].unique())
        self.task_list = {key: "" for key in task_list}
        self.user_list = {key: 0 for key in user_list}
        self.user_rep = {key: 0 for key in user_list}
        self.user_weight = {key: init_weight for key in user_list}
        # 设置参数，避免出现0值
        self.min_lamda = min_d
        # 初始化真实值
        self.data = data
        self.setinit_x_m()
        # 计算各个用户权重值

        self.cal_wk(data)
        t1 = self.cal_x_weight()
        epoch = 1
        for _ in tqdm(range(max_iter)):
            epoch += 1
            self.update()
            self.cal_wk(data)
            t2 = self.cal_x_weight()
            # print(data)
            if np.linalg.norm(t1 - t2) < thresh:
                self.update_rep()
                return self.x_m, epoch, self.Rep
            else:
                t1 = t2
        self.update_rep()
        return self.x_m, epoch , self.Rep


if __name__ == "__main__":
    df = pd.DataFrame([["a", "Einstein", "Special relativity"],
                       ["b", "Einstein", "Special relativity"],
                       ["c", "Galileo", "Special relativity"],

                       ["a", "Newton", "Universal gravitation"],
                       ["b", "Newton", "Universal gravitation"],
                       ["c", "Galileo", "Universal gravitation"],

                       ["a", "Galileo", "Heliocentrism"],
                       ["b", "Galileo", "Heliocentrism"],
                       ["c", "Newton", "Heliocentrism"],
                       ],

                      columns=["source", "fact", "task"])

    crh = RCRH()
    df = crh.train(df, ["Heliocentrism", "Special relativity", "Universal gravitation"], ["b", "a", "c"])
    print(df)
    # dd=df.groupby([crh.object_col])[crh.fact_conf_col].idxmax()
    # print(df)
    # result_df = df.loc[dd]
    # print(result_df)
