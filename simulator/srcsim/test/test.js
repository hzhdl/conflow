const PM2 = require('pm2');
const SrcSim = require('../src/index');
const { DataGen, DataGenEnum, MdataGen } = require('../src/datagen');

const endpoint = [
    'http://127.0.0.1:3000/senddata',
    'http://127.0.0.1:3001/senddata',
    'http://127.0.0.1:3002/senddata',
    'http://127.0.0.1:3003/senddata',
    'http://127.0.0.1:3004/senddata',
    'http://127.0.0.1:3005/senddata',
    'http://127.0.0.1:3006/senddata',
    'http://127.0.0.1:3007/senddata',
    'http://127.0.0.1:3008/senddata',
    'http://127.0.0.1:3009/senddata',
];

const dataConfigs = {
    maxDataCount: 2,
    outputInterval: 15000,
    batchSize: 1,
    chain_id: 'test-chain',
}

//badratelist = [0,0,0.1,0.5,0.9,0,0,0.1,0.5,0.9,0,0,0.1,0.5,0.9]
//
//     mdGen= datagen.MdataGen(badsources=10, totalsources=50, tasks=100,
//                            genpolicy=datagen.DataGenEnum.NoBlacnepolicy, gen_badrate_list=badratelist,balancerate=0.6,
//                            data_save=datagen.DataGenEnum.Data_toexcel, data_name="data.xlsx")

async function startSimulators(numbers) {
    // console.log(`Starting ${numbers} simulators...`);
    // let simulators = [];
    // for (let i = 0; i < numbers; i++) {
    //     // const endpoint = endpoint;
    //     const config = dataConfigs;
    //     config.chain_id = `chain_${i + 1}`;
    //     simulators.push(new SrcSim(endpoint, config));
    //     console.log(`Simulator ${i + 1} started`);
    // }
    // simulators.forEach(async (simulator) => await simulator.start());

    // let badratelist = [0,0,0.1,0.5,0.9,0,0,0.1,0.5,0.9,0,0,0.1,0.5,0.9]
    let badratelist = [0]

    const data=new MdataGen({
        totalsources : numbers,
        badsources : 10,
        tasks : 100,
        genpolicy: DataGenEnum.NoBlacnepolicy,
        balancerate : 0.6,
        data_save : DataGenEnum.Data_nosave,
        gen_badrate_list : badratelist,
    })
    var gendata = data.genmutildata();
    // console.log(gendata)

    var srcSim = new SrcSim(endpoint, dataConfigs, gendata.data);
    srcSim.start();
}

// startSimulators(20)
// startSimulators(40)
// startSimulators(60)
// startSimulators(80)
startSimulators(100)



//
// PM2.connect(function(err) {
//     if (err) {
//         console.error(err);
//         process.exit(2);
//     }
//
//     endpoints.forEach((endpoint, index) => {
//         const config = dataConfigs;
//         PM2.start({
//             script: 'app.js',  // 你的模拟器脚本路径
//             name: `simulator_${index + 1}`,  // 进程名称
//             env: {
//                 ENDPOINT: endpoint,
//                 CONFIG: JSON.stringify(config),
//                 MAX_DATA_COUNT: maxDataCount
//             }
//         }, function(err, apps) {
//             if (err) {
//                 console.error(`Error starting simulator_${index + 1}:`, err);
//                 return;
//             }
//             console.log(`Simulator ${index + 1} started`);
//         });
//     });
// });

