from TD import datagen
import pandas as pd

badratelist = [0,0,0.1,0.5,0.9,0,0,0.1,0.5,0.9,0,0,0.1,0.5,0.9]

mdGen= datagen.MdataGen(badsources=15, totalsources=50, tasks=100,
                               genpolicy=datagen.DataGenEnum.NoBlacnepolicy, gen_badrate_list=badratelist,balancerate=0.6,
                               data_save=datagen.DataGenEnum.Data_nosave, data_name="data.xlsx")
data,data_truth=mdGen.genmutildata()
# for i in data:
df=[]
# dd=data[4].groupby("task")

for i in data:
    dd = i.groupby("task")
    sumg=0
    sumb=0
    for t in i["task"].unique():
        vals=dd.get_group(t)
        sumb+=vals[vals["source"].str.startswith('b')]["fact"].count()
        sumg+=vals[vals["source"].str.startswith('s')]["fact"].count()
    df.append(sumb/sumg)



pd.DataFrame(df).to_excel("brate.xlsx")


