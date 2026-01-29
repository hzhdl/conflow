// SPDX-License-Identifier: MIT
pragma solidity >=0.4.24;
import "./mimc7.sol";


contract MTC2 {
    using MiMC7 for uint256;
    uint256 laststate;

    uint256   s0=1234;
    // uint256 s0=uint256(1234);

    uint256[2] States;

    // bytes[2] Proofpath;
    uint256 root;

    constructor()   {
        States[0] = s0;
        States[1] = s0;
        laststate = s0;
        // setnewstat(s0, s0);
    }

    function setnewstat( uint256  next) public   {
        setnewstat(laststate,next);
    }

    function concatandkeccak(uint256  b1, uint256  b2)
        private
        pure
        returns (uint256 hash)
    {
        // uint256 tmp;
        // tmp=b1>b2?b1-b2:b2-b1;
        // hash=MiMC7.hash(addmod(b1, b2, MiMC7.p),0);
        // hash=MiMC7.hash(b1>b2?b1-b2:b2-b1,0);
        uint256[2] memory data;
        data[0]=b1;
        data[1]=b2;
        hash=MiMC7.mutilhash2(data,0);
    }

    function setnewstat(uint256  last, uint256  next) private  {
        // 存储数据，状态池满时，进行MT累加，卷积数据。
        States[0] = concatandkeccak(States[0], States[1]);
        States[1] = last;
        // 将要更新的数据刷入当前状态数据中
        laststate = next;
    }



    function validation(uint256  lasts,
            uint256  state1,
            uint256  state2,
            uint256  roothash) public view  returns(bool){

            uint256  res = concatandkeccak(
                concatandkeccak(
                    concatandkeccak(s0, state1),
                    state2
                ),
                lasts
            );
        return res==roothash;
    }



    function getstateandproof()
        public
        view
        returns (

            uint256  state0,
            uint256  state1,
            uint256  state2,
            uint256  lasts,
            uint256  roothash
        )
    {
        state0=s0;
        lasts = laststate;
        state1 = States[0];
        state2 = States[1];
        // 计算hash指针，生成root和proofpath
        // Proofpath[0]=sha256(sha256(s0)+States[0]);
        // Proofpath[1]=sha256(sha256(sha256(sha256(s0)+States[0]))+States[1]);

        roothash = concatandkeccak(
            concatandkeccak(
                concatandkeccak(state0, States[0]),
                States[1]
            ),
            lasts
        );
    }
}

