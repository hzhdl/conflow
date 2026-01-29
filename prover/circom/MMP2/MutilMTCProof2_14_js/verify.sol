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

contract Groth16Verifier {
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

    
    uint256 constant IC0x = 4436626890622766349348958249155482598887042189382824054119504410345066966682;
    uint256 constant IC0y = 21054491352868680302893847445391282757316137647840638323160921392076828326821;
    
    uint256 constant IC1x = 8731514866726804157523692281003942702913823324245292920767998647277996757756;
    uint256 constant IC1y = 7283587251070804299062822157348000560039303057109056251883136417509733958403;
    
    uint256 constant IC2x = 19442771215791501787889960448632788106649826479269454292080706328142519637964;
    uint256 constant IC2y = 21692255207519649990647229958022852712802610134409060877536279776434965847772;
    
    uint256 constant IC3x = 13953513655941763705125541826910668709944129880212317456694630488199286923634;
    uint256 constant IC3y = 12400490152936905068417742747597634805738200516722924733077513289652803982321;
    
    uint256 constant IC4x = 6016597865353578936672965149200551280254903251075604575528347920938804482505;
    uint256 constant IC4y = 8764558749997627340550123300165230461740963579829501305076965451456741354791;
    
    uint256 constant IC5x = 13281773185254132978433611119404953024594502599526939390929102256954697084618;
    uint256 constant IC5y = 803557849151402649676606080748746591735176859269324587810990646101312236581;
    
    uint256 constant IC6x = 19324633330059490309400704270116564569585121048095326752455176431250569647313;
    uint256 constant IC6y = 2836047877878258163586229330989378999456143099172161503910139830213130958225;
    
    uint256 constant IC7x = 21301277474193608129575249487260783501261852885805344409590851619213288285357;
    uint256 constant IC7y = 3839578341831997989321018824357525766478808579082369857223206619707948453677;
    
    uint256 constant IC8x = 12939339390696871497809828851334749495022213997302185862080063884971304341544;
    uint256 constant IC8y = 5353830275313960397491379707983894211265321891603888232846998745196057169103;
    
    uint256 constant IC9x = 8647417784202443829849648010791329004054561807463032312579521992211159640227;
    uint256 constant IC9y = 9010340136295964289799853478479524670127192834426795382973662237074197776014;
    
    uint256 constant IC10x = 20484131747345995384430417033077763695096286539251289819501651668857567822309;
    uint256 constant IC10y = 19780350928468578862066913342391166472844076758081256334931288709749885720898;
    
    uint256 constant IC11x = 19480784419184936741231109208604593198171939533748132674753762928902623542510;
    uint256 constant IC11y = 8153361976638936188382622314483250672633493336141832876624412130694149684307;
    
    uint256 constant IC12x = 21799227100938716355420348210297211283534963355597402212839655587063638837384;
    uint256 constant IC12y = 12739612080671628720762418101484736190073841842178584693446917744216632551516;
    
    uint256 constant IC13x = 1826035304847069569341185457487992156284193396818406661574080175663081250112;
    uint256 constant IC13y = 12412579649825468785264528250266042762550386696344701557505525046913634008712;
    
    uint256 constant IC14x = 6091460183582449720617467545897722232336720174119500768740714286180628301715;
    uint256 constant IC14y = 7296841947541010155690062846345629301829041136950505867758954247021488426175;
    
    uint256 constant IC15x = 18628506895904592361603999791475797651957075891984141531890247246235183382835;
    uint256 constant IC15y = 3338339133093642134167462257964563471938349447506194106690263911378116945713;
    
    uint256 constant IC16x = 18739986106014340221135139374401366622038502211164788139046494701490796981799;
    uint256 constant IC16y = 13761293917200026066294975290834785931289557299366603973720784858157560336925;
    
    uint256 constant IC17x = 9891663775007543287106008742068608209760622522581748907055982585404935927038;
    uint256 constant IC17y = 19265670062220373678213718562352595023228619648777306651756349258106841982526;
    
    uint256 constant IC18x = 8769884205461374157094626153590602775367501924469178848705104765091810056597;
    uint256 constant IC18y = 17329193857144149905254772052121702482013470203693569814614505644152477963604;
    
    uint256 constant IC19x = 12608593501503538663268779840422116474723442761472384260969798774655181388589;
    uint256 constant IC19y = 6188476281085777910558503520443116523654324683460322421120308903408775845850;
    
    uint256 constant IC20x = 3872377780994637006473883266838251586318151631685676060622808469588723119794;
    uint256 constant IC20y = 6882209478670254903849503842483830667846770417816973621651245227356779020149;
    
    uint256 constant IC21x = 912388407127035315149449844894414441891547714640675884001639896509325297530;
    uint256 constant IC21y = 17355524049806025297555380761381873933083009824744174596373563054391153476317;
    
    uint256 constant IC22x = 4272934710525527917880659967800416455471807030496721289656919793557070057616;
    uint256 constant IC22y = 2176424744234064327728863729780962396552946567594247317690713596741335951727;
    
    uint256 constant IC23x = 12356789843622422669608012756136012024752457145018490814164165535741758136578;
    uint256 constant IC23y = 4544509292335987169009570098791546706090383174260407725044879190271073855766;
    
    uint256 constant IC24x = 21855429245287850791175620782443046880888609112632351349009546266405032617596;
    uint256 constant IC24y = 10402521460548620795338443794666831409875253626350818566842144050314593582677;
    
    uint256 constant IC25x = 3231206917775211012865073120939464660060850665335953071300949928449307903603;
    uint256 constant IC25y = 12345251908385053723112255687102807342390026294465985709035564535200652433415;
    
    uint256 constant IC26x = 14024364670011099676115301321243056380271275849673355783705236383699739060606;
    uint256 constant IC26y = 17952501421298205217521602453694384759592315847175614639232550780137330450564;
    
    uint256 constant IC27x = 15734478488239902026096326925162581793270234378859961887678238542104729376739;
    uint256 constant IC27y = 16151390332920115712738313182526380236295633652301445993381367632600244173773;
    
    uint256 constant IC28x = 7770195191634239742717111283683987151283437154890004813283787167389362385083;
    uint256 constant IC28y = 13898752456737798261446390045480139833702109696501934287346061755251417304387;
    
    uint256 constant IC29x = 19624040995446194681478819053724924041831718458805639374193151395665817174619;
    uint256 constant IC29y = 4811055772175352277967942551743826613614981935272519035211583960413872855491;
    
    uint256 constant IC30x = 12322879073485273601901310529077139160409065471675439001733340542322088835158;
    uint256 constant IC30y = 15090874339913538936758260705839500264930564853717176700932153348509651726494;
    
    uint256 constant IC31x = 17975578076468538071767997708150526896072640706905227238439203009291011745833;
    uint256 constant IC31y = 13822197990876880377468709365469717254396526716848230698914775246492330376122;
    
    uint256 constant IC32x = 19047770246928265896333764882702110685032333111084520768818150443725526584086;
    uint256 constant IC32y = 9208642863208601717618962763920066269262910988604697437464421807297991436308;
    
    uint256 constant IC33x = 7797168882042840439947172392747816041031340400329772825205256981823012909489;
    uint256 constant IC33y = 9005103897450651762540296742883218313235183484131099517272692644839397957188;
    
    uint256 constant IC34x = 11402725125507906198542297638730683534301207587163726145582555502608847464718;
    uint256 constant IC34y = 13193332991916711778616001219669203788166835026224013842934148435989832184456;
    
    uint256 constant IC35x = 13491917462602066015131672216222984856302108092845485209068899477826024984926;
    uint256 constant IC35y = 3659947645792258792992694974072466615462042239076737138111698174909896276575;
    
    uint256 constant IC36x = 1617642390414932057989101571874125121312495813927193268825448347277033856286;
    uint256 constant IC36y = 809798326559655806312422179061004069193729444871015390785138017865008134421;
    
    uint256 constant IC37x = 18178736037372664513309240279809208329355200683130549539106069245534184445961;
    uint256 constant IC37y = 5267617273411746255841432377723374805862210631372394479627919113742413705770;
    
    uint256 constant IC38x = 10396073901891293313630972256106254613183237936695780551680827288072292678877;
    uint256 constant IC38y = 8251135340712821006039329210045384053211449541817705039379485846256377382019;
    
    uint256 constant IC39x = 920722621531086843101013660805833997708437316830129179477539398946600482768;
    uint256 constant IC39y = 6241762438141825547171587719734380712062340228863826809160407876804600583148;
    
    uint256 constant IC40x = 899669861995109296170196648564533839157928043567057462170902312663993918232;
    uint256 constant IC40y = 16042114907579642541356981224273610770130450142747631698892647191555283350156;
    
    uint256 constant IC41x = 11312853200853522362533073897981073715132435948847353950037424054219073172924;
    uint256 constant IC41y = 13296193117111031694510364960071517252943385754390015948075970907863045649624;
    
    uint256 constant IC42x = 16734119538530320279715119451207536413013628953380391775256427143450735143502;
    uint256 constant IC42y = 18074405321057592746819365087438069780205820982309414233688024527713620663083;
    
    uint256 constant IC43x = 13700391214708266640931367027922307634059885801716928833085921544904793445351;
    uint256 constant IC43y = 12955944582993681719485476217818302084990398405281624380038524610805056433672;
    
    uint256 constant IC44x = 20973161391126349552034514717934571486410447965990575149130595928583993373104;
    uint256 constant IC44y = 17968796424552847779980605703836523505987511028958530667489616439529657338531;
    
    uint256 constant IC45x = 9598828030126966897913719269160772391772351953065342474147610161241729742798;
    uint256 constant IC45y = 18108607761543624557724772703489945294818404429210206175069281037192476327305;
    
    uint256 constant IC46x = 12142538721242685372802212100919162538369346039357487275225481655758320088274;
    uint256 constant IC46y = 13482197652059401150001488905318450974770215026497397416844256344516093252356;
    
    uint256 constant IC47x = 5071038096001564657813265414886123814238274608458837207824579748209646126156;
    uint256 constant IC47y = 4159819293430917718037690092483711273094188012745670218204440293203841968179;
    
    uint256 constant IC48x = 17977226533591661667291892296026576237104603841748203294549191704779973550502;
    uint256 constant IC48y = 13576892459656025594433018220011627968636813333072555217432707497336641252879;
    
    uint256 constant IC49x = 6437504592332981752991678785302421868960426824096852365352398972006014092638;
    uint256 constant IC49y = 3256046423824428850964478508188164020535994247106589593813925727204557763720;
    
    uint256 constant IC50x = 5800526460115816648647711253106806950818375533268954603914646868978992369166;
    uint256 constant IC50y = 11523131595120407767426955924656533391328060910840174780852803222596868878100;
    
    uint256 constant IC51x = 6693347170160112239154475967310163968571214925235177823021274843941346504326;
    uint256 constant IC51y = 14321135058642700862686162639980489992934687945375676599797288957356638098249;
    
    uint256 constant IC52x = 9216984744146483997599373725119041171648027661057295512189518311353539711231;
    uint256 constant IC52y = 8462260448255115183169450469951911693728174259774028787162105010594352430304;
    
    uint256 constant IC53x = 2741998806317540050067081973917182396323324037652506615995416468570895916834;
    uint256 constant IC53y = 13902312548111880647256691230953457236111053704847328074881145488577965618341;
    
    uint256 constant IC54x = 20414401795978743110100665483694425667848554053772690459753632478300799926056;
    uint256 constant IC54y = 6614326121424375138188619126981098675904579615055929087902765851126205491560;
    
    uint256 constant IC55x = 12021685464989454277850514726343288409439675830150030135149903403773452867077;
    uint256 constant IC55y = 5931805097835783012462786110885321918414079146036318709453159601661757785487;
    
    uint256 constant IC56x = 11388738069279106885711486110038282064619694067124931903814101736105777553784;
    uint256 constant IC56y = 8851496268678814841704369077216118763556962801877749203241031459415430466866;
    
 
    // Memory data
    uint16 constant pVk = 0;
    uint16 constant pPairing = 128;

    uint16 constant pLastMem = 896;

    function verifyProof(uint[2] calldata _pA, uint[2][2] calldata _pB, uint[2] calldata _pC, uint[56] calldata _pubSignals) public view returns (bool) {
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
                
                g1_mulAccC(_pVk, IC41x, IC41y, calldataload(add(pubSignals, 1280)))
                
                g1_mulAccC(_pVk, IC42x, IC42y, calldataload(add(pubSignals, 1312)))
                
                g1_mulAccC(_pVk, IC43x, IC43y, calldataload(add(pubSignals, 1344)))
                
                g1_mulAccC(_pVk, IC44x, IC44y, calldataload(add(pubSignals, 1376)))
                
                g1_mulAccC(_pVk, IC45x, IC45y, calldataload(add(pubSignals, 1408)))
                
                g1_mulAccC(_pVk, IC46x, IC46y, calldataload(add(pubSignals, 1440)))
                
                g1_mulAccC(_pVk, IC47x, IC47y, calldataload(add(pubSignals, 1472)))
                
                g1_mulAccC(_pVk, IC48x, IC48y, calldataload(add(pubSignals, 1504)))
                
                g1_mulAccC(_pVk, IC49x, IC49y, calldataload(add(pubSignals, 1536)))
                
                g1_mulAccC(_pVk, IC50x, IC50y, calldataload(add(pubSignals, 1568)))
                
                g1_mulAccC(_pVk, IC51x, IC51y, calldataload(add(pubSignals, 1600)))
                
                g1_mulAccC(_pVk, IC52x, IC52y, calldataload(add(pubSignals, 1632)))
                
                g1_mulAccC(_pVk, IC53x, IC53y, calldataload(add(pubSignals, 1664)))
                
                g1_mulAccC(_pVk, IC54x, IC54y, calldataload(add(pubSignals, 1696)))
                
                g1_mulAccC(_pVk, IC55x, IC55y, calldataload(add(pubSignals, 1728)))
                
                g1_mulAccC(_pVk, IC56x, IC56y, calldataload(add(pubSignals, 1760)))
                

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
            
            checkField(calldataload(add(_pubSignals, 1312)))
            
            checkField(calldataload(add(_pubSignals, 1344)))
            
            checkField(calldataload(add(_pubSignals, 1376)))
            
            checkField(calldataload(add(_pubSignals, 1408)))
            
            checkField(calldataload(add(_pubSignals, 1440)))
            
            checkField(calldataload(add(_pubSignals, 1472)))
            
            checkField(calldataload(add(_pubSignals, 1504)))
            
            checkField(calldataload(add(_pubSignals, 1536)))
            
            checkField(calldataload(add(_pubSignals, 1568)))
            
            checkField(calldataload(add(_pubSignals, 1600)))
            
            checkField(calldataload(add(_pubSignals, 1632)))
            
            checkField(calldataload(add(_pubSignals, 1664)))
            
            checkField(calldataload(add(_pubSignals, 1696)))
            
            checkField(calldataload(add(_pubSignals, 1728)))
            
            checkField(calldataload(add(_pubSignals, 1760)))
            
            checkField(calldataload(add(_pubSignals, 1792)))
            

            // Validate all evaluations
            let isValid := checkPairing(_pA, _pB, _pC, _pubSignals, pMem)

            mstore(0, isValid)
             return(0, 0x20)
         }
     }
 }
