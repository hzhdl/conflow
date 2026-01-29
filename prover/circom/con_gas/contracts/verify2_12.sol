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

contract Groth16Verifier2_12 {
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


    uint256 constant IC0x = 14997686724745213892194563691044300459194776101075332827376436469525189851424;
    uint256 constant IC0y = 1345247345210389519565408453920098261484399115497047601680134205382967109735;

    uint256 constant IC1x = 9550359993641359760945795677613178950242984315527703156742219128881387066607;
    uint256 constant IC1y = 3827818018154399627992150956950108484684204763018110196575913772665977147831;

    uint256 constant IC2x = 4099818497463269001087039183996532511475822049209036272320226903285786388603;
    uint256 constant IC2y = 4963974188635571998412874783506473712691436211054600289680038832700072838262;

    uint256 constant IC3x = 12987895881018683227862844697662027151890656386411767561446905885149581133665;
    uint256 constant IC3y = 8282645157974519308691879506953758718424439290774829195557598721861117348087;

    uint256 constant IC4x = 21878877723520409768006433063575000974266448836551839831536371605999089823149;
    uint256 constant IC4y = 18415451583618699034150289425721936081073854083819266060575316155327470868653;

    uint256 constant IC5x = 5363380015824489984312319598351188937203234367257966355138588235381758646405;
    uint256 constant IC5y = 20085866977455680386097626019555566029457830990297364524312074402786487141933;

    uint256 constant IC6x = 10769300359110657208987056897082912721665114631709634880757555479946515754442;
    uint256 constant IC6y = 6713703003958888637184513685891234041759040096226931559258013314154475397387;

    uint256 constant IC7x = 9483874742716224281217637252241576280165061662477993636590429611753080393299;
    uint256 constant IC7y = 10077107570051075749857250539451300663968756704221521186025048100056814525926;

    uint256 constant IC8x = 7042727765565242294626663386271623432130835015335474048733364620404289553082;
    uint256 constant IC8y = 17594560988298783616373607303934697542381779239077512662529413016740927850815;

    uint256 constant IC9x = 4837782635876952808810867432818057126919308007731620874355814300843000554082;
    uint256 constant IC9y = 21028057711564929023419728119094824154836939735287912253033615465921629848083;

    uint256 constant IC10x = 20912401508110709572233773455412062806833799925217162244582085798937995084913;
    uint256 constant IC10y = 12823478930730007063540037427076809193204382776031211905859596481171541303570;

    uint256 constant IC11x = 15663589085885647056880214765625103651160320368375968771026113477347547109079;
    uint256 constant IC11y = 4899071478435116681865163733133461910793821581371320260378457622633143352278;

    uint256 constant IC12x = 2403467843685930000380219408599591386762336167132853677805037071288697049119;
    uint256 constant IC12y = 4016140902873339899897002988280101428465706726420062074221655352083185523121;

    uint256 constant IC13x = 13872248722945323441970291714067515458378917268430183635011776318520487192519;
    uint256 constant IC13y = 15517256602301867814901323107004795162891569853137131715909546912249960585459;

    uint256 constant IC14x = 2321564612370225107072406027602935202805176889949136350017239418538346099785;
    uint256 constant IC14y = 13343134064220057818691492779294025156052930496892525770835616981820046045194;

    uint256 constant IC15x = 20240385098278513015236610528978958461689900545616568579938433597506251628690;
    uint256 constant IC15y = 2605516332795363609425418375630344298863831018255501783688119828062701269903;

    uint256 constant IC16x = 5487098007546806989840452540345049663077297788641388173270384568405448811096;
    uint256 constant IC16y = 20336026624120644805191480441089329297008923876620336836088086781003878232173;

    uint256 constant IC17x = 7459913796264165533594738831368095216592031932921689726808448454053650808634;
    uint256 constant IC17y = 15470672701514676287261518382830473934116723549421581405280408564803114386090;

    uint256 constant IC18x = 16835202634885849241046723564759708776179346356654751054850954173946806338075;
    uint256 constant IC18y = 19932564565105641280401681095434770330513903141631406941429044631362419019231;

    uint256 constant IC19x = 8529815732842417738025024842515105124449780589175150005945605805069350504308;
    uint256 constant IC19y = 19877882157265491002517714418282081296844251225666468749109427641781503631251;

    uint256 constant IC20x = 13434686098963139118750802985876118931330790347518596262075116982147363230497;
    uint256 constant IC20y = 10860105744884192422056584739028229316626015807361918512061282806015637033138;

    uint256 constant IC21x = 14957631437571589599935242945888516666080665558791085132410394702373882952479;
    uint256 constant IC21y = 4958873628966164209352192288429038258820628437964153309155410681486465975846;

    uint256 constant IC22x = 16485363364243200861571542773320055860524689397540650204614703621793068106930;
    uint256 constant IC22y = 16301634760156659127252115852767912052518523703482392679149556787583256241383;

    uint256 constant IC23x = 8226219880635798965490743522759283700980113956044025121333174071900496585928;
    uint256 constant IC23y = 7793315346069807400189841724402257631332640433887632688620894491827260500322;

    uint256 constant IC24x = 18177888364881092952105758974792202646399949825485160233600600247177731684763;
    uint256 constant IC24y = 1712000852317068123531262619064035230750735872456910837526827456269932698173;

    uint256 constant IC25x = 11142854717367909738404940850196867211498697581221865642268013083528875336026;
    uint256 constant IC25y = 10957222102237967902019929992441131703186324476003054826867015451116196849397;

    uint256 constant IC26x = 9527297492620870719041423688856062379803232945990727624894181893840000143647;
    uint256 constant IC26y = 14516486383010646425948610820902422979352363923382386492631894510648755558550;

    uint256 constant IC27x = 15218582038710466267607996028970824318595526359084160851493778714031137139877;
    uint256 constant IC27y = 57776812496720820495337291686562674981705031791541457316337465611451116846;

    uint256 constant IC28x = 16853309565425942801064441726637594102001432241821086052668211697199392327616;
    uint256 constant IC28y = 20933186320801351159945392951292985643571023441606908920523312018988650819314;

    uint256 constant IC29x = 15455638603036324903263217972177195691425421991920175592638868124575657786596;
    uint256 constant IC29y = 2582804401647621599398040876384662379730687153992953861673803704865816561418;

    uint256 constant IC30x = 9951450325315273488509912897635313350763774897340070158827803037263004743267;
    uint256 constant IC30y = 3303905744203251234975092108747249682200462320646179481196488191028098081287;

    uint256 constant IC31x = 15886875321231125048176162512959265194446828025940432443076383873401899221694;
    uint256 constant IC31y = 16124675480568815644704046592656292838378336117885628950034638277124511613532;

    uint256 constant IC32x = 10623906759889860919218744797176739230473050003502390374627754869139097065687;
    uint256 constant IC32y = 19462899338828720871656657297330750345279390374617343441124748728904347809689;

    uint256 constant IC33x = 10209049035979859658873278708165249119326624652576864713456061104150763705185;
    uint256 constant IC33y = 1284968944784716250978324799047171570182276303432955222127581154622794425455;

    uint256 constant IC34x = 19354821378932444460972670506632511437277231336606084676865300329069491471360;
    uint256 constant IC34y = 434409040360661602939199090216295903782081903113579455906924449791927582533;

    uint256 constant IC35x = 20555502332490142953441329261128518991519839709795642590498904850691998183600;
    uint256 constant IC35y = 10242147192813272199738979148348383789998869760528097622139872644450441124206;

    uint256 constant IC36x = 21802320846103322679683291839756673615187149735674433372347826290017638689767;
    uint256 constant IC36y = 1257437721934826094313633752568127472555695494322905771241000292771640651483;

    uint256 constant IC37x = 16596777805317217967219564525100130231552951206891506359859165692596093754495;
    uint256 constant IC37y = 8443988327489166236042952522806682686806820325047681569326984126239843999055;

    uint256 constant IC38x = 21133124733307419535002058285344011842169547821097109603074051659700527827803;
    uint256 constant IC38y = 1113804957104677989441667093035803733266438646061029761286296541702198137287;

    uint256 constant IC39x = 3015532816679181838963194106717528997464489390707271101432219018874305315250;
    uint256 constant IC39y = 16767456228079725346139184241142619779707286491419256251315942560507370856587;

    uint256 constant IC40x = 13028258228623988595380716389121606158407635743949558576577020951041080694128;
    uint256 constant IC40y = 4770537087574718373004882803527347757822889779892157888671869148418135725423;

    uint256 constant IC41x = 12389729734341763144889858166639050049577056913798280117733611577048498296072;
    uint256 constant IC41y = 11348836683661936482836909495281442272098320260383511778642238216040711556920;

    uint256 constant IC42x = 13595554979535087818028134845062213453318802089369868735311292546533967278260;
    uint256 constant IC42y = 6376966629624688484978840200770645676310793380606541666944774353550655896525;

    uint256 constant IC43x = 16114125342641336494272832876603559766865700656051072903458221263064794566045;
    uint256 constant IC43y = 10476142941901903484514850421824428879279873698930033403142857493831210306591;

    uint256 constant IC44x = 12983247629261976133530679376199749289116960165661301084522727025338476217451;
    uint256 constant IC44y = 21533081301193898400709420812833870541240653656472408678160928484259412894719;

    uint256 constant IC45x = 18190201415891558411071769414651225073175833056263242489328607309634148295727;
    uint256 constant IC45y = 2643014160506996635640552193136475682233388780132776633698823078308119606643;

    uint256 constant IC46x = 15559306708487061899805268773309257601775219271667511537249034856591122733113;
    uint256 constant IC46y = 20837907599362370159111425759469496773604376356078021978548691312146400071524;

    uint256 constant IC47x = 2587331378592113359655314478253343947915979695962114785062478128497069192899;
    uint256 constant IC47y = 17148066869979084912405864048170734345007404817932192516666584339947574696850;

    uint256 constant IC48x = 13422618658590621077598243019299944465138024123476155832751484269446212227121;
    uint256 constant IC48y = 5514141633781652839590180179477810360847032268848317653455724367286696656035;
    

    // Memory data
    uint16 constant pVk = 0;
    uint16 constant pPairing = 128;

    uint16 constant pLastMem = 896;

    function verifyProof(uint[2] calldata _pA, uint[2][2] calldata _pB, uint[2] calldata _pC, uint[48] calldata _pubSignals) public returns (bool) {
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


            // Validate all evaluations
            let isValid := checkPairing(_pA, _pB, _pC, _pubSignals, pMem)

            mstore(0, isValid)
             return(0, 0x20)
         }
     }
 }
