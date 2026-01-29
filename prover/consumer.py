# consumer.py

import pika
from config import RABBITMQ_HOST, RABBITMQ_QUEUE , RABBITMQ_USER , RABBITMQ_PASSWORD , RABBITMQ_VHOST
from processor import add_to_buffer,process_data

# message_count = 1
messages = []

def consume_messages():
    connection = pika.BlockingConnection(
        pika.ConnectionParameters(host=RABBITMQ_HOST,port=5672,
                                  virtual_host=RABBITMQ_VHOST,
                                  credentials=pika.PlainCredentials(RABBITMQ_USER, RABBITMQ_PASSWORD)))
    channel = connection.channel()
    # channel.queue_declare(queue=RABBITMQ_QUEUE)
    channel.basic_qos(prefetch_count=1)

    def get_queue_length():
        # 获取队列的详细信息
        queue_info = channel.queue_declare(queue=RABBITMQ_QUEUE, durable=True, passive=True)
        return queue_info.method.message_count

    def callback(ch, method, properties, body):
        global  messages
        # message_count += 1
        messages.append(body)
        # 当消息数量达到50时，一次性处理这些消息
        if len(messages) >= 50:
            process_messages(messages)
            # 清空消息列表和计数器
            messages = []
            # message_count = 1
        ch.basic_ack(delivery_tag=method.delivery_tag)

    def process_messages(messages):
        print(f"Processing {len(messages)} messages:")
        add_to_buffer(messages)
        # for message in messages:
        #     add_to_buffer(message.decode())
        # process_data()


    # def callback(ch, method, properties, body):
    #     add_to_buffer(body.decode())
    #     ch.basic_ack(delivery_tag=method.delivery_tag)

    # channel.basic_qos(prefetch_count=1)
    # channel.basic_consume(queue=RABBITMQ_QUEUE, on_message_callback=callback)
    # 开始消费消息
    channel.basic_consume(queue=RABBITMQ_QUEUE, on_message_callback=callback)

    print(' [*] Waiting for messages. To exit press CTRL+C')
    channel.start_consuming()

consume_messages()