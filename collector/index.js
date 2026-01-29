const Koa = require('koa')
// const views = require('koa-views')
const json = require('koa-json')
const onerror = require('koa-onerror')
const bodyparser = require('koa-bodyparser')
const logger = require('koa-logger')
const http = require('http');
const debug = require('debug')('demo:server');


const dataRoutes = require('./routes/dataRoutes');
const { connectRabbitMQ } = require('./services/rabbitmqServices');

// const app = new Koa();

class  Conllector {
    constructor(p,kconfig) {
        this.port = p;
        this.config = {...kconfig};
        this.app = new Koa();
        this.server = http.createServer(this.app.callback());
        // console.log(this.config.src_id)

        // console.log(this.app.context.config.src_id)
        // app.context.config = kconfig;




// 使用bodyParser中间件来解析请求体
// middlewares
        this.app.use(bodyparser({
            enableTypes:['json', 'form', 'text']
        }))
        this.app.use(json())
        this.app.use(logger())
// logger
        this.app.use(async (ctx, next) => {
            const start = new Date()
            console.log(ctx.config.src_id)
            await next()
            const ms = new Date() - start
            console.log(`${ctx.method} ${ctx.url} - ${ms}ms`)
        })

// 连接到RabbitMQ


// 加载路由
        this.app.use(dataRoutes.routes(),dataRoutes.allowedMethods());
// app.address= "http://172.16.0.13"
// console.log(app.address)

// error-handling
        this.app.on('error', (err, ctx) => {
            console.error('server error', err, ctx)
        });




        const port = this.port ||3000;

        /**
         * Listen on provided port, on all network interfaces.
         */

        this.server.listen(port);
        this.server.on('error', onError);
        this.server.on('listening', ()=>{
            var addr = this.server.address();
            var bind = typeof addr === 'string'
                ? 'pipe ' + addr
                : 'port ' + addr.port;
            debug('Listening on ' + bind);
        });
        console.log("已成功运行，监听端口："+port)

        /**
         * Event listener for HTTP server "error" event.
         */

        function onError(error) {
            if (error.syscall !== 'listen') {
                throw error;
            }

            var bind = typeof port === 'string'
                ? 'Pipe ' + port
                : 'Port ' + port;

            // handle specific listen errors with friendly messages
            switch (error.code) {
                case 'EACCES':
                    console.error(bind + ' requires elevated privileges');
                    process.exit(1);
                    break;
                case 'EADDRINUSE':
                    console.error(bind + ' is already in use');
                    process.exit(1);
                    break;
                default:
                    throw error;
            }
        }

        /**
         * Event listener for HTTP server "listening" event.
         */

        function onListening() {

        }


    }
    async Start(config) {
        const channel = await connectRabbitMQ().catch(console.error);
        this.app.context.rabbitmqchannel = channel;
        this.app.context.config = {...config};
        // console.log(config)
    }






}


module.exports = Conllector;
