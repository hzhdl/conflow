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
    print("一共经过{}轮计算后，算法收敛。最终准确率为：{}".format(epoch, acc / len(real_truth)))
    return dd

@get_time
def testMutilCRH(df, real_truth, col):
    user_list = list(df[0][col[0]].unique())
    l = len(df)
    # 初始化信誉值


    # 保留每轮计算的数据
    epochs = []
    accs = []
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
        epochs.append(epoch)
        # print(dd)

    print(epochs,accs)


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
    return epochs,accs,rep_polt






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
    # 单轮数据生成和测试

    # # 数据生成设置
    # data = datagen.DataGen(badsources=5, totalsources=10, tasks=100,
    #                        genpolicy=datagen.DataGenEnum.Halfpolicy, gen_badrate=0.1,
    #                        data_save=datagen.DataGenEnum.Data_toexcel, data_name="data.xlsx")
    # # 数据生成
    # ddf = data.gendata()
    # # 真实结果生成
    # real_truth = data.getreal_truth()
    # # 实验基准和自身实验
    # # testTF(ddf,real_truth,["source", "fact", "task"])
    # # testCRH(ddf, real_truth, ["source", "fact", "task"])
    # testRCRH(ddf, real_truth, ["source", "fact", "task"])

#     多轮数据生成和测试
#     badratelist= [0,0,1,1,0,0,1,0]
    badratelist = [0,0,0.1,0.5,0.9,0,0,0.1,0.5,0.9,0,0,0.1,0.5,0.9]

    mdGen= datagen.MdataGen(badsources=10, totalsources=50, tasks=100,
                           genpolicy=datagen.DataGenEnum.NoBlacnepolicy, gen_badrate_list=badratelist,balancerate=0.6,
                           data_save=datagen.DataGenEnum.Data_toexcel, data_name="data.xlsx")
    data,data_truth=mdGen.genmutildata()

    epochs,accs,rep=testMutilRCRH(data,data_truth,["source", "fact", "task"])
    print(epochs,accs)
    pd.DataFrame(rep).to_excel("res_RCRH.xlsx")
    # print(rep)
    testMutilCRH(data,data_truth,["source", "fact", "task"])
    # print("dsfa sdfdsfdsfsda")