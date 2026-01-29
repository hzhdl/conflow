// SPDX-License-Identifier: MIT
pragma solidity >=0.4.24;

contract MTC8 {
    bytes32 laststate;

    bytes32 public  s0=bytes2(0x1234);

    bytes32[8] States;
    uint256 count;

    // bytes[2] Proofpath;
    bytes32 root;

    constructor() public  {
        count = 7;
        States[0] = s0;
        States[1] = s0;
        States[2] = s0;
        States[3] = s0;
        States[4] = s0;
        States[5] = s0;
        States[6] = s0;
        States[7] = s0;

        
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
    function concatandkeccak8(bytes32  b1, bytes32  b2,bytes32  b3, bytes32  b4,bytes32  b5, bytes32  b6,bytes32  b7, bytes32  b8)
        private
        pure 
        returns (bytes32 hash)
    {
        bytes memory tmp = new bytes(32*8);
        for (uint256 i = 0; i < b1.length; i++) {
            tmp[i] = b1[i];
            tmp[i+32] = b2[i];
            tmp[i+64] = b3[i];
            tmp[i+96] = b4[i];
            tmp[i+128] = b5[i];
            tmp[i+160] = b6[i];
            tmp[i+192] = b7[i];
            tmp[i+224] = b8[i];
            
        }
        hash=keccak256(tmp);
    }

    function setnewstat(bytes32  last, bytes32  next) private  {
        // 存储数据，状态池满时，进行MT累加，卷积数据。
        if (count == 7) {
            States[0] = concatandkeccak8(States[1], States[2],States[3],States[4], States[5],States[6],States[7],last);
            States[1] = last;
            States[2] = 0x0000000000000000000000000000000000000000000000000000000000000000;
            States[3] = 0x0000000000000000000000000000000000000000000000000000000000000000;
            States[4] = 0x0000000000000000000000000000000000000000000000000000000000000000;
            States[5] = 0x0000000000000000000000000000000000000000000000000000000000000000;
            States[6] = 0x0000000000000000000000000000000000000000000000000000000000000000;
            States[7] = 0x0000000000000000000000000000000000000000000000000000000000000000;
            count = 1;
        } else {
            States[count+1] = last;
            count++;
        }
        
        
        // 将要更新的数据刷入当前状态数据中
        laststate = next;
    }
    function keccaks(bytes32  state1,
            bytes32  state2,
            bytes32  state3,
            bytes32  state4,
            bytes32  state5
        ) private view returns (bytes32 mid){
        mid=concatandkeccak(
                concatandkeccak(
                    concatandkeccak(
                        concatandkeccak(
                            concatandkeccak(keccak256(abi.encode(s0)), state1),
                            state2),
                        state3
                    ),
                    state4
                ), 
                state5
            );
    }

    function validation(bytes32  lasts,
            bytes32  state1,
            bytes32  state2,
            bytes32  state3,
            bytes32  state4,
            bytes32  state5,
            bytes32  state6,
            bytes32  state7,
            bytes32  state8,
            bytes32  roothash) public view  returns(bool){
                

            bytes32  res = concatandkeccak(
                concatandkeccak(
                    concatandkeccak(
                        concatandkeccak(
                            keccaks(state1,state2,state3,state4,state5)
                            ,
                            state6
                        ),
                        state7
                    ),
                    state8
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
            bytes32  state5,
            bytes32  state6,
            bytes32  state7,
            bytes32  state8,
            bytes32  roothash
        )
    {
        lasts = laststate;
        state1 = States[0];
        state2 = States[1];
        state3 = States[2];
        state4 = States[3];
        state5 = States[4];
        state6 = States[5];
        state7 = States[6];
        state8 = States[7];
        // 计算hash指针，生成root和proofpath
        // Proofpath[0]=keccak256(keccak256(s0)+States[0]);
        // Proofpath[1]=keccak256(keccak256(keccak256(keccak256(s0)+States[0]))+States[1]);
        
        roothash = concatandkeccak(
            concatandkeccak(
                concatandkeccak(
                    concatandkeccak(
                        concatandkeccak(
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
                            States[4]
                        ),
                        States[5] 
                    ),
                    States[6] 
                ),
                States[7] 
            ),
            lasts
        );
    }
}
