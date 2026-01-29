const fs = require('fs');

const state=[
    "105850382902249579913626708789097843739425253952766971993822971452327187075657",
    "11730251359286723731141466095709901450170369094578288842486979042586033922425",
    "105850382902249579913626708789097843739425253952766971993822971452327187075657",
    "123456"]
const newstate="123456789123"


const data = {
    "state": [],
    "newstate": []
}
async function  gen_input() {
    for (let i = 8; i < 18; i+=2){
        let data_item = {
            "state": [],
            "newstate": []
        }
        for (let j = 0; j < i; j++){
            data_item["state"].push(state)
            data_item["newstate"].push(newstate)
        }
        console.log(data_item.state.length)

        json_data = JSON.stringify(data_item)


        // 文件路径
        const filePath = '../input/input_' + i + '.json';

// 检查文件是否存在
        await fs.writeFile(filePath, json_data, (err) => {
            if (err) {
                console.error('无法创建文件', err);
                return;
            }
            console.log('JSON文件已生成并保存为 output.json');
        });
    }
}
gen_input()





