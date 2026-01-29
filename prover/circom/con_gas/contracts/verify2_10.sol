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

contract Groth16Verifier2_10 {
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


    uint256 constant IC0x = 18649558138043227760663594944636316187551289729309309564507701280410998433050;
    uint256 constant IC0y = 13487446829038106260840737713762679511178024552531654672089214902597328226784;

    uint256 constant IC1x = 19558583876548724552650077755170559306539518923877222402411664820064031931330;
    uint256 constant IC1y = 21357851344816322150354375991179141210631136916561278285871030711792063481514;

    uint256 constant IC2x = 13920965535395066097762805427613078213669440772970069365980771559996025614404;
    uint256 constant IC2y = 911099118924531634689775766713316953002690899621901672736155969044771541465;

    uint256 constant IC3x = 11433285151564650027598884712000090766681958885934660281067141163618823665186;
    uint256 constant IC3y = 9323686375926657248038172551731161142363465811767379796846009108549945980732;

    uint256 constant IC4x = 4871879281299972379708088354057754435401526028644077198501689125906188830331;
    uint256 constant IC4y = 10856466979403887435988577323042207917228003600040163011674586280080885831363;

    uint256 constant IC5x = 10288730432383944929125021528859719765814810126369240047588043692977812325251;
    uint256 constant IC5y = 1292484058222452433281628322769408950274621090029873052450309603843781655567;

    uint256 constant IC6x = 1853748518331897690083897733997613971284950033723163747746555327325040901350;
    uint256 constant IC6y = 5293767674520673067538326342396138902331734299653722828873340186848805553633;

    uint256 constant IC7x = 21102733283465343868246298481851826678644826059410751285609184283347947413705;
    uint256 constant IC7y = 14167206373116793089596395204265832159427336374764348032745750473860698613142;

    uint256 constant IC8x = 12954566043308855063933109953633135543571860957569106760596870491834191290126;
    uint256 constant IC8y = 8186466419953365387964317922878835438446121388227998636599051745164028231756;

    uint256 constant IC9x = 340441925574100525092794700260268418309776942139550511266531266320032362551;
    uint256 constant IC9y = 10930520883483653807446687894144207375462360626102384558903592262564780138569;

    uint256 constant IC10x = 8923527946227098599345968246500384351497106477152806585686821997112395804909;
    uint256 constant IC10y = 10192682683805602285519734907088350275578243992849138398568070022560000041565;

    uint256 constant IC11x = 2719619968744762907449307333850744309022128631380373011843975750215639326189;
    uint256 constant IC11y = 10492818819814307142510734664801792408533212036633792545699490413939049503781;

    uint256 constant IC12x = 8954337458563912402464430659015027190728862759329471549204004011333455507730;
    uint256 constant IC12y = 13751231942109124697223183764429600272739331086437613550621116342807983001855;

    uint256 constant IC13x = 5413024941547833013147219460753992011372010540072369247992064949021941568432;
    uint256 constant IC13y = 2433858984590161839372302974707321748885834076017803987557160783523671559360;

    uint256 constant IC14x = 17552078717752329902630227210274921589589499617786700164313142440932924126737;
    uint256 constant IC14y = 7441659052522515294602813200436837096856480255771532410851467217804849977252;

    uint256 constant IC15x = 5082113752596984690584547965638351549220158889713493184761273632519807916856;
    uint256 constant IC15y = 11268970410330192584356555849851862803365113451210404621890864496847243962910;

    uint256 constant IC16x = 19559719917768108991823452049650597808717966235256418733302439003120364489244;
    uint256 constant IC16y = 12617423132334785117964363045748035701522862098259965981362120304833142330375;

    uint256 constant IC17x = 10475307314341198019363736445310040496026655351623039042199148654325866765256;
    uint256 constant IC17y = 16464589724943742846672317428706766770862247999089905630155038228978840651300;

    uint256 constant IC18x = 1878520187039773534934636431868356918190075682970768433326328415994203950506;
    uint256 constant IC18y = 16190407755290844430227669290295871115728919169252115416249130723518610804012;

    uint256 constant IC19x = 5519684796675552295046882480766176169281137281253398772828848630910356553495;
    uint256 constant IC19y = 2306486838602681091782203945055905370313283593768366748680076639023276545154;

    uint256 constant IC20x = 8511721592256547172738403714257519135978971074654038415477409990260808053850;
    uint256 constant IC20y = 4848143658703602932887139570056764695854673135519119084290717693226937029169;

    uint256 constant IC21x = 176255623528764628571449367189916398077113951352590332685438030008950016871;
    uint256 constant IC21y = 2110784144096109451204178660917961244630654856848104627270287044512227319560;

    uint256 constant IC22x = 12243619507988247415101109146539552024517887184505117103519946618763198899957;
    uint256 constant IC22y = 6673329071577024912020595660996941920766574969209994066706840239255161451527;

    uint256 constant IC23x = 1324347797683546507432527089189484050906013729809728553483945753108397706903;
    uint256 constant IC23y = 19891057295572248522201139337618230816169950951223187073243068474731568098627;

    uint256 constant IC24x = 17852823748948995034920563764960519075018055223454381035331247819019236066476;
    uint256 constant IC24y = 13545535382678533084693501761223203352017611119133206623150927042495856181273;

    uint256 constant IC25x = 21619297699330814473357664145277512268901521086921942186631326188417680279573;
    uint256 constant IC25y = 11980034192892766724738014814208940101184441012922965429893115364624646194503;

    uint256 constant IC26x = 15625082097099597744152712245789229578815552254538652159753183640907480151413;
    uint256 constant IC26y = 3448951017279243693100465293296305671694000296541638339904843021564917086970;

    uint256 constant IC27x = 2544659068921035678602898431496578372046784673363297222998342410699631420637;
    uint256 constant IC27y = 9546654491520835575146906440704657156474087016920391872942923896343350023797;

    uint256 constant IC28x = 14302416744619927369107526098128367561822891983609580515657958299695737490828;
    uint256 constant IC28y = 9335813637981660756324971655017602035756911266593431839627788966250337181368;

    uint256 constant IC29x = 8239216786119909026319087854685770933433178423948085030386397784761896721159;
    uint256 constant IC29y = 4427202772266717317697766919506304379563544819572846610859046566506242760257;

    uint256 constant IC30x = 16661402588265686370995095434067843032294173461874458555447668441563781282766;
    uint256 constant IC30y = 247548698567548960869632087606278251896316576306524114102043180690892634442;

    uint256 constant IC31x = 15290507098426607156331136310483663182729328518259846814228179318694216161819;
    uint256 constant IC31y = 5537070743251952635706323548413350455765376833012697137626634099764945096558;

    uint256 constant IC32x = 18858981479250639774621258327972271908360724861294596937348539086470666396742;
    uint256 constant IC32y = 13338576718224515934481338350261737576101957246305958434528065378881144565769;

    uint256 constant IC33x = 6421600778356552876402347247136592851483337750826945311363464916380418469997;
    uint256 constant IC33y = 4329375177995880906171023008797301408146421156138798533762919187330819380679;

    uint256 constant IC34x = 15600069776816500339794007346641873856421687449182834096020060759958350880256;
    uint256 constant IC34y = 7811155466754227469257250268051515442008691694659808370340899833214027304046;

    uint256 constant IC35x = 12003685995509059663028783887881108949456723894506078966108053994786169554212;
    uint256 constant IC35y = 11093669600656286316557907279792223955336035288517177050882188796147078830683;

    uint256 constant IC36x = 8931175727841794084892752216684268050717762712937577201392527416539454365076;
    uint256 constant IC36y = 13013673893405899733615677120094581049434244219259197135070213850243078653948;

    uint256 constant IC37x = 19180810630393871480754268181500655123407745034495817102567866105694855292003;
    uint256 constant IC37y = 20336461059700626380056930885327479428677970015381868139516739601120103032433;

    uint256 constant IC38x = 7787011925236557853745724960517157035742558024130982651242977574987026487016;
    uint256 constant IC38y = 9603100608013957967576852191367911849772606073498406230894037879230139546950;

    uint256 constant IC39x = 16492555052574023488831598697257366931427568342780792085518268092271122214384;
    uint256 constant IC39y = 15386788081544505809775945167170565534076277996948318406879704290714438207395;

    uint256 constant IC40x = 21154756137424532678366645839076799419257110862177724078972768370596535978840;
    uint256 constant IC40y = 20507014521011058597268846056728372677802293346884131913823644141192056045375;


    // Memory data
    uint16 constant pVk = 0;
    uint16 constant pPairing = 128;

    uint16 constant pLastMem = 896;

    function verifyProof(uint[2] calldata _pA, uint[2][2] calldata _pB, uint[2] calldata _pC, uint[40] calldata _pubSignals) public returns (bool) {
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

                g1_mulAccC(_pVk, IC33x, IC33y, calldataload(add(pubSignals, 1024)))

                g1_mulAccC(_pVk, IC34x, IC34y, calldataload(add(pubSignals, 1056)))

                g1_mulAccC(_pVk, IC35x, IC35y, calldataload(add(pubSignals, 1088)))

                g1_mulAccC(_pVk, IC36x, IC36y, calldataload(add(pubSignals, 1120)))

                g1_mulAccC(_pVk, IC37x, IC37y, calldataload(add(pubSignals, 1152)))

                g1_mulAccC(_pVk, IC38x, IC38y, calldataload(add(pubSignals, 1184)))

                g1_mulAccC(_pVk, IC39x, IC39y, calldataload(add(pubSignals, 1216)))

                g1_mulAccC(_pVk, IC40x, IC40y, calldataload(add(pubSignals, 1248)))


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

            checkField(calldataload(add(_pubSignals, 1056)))

            checkField(calldataload(add(_pubSignals, 1088)))

            checkField(calldataload(add(_pubSignals, 1120)))

            checkField(calldataload(add(_pubSignals, 1152)))

            checkField(calldataload(add(_pubSignals, 1184)))

            checkField(calldataload(add(_pubSignals, 1216)))

            checkField(calldataload(add(_pubSignals, 1248)))

            checkField(calldataload(add(_pubSignals, 1280)))


            // Validate all evaluations
            let isValid := checkPairing(_pA, _pB, _pC, _pubSignals, pMem)

            mstore(0, isValid)
             return(0, 0x20)
         }
     }
 }
