const Collector = require('./index.js');

const port = process.env.PORT || 3000;
const configs = {
    queue: ['P1','P2','P3','P4','P5','P6','P7','P8','P9','P10','P11','P12','P13','P14','P15','P16','P17','P18','P19','P20']
    // queue: ['P1','P2','P3','P4','P5','P6','P7','P8','P9','P10','P11','P12','P13','P14','P15']
    // queue: ['P1','P2','P3','P4','P5','P6','P7','P8','P9','P10']
    // queue: ['P1','P2','P3','P4','P5']
};

async function startCollectors(numbers) {
    console.log(`Starting ${numbers} Collector...`);
    let Collectors = [];
    for (let i = 0; i < numbers; i++) {
        // const endpoint = endpoint;
        const config = configs;
        config.src_id = `src_${i + 1}`;
        // console.log(config.src_id)
        Collectors.push(new Collector(port+i, config));
        // console.log(Collectors[i])
        console.log(`Collectors ${i + 1} started`);
    }
    for (let i = 0; i < numbers; i++) {
        let config = configs;
        config.src_id = `src_${i + 1}`;
        // console.log(config)
        await Collectors[i].Start(config)
    };
}

startCollectors(100)
// new Collector(port, config).Start();
