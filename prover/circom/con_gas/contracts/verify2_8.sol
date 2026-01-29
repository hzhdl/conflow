// SPDX-License-Identifier: GPL-3.0
/*
    Copyright 2021 0KIMS association.

    This file is generated with [snarkJS](https://github.com/iden3/snarkjs).

    snarkJS is a free software: you can redistribute it and/or modify it
    under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    snarkJS is distributed in the hope that it will be useful, but WITHOUT
    ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
    or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public
    License for more details.

    You should have received a copy of the GNU General Public License
    along with snarkJS. If not, see <https://www.gnu.org/licenses/>.
*/

pragma solidity >=0.7.0 <0.9.0;

contract Groth16Verifier2_8 {
    // Scalar field size
    uint256 constant r    = 21888242871839275222246405745257275088548364400416034343698204186575808495617;
    // Base field size
    uint256 constant q   = 21888242871839275222246405745257275088696311157297823662689037894645226208583;

    // Verification Key data
    uint256 constant alphax  = 18113701599702960939815461760114797017867204523419505319507439174274894523138;
    uint256 constant alphay  = 11308461443733322241968198500621184609624604577653881130092330838043751385684;
    uint256 constant betax1  = 6737422371443211009337018246491521817470394847694328368650079476432666359949;
    uint256 constant betax2  = 18409018230954575423235412852648372571827307435058091575801987218984863651586;
    uint256 constant betay1  = 5683103026033830506748295027318228942526014559685594521305579540479845206350;
    uint256 constant betay2  = 14877077335196579790986602992687162346089872079334025178075440281613701761013;
    uint256 constant gammax1 = 11559732032986387107991004021392285783925812861821192530917403151452391805634;
    uint256 constant gammax2 = 10857046999023057135944570762232829481370756359578518086990519993285655852781;
    uint256 constant gammay1 = 4082367875863433681332203403145435568316851327593401208105741076214120093531;
    uint256 constant gammay2 = 8495653923123431417604973247489272438418190587263600148770280649306958101930;
    uint256 constant deltax1 = 11559732032986387107991004021392285783925812861821192530917403151452391805634;
    uint256 constant deltax2 = 10857046999023057135944570762232829481370756359578518086990519993285655852781;
    uint256 constant deltay1 = 4082367875863433681332203403145435568316851327593401208105741076214120093531;
    uint256 constant deltay2 = 8495653923123431417604973247489272438418190587263600148770280649306958101930;


    uint256 constant IC0x = 2456032805833069047293857104010838429620282746451318046119218747325502888081;
    uint256 constant IC0y = 10277049786090835342687550917471147094372392422354692330902506061034309617298;

    uint256 constant IC1x = 2796768169572786520776439710813984274231840392318365762563134280882856477110;
    uint256 constant IC1y = 13971512146044886046644996891922498648876393671029584616796082276937425506223;

    uint256 constant IC2x = 9766209981050294186281107813708593758707272119177617880936992015456255768728;
    uint256 constant IC2y = 17818110575862260660031037674872638151903887367072851150176531337670908786490;

    uint256 constant IC3x = 2689683155330989490756034664321360617076622229903138947079770029008937344219;
    uint256 constant IC3y = 2649754806871446181026320488891335504585167461125545900053410676648150487929;

    uint256 constant IC4x = 2825267710970756354923443708204898413540565791078393240305715872761427769490;
    uint256 constant IC4y = 4762443668244910683190571131536619674381956773796551141808767402438998004293;

    uint256 constant IC5x = 3407992564703893802852987878103133698369840849651159986580166713061753061198;
    uint256 constant IC5y = 16077709778744584048397320086896653361079827864968170149537090153075739315265;

    uint256 constant IC6x = 2508880542607983771989890210912029743301538093906361177097708789224494762080;
    uint256 constant IC6y = 19886561808744429727547027248745366357893395730990700686746063251615295553318;

    uint256 constant IC7x = 3011735192646519088335157471085123153903827841440023177760948381147384601655;
    uint256 constant IC7y = 7935832223261504448191535353940762578863836976652317796413498084887137612923;

    uint256 constant IC8x = 16465636512568142559192971383260884460799608000727234658939038113334657788055;
    uint256 constant IC8y = 17951252328249905239847213000061998074004824111143013828209380561859820902037;

    uint256 constant IC9x = 13936255768959758794591713185130789522175620399604084311199197993751176865487;
    uint256 constant IC9y = 14888154666740221249647017627492671821272525031872756884528947309118233340102;

    uint256 constant IC10x = 4455572195464537916549269814353916363680212779698702963909642220958030235980;
    uint256 constant IC10y = 13518783226685505992811363676441667763325000854293069628477853121763004387182;

    uint256 constant IC11x = 20687298910060048215954972905572926444669367521243916499765751385005105741006;
    uint256 constant IC11y = 1336136331049836553990379179790479064864262867789866176103926152913951216418;

    uint256 constant IC12x = 21843858677747205153985523320944831762928101122983205842581823854830590941074;
    uint256 constant IC12y = 15957123673250856985875459549995635686187713493555369529247417384802298271984;

    uint256 constant IC13x = 15229298631403188393603914615104659174536764798920288194671468844015947181284;
    uint256 constant IC13y = 16600382359642398456725336887532684342125261086841946935594706119393487763541;

    uint256 constant IC14x = 3098543960662924610666748482606936154157088983000919694246813835909233484758;
    uint256 constant IC14y = 20495905824807176456252476651447920308318963462388510168208900303841475269257;

    uint256 constant IC15x = 704499645656246699804678367096816836436772128210056502485588503669389021378;
    uint256 constant IC15y = 13050877569251415223259466113589475177898397046812399021473236628150203033931;

    uint256 constant IC16x = 8534934206898784579996881403753301078231471560520385451158387612361837546635;
    uint256 constant IC16y = 15787892192822565727389256325229023725263615696122818106154188759312479881505;

    uint256 constant IC17x = 15836782786366963238978815139322238819238334956975708969857078726294901983305;
    uint256 constant IC17y = 13009911678796565818994124812025584777616517001105080430594163136864514460782;

    uint256 constant IC18x = 5502924042598623220548601452021163659011831696479266262938006451096915599327;
    uint256 constant IC18y = 4650719440865192973738895721090377117791777676288418285389210689947845097438;

    uint256 constant IC19x = 12369963648546032799911199033959396948274806285875895626938745201501575803180;
    uint256 constant IC19y = 10865428539609564283418057374015227008347045833463901637208840042417845122625;

    uint256 constant IC20x = 471762406421663763927206344107343263312594534427238087965116354798282338744;
    uint256 constant IC20y = 11166399946216552960549776622612848992680919445858213159673507786958459947534;

    uint256 constant IC21x = 18245064003377670568926300118579267548804493927377131813365818183040477796338;
    uint256 constant IC21y = 18005731329729794949943911786756391221323182797864709252713635918231941592551;

    uint256 constant IC22x = 2361669392904252611522494468131022062928021516150637385163305640801166730950;
    uint256 constant IC22y = 7953644597848009258830554944669158737933884068163364287476451893404483297236;

    uint256 constant IC23x = 4433110868036756713941507040060486233444698335757218727979435924662188980813;
    uint256 constant IC23y = 6078519902569998001750134704019033476492791759621168459480929692634499211447;

    uint256 constant IC24x = 21626354632117141494701340293235149209449048241999404215548184607518011929469;
    uint256 constant IC24y = 20772300049977937796613712678804642372333523326729234872065391606999028961716;

    uint256 constant IC25x = 10409367506611719791149076252677657658461669326537013939846751051399575464416;
    uint256 constant IC25y = 823866804692287513482582641539644821822109472526140731782305391950356884721;

    uint256 constant IC26x = 10961589152834934370282465467105840789430101698272135196156016916475513442191;
    uint256 constant IC26y = 13695693813402143575584014569102043451782054681862903137377529252835737743946;

    uint256 constant IC27x = 19972575810558968628057914944445906549697683390781303989272794971185760948095;
    uint256 constant IC27y = 16466586741347851199425014989656366172936903176385356913902272634248668952705;

    uint256 constant IC28x = 18575822170689935963250846040000391653901291453774682809941314383884599711331;
    uint256 constant IC28y = 5677666186006950231538465390590829427752963807792530501029328447183220570215;

    uint256 constant IC29x = 17471239173885725087340307193539092802806793926073301925174579492754417376811;
    uint256 constant IC29y = 3499590925952480068613838409773689026927800143084909410931225981220644133192;

    uint256 constant IC30x = 11521524775813810899665004512887723439330888335470853245286615449573891613178;
    uint256 constant IC30y = 2552163838994969590185330940002523495836336247587497606272077228997201040669;

    uint256 constant IC31x = 11451443967099753203057343573469626912569056817475041348765340848014294196842;
    uint256 constant IC31y = 9765148968141165197153785458338489914722523614665281585924941617737084771276;

    uint256 constant IC32x = 4775669978022901109026451083989513778462188974909645521755586042749878517047;
    uint256 constant IC32y = 3281318030172643999350884258909003078823089016475940024341239101934717966862;


    // Memory data
    uint16 constant pVk = 0;
    uint16 constant pPairing = 128;

    uint16 constant pLastMem = 896;

    function verifyProof(uint[2] calldata _pA, uint[2][2] calldata _pB, uint[2] calldata _pC, uint[32] calldata _pubSignals) public returns (bool) {
        assembly {
            function checkField(v) {
                if iszero(lt(v, r)) {
                    mstore(0, 0)
                    return(0, 0x20)
                }
            }

            // G1 function to multiply a G1 value(x,y) to value in an address
            function g1_mulAccC(pR, x, y, s) {
                let success
                let mIn := mload(0x40)
                mstore(mIn, x)
                mstore(add(mIn, 32), y)
                mstore(add(mIn, 64), s)

                success := staticcall(sub(gas(), 2000), 7, mIn, 96, mIn, 64)

                if iszero(success) {
                    mstore(0, 0)
                    return(0, 0x20)
                }

                mstore(add(mIn, 64), mload(pR))
                mstore(add(mIn, 96), mload(add(pR, 32)))

                success := staticcall(sub(gas(), 2000), 6, mIn, 128, pR, 64)

                if iszero(success) {
                    mstore(0, 0)
                    return(0, 0x20)
                }
            }

            function checkPairing(pA, pB, pC, pubSignals, pMem) -> isOk {
                let _pPairing := add(pMem, pPairing)
                let _pVk := add(pMem, pVk)

                mstore(_pVk, IC0x)
                mstore(add(_pVk, 32), IC0y)

                // Compute the linear combination vk_x

                g1_mulAccC(_pVk, IC1x, IC1y, calldataload(add(pubSignals, 0)))

                g1_mulAccC(_pVk, IC2x, IC2y, calldataload(add(pubSignals, 32)))

                g1_mulAccC(_pVk, IC3x, IC3y, calldataload(add(pubSignals, 64)))

                g1_mulAccC(_pVk, IC4x, IC4y, calldataload(add(pubSignals, 96)))

                g1_mulAccC(_pVk, IC5x, IC5y, calldataload(add(pubSignals, 128)))

                g1_mulAccC(_pVk, IC6x, IC6y, calldataload(add(pubSignals, 160)))

                g1_mulAccC(_pVk, IC7x, IC7y, calldataload(add(pubSignals, 192)))

                g1_mulAccC(_pVk, IC8x, IC8y, calldataload(add(pubSignals, 224)))

                g1_mulAccC(_pVk, IC9x, IC9y, calldataload(add(pubSignals, 256)))

                g1_mulAccC(_pVk, IC10x, IC10y, calldataload(add(pubSignals, 288)))

                g1_mulAccC(_pVk, IC11x, IC11y, calldataload(add(pubSignals, 320)))

                g1_mulAccC(_pVk, IC12x, IC12y, calldataload(add(pubSignals, 352)))

                g1_mulAccC(_pVk, IC13x, IC13y, calldataload(add(pubSignals, 384)))

                g1_mulAccC(_pVk, IC14x, IC14y, calldataload(add(pubSignals, 416)))

                g1_mulAccC(_pVk, IC15x, IC15y, calldataload(add(pubSignals, 448)))

                g1_mulAccC(_pVk, IC16x, IC16y, calldataload(add(pubSignals, 480)))

                g1_mulAccC(_pVk, IC17x, IC17y, calldataload(add(pubSignals, 512)))

                g1_mulAccC(_pVk, IC18x, IC18y, calldataload(add(pubSignals, 544)))

                g1_mulAccC(_pVk, IC19x, IC19y, calldataload(add(pubSignals, 576)))

                g1_mulAccC(_pVk, IC20x, IC20y, calldataload(add(pubSignals, 608)))

                g1_mulAccC(_pVk, IC21x, IC21y, calldataload(add(pubSignals, 640)))

                g1_mulAccC(_pVk, IC22x, IC22y, calldataload(add(pubSignals, 672)))

                g1_mulAccC(_pVk, IC23x, IC23y, calldataload(add(pubSignals, 704)))

                g1_mulAccC(_pVk, IC24x, IC24y, calldataload(add(pubSignals, 736)))

                g1_mulAccC(_pVk, IC25x, IC25y, calldataload(add(pubSignals, 768)))

                g1_mulAccC(_pVk, IC26x, IC26y, calldataload(add(pubSignals, 800)))

                g1_mulAccC(_pVk, IC27x, IC27y, calldataload(add(pubSignals, 832)))

                g1_mulAccC(_pVk, IC28x, IC28y, calldataload(add(pubSignals, 864)))

                g1_mulAccC(_pVk, IC29x, IC29y, calldataload(add(pubSignals, 896)))

                g1_mulAccC(_pVk, IC30x, IC30y, calldataload(add(pubSignals, 928)))

                g1_mulAccC(_pVk, IC31x, IC31y, calldataload(add(pubSignals, 960)))

                g1_mulAccC(_pVk, IC32x, IC32y, calldataload(add(pubSignals, 992)))


                // -A
                mstore(_pPairing, calldataload(pA))
                mstore(add(_pPairing, 32), mod(sub(q, calldataload(add(pA, 32))), q))

                // B
                mstore(add(_pPairing, 64), calldataload(pB))
                mstore(add(_pPairing, 96), calldataload(add(pB, 32)))
                mstore(add(_pPairing, 128), calldataload(add(pB, 64)))
                mstore(add(_pPairing, 160), calldataload(add(pB, 96)))

                // alpha1
                mstore(add(_pPairing, 192), alphax)
                mstore(add(_pPairing, 224), alphay)

                // beta2
                mstore(add(_pPairing, 256), betax1)
                mstore(add(_pPairing, 288), betax2)
                mstore(add(_pPairing, 320), betay1)
                mstore(add(_pPairing, 352), betay2)

                // vk_x
                mstore(add(_pPairing, 384), mload(add(pMem, pVk)))
                mstore(add(_pPairing, 416), mload(add(pMem, add(pVk, 32))))


                // gamma2
                mstore(add(_pPairing, 448), gammax1)
                mstore(add(_pPairing, 480), gammax2)
                mstore(add(_pPairing, 512), gammay1)
                mstore(add(_pPairing, 544), gammay2)

                // C
                mstore(add(_pPairing, 576), calldataload(pC))
                mstore(add(_pPairing, 608), calldataload(add(pC, 32)))

                // delta2
                mstore(add(_pPairing, 640), deltax1)
                mstore(add(_pPairing, 672), deltax2)
                mstore(add(_pPairing, 704), deltay1)
                mstore(add(_pPairing, 736), deltay2)


                let success := staticcall(sub(gas(), 2000), 8, _pPairing, 768, _pPairing, 0x20)

                isOk := and(success, mload(_pPairing))
            }

            let pMem := mload(0x40)
            mstore(0x40, add(pMem, pLastMem))

            // Validate that all evaluations ∈ F

            checkField(calldataload(add(_pubSignals, 0)))

            checkField(calldataload(add(_pubSignals, 32)))

            checkField(calldataload(add(_pubSignals, 64)))

            checkField(calldataload(add(_pubSignals, 96)))

            checkField(calldataload(add(_pubSignals, 128)))

            checkField(calldataload(add(_pubSignals, 160)))

            checkField(calldataload(add(_pubSignals, 192)))

            checkField(calldataload(add(_pubSignals, 224)))

            checkField(calldataload(add(_pubSignals, 256)))

            checkField(calldataload(add(_pubSignals, 288)))

            checkField(calldataload(add(_pubSignals, 320)))

            checkField(calldataload(add(_pubSignals, 352)))

            checkField(calldataload(add(_pubSignals, 384)))

            checkField(calldataload(add(_pubSignals, 416)))

            checkField(calldataload(add(_pubSignals, 448)))

            checkField(calldataload(add(_pubSignals, 480)))

            checkField(calldataload(add(_pubSignals, 512)))

            checkField(calldataload(add(_pubSignals, 544)))

            checkField(calldataload(add(_pubSignals, 576)))

            checkField(calldataload(add(_pubSignals, 608)))

            checkField(calldataload(add(_pubSignals, 640)))

            checkField(calldataload(add(_pubSignals, 672)))

            checkField(calldataload(add(_pubSignals, 704)))

            checkField(calldataload(add(_pubSignals, 736)))

            checkField(calldataload(add(_pubSignals, 768)))

            checkField(calldataload(add(_pubSignals, 800)))

            checkField(calldataload(add(_pubSignals, 832)))

            checkField(calldataload(add(_pubSignals, 864)))

            checkField(calldataload(add(_pubSignals, 896)))

            checkField(calldataload(add(_pubSignals, 928)))

            checkField(calldataload(add(_pubSignals, 960)))

            checkField(calldataload(add(_pubSignals, 992)))

            checkField(calldataload(add(_pubSignals, 1024)))


            // Validate all evaluations
            let isValid := checkPairing(_pA, _pB, _pC, _pubSignals, pMem)

            mstore(0, isValid)
             return(0, 0x20)
         }
     }
 }
