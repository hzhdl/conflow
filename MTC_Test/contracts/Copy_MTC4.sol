// SPDX-License-Identifier: MIT
pragma solidity >=0.4.24;

contract MTC4 {
    bytes32 laststate;

    bytes32 public  s0=bytes2(0x1234);

    bytes32[4] States;
    uint256 count;

    // bytes[2] Proofpath;
    bytes32 root;

    constructor() public  {
        count = 3;
        States[0] = s0;
        States[1] = s0;
        States[2] = s0;
        States[3] = s0;

        
    }

    function setnewstat( bytes32  next) public   {
        setnewstat(laststate,next); 
    }

    function concatandkeccak(bytes32  b1, bytes32  b2)
        private
        pure 
        returns (bytes32 hash)
    {
        bytes memory tmp = new bytes(b1.length + b2.length);
        uint256 p = 0;
        for (uint256 i = 0; i < b1.length; i++) {
            tmp[p] = b1[i];
            p++;
        }
        for (uint256 j = 0; j < b2.length; j++) {
            tmp[p] = b2[j];
            p++;
        }
        hash=keccak256(tmp);
    }
    function concatandkeccak4(bytes32  b1, bytes32  b2,bytes32  b3, bytes32  b4)
        private
        pure 
        returns (bytes32 hash)
    {
        bytes memory tmp = new bytes(b1.length + b2.length + b3.length + b4.length);
        uint256 p = 0;
        for (uint256 i = 0; i < b1.length; i++) {
            tmp[p] = b1[i];
            p++;
        }
        for (uint256 j = 0; j < b2.length; j++) {
            tmp[p] = b2[j];
            p++;
        }
        for (uint256 k = 0; k < b3.length; k++) {
            tmp[p] = b3[k];
            p++;
        }
        for (uint256 z = 0; z < b4.length; z++) {
            tmp[p] = b4[z];
            p++;
        }
        hash=keccak256(tmp);
    }

    function setnewstat(bytes32  last, bytes32  next) private  {
        // 存储数据，状态池满时，进行MT累加，卷积数据。
        if (count == 3) {
            States[0] = concatandkeccak4(States[1], States[2],States[3],last);
            States[1] = last;
            States[2] = 0x0000000000000000000000000000000000000000000000000000000000000000;
            States[3] = 0x0000000000000000000000000000000000000000000000000000000000000000;
            count = 1;
        } else {
            States[count+1] = last;
            count++;
        }
        
        

        // 将要更新的数据刷入当前状态数据中
        laststate = next;
    }

    function validation(bytes32  lasts,
            bytes32  state1,
            bytes32  state2,
            bytes32  state3,
            bytes32  state4,
            bytes32  roothash) public view  returns(bool){

            bytes32  res = concatandkeccak(
                concatandkeccak(
                    concatandkeccak(
                        concatandkeccak(
                            concatandkeccak(keccak256(abi.encode(s0)), state1),
                            state2
                        ),
                        state3
                    ),
                    state4
                ),
                lasts
            );
        return compare(res, roothash);
    }

    function compare(bytes32  b1,bytes32  b2) private pure  returns (bool)
    {
        for(uint256 i=0;i<b1.length;i++){
            if(b1[i]!=b2[i]) return false;
        }
        return true;
        


    }

    

    function getstateandproof()
        public 
        view 
        returns (
            bytes32  lasts,
            bytes32  state1,
            bytes32  state2,
            bytes32  state3,
            bytes32  state4,
            bytes32  roothash
        )
    {
        lasts = laststate;
        state1 = States[0];
        state2 = States[1];
        state3 = States[2];
        state4 = States[3];
        // 计算hash指针，生成root和proofpath
        // Proofpath[0]=keccak256(keccak256(s0)+States[0]);
        // Proofpath[1]=keccak256(keccak256(keccak256(keccak256(s0)+States[0]))+States[1]);
       
        roothash = concatandkeccak(
            concatandkeccak(
                concatandkeccak(
                    concatandkeccak(
                        concatandkeccak(keccak256(abi.encode(s0)), States[0]),
                        States[1] 
                    ),
                    States[2] 
                ),
                States[3] 
            ),
            lasts
        );
    }
}
