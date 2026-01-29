# processor.py
from Data import Data

data_buffer = Data()


def process_data():
    global data_buffer
    print(f"Processing data: {data_buffer.handler()}")
    # 在这里添加你的数据处理逻辑
    data_buffer.TD_data()
    data_buffer.clean_data()

def add_to_buffer(data):
    global data_buffer
    data_buffer.add_data(data)


