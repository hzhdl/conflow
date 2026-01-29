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
  async function deployOneYearLockFixture(name, signer) {

    const Lock = await ethers.getContractFactory(name);
    const Lockk = await Lock.connect(signer);

    const lock = await Lockk.deploy();
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
    it("Should deploy with the correct parameters", async function () {

      var defaultProvider = new ethers.getDefaultProvider("http://172.16.0.13:8645");
      var dsigner = defaultProvider.getSigner();
      let name = "Groth16Verifier2_";
      const gasueds=[]
      const cons=[]
      for (let i = 8; i < 18; i+=2) {
        const {lock,receipt} = await deployOneYearLockFixture(name+i.toString(), dsigner);
        gasueds.push(lock.address, receipt.gasUsed.toString())

        //读取数据
        let input ='' ;
        let proof ='';

        await  readJsonFile('/home/hzh/conflow/prover/circom/con_gas/contracts/public2_'+i+'.json').then(res=>{
          input=res
        })
        await readJsonFile('/home/hzh/conflow/prover/circom/con_gas/contracts/proof2_'+i+'.json').then(res=>{
          proof=res
        })
        // console.log(lock.interface.fragments)


        // console.log(cons[0].estimateGas.verifyProof)
        // console.log(proof.pi_a.slice(0,2))
        const utils = ethers.utils;
        let a=await number2BigNumber(proof.pi_a.slice(0,2))
        let b=await number2BigNumbers(proof.pi_b.slice(0,2))
        let c=await number2BigNumber(proof.pi_c.slice(0,2))
        let intputs=await number2BigNumber(input)
        let tx=await lock.verifyProof(a,[[b[0][1],b[0][0]],[b[1][1],b[1][0]]],c,intputs,{gasLimit:7000000})
            tx=await tx.wait()
        intputs[0]="0x1234567891230000000000000000000000000000000000000000000000000000"
        let txfail=await lock.verifyProof(a,[[b[0][1],b[0][0]],[b[1][1],b[1][0]]],c,intputs,{gasLimit:7000000})
        txfail=await txfail.wait()
        console.log( tx.gasUsed)
        console.log("fail", txfail.gasUsed)
        // console.log(proof)
        // console.log(await number2BigNumber(proof.pi_a.slice(0,2)),await number2BigNumbers(proof.pi_b.slice(0,2)),
        //     await number2BigNumber(proof.pi_c.slice(0,2)),await number2BigNumber(input))
        // console.log(await number2BigNumber(proof.pi_a.slice(0,2)),await number2BigNumbers(proof.pi_b.slice(0,2)),
        //     await number2BigNumber(proof.pi_c.slice(0,2)),await number2BigNumber(input))

      }
      console.log(gasueds);
      // expect(await lock.unlockTime()).to.equal(unlockTime);
      // expect(await lock.lockedAmount()).to.equal(lockedAmount);



    });
  });

});
