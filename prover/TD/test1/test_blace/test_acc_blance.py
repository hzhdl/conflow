import math
import random

import matplotlib

from TD import CRH, datagen, RCRH
# import TF
import pandas as pd
import time
import matplotlib.pyplot as plt
matplotlib.use('TkAgg')

def get_time(f):
    def inner(*arg, **kwarg):
        s_time = time.time()
        res = f(*arg, **kwarg)
        e_time = time.time()
        print('耗时：{}秒'.format(e_time - s_time))
        return res

    return inner

# def testTF(df, real_truth, col):
#     tf = TF.TruthFinderModel()
#     dd, epoch = tf.train(df)
#     acc = 0
#     for i in real_truth:
#         if real_truth[i] == dd[i]:
#             acc += 1
#     print("一共经过{}轮计算后，算法收敛。最终准确率为：{}".format(epoch, acc / len(real_truth)))
#     return dd


@get_time
def testCRH(df, real_truth, col):
    crh = CRH.CRH(task_col=col[2], source_col=col[0])
    dd, epoch = crh.train(df,init_weight=1, min_d=0.00000001, max_iter=200, thresh=1e-9)
    acc = 0
    for i in real_truth:
        if real_truth[i] == dd[i]:
            acc += 1
    print("一共经过{}轮计算后，算法收敛。最终准确率为：{}".format(epoch, acc / len(real_truth)))
    return dd

def polt_rep(data,x):
    # x=[i for i in range(len(list(data.keys())))]


    for url in data:
        plt.plot(x, data[url], label=url)

    # 设置标题、x轴和y轴标签
    plt.title('Multiple Line Chart')
    plt.xlabel('X-axis')
    plt.ylabel('Y-axis')

    # 添加图例
    legend = plt.legend()
    frame = legend.get_frame()
    frame.set_facecolor('white')

    # 显示图形
    plt.show()

@get_time
def testRCRH(df, real_truth, col):
    user_list = list(df[col[0]].unique())
    rep={ ui: 0 for ui in user_list}
    rep_polt={ui: [] for ui in user_list}
    for uii in rep_polt:
        rep_polt[uii].append(rep[uii])

    crh = RCRH.RCRH(task_col=col[2], source_col=col[0],rep=rep,roll=0.3,fa=1,fi=0.2)
    dd, epoch,Rep = crh.train(df,init_weight=1, min_d=0.00000001, max_iter=200, thresh=1e-9)

    for uii in rep_polt:
        rep_polt[uii].append(Rep[uii])
    x=[i for i in range(2)]
    polt_rep(rep_polt,x)

    acc = 0
    for i in real_truth:
        if real_truth[i] == dd[i]:
            acc += 1
    rmse=math.log(acc/len(real_truth))
    print("一共经过{}轮计算后，算法收敛。最终准确率为：{},均方误差为{}".format(epoch, acc / len(real_truth),rmse))
    return dd

@get_time
def testMutilCRH(df, real_truth, col):
    user_list = list(df[0][col[0]].unique())
    l = len(df)
    # 初始化信誉值


    # 保留每轮计算的数据
    epochs = []
    accs = []
    rmses=[]
    # 开始多轮计算
    for i in range(l):
        crh = CRH.CRH(task_col=col[2], source_col=col[0])
        dd, epoch = crh.train(df[i], init_weight=1, min_d=0.00000001, max_iter=200, thresh=1e-9)
        acc = 0
        for ii in real_truth[i]:
            if real_truth[i][ii] == dd[ii]:
                acc += 1
        # 更新并保留数据
        accs.append(acc / len(real_truth[i]))
        rmses.append(- math.log(acc / len(real_truth[i])))
        epochs.append(epoch)
        # print(dd)

    return epochs,accs,rmses


@get_time
def testMutilRCRH(df, real_truth, col):
    user_list = list(df[0][col[0]].unique())
    l = len(df)
    # 初始化信誉值
    rep={ ui: 0.5 for ui in user_list}
    rep_polt={ui: [] for ui in user_list}
    for uii in rep_polt:
        rep_polt[uii].append(rep[uii])

    # 保留每轮计算的数据
    epochs=[]
    accs=[]
    rmses=[]
    # 开始多轮计算
    for i in range(l):
        crh = RCRH.RCRH(task_col=col[2], source_col=col[0],rep=rep,roll=0.1,fa=1,fi=1)
        dd, epoch,Rep = crh.train(df[i],init_weight=1, min_d=0.00000001, max_iter=200, thresh=1e-9)
        acc = 0
        for ii in real_truth[i]:
            if real_truth[i][ii] == dd[ii]:
                acc += 1
        # 更新并保留数据
        accs.append(acc / len(real_truth[i]))
        rmses.append(-math.log(acc / len(real_truth[i])))
        epochs.append(epoch)
        rep = Rep
        # print(dd)
        for uii in rep_polt:
            rep_polt[uii].append(Rep[uii])

    # x=[i for i in range(len(df)+1)]
    # polt_rep(rep_polt,x)

    # print(epochs,accs)
    # print(rep_polt)
    # print("一共经过{}轮计算后，算法收敛。最终准确率为：{}".format(epoch, acc / len(real_truth)))
    return epochs,accs,rep_polt,rmses






if __name__ == "__main__":
#     多轮数据生成和测试
#   作恶率将基础的运行三轮
#     badratelist = [0,0]
#     for m in range(13):
#         badratelist.append(random.random())
    badratelist=[0,0,0.1,0.5,0.9,0,0,0.1,0.5,0.9,0,0,0.1,0.5,0.9]
    # 实验设置不同的作恶节点数量
    # badnum=[10,15,20,25,30]
    badnum=[0.2,0.4,0.6,0.8]
    # 记录数据
    epochdic = {}
    accdic={}
    rmsedic={}
    df= {}
    for i in badnum:
        mdGen= datagen.MdataGen(badsources=20, totalsources=50, tasks=100,
                               genpolicy=datagen.DataGenEnum.NoBlacnepolicy, gen_badrate_list=badratelist,balancerate=i,
                               data_save=datagen.DataGenEnum.Data_nosave, data_name="data.xlsx")
        data,data_truth=mdGen.genmutildata()
        df[str(i) + "_secrate"] = []
        for ii in data:
            dd = ii.groupby("task")
            sumg = 0
            sumb = 0
            for t in ii["task"].unique():
                vals = dd.get_group(t)
                sumb += vals[vals["source"].str.startswith('b')]["fact"].count()
                sumg += vals[vals["source"].str.startswith('s')]["fact"].count()
            df[str(i) + "_secrate"].append(sumb / sumg)


        # pd.DataFrame(df).to_excel(str(i)+"brate.xlsx")

        epochs,accs,rep,rmses=testMutilRCRH(data,data_truth,["source", "fact", "task"])
        # print(epochs,accs)
        epochdic[str(i)+"RCRH_epochs"]=epochs
        accdic[str(i) + "RCRH_accs"] = accs
        rmsedic[str(i)+ "RCRH_rmses"]=rmses
        pd.DataFrame(rep).to_excel(str(i) +"_res_RCRH.xlsx")
        epochss,accss,rmsess=testMutilCRH(data,data_truth,["source", "fact", "task"])
        epochdic[str(i) + "CRH_epochs"] = epochss
        accdic[str(i) + "CRH_accs"] = accss
        rmsedic[str(i) + "CRH_rmses"] = rmsess

    pd.DataFrame(epochdic).to_excel("epochs.xlsx")
    pd.DataFrame(accdic).to_excel("accs.xlsx")
    pd.DataFrame(df).to_excel("secrate.xlsx")
    pd.DataFrame(rmsedic).to_excel("rmse.xlsx")

