import pandas as pd
import numpy as np
from numpy.linalg import norm
import math
from sklearn.feature_extraction.text import TfidfVectorizer
import warnings

warnings.filterwarnings('ignore')


def compute_similarity(w1, w2, word_model):
    # 可以根据需要调整
    V = word_model.transform([w1, w2])
    v1, v2 = np.asarray(V.todense())
    return np.dot(v1, v2) / (norm(v1) * norm(v2))


class TruthFinderModel(object):
    def __init__(self, object_col='task',
                 fact_col='fact',
                 source_col='source',
                 source_trust_col='trust_w',
                 fact_conf_col='conf_f',
                 rho=0.6,
                 gamma=0.8):
        self.object_col = object_col
        self.fact_col = fact_col
        self.source_col = source_col
        self.fact_conf_col = fact_conf_col
        self.source_trust_col = source_trust_col
        self.rho = rho
        self.gamma = gamma
        # 后续需要使用词向量计算事实项之间相似度
        vectorizer = TfidfVectorizer(min_df=1)
        self.word_model = vectorizer

    def fact_implication(self, group):
        new_conf = []
        for i in group.index:
            tmp_s = 0
            for j in group.index:
                if i != j:
                    sim = compute_similarity(group.loc[j, self.fact_col].lower(),
                                             group.loc[i, self.fact_col].lower(),
                                             self.word_model)
                    tmp_s += group.loc[j, self.fact_conf_col] * sim
            new_conf.append(group.loc[i, self.fact_conf_col] + self.rho * tmp_s)
        group[self.fact_conf_col] = new_conf
        return group

    def computer_conf_fact(self, data):
        conf_fact = data.groupby([self.object_col, self.fact_col])[self.source_trust_col].sum()
        conf_fact.name = self.fact_conf_col
        conf_fact = conf_fact.reset_index()
        conf_fact = conf_fact.groupby(self.object_col).apply(self.fact_implication)
        conf_fact[self.fact_conf_col] = conf_fact[self.fact_conf_col].apply(
            lambda x: 1 / (1 + math.exp(-self.gamma * x)))
        data = data.drop(self.fact_conf_col, axis=1).merge(conf_fact.reset_index(drop=True),
                                                           on=[self.object_col, self.fact_col])
        return data

    def computer_websit_trust(self, data):
        website_trust = data.groupby(self.source_col)[self.fact_conf_col].mean()
        # source_trust_col中保存的是log之后的结果
        website_trust = -np.log(1 - website_trust)
        website_trust.name = self.source_trust_col
        data = data.drop(self.source_trust_col, axis=1).merge(website_trust, left_on=self.source_col,
                                                              right_index=True)
        return data

    def trust_conf_update(self, data):
        self.word_model = self.word_model.fit(data[self.fact_col].str.lower())
        # 更新事实项的可信度
        data = self.computer_conf_fact(data)
        # 更新数据源可信度
        data = self.computer_websit_trust(data)
        return data

    def getresult(self,df):
        d=df.groupby([self.object_col])[self.fact_conf_col].idxmax()
        dd=df.loc[d]
        result_df={}
        for index,row in dd.iterrows():
            result_df[row[self.object_col]]=row[self.fact_col]
        return result_df

    def train(self, data, max_iter=200, thresh=1e-6, initial_trust=0.8):
        data[self.source_trust_col] = initial_trust
        data[self.fact_conf_col] = 0
        epoch=0
        for _ in range(max_iter):
            epoch+=1
            t1 = data.groupby(self.source_col)[self.source_trust_col].mean().values
            data = self.trust_conf_update(data)
            t2 = data.groupby(self.source_col)[self.source_trust_col].mean().values
            if np.linalg.norm(t1 - t2) < thresh:
                # print(data.loc[data.groupby([self.object_col])[self.fact_conf_col].idxmax()])
                return self.getresult(data),epoch
        print(data.loc[data.groupby([self.object_col])[self.fact_conf_col].idxmax()])
        return self.getresult(data),epoch


if __name__ == "__main__":
    df = pd.DataFrame([

        ["c", "___", "Special relativity"],
        ["a", "Einstein", "Special relativity"],
        ["b", "Einstein", "Special relativity"],


        ["c", "___", "Universal gravitation"],
        ["a", "Newton", "Universal gravitation"],
        ["b", "Newton", "Universal gravitation"],


        ["c", "___", "Heliocentrism"],
        ["a", "Galileo", "Heliocentrism"],
        ["b", "Galileo", "Heliocentrism"],
    ],
                      columns=["source", "fact", "task"])
    tf = TruthFinderModel()
    dd,_ = tf.train(df)

    print(dd)
