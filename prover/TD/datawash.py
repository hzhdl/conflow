import xlrd
import pandas as pd
import math
df=pd.read_excel("dataa.xls")
df.insert(loc=16,column="score",value=0)
def cal1(x):
    val0=x[1]+x[2]+x[3]+x[4]+x[5]
    # print(val0*2,sc(7)+sg(8)+nn(9) +gd(10)+yq(11)+scp(12)+yl(13)+sy(14)+jj(15)+jc(16))
    return val0*2+sc(x[7])+sg(x[8])+nn(x[9]) +gd(x[10])+yq(x[11])+scp(x[12])+yl(x[13])+sy(x[14])+jj(x[15])+jc(x[16])

def sc(s):
    if s>=300: return 10
    elif s>=200: return 8
    elif s>=100: return 6
    elif s>0: return 3
    else: return 0

def sg(s):
    v=s
    if v<=0 or v>=550: return 0
    elif 0<v<=100 or 450<=v<550: return 4
    elif 100<v<=200 or 350<=v<450: return 6
    else: return 10

def nn(v):
    if v>=600: return 1
    elif v>=500: return 3
    elif v>0: return 6
    else: return 0

def gd(v):
    if v>=15: return 10
    elif v>=11: return 7
    elif v>=5: return 4
    else: return 0

def yq(s):

    if s==0: return 0
    elif 0<s<=60 or 200<=s<260: return 4
    elif 60<s<=120 or 260<=s<320: return 8
    else: return 10

def scp(s):
    if 1<=s<=3: return 6
    else: return 0

def yl(s):
    if s==0 or s>55: return 0
    elif 0<s<=15 or 30<s<=45: return 3
    elif 15<s<=25 or 45<s<=55: return 6
    else: return 8

def sy(s):
    if 0<=s<5: return 10
    elif 5<=s<10: return 6
    elif 10<=s<15: return 2
    else: return 0

def jj(s):
    if 0<=s<=15: return 10
    elif 15<s<=25: return 5
    elif 25<s<=35: return 2
    else: return 0

def jc(s):
    if s>=21: return 10
    elif 18<=s<21: return 8
    elif 14<=s<=17: return 6
    elif 7 <= s <=13: return 4
    else: return 0


df[1].fillna(value=1, inplace=True)

df["score"]=df.apply(cal1,axis=1)

# df.to_excel('prodata.xlsx')

print("end")


