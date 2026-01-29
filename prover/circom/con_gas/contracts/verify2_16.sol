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

contract Groth16Verifier2_16 {
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


    uint256 constant IC0x = 17279912095004711876521730869692422702198665580436306467726112302154490012280;
    uint256 constant IC0y = 12089719901547765439164853378010571729711388915425131126286239704366379184182;

    uint256 constant IC1x = 6500804489531244952598420343460083088653251802557498117412261295799311146646;
    uint256 constant IC1y = 6971970366760707601620022536172694057251628569783049302841172720525879914329;

    uint256 constant IC2x = 19502588274956746455748046930281827101929186165024439571456501742602176095050;
    uint256 constant IC2y = 5764944003028405050303505470743549738955403616982485417782578638000211876722;

    uint256 constant IC3x = 3892462393638074655055516741090426151572754769090424514946143174111807801502;
    uint256 constant IC3y = 7834399431023938339856602069076551330489958195138842857600167390677494328953;

    uint256 constant IC4x = 6350273588006520618005317328678659172479723912629088241110332376635429480728;
    uint256 constant IC4y = 5711522809766377663194267948897572306566823933426176968314597488001870362278;

    uint256 constant IC5x = 3546868130994277022767186206183100905104044541945521041532147858587494279848;
    uint256 constant IC5y = 9820549338464295455531153262413923982842098404289089575072608659412632074140;

    uint256 constant IC6x = 8942911448665829507142522716453602968774307568834576595366097679707607229393;
    uint256 constant IC6y = 13488512732635831967052090170886033317739548962523716479174949510048305490220;

    uint256 constant IC7x = 16059166673901775987518876616465380132152222818816278323651167141388325550529;
    uint256 constant IC7y = 18898960915887383225129878904023820474535660113724564404636296092437639821311;

    uint256 constant IC8x = 19738589793144215320207363044294970709145150183987064854178993917536861463623;
    uint256 constant IC8y = 3699142020571210203519985399732678198282292054287285989437950355605939267858;

    uint256 constant IC9x = 2415793656983931231618266195173323508554976923360653362350537639836151801979;
    uint256 constant IC9y = 3610786544955103233111518051842649704203863576705709896499371004066527905928;

    uint256 constant IC10x = 7898086101371163372129007309599021031331357970003585227905909483286648349479;
    uint256 constant IC10y = 19814687674717230747841419850337072335816011922115145171902868616832778858860;

    uint256 constant IC11x = 13487133081495803765336858011310648194778881556105452214763369827768819515598;
    uint256 constant IC11y = 8772736360187377123615303488507999067485608905354399762843412851361519002603;

    uint256 constant IC12x = 2634693194373971057956038725819154810747504344943262157769871690963605658195;
    uint256 constant IC12y = 12052699169338042340855501414687565939061829508633011698079950076361319753176;

    uint256 constant IC13x = 19988850633584241448070523844450025033163718728830950319649037708176435486116;
    uint256 constant IC13y = 18257506956530096354276542889891062895602999186094442293670274315608881543165;

    uint256 constant IC14x = 21105427992219489452279949352303133728490702456472360761357499799617973920552;
    uint256 constant IC14y = 6080009694190631211812225525297280404174904262866936991432473420083758051191;

    uint256 constant IC15x = 12142573333426179041893877263791196043599936100388915906031182912421616445932;
    uint256 constant IC15y = 3393678074342574051851311246275625102582710071974138482227048320537059526507;

    uint256 constant IC16x = 9330967587813184112141030301325891109212206956162777046901890539781736409652;
    uint256 constant IC16y = 17255952218502383764236206726615779455331085569626544693283326675954668568915;

    uint256 constant IC17x = 21714634178654576221277656934228005177232230515627761189125492691291349144947;
    uint256 constant IC17y = 2818610411244382005959948317950107653514271598553111642737427067201321396507;

    uint256 constant IC18x = 857753040203870990328339309167105962279513538101115335372258153021326477884;
    uint256 constant IC18y = 15676809832893150877704712265094158903119884043920167301632110166693050256843;

    uint256 constant IC19x = 13743584511291131101479192163703106277983831448551515926925012171056174175619;
    uint256 constant IC19y = 264707605885794436901134790460272763997234890117834955504932947679095023812;

    uint256 constant IC20x = 8940215684146628051368255035481297116602563710823155800095059128858940906118;
    uint256 constant IC20y = 1255744349431153423368018930453467602362314611208249064126309765214999147848;

    uint256 constant IC21x = 10640149076754330089691803796829875886107620820342234700749811772377872887616;
    uint256 constant IC21y = 6939803711544444874105194406147544533225224345161051291250512141283001158091;

    uint256 constant IC22x = 4291128434897400326193269242671664407057821418849667772263724526715588500926;
    uint256 constant IC22y = 9436037760238149361698241197001321923625174857220108875140933948638523226686;

    uint256 constant IC23x = 18367149191174647060465523518078164164286377788332967576490084750708957647765;
    uint256 constant IC23y = 21668233979125511024420725538219760542352466108328480981356292416894313779108;

    uint256 constant IC24x = 19825073600342341473925565021800322206561070733812876096828237921638468167464;
    uint256 constant IC24y = 381307816979061630283802181008081578540408634236046793572523456955508823942;

    uint256 constant IC25x = 5487640256686827597064066687309157845838200070402519557049991218814547177897;
    uint256 constant IC25y = 13808655422757868014055062947443785603407634417303368521196011246422266488830;

    uint256 constant IC26x = 16049966332461398211676616781041871576706564768120906640274225038197245444832;
    uint256 constant IC26y = 3495686708936511760940454351184858295566223661144708893091161130189863866197;

    uint256 constant IC27x = 3791550222464346481499517236820147206991069080531608575469562461601712233075;
    uint256 constant IC27y = 18635853357906418595496255285274932685219403324081915145090752801806119549531;

    uint256 constant IC28x = 4108164611288558028995312210342184231013621179977327076220633531296660808514;
    uint256 constant IC28y = 19961745367222857186116087709252581531997021533296925061781176532950339839428;

    uint256 constant IC29x = 11492174765424116448323942587567761631241201601558944341747228284511002744268;
    uint256 constant IC29y = 13470176076866410647231455230865528170856073733656204631673816918581788265918;

    uint256 constant IC30x = 6362020033232495032087933511356730921791735593188046075111578492042021755312;
    uint256 constant IC30y = 9579967964511214834483742662620868397248498732228761217242364190507185618304;

    uint256 constant IC31x = 18430110795229244183722229021447180555497315214473297403054367819669140222624;
    uint256 constant IC31y = 16329759400253721324191155542947516082249872542070205849871514895621535739720;

    uint256 constant IC32x = 7858168782645097626784966744198226567387965808527737763812076902242536780095;
    uint256 constant IC32y = 3799109760184912621477621748441495734815835459116482934598092362417809623094;

    uint256 constant IC33x = 13892688265288363435781261127570297066470102244555567391582758415966028798224;
    uint256 constant IC33y = 4962572360029378153388263254866885424078114170325549709074226920958337373280;

    uint256 constant IC34x = 1037715603246434895140106402955197372436939550891991932048380494700542184330;
    uint256 constant IC34y = 15654321044435990694563940940274620118747060460466213358835807037924512109582;

    uint256 constant IC35x = 2222711498868381141957030825419935929676055966480046731584304518720176074479;
    uint256 constant IC35y = 11286737599140547398392503407245457807330970354017207896676932540727662187456;

    uint256 constant IC36x = 2337196447716601326177950902675868719785542801354116969393786774915063190334;
    uint256 constant IC36y = 5726275728248709922943951933623181301636371774706001788815459514659174623323;

    uint256 constant IC37x = 1331257157626459677155435545568987582266553890224889009303174617224480416626;
    uint256 constant IC37y = 7329505984778517830265392791692536629328147292763455208189993138358345757468;

    uint256 constant IC38x = 9916782902527270890856754376044342776266448263951028933200361097054165536156;
    uint256 constant IC38y = 16890178496483194497080913558342381130942942598546109562265353847400583915665;

    uint256 constant IC39x = 3470018199043928995753696246178597184547229367473877326702757990093660190869;
    uint256 constant IC39y = 12559443627952523819257881585221544064474477030775672733619113163635595055434;

    uint256 constant IC40x = 17773237895074002823116497755027335419657878614096526030333348020989666407724;
    uint256 constant IC40y = 4464178672991232734615506696782282952824866868984794895523199959042877195617;

    uint256 constant IC41x = 6324662583325717833617930234147202304445097799483368445961074741171191864395;
    uint256 constant IC41y = 7436049939428807282114128174833000645299268007166867172196102266737299003894;

    uint256 constant IC42x = 19026084276926810503716739351032242463764278800552237421744371597473794698319;
    uint256 constant IC42y = 11215708728622795249866670692159716744373222485376918201401826842647688485478;

    uint256 constant IC43x = 18418655959445955195522923810305055373081589876334237737242803031883651442098;
    uint256 constant IC43y = 18148636356067893023243416608231492144900100382494046582869586891362043424252;

    uint256 constant IC44x = 12526900270030667638233124478600424631558778462715004095679723435943093274413;
    uint256 constant IC44y = 68011411322947252167217696284222322797454486781809009562653939412031899155;

    uint256 constant IC45x = 6146553941751173378433435513485006696075184377350174150129393855396327976533;
    uint256 constant IC45y = 14735546184506100420413775323138709956499515125653361542975806803072975926686;

    uint256 constant IC46x = 9671710482572776980396804150174979816089311308983475197821747196110825527359;
    uint256 constant IC46y = 7988410151941203174855636621528260456104549062231131095056017840095355715682;

    uint256 constant IC47x = 19603236289460034698210120600860226229944636932512999969143244794084449190929;
    uint256 constant IC47y = 18477986218786302465039561424528508115108835784618428358399287057929490239771;

    uint256 constant IC48x = 13595334527710281880130995195182438993299445091123843880909037691711106214943;
    uint256 constant IC48y = 10664764270400472693064998545818809865290743613465811844604648270868453188205;

    uint256 constant IC49x = 16037348671719587811686984772880768970803363025423788782275689221697364415411;
    uint256 constant IC49y = 12087706067780965681114291738240848797593217458768891590717329669027493353583;

    uint256 constant IC50x = 13877689384982086219266441137777692152628513974569736071583576709662083285068;
    uint256 constant IC50y = 18725848759730249212628461328377200523544669581952971179461023660840790058606;

    uint256 constant IC51x = 15318245929175122260244719141463029816361718382249718804230383761472217331008;
    uint256 constant IC51y = 7010776845902913157873424671565071945760855323731424206395948812943025235664;

    uint256 constant IC52x = 1217440539294855298215722044186470067182711138004808773452049368819646318248;
    uint256 constant IC52y = 16613068750253700528591651373268127692787595110426732708401368893475499855263;

    uint256 constant IC53x = 15095124467631790639509292437625013446800177115828050028428563215703960527313;
    uint256 constant IC53y = 3119537258126028543168404991436524895561247055721359464594264064144738088833;

    uint256 constant IC54x = 3647979292722057468498488126006543037714576845540080761554972183174082681303;
    uint256 constant IC54y = 19246969308418387788197109739406166159848647259199857080729226221623770598012;

    uint256 constant IC55x = 15503559806355484984623323453273703561468843044119407639044170157081749645821;
    uint256 constant IC55y = 13783587011283096663481253799009780706379838650855904905677604496315057939881;

    uint256 constant IC56x = 1492666886032111753146684131128264012095336477468865011579463224346724765800;
    uint256 constant IC56y = 16327159197550459983883457780632348767807879336199515170161590426207695807167;

    uint256 constant IC57x = 15057143378222758379053840190272460355762545198931536187998331628714973424933;
    uint256 constant IC57y = 5692339909032881041453121762911039643478589998314775668882351365314683653842;

    uint256 constant IC58x = 21131431482622331436439421357585988254680984867945914297260581619921721202594;
    uint256 constant IC58y = 19339451403862075797135670361486083141225816078985684299676012667684133682834;

    uint256 constant IC59x = 16638415675155974407333658088185036235746467354494523567215113854355625215101;
    uint256 constant IC59y = 16969626135992378480955473368686722249255990987890117771415836288783222171470;

    uint256 constant IC60x = 11707456026424452184730093044565951977872365460113234100897873534992678859248;
    uint256 constant IC60y = 4784887419016292163211745098390559491310132890839927692461749748604305988881;

    uint256 constant IC61x = 3803774966531601692649100642640222932956106115248956006310624811728656468551;
    uint256 constant IC61y = 14860783771084960467189508313113692993007972648736811039342946023475129768375;

    uint256 constant IC62x = 11147571618059703091429604569726353473011990493622412007619508102974122133591;
    uint256 constant IC62y = 20393799162729148821101035580705990015037004918787791325569344206906383614537;

    uint256 constant IC63x = 15550601271062233198496709674188377136810798518367107871800612776476044882534;
    uint256 constant IC63y = 17477646109315694857758871180234300934961906498176015443078774019208440767060;

    uint256 constant IC64x = 21624368930092288980954074803279521364462620886747180209719523312371228525999;
    uint256 constant IC64y = 2302347313147812650142310903047953952116530247613266737352536817291803004369;


    // Memory data
    uint16 constant pVk = 0;
    uint16 constant pPairing = 128;

    uint16 constant pLastMem = 896;

    function verifyProof(uint[2] calldata _pA, uint[2][2] calldata _pB, uint[2] calldata _pC, uint[64] calldata _pubSignals) public returns (bool) {
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

                g1_mulAccC(_pVk, IC57x, IC57y, calldataload(add(pubSignals, 1792)))

                g1_mulAccC(_pVk, IC58x, IC58y, calldataload(add(pubSignals, 1824)))

                g1_mulAccC(_pVk, IC59x, IC59y, calldataload(add(pubSignals, 1856)))

                g1_mulAccC(_pVk, IC60x, IC60y, calldataload(add(pubSignals, 1888)))

                g1_mulAccC(_pVk, IC61x, IC61y, calldataload(add(pubSignals, 1920)))

                g1_mulAccC(_pVk, IC62x, IC62y, calldataload(add(pubSignals, 1952)))

                g1_mulAccC(_pVk, IC63x, IC63y, calldataload(add(pubSignals, 1984)))

                g1_mulAccC(_pVk, IC64x, IC64y, calldataload(add(pubSignals, 2016)))


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

            checkField(calldataload(add(_pubSignals, 1824)))

            checkField(calldataload(add(_pubSignals, 1856)))

            checkField(calldataload(add(_pubSignals, 1888)))

            checkField(calldataload(add(_pubSignals, 1920)))

            checkField(calldataload(add(_pubSignals, 1952)))

            checkField(calldataload(add(_pubSignals, 1984)))

            checkField(calldataload(add(_pubSignals, 2016)))

            checkField(calldataload(add(_pubSignals, 2048)))


            // Validate all evaluations
            let isValid := checkPairing(_pA, _pB, _pC, _pubSignals, pMem)

            mstore(0, isValid)
             return(0, 0x20)
         }
     }
 }
