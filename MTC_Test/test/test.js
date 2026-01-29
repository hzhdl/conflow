// const {
//   time,
//   loadFixture,
// } = require("@nomicfoundation/hardhat-toolbox/network-helpers");
const { anyValue } = require("@nomicfoundation/hardhat-chai-matchers/withArgs");
const { expect } = require("chai");
const fs = require('fs')
// require("@nomiclabs/hardhat-ethers");

describe("Lock", function () {
    // We define a fixture to reuse the same setup in every test.
    // We use loadFixture to run this setup once, snapshot that state,
    // and reset Hardhat Network to that snapshot in every test.
    async function deployOneYearLockFixture(name, signer,lib) {
        let Lock=null
        if (lib==null) {
             Lock = await ethers.getContractFactory(name);
        }
        else {
             Lock = await ethers.getContractFactory(name,lib);

        }


        const Lockk = await Lock.connect(signer);

        const lock = await Lockk.deploy();
        // console.log(lock)
        const receipt = await lock.deployTransaction.wait();

        return { lock,receipt };
    }
    async function deployVerifyMTC(name, signer,lib,MTC) {
        let Lock=null
        if (lib==null) {
             Lock = await ethers.getContractFactory(name);
        }
        else {
             Lock = await ethers.getContractFactory(name,lib);

        }


        const Lockk = await Lock.connect(signer);

        const lock = await Lockk.deploy(...MTC);
        // console.log(lock)
        const receipt = await lock.deployTransaction.wait();

        return { lock,receipt };
    }

    function readJsonFile(filePath) {
        return new Promise((resolve, reject) => {
            fs.readFile(filePath, 'utf8', (err, data) => {
                if (err) {
                    reject(err);
                    return;
                }
                try {
                    const jsonData = JSON.parse(data);
                    resolve(jsonData);
                } catch (parseErr) {
                    reject(parseErr);
                }
            });
        });
    }

    async function number2BigNumber(num) {
        for (let i = 0; i < num.length; i++) {
            let tmp=ethers.BigNumber.from(num[i]).toHexString()
            num[i] = ethers.utils.hexZeroPad( tmp , 32 );
        }
        return num; // convert to BigNumber
    }

    async function number2BigNumbers(num) {
        for (let i = 0; i < num.length; i++) {
            for (let j = 0; j < num[i].length; j++) {
                let tmp=ethers.BigNumber.from(num[i][j]).toHexString()
                num[i][j] =  ethers.utils.hexZeroPad( tmp , 32 );
            }

        }
        return num; // convert to BigNumber
    }

    describe("Deployment", function () {
        it("use & update test", async function () {

            var defaultProvider = new ethers.getDefaultProvider("http://172.16.0.13:8645");
            var dsigner = defaultProvider.getSigner();
            const {lock,receipt}=await deployOneYearLockFixture("MiMC7", dsigner,null);
            const mimc7=lock;
            console.log(receipt.gasUsed.toString())
            // let name = "Groth16Verifier2_";
            // let names=["HashChain","MTC2"]
            const gasueds=[]
            const cons=[]
            const utils= ethers.utils;
            const BigNumber = ethers.BigNumber

            //部署HashChain
            const hashchain = await deployOneYearLockFixture("HashChain", dsigner,{libraries: {
                    MiMC7: mimc7.address
                }});
            gasueds.push(hashchain.lock.address, hashchain.receipt.gasUsed.toString())
            let gass=[]
            for (let j = 0; j < 10; j++) {
                let tmp=await hashchain.lock.setnewstat(BigNumber.from(utils.randomBytes(10)),{gasLimit:7000000})
                tmp=await tmp.wait()
                gass.push(tmp.gasUsed)
            }
            console.log(gass)

            //部署MTC2
            const MTC2 = await deployOneYearLockFixture("MTC2", dsigner,{libraries: {
                    MiMC7: mimc7.address
                }});
            gasueds.push(MTC2.lock.address, MTC2.receipt.gasUsed.toString())
            gass=[]
            for (let j = 0; j < 10; j++) {
                let tmp=await MTC2.lock.setnewstat(BigNumber.from(utils.randomBytes(10)),{gasLimit:7000000})
                tmp=await tmp.wait()
                gass.push(tmp.gasUsed)
            }
            console.log(gass)

            console.log(gasueds);
            // expect(await lock.unlockTime()).to.equal(unlockTime);
            // expect(await lock.lockedAmount()).to.equal(lockedAmount);

        });

        it("verify test", async function () {

            var defaultProvider = new ethers.getDefaultProvider("http://172.16.0.13:8645");
            var dsigner = defaultProvider.getSigner();
            const {lock,receipt}=await deployOneYearLockFixture("MiMC7", dsigner,null);
            const mimc7=lock;
            console.log(receipt.gasUsed.toString())
            // let name = "Groth16Verifier2_";
            // let names=["HashChain","MTC2"]
            const gasueds=[]
            const cons=[]
            const utils= ethers.utils;
            const BigNumber = ethers.BigNumber

            //部署HashChain
            const hashchain = await deployVerifyMTC("VerifyMTC", dsigner,{libraries: {
                    MiMC7: mimc7.address
                }}, [BigNumber.from("1425027762868010371145367111571569310129978921381540285984257259184483867076"),
                BigNumber.from("1425027762868010371145367111571569310129978921381540285984257259184483867076")
                ,1234,1234]);
            gasueds.push(hashchain.lock.address, hashchain.receipt.gasUsed.toString())


            let gass=[]
            // for (let j = 0; j < 10; j++) {
            let tmp=await hashchain.lock.validation2(1234,1234,1234,1234,{gasLimit:7000000})
            tmp=await tmp.wait()
            gass.push(tmp.gasUsed)
            tmp=await hashchain.lock.validation2(123,1234,1234,1234,{gasLimit:7000000})
            tmp=await tmp.wait()
            gass.push(tmp.gasUsed)
            // }
            console.log(gass)


            console.log(gasueds);
            // expect(await lock.unlockTime()).to.equal(unlockTime);
            // expect(await lock.lockedAmount()).to.equal(lockedAmount);

        });
    });


});
