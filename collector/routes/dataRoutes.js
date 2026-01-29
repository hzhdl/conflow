const router = require('koa-router')();
const { sendToRabbitMQ } = require('../services/rabbitmqServices');


// const router = new Router();

router.post('/senddata', async (ctx) => {
    const data = ctx.request.body;
    // console.log(JSON.parse(data.Data));
    // console.log(queue);
    data.src_id=ctx.config.src_id;
    data.timestamp=new Date().getTime();
    if (data) {
        ctx.config.queue.forEach(async (queue) => {
            // console.log(data);
            await sendToRabbitMQ(ctx.rabbitmqchannel,data,queue);
        });
        ctx.body = { message: 'Data sent to RabbitMQ' };
    } else {
        ctx.status = 400;
        ctx.body = { error: 'No data provided' };
    }
});
router.get('/test', async (ctx) => {
    console.log('test');
    ctx.body = { message: ' test$'+ctx.config.src_id };
});

module.exports = router;
