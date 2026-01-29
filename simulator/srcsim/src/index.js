const axios = require('axios');
const { v4: uuidv4 } = require('uuid');
const moment = require('moment');

class SrcSim {
    constructor(endpoint, config,data=null) {
        this.endpoint = endpoint;
        this.chain_id = config.chain_id || 'testnet';
        this.config = config;
        // this.srcid=config.srcid || 'testsrc';
        this.dataCount = 0;
        this.maxDataCount = config.maxDataCount || 10;
        this.dataid=[]
        for (let i = 0; i < this.config.batchSize; i++) {
            this.dataid.push(uuidv4());
        }

        //现有数据直接注入
        this.data = data;
        this.data_flag=false;
        if (this.data !== null) {
            // console.log("-------------------")
            this.data_flag = true;
            //注入数据长度与endpoint长度一致
            //构建endpoint，并使其和srcid具有对应关系
            this.endpoint = {};
            let index = 0;
            // console.log(this.data);
            for (let srcid in this.data[0]) {
                this.endpoint[srcid]='http://127.0.0.1:'+(3000+index)+'/senddata';
                index++;
            }
            console.log("endpoint:",this.endpoint.size)

        }
    }

    generateMockData() {
        let data =[]
        for (let i = 0; i < this.config.batchSize; i++) {
            data.push({
                contract_id: this.dataid[i],
                status: this.config.status || 'active',
                balance: this.config.balance !== undefined ? this.config.balance : Math.floor(Math.random() * 10000),
                timestamp: new Date().getTime(),
                chain_id:this.chain_id
            });
        }
        return data;
    }

    async sendDataToEndpoint(data) {
        const endpoints = this.endpoint;
        const promises = endpoints.map(endpoint => {
            return axios.post(endpoint, {Data:JSON.stringify(data),Nonce: this.dataCount}).catch(error => {
                console.error(`Error sending data to ${endpoint}:`, error);
            });
        });

        await Promise.all(promises);
        console.log(`Data sent to ${endpoints.length} endpoints:`, data.length);
    }

    async sendgenDataToEndpoint(data) {
        const endpoints = this.endpoint;
        // console.log(endpoints)
        const promises = []

        for (let srcid in data) {
            // console.log(data[srcid],endpoints[srcid])
            promises.push(
                axios.post(endpoints[srcid], {Data:JSON.stringify(data[srcid]),Nonce: this.dataCount}).catch(error => {
                    console.error(`Error sending data to ${endpoints[srcid]}:`, error);
                })
            );
        };

        // await Promise.all(promises);
        console.log(`Data sent to ${endpoints.length} endpoints:`, data.length);
    }

    async loop() {
        console.log(this.dataCount,this.maxDataCount,"---------")

        const data = this.generateMockData();
        this.sendDataToEndpoint(data);
        this.dataCount += 1;
        if (this.dataCount >= this.maxDataCount){
            this.stop();
        }else {
            setTimeout(this.loop.bind(this), this.config.outputInterval || 6000);
        }

    }

    async loop_data() {
        console.log("第",this.dataCount,"/",Object.keys(this.data).length,"  轮数据注入")
        // console.log(this.data)

        const senddata = this.data[this.dataCount];
        this.sendgenDataToEndpoint(senddata);
        this.dataCount += 1;
        if (this.dataCount > Object.keys(this.data).length){
            this.stop();
        }else {
            setTimeout(this.loop_data.bind(this), this.config.outputInterval || 6000);
        }

    }

    stop() {
        console.log('Stopping...');
        process.exit(0);
    }

    async start() {
        this.dataCount = 0;
        if (this.data_flag) {
            this.loop_data();
        }
        else {
            this.loop();
        }
        // setTimeout(this.loop.bind(this), this.config.outputInterval || 6000);
    }
}

module.exports = SrcSim;

