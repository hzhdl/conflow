require("@nomicfoundation/hardhat-toolbox");
require("hardhat-gas-reporter");

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.11",
  networks: {
    default: {
      url: "http://172.16.0.13:8645",
      chainId: 9,
    },
  },
  gasReporter: {
    enabled: true, // 启用gas报告
    // currency: 'USD', // 可选：设置货币单位
    // gasPrice: 20, // 可选：设置gas价格
    // coinmarketcap: 'YOUR_COINMARKETCAP_API_KEY', // 可选：设置CoinMarketCap API密钥
    // token: 'ETH', // 可选：设置token类型
    showTimeSpent: true, // 可选：显示测试花费的时间
    outputFile: 'gas-report.txt', // 可选：设置输出文件
  },
};
