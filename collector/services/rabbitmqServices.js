const amqp = require('amqplib');

const rabbitmqUrl = 'amqp://172.16.0.24:5672'; // 根据你的RabbitMQ配置修改



async function connectRabbitMQ() {
    const connection = await amqp.connect({
        protocol: 'amqp',
        hostname: '172.16.0.24',
        port: 5672,
        username: 'hzh',
        password: '123456',
        // locale: 'en_US',
        frameMax: 0,
        heartbeat: 0,
        vhost: 'ToP',
    });
    console.log("链接RabbitMQ")
    let channel = await connection.createChannel();
    // await channel.assertQueue();
    return channel;
}

async function sendToRabbitMQ(channel,data,queue) {
    if (!channel) {
        channel = await connectRabbitMQ();
    }
    await channel.sendToQueue(queue, Buffer.from(JSON.stringify(data)));
}

module.exports = {
    connectRabbitMQ,
    sendToRabbitMQ
};
