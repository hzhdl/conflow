const crypto = require('crypto');
const ExcelJS = require('exceljs');
const uuidv4  = require('uuid');

class DataGenEnum {
    static Data_toexcel = 'Data_toexcel';
    static Data_nosave = 'Data_nosave';
    static Data_Name = 'Data_Name';
    static Basepolicy = 'Basepolicy';
    static Halfpolicy = 'Halfpolicy';
    static NoBlacnepolicy = 'NoBlacnepolicy';
}

class DataGen {
    constructor({
                    totalsources = 100,
                    badsources = 10,
                    tasks = 100,
                    data_epoch = 1000,
                    genpolicy = DataGenEnum.Basepolicy,
                    taskpre = 'task',
                    sourcepre = 'source',
                    factpre = 'fact',
                    truth_len = 8,
                    bad_value = '____',
                    null_value = '---',
                    data_save = DataGenEnum.Data_nosave,
                    data_name = DataGenEnum.Data_Name,
                    gen_badrate = 0.5,
                    balance_rate = 0.5,
                    columns = ["src_id", "state", "contract_id"]
                } = {}) {
        this.totalsources = totalsources;
        this.badsources = badsources;
        this.tasks = tasks;
        this.data_save = data_save;
        this.data_name = data_name;
        this.data_epoch = data_epoch;
        this.genpolicy = genpolicy;
        // this.taskpre = taskpre;
        // this.sourcepre = sourcepre;
        // this.factpre = factpre;
        this.columns = columns;
        this.truth_len = truth_len;
        // this.bad_value = bad_value;
        this.gen_badrate = gen_badrate;
        this.balance_rate = balance_rate;
        this.null_value = null_value;

        this.bad_value = this.generate_random_hex_string(10);
        this.taskpre = this.generate_random_hex_string(8);
        this.sourcepre = this.generate_random_hex_string(8);
        this.badsourcepre = this.generate_random_hex_string(8);
        this.factpre = this.generate_random_hex_string(8);
        // this.sourcelist = [];
        // for (let i = 1; i <= this.totalsources; i++) {
        //     this.real_truth[`${this.taskpre}${i}`] = this.generate_random_hex_string(this.truth_len);
        // }
    }

    generate_random_hex_string(length) {
        const ranstr=crypto.randomBytes(length).toString('hex');
        return ranstr;
    }

    gen_badvalue(i, j, flag) {
        if (this.genpolicy === DataGenEnum.Basepolicy) {
            return [`${this.badsourcepre}${i}`, this.bad_value, `${this.taskpre}${j}`];
        } else {
            if (flag[j - 1] === 0) {
                return [`${this.badsourcepre}${i}`, this.bad_value, `${this.taskpre}${j}`];
            } else {
                return [`${this.badsourcepre}${i}`, this.real_truth[`${this.taskpre}${j}`], `${this.taskpre}${j}`];
            }
        }
    }

    gendata() {
        const dictdata = {};
        // const data = [];
        this.real_truth = {};
        for (let i = 1; i <= this.tasks; i++) {
            this.real_truth[`${this.taskpre}${i}`] = this.generate_random_hex_string(this.truth_len);
        }

        const flag = Array.from({ length: this.tasks }, (_, idx) => idx < this.tasks * this.gen_badrate ? 0 : 1);
        for (let i = 0; i < this.badsources; i++) {
            dictdata[`${this.badsourcepre}${i}`]=[]
            for (let j = 1; j <= this.tasks; j++) {
                dictdata[`${this.badsourcepre}${i}`].push(this.gen_badvalue(i, j, flag));
            }
        }

        for (let i = 0; i < this.totalsources - this.badsources; i++) {
            dictdata[`${this.sourcepre}${i}`]=[]
            for (let j = 1; j <= this.tasks; j++) {
                if (i < (this.totalsources - this.badsources) * this.balance_rate && j < this.tasks * this.gen_badrate * this.balance_rate && this.genpolicy === DataGenEnum.NoBlacnepolicy) {
                    // Skip or add null value
                } else {
                    dictdata[`${this.sourcepre}${i}`].push([`${this.sourcepre}${i}`, this.real_truth[`${this.taskpre}${j}`], `${this.taskpre}${j}`]);
                }
            }
        }


        let df = [];
        for (const dictdatum in dictdata) {
            // console.log(dictdata[dictdatum])
            df = dictdata[dictdatum].map(row => ({ src_id: row[0], state: row[1], contract_id: row[2] }));
        }

        if (this.data_save === DataGenEnum.Data_toexcel) {
            const workbook = new ExcelJS.Workbook();
            const worksheet = workbook.addWorksheet('Data');
            worksheet.columns = this.columns.map(col => ({ header: col, key: col, width: 10 }));
            df.forEach(row => worksheet.addRow(row));
            workbook.xlsx.writeFile(this.data_name)
                .then(() => console.log(`Data saved to ${this.data_name}`))
                .catch(err => console.error('Error saving data:', err));
        }

        return dictdata;
    }

    getreal_truth() {
        return this.real_truth;
    }
}

class MdataGen {
    constructor({
                    totalsources = 100,
                    badsources = 10,
                    tasks = 100,
                    data_epoch = 1000,
                    genpolicy = DataGenEnum.Basepolicy,
                    taskpre = 'task',
                    sourcepre = 'source',
                    factpre = 'fact',
                    truth_len = 8,
                    bad_value = '___',
                    balancerate = 0.5,
                    data_save = DataGenEnum.Data_nosave,
                    data_name = DataGenEnum.Data_Name,
                    gen_badrate_list = [0, 0, 0, 0, 0.5, 0.5, 0, 0, 0],
                    columns = ["source", "fact", "task"]
                } = {}) {
        this.badratelist = gen_badrate_list;
        this.mdatagen = new DataGen({ badsources, totalsources, tasks, genpolicy, gen_badrate: this.badratelist[0], balance_rate: balancerate, data_save, data_name });
    }

    genmutildata() {
        const data = [];
        const data_truth = [];
        for (let i = 0; i < this.badratelist.length; i++) {
            this.mdatagen.gen_badrate = this.badratelist[i];
            this.mdatagen.data_name = `${i}data.xlsx`;
            data.push(this.mdatagen.gendata());
            data_truth.push(this.mdatagen.getreal_truth());
        }
        return { data, data_truth };
    }
}

module.exports = { DataGen, DataGenEnum, MdataGen };

// if (require.main === module) {
//     const datagen = new DataGen();
//     const dd = datagen.gendata();
//     console.log(dd);
//
//     const mdatagen = new MdataGen({
//         badsources: 5,
//         totalsources: 10,
//         tasks: 100,
//         genpolicy: DataGenEnum.Halfpolicy,
//         gen_badrate_list: [0.1],
//         data_save: DataGenEnum.Data_toexcel,
//         data_name: "data.xlsx"
//     });
//     const { data, data_truth } = mdatagen.genmutildata();
//     console.log(data, data_truth);
// }
