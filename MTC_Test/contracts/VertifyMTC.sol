pragma solidity ^0.4.24;
import "./mimc7.sol";

contract VerifyMTC {
    using MiMC7 for uint256;

//    验证后更新每次的root
    uint256 lroot2;
    uint256 lroot4;

//    初始状态，初始化时保证其正确性
    uint256 ls2;
    uint256 ls4;



    constructor(uint256 lr2,uint256 lr4,uint256 ns2,uint256 ns4)public {
//        初始化数据，此时的数据应保证其可靠性
        lroot2=lr2;
        lroot4=lr4;

        ls2=ns2;
        ls4=ns4;

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




    function validation2(
        uint256  lasts,
        uint256  state1,
        uint256  state2,
        uint256  newstate) public returns (bool){

        uint256  res = concatandkeccak(
            concatandkeccak(
                concatandkeccak(ls2, state1),
                state2
            ),
            lasts
        );
        if(compare(res, lroot2)){
            //        更新root
            lroot2=concatandkeccak(
                concatandkeccak(
                    concatandkeccak(ls2, concatandkeccak(state1,state2)),
                lasts
                ),
                newstate
            );
    //        保存新状态数据并管理
            return true;
        }
        return false;

    }
//    function concatandkeccak4(uint256  b1, uint256  b2,uint256  b3, uint256  b4)
//    private
//    pure
//    returns (uint256 hash)
//    {
//        bytes memory tmp = new bytes(b1.length + b2.length + b3.length + b4.length);
//        uint256 p = 0;
//        for (uint256 i = 0; i < b1.length; i++) {
//            tmp[p] = b1[i];
//            tmp[p+32] = b1[i];
//            tmp[p+64] = b1[i];
//            tmp[p+96] = b1[i];
//            p++;
//        }
//
//        hash=sha256(tmp);
//    }
//    function validation4(bytes32  lasts,
//        bytes32[4]  state,
//        uint256  index,
//        bytes32  newstate) public returns(bool) {
//
//        bytes32  res = concatandkeccak(
//            concatandkeccak(
//                concatandkeccak(
//                    concatandkeccak(
//                        concatandkeccak(sha256(abi.encode(ls4)), state[0]),
//                        state[1]
//                    ),
//                    state[2]
//                ),
//                state[3]
//            ),
//            lasts
//        );
//        if(compare(res, lroot4)){
//            //        更新root
//            if (index == 3) {
//                state[0] = concatandkeccak4(state[0],state[1], state[2],state[3]);
//                state[1] = lasts;
//                state[2] = 0x0000000000000000000000000000000000000000000000000000000000000000;
//                state[3] = 0x0000000000000000000000000000000000000000000000000000000000000000;
//
//            } else {
//                state[index+1] = lasts;
//            }
//            lroot4 = concatandkeccak(
//                concatandkeccak(
//                    concatandkeccak(
//                        concatandkeccak(
//                            concatandkeccak(sha256(abi.encode(ls4)), state[0]),
//                            state[1]
//                        ),
//                        state[2]
//                    ),
//                    state[3]
//                ),
//                lasts
//            );
//            //        保存新状态数据并管理
//            return true;
//        }
//        return false;
//
//    }


    function compare(uint256  b1,uint256  b2) private pure  returns (bool)
    {
        return b1==b2;

    }
}
