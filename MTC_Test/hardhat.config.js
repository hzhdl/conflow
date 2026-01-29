require("@nomicfoundation/hardhat-toolbox");

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.4.24",
  networks: {
    default: {
      url: "http://172.16.0.13:8645",
      chainId: 9,
    },
  },

};
