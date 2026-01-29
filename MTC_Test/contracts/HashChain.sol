// SPDX-License-Identifier: MIT
pragma solidity >=0.4.24;
import "./mimc7.sol";

contract HashChain {
    using MiMC7 for uint256;
    uint256 laststate;

    mapping(uint256=>uint256[2]) states;
    uint256 count;

    constructor() public  {
        count = 1;
        states[0][0]=1234;
        states[0][1]=MiMC7.hash(1234,0);
    }

    function setnewstat( uint256  next) public   {
        states[count][0]=next;
        states[count][1]=concatandkeccak(next,states[count][1]);
        count++;
    }

    function concatandkeccak(uint256  b1, uint256  b2)
        private
        pure
        returns (uint256 hash)
    {
        uint256[2] memory data;
        data[0]=b1;
        data[1]=b2;
        hash=MiMC7.mutilhash2(data,0);
    }





}
