# data_utils.py
import matplotlib

# import TF
from   TD.CRH import *
from   TD.datagen import *
from   TD.RCRH import *
# , TD.datagen, TD.RCRH
import time
import matplotlib.pyplot as plt


import pandas as pd
import json
import threading
import time

import threading



class ThreadSafeCounter:
    def __init__(self, initial=0, max_retries=5, retry_delay=0.1):
        self.value = initial
        self.lock = threading.Lock()
        self.max_retries = max_retries
        self.retry_delay = retry_delay

    def increment(self, amount=1):
        attempt = 0
        while attempt < self.max_retries:
            with self.lock:
                try:
                    # 假设有一种条件需要检查，假定条件总是满足
                    self.value += amount
                    return True
                except Exception as e:
                    attempt += 1
                    print(f"Failed to increment: {e}. Retrying {attempt}/{self.max_retries}.")
                    time.sleep(self.retry_delay)
        # 如果仍然不成功，可以抛出异常或者返回某种状态
        print("Max retries reached. Increment failed.")
        return False

    def get_value(self):
        with self.lock:
            return self.value

    def set_value(self):
        with self.lock:
            self.value=0

# data_count = 0


class Data:
    def __init__(self,):
        """
        初始化Data类。
        :param condition_func: 一个函数，判断何时应该执行handler_func。
        :param handler_func: 满足条件时需要调用的处理函数。
        """
        self.cols=["src_id", "state", "contract_id"]
        self.dataframe = pd.DataFrame(columns=self.cols)
        self.Nonce_flag = 0
        self.src= set()
        self.src_num =50
        self.crh = CRH()
        self.RCRH = RCRH()

        self.dataframe_time= 0

        # self.recieve_num = 0
        # self.condition_func = example_condition | self.condition
        # self.handler_func = example_handler | self.handler

    def add_data(self, json_datas):
        """
        解析JSON数据并加入DataFrame中。

        :param json_data: JSON格式的字符串。
        """

        # global data_count
        try:
            self.dataframe_time=time.time()*1000
            for json_data in json_datas:

                data_dict = json.loads(json_data.decode())
                data = json.loads(data_dict.get("Data"))
                src_id   = data_dict.get("src_id")
                Nonce    = data_dict.get("Nonce")
                self.dataframe_time =min(self.dataframe_time,data_dict.get("timestamp"))
                self.src.add(src_id)
                self.dataframe = self.dataframe.append(pd.DataFrame(data, columns=self.cols),ignore_index=True)

            self.TD_data()

        except json.JSONDecodeError as e:
            print(f"Invalid JSON data: {e}")

    def TD_data(self):
        """解析JSON数据并加入DataFrame中。"""
        print("TD data: ", len(self.dataframe))
        # print(self.dataframe.head())
        time_start= time.time()
        print("Time cost1: ", time_start*1000 - self.dataframe_time)
        truthdata,epoch =self.crh.train(self.dataframe,init_weight=1, min_d=0.00000001, max_iter=200, thresh=1e-9)
        time_end= time.time()
        print("Time cost2: ",time_end-time_start)
        print("Truth data: ", len(truthdata))
        self.clean_data()

    # 示例处理函数
    def handler(self):
        # print("Condition met! Handling data:")
        # print(self.dataframe.size)
        return len(self.dataframe)

    # 示例条件函数
    def condition(self):
        # 例如：当数据行数达到5行时，触发处理函数
        # print(len(self.dataframe), "rows")
        return self.src_num

    def clean_data(self):
        """
        清理DataFrame中的数据。
        """
        print("Cleaning data...")
        self.dataframe=pd.DataFrame()
