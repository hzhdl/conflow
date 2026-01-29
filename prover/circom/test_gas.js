const fs = require('fs');
const Web3 = require('web3');

// 连接到以太坊节点（例如 Ganache 或 Infura）
const web3 = new Web3('http://localhost:8545'); // 替换为你的以太坊节点URL

// 读取proof.json文件
const proofData = JSON.parse(fs.readFileSync('proof.json', 'utf8'));

// 假设你的验证合约地址和ABI
const contractAddress = '0xYourContractAddress';
const contractABI = [
    // 替换为你的验证合约的ABI
    // 例如：
    // {
    //     "constant": false,
    //     "inputs": [
    //         { "name": "proof", "type": "bytes" },
    //         { "name": "publicInputs", "type": "uint256[]" }
    //     ],
    //     "name": "verifyProof",
    //     "outputs": [
    //         { "name": "", "type": "bool" }
    //     ],
    //     "payable": false,
    //     "stateMutability": "nonpayable",
    //     "type": "function"
    // }
];

// 创建合约实例
const contract = new web3.eth.Contract(contractABI, contractAddress);

// 获取默认账户
web3.eth.getAccounts().then(accounts => {
    const account = accounts[0];

    // 准备调用合约的参数
    const proof = proofData.proof;
    const publicInputs = proofData.publicInputs;

    // 调用合约的verifyProof函数
    contract.methods.verifyProof(proof, publicInputs).estimateGas({ from: account })
        .then(gasEstimate => {
            console.log('Gas Estimate:', gasEstimate);

            // 实际调用合约并获取gas开销
            return contract.methods.verifyProof(proof, publicInputs).send({ from: account });
        })
        .then(receipt => {
            console.log('Transaction Receipt:', receipt);
            console.log('Gas Used:', receipt.gasUsed);
        })
        .catch(err => {
            console.error('Error:', err);
        });
});
