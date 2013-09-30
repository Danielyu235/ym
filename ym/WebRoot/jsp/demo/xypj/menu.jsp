<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ include file="/common/jqueryhead.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>    
  	<title></title>
	<link rel="StyleSheet" href="dtree.css" type="text/css" />
	<script type="text/javascript" src="dtree.js"></script>
</head>	
	<body style="height:100%; margin:0px; overflow:hidden;" scroll=auto>
	<table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0">
  		<tr>
			<td  id="frmtitle"  valign="top" width="10%" style="background-color: #EAF4FC">
				<div id="treediv" class="treediv bgtree" style="overflow-y:scroll;width:200px; height:100%;">
					<div>	
						<script type="text/javascript">
				            d = new dTree('d');
							d.add(0,-1,'阳煤新景矿公司');
							d.add(1,0,'采煤工区',"${ctx}/jsp/reputation/reputation.jsp?departmentf=8c070fa733c34d789f58ddf2ef2b81f8",'','mainframe2','qg.png');	
							d.add(10,1,'办公室',"${ctx}/jsp/reputation/reputation.jsp?departments=736bedc9975f4cdda08c22f8831063e4",'','mainframe2','qg.png');	
							d.add(11,1,'党总支办公室',"${ctx}/jsp/reputation/reputation.jsp?departments=321b5a2de1ce4710ab5006964706ef93",'','mainframe2','qg.png');
							d.add(12,1,'主任',"${ctx}/jsp/reputation/reputation.jsp?departments=0bf19929e76f4044afef299857adfbfd",'','mainframe2','qg.png');
							d.add(13,1,'书记',"${ctx}/jsp/reputation/reputation.jsp?departments=ffda59d6c3e84d3c9a3968a53454055a",'','mainframe2','qg.png');
							d.add(14,1,'主任工程师',"${ctx}/jsp/reputation/reputation.jsp?departments=bf7dc8ad9bcb47b382a3312dc9c60ccc",'','mainframe2','qg.png');
							d.add(15,1,'调度站',"${ctx}/jsp/reputation/reputation.jsp?departments=0d5529c7ec134466986c9eff3a9956a6",'','mainframe2','qg.png');
							d.add(16,1,'技术组',"${ctx}/jsp/reputation/reputation.jsp?departments=4ae85b6b995443c7b97fb0c7aa66cb27",'','mainframe2','qg.png');
							d.add(17,1,'成本组',"${ctx}/jsp/reputation/reputation.jsp?departments=10ffc991a85d4f6586b2145148223cb4",'','mainframe2','qg.png');
							d.add(18,1,'安检组',"${ctx}/jsp/reputation/reputation.jsp?departments=a88cd548809e4bf1b2ca36a05cede3f2",'','mainframe2','qg.png');
							d.add(19,1,'综一队办公室',"${ctx}/jsp/reputation/reputation.jsp?departments=47cc4e9813cb4b589f669f359a9113b2",'','mainframe2','qg.png');
							d.add(20,1,'综二队办公室',"${ctx}/jsp/reputation/reputation.jsp?departments=266085d2f85a418e98bba3cae6d08133",'','mainframe2','qg.png');
							d.add(21,1,'综三队办公室',"${ctx}/jsp/reputation/reputation.jsp?departments=905fe65cc485413abaa2dc52b00335bb",'','mainframe2','qg.png');
							d.add(22,1,'综四队办公室',"${ctx}/jsp/reputation/reputation.jsp?departments=3e7f662b678c427f929effd4f8a6d0f8",'','mainframe2','qg.png');
							d.add(23,1,'准备一队办公室',"${ctx}/jsp/reputation/reputation.jsp?departments=201548bd59f44125992d5f826198ac51",'','mainframe2','qg.png');
							d.add(24,1,'准备二队办公室',"${ctx}/jsp/reputation/reputation.jsp?departments=be63e7cd50544993acea29090a707075",'','mainframe2','qg.png');
							d.add(25,1,'准备三队办公室',"${ctx}/jsp/reputation/reputation.jsp?departments=d4333892fae34d9c9b90e32bb5db3d5c",'','mainframe2','qg.png');
							d.add(26,1,'机电安装队',"${ctx}/jsp/reputation/reputation.jsp?departments=0a30da6849dc48cc802272f8f46ee8cf",'','mainframe2','qg.png');
							d.add(27,1,'回收队办公室',"${ctx}/jsp/reputation/reputation.jsp?departments=7a50b7d0249d4ea79a3dea7935851832",'','mainframe2','qg.png');
															
							d.add(2,0,'掘开工区',"${ctx}/jsp/reputation/reputation.jsp?departmentf=3311b3fc24504b568a364aeca57db189",'','mainframe2','sj.png');
							d.add(29,2,'办公室',"${ctx}/jsp/reputation/reputation.jsp?departments=81f1ba2f5f9347aa90aac90bdcfa7583",'','mainframe2','sj.png');
							d.add(30,2,'党总支办公室',"${ctx}/jsp/reputation/reputation.jsp?departments=4ec32a57a5b14c44823b86d07c4fa1bb",'','mainframe2','sj.png');
							d.add(31,2,'书记',"${ctx}/jsp/reputation/reputation.jsp?departments=556e7c966652423e929cfa7a946ec93e",'','mainframe2','sj.png');
							d.add(32,2,'副主任',"${ctx}/jsp/reputation/reputation.jsp?departments=e78d7ec1b3d447b2a66998e381118c01",'','mainframe2','sj.png');
							d.add(33,2,'主任工程师',"${ctx}/jsp/reputation/reputation.jsp?departments=a374109aa64e40478a6226d03fa79aa2",'','mainframe2','sj.png');
							d.add(34,2,'调度站',"${ctx}/jsp/reputation/reputation.jsp?departments=a9fac273f15f43bbb5fd18558cf4e182",'','mainframe2','sj.png');
							d.add(35,2,'安全小分队',"${ctx}/jsp/reputation/reputation.jsp?departments=41b30660a48f4e11adec19a7cdc2a41a",'','mainframe2','sj.png');
							d.add(36,2,'成本组',"${ctx}/jsp/reputation/reputation.jsp?departments=dcccce36e0a54403a1c09283c8cf8992",'','mainframe2','sj.png');
							d.add(37,2,'技术组',"${ctx}/jsp/reputation/reputation.jsp?departments=43c3ba31334640d592db027b7d8e8073",'','mainframe2','sj.png');
							d.add(38,2,'综掘一队办公室',"${ctx}/jsp/reputation/reputation.jsp?departments=81f1ba2f5f9347aa90aac90bdcfa7583",'','mainframe2','sj.png');
							d.add(39,2,'综掘二队办公室',"${ctx}/jsp/reputation/reputation.jsp?departments=baedc76fc45942bc9c16afe8d75795df",'','mainframe2','sj.png');
							d.add(40,2,'综掘三队办公室',"${ctx}/jsp/reputation/reputation.jsp?departments=644c6a3164af412a9bce79aa6e6b28c1",'','mainframe2','sj.png');
							d.add(41,2,'综掘四队办公室',"${ctx}/jsp/reputation/reputation.jsp?departments=d9a22a57e2344b80a0a99fbd78d9792b",'','mainframe2','sj.png');
							d.add(42,2,'综掘五队办公室',"${ctx}/jsp/reputation/reputation.jsp?departments=4f455d0bd326470ea6b41a04fea80f3d",'','mainframe2','sj.png');
							d.add(43,2,'综掘六队办公室',"${ctx}/jsp/reputation/reputation.jsp?departments=afa83f5ba4774b879da9d5afa8975f6c",'','mainframe2','sj.png');
							d.add(44,2,'开拓一队办公室',"${ctx}/jsp/reputation/reputation.jsp?departments=7bd4b0ca9e9f4bd89f655a5ae4dadfd8",'','mainframe2','sj.png');
							d.add(45,2,'开拓二队办公室',"${ctx}/jsp/reputation/reputation.jsp?departments=b6df0f1aa57343d09d65527ed014c97f",'','mainframe2','sj.png');
							d.add(46,2,'开拓三队办公室',"${ctx}/jsp/reputation/reputation.jsp?departments=0e1103958a4b4faea7ecf769477d0141",'','mainframe2','sj.png');
							d.add(47,2,'开拓四队办公室',"${ctx}/jsp/reputation/reputation.jsp?departments=48352b2617114bf5b8b01aac18a35a53",'','mainframe2','sj.png');
							d.add(48,2,'开拓五队办公室',"${ctx}/jsp/reputation/reputation.jsp?departments=b4ef4b72a83c403f8dc77237e8902321",'','mainframe2','sj.png');
							d.add(49,2,'开拓六队办公室',"${ctx}/jsp/reputation/reputation.jsp?departments=de93cabd597d49499278db4195cb0450",'','mainframe2','sj.png');
							d.add(50,2,'综掘准备办公室',"${ctx}/jsp/reputation/reputation.jsp?departments=edf701e650b9419bbe9cf38895663754",'','mainframe2','sj.png');
							d.add(51,2,'维护队办公室',"${ctx}/jsp/reputation/reputation.jsp?departments=4b0a3de306244f0ea6e3dec48371527f",'','mainframe2','sj.png');
							d.add(52,2,'工程队办公室',"${ctx}/jsp/reputation/reputation.jsp?departments=e10eeb6829cc4f12a27a3e98ec4166c6",'','mainframe2','sj.png');
							d.add(53,2,'技措一队办公室',"${ctx}/jsp/reputation/reputation.jsp?departments=131b553e3cb44b6cb42afa8f435fc66c",'','mainframe2','sj.png');
							d.add(54,2,'技措二队办公室',"${ctx}/jsp/reputation/reputation.jsp?departments=9e105af1524b49c8843b828bcb360957",'','mainframe2','sj.png');
							                           
							
							d.add(3,0,'抽采工区',"${ctx}/jsp/reputation/reputation.jsp?departmentf=c59528bcfe7b4a9f89cd8faae5a875d7",'','mainframe2','qj.png');
							d.add(55,3,'办公室',"${ctx}/jsp/reputation/reputation.jsp?departments=22286f783bbb4ffd8377c521a160a2c4",'','mainframe2','qj.png');
							d.add(56,3,'党总支办公室',"${ctx}/jsp/reputation/reputation.jsp?departments=218d299b9b304812a0e38138b9b9e092",'','mainframe2','qj.png');
							d.add(57,3,'主任',"${ctx}/jsp/reputation/reputation.jsp?departments=1ef4f9f141314dc99e6fadb2674229f4",'','mainframe2','qj.png');
							d.add(58,3,'书记',"${ctx}/jsp/reputation/reputation.jsp?departments=55abe3f6418047179fda28fd866f28c4",'','mainframe2','qj.png');
							d.add(59,3,'副主任',"${ctx}/jsp/reputation/reputation.jsp?departments=63163c02b4534ce19c7e8845b7d0bc43",'','mainframe2','qj.png');
							d.add(60,3,'调度站长',"${ctx}/jsp/reputation/reputation.jsp?departments=8bce7e87326a4827af5dd2f16b49d44c",'','mainframe2','qj.png');
							d.add(61,3,'技术组长',"${ctx}/jsp/reputation/reputation.jsp?departments=41a522717028422387eb44c24f768e44",'','mainframe2','qj.png');
							d.add(62,3,'成本组长',"${ctx}/jsp/reputation/reputation.jsp?departments=425203c1b49543cda45b94916e4fca26",'','mainframe2','qj.png');
							d.add(63,3,'安监站长',"${ctx}/jsp/reputation/reputation.jsp?departments=b024bd7019e7490394f6ddcdada1b065",'','mainframe2','qj.png');
							d.add(64,3,'钻机二队办公室',"${ctx}/jsp/reputation/reputation.jsp?departments=623800e3382245a387c7494e6af7df2b",'','mainframe2','qj.png');
							d.add(65,3,'探放水对办公室',"${ctx}/jsp/reputation/reputation.jsp?departments=bc6ae9a222584936817eb5f94275676b",'','mainframe2','qj.png');
							d.add(66,3,'抽排队办公室',"${ctx}/jsp/reputation/reputation.jsp?departments=2639ba543b554565ab88627a429b0056",'','mainframe2','qj.png');
														
							d.add(4,0,'运输工区',"${ctx}/jsp/reputation/reputation.jsp?departmentf=d601be750b7b41a0bc92fb4f273f8f56",'','mainframe2','qt.png');
							d.add(67,4,'办公室',"${ctx}/jsp/reputation/reputation.jsp?departments=eddd4d19a2ce400d9be7963a2af2fc07",'','mainframe2','qt.png');
							d.add(68,4,'总支办公室',"${ctx}/jsp/reputation/reputation.jsp?departments=1c7e5b9ab8b640d9819721796446942b",'','mainframe2','qt.png');
							d.add(69,4,'常务主任',"${ctx}/jsp/reputation/reputation.jsp?departments=62162eb9581d4aafabb99896f13f4c5a",'','mainframe2','qt.png');
							d.add(70,4,'副主任',"${ctx}/jsp/reputation/reputation.jsp?departments=f6cd63e367c640b781b06f10df992275",'','mainframe2','qt.png');
							d.add(71,4,'主任工程师',"${ctx}/jsp/reputation/reputation.jsp?departments=b549177db94e47318bebaa702d5ce173",'','mainframe2','qt.png');
							d.add(72,4,'调度站长',"${ctx}/jsp/reputation/reputation.jsp?departments=81f3ba14fde44ca18a6c435ad9f1695a",'','mainframe2','qt.png');
							d.add(73,4,'技术组',"${ctx}/jsp/reputation/reputation.jsp?departments=b2e9576a2c1d49ceb7fd06beaad73162",'','mainframe2','qt.png');
							d.add(75,4,'成本组',"${ctx}/jsp/reputation/reputation.jsp?departments=371e053f73584bcaa4a8abbf95ce9710",'','mainframe2','qt.png');
							d.add(76,4,'安全小分队',"${ctx}/jsp/reputation/reputation.jsp?departments=b7489af7fcdb4810b51778a7cc04d052",'','mainframe2','qt.png');
							d.add(77,4,'运输队办公室',"${ctx}/jsp/reputation/reputation.jsp?departments=7a02e9055a83438b9adcf6da955fb37a",'','mainframe2','qt.png');
							d.add(78,4,'钉道对办公室',"${ctx}/jsp/reputation/reputation.jsp?departments=fbf75a5c34344e2d9de75c658c4090ba",'','mainframe2','qt.png');
							d.add(79,4,'下料一队办公室',"${ctx}/jsp/reputation/reputation.jsp?departments=43851a96bbe7441fb99c881c22ae9a78",'','mainframe2','qt.png');
							d.add(80,4,'下料二队办公室',"${ctx}/jsp/reputation/reputation.jsp?departments=6998b5b906634f299a506d044ee0f777",'','mainframe2','qt.png');
							d.add(81,4,'运输机电队办公室',"${ctx}/jsp/reputation/reputation.jsp?departments=0b60c6c5becd4560b01a8c1eee2e8247",'','mainframe2','qt.png');
							d.add(82,4,'排矸对办公室',"${ctx}/jsp/reputation/reputation.jsp?departments=00d06fabe18a4d01b18fdbd191574d63",'','mainframe2','qt.png');
							                            

							
							d.add(5,0,'机电工区',"${ctx}/jsp/reputation/reputation.jsp?departmentf=2c6c3460f99b477cadfdaefba8a8fa1b",'','mainframe2','qt.png');
							d.add(83,5,'办公室',"${ctx}/jsp/reputation/reputation.jsp?departments=c1d6b14a950a4be9a3f403de9cc5c447",'','mainframe2','qt.png');
							d.add(84,5,'总支干事',"${ctx}/jsp/reputation/reputation.jsp?departments=c54add5d89bd4f8ca1e93003c46523d5",'','mainframe2','qt.png');
							d.add(85,5,'主任',"${ctx}/jsp/reputation/reputation.jsp?departments=013e1d18926c4c3f8f12312135592070",'','mainframe2','qt.png');
							d.add(85,5,'书记',"${ctx}/jsp/reputation/reputation.jsp?departments=1b2635774b6245fcaa6652d5c79f70fd",'','mainframe2','qt.png');
							d.add(86,5,'副主任',"${ctx}/jsp/reputation/reputation.jsp?departments=9d58582407934bc085161d6319ada356",'','mainframe2','qt.png');
							d.add(87,5,'调度站长',"${ctx}/jsp/reputation/reputation.jsp?departments=81d48c6271d3489f9409ee3da30a823f",'','mainframe2','qt.png');
							d.add(88,5,'机电调度室',"${ctx}/jsp/reputation/reputation.jsp?departments=17d7f648296f429e94ab504fb9e581ac",'','mainframe2','qt.png');
							d.add(86,5,'机电管理组',"${ctx}/jsp/reputation/reputation.jsp?departments=c86c3dc59c2b4bf28188a394a63f035b",'','mainframe2','qt.png');
							d.add(87,5,'大型材料组',"${ctx}/jsp/reputation/reputation.jsp?departments=12f61f95142e4528b7915d16fa81bdcf",'','mainframe2','qt.png');
							d.add(88,5,'设备管理组',"${ctx}/jsp/reputation/reputation.jsp?departments=071f42bef4444df58bbb3ae36316b5ce",'','mainframe2','qt.png');
							d.add(89,5,'配件管理组',"${ctx}/jsp/reputation/reputation.jsp?departments=0a515b2900e64104a93a3cc881a253f5",'','mainframe2','qt.png');
							d.add(90,5,'成本管理组',"${ctx}/jsp/reputation/reputation.jsp?departments=45864633e882446c9f280b9558c074c4",'','mainframe2','qt.png');
							d.add(91,5,'三电环保办',"${ctx}/jsp/reputation/reputation.jsp?departments=096a1e6a977840f98de5e13da89e3c43",'','mainframe2','qt.png');
							d.add(92,5,'三电办',"${ctx}/jsp/reputation/reputation.jsp?departments=72c7318bad53436dae34025f33c38417",'','mainframe2','qt.png');
							d.add(93,5,'环保',"${ctx}/jsp/reputation/reputation.jsp?departments=85744ef39a92448492a0602e719a5f57",'','mainframe2','qt.png');
							d.add(94,5,'技术组',"${ctx}/jsp/reputation/reputation.jsp?departments=1c9945328e26470da7de2d6eedb6e8fd",'','mainframe2','qt.png');
							d.add(95,5,'综采组',"${ctx}/jsp/reputation/reputation.jsp?departments=94af774051a24cbd900065097ffb0978",'','mainframe2','qt.png');
							d.add(96,5,'职教干事',"${ctx}/jsp/reputation/reputation.jsp?departments=929109d69b974535b9e889008a710e63",'','mainframe2','qt.png');
							d.add(97,5,'安监站长',"${ctx}/jsp/reputation/reputation.jsp?departments=ab75eaa107204e07b14daa84ae6dc374",'','mainframe2','qt.png');
							d.add(98,5,'检修队办公室',"${ctx}/jsp/reputation/reputation.jsp?departments=cff43c9a623c460f968c99ba11ff135c",'','mainframe2','qt.png');
							d.add(99,5,'机电队',"${ctx}/jsp/reputation/reputation.jsp?departments=0a0914d0929044caadd72c0b4dae0c9c",'','mainframe2','qt.png');



							
							d.add(6,0,'维运工区',"${ctx}/jsp/reputation/reputation.jsp?departmentf=a69d4659653049b4aeace9bc9eda6812",'','mainframe2','qt.png');
							d.add(100,6,'办公室',"${ctx}/jsp/reputation/reputation.jsp?departments=72e121466fc84e4abe81a5bbae59b47f",'','mainframe2','qt.png');
							d.add(101,6,'总支干事',"${ctx}/jsp/reputation/reputation.jsp?departments=97373d9a21154e2391baf287de0a7f41",'','mainframe2','qt.png');
							d.add(102,6,'主任',"${ctx}/jsp/reputation/reputation.jsp?departments=7742313409d14b48a509e29515b83224",'','mainframe2','qt.png');
							d.add(103,6,'书记',"${ctx}/jsp/reputation/reputation.jsp?departments=592fcf7788174d338601092776eb65b3",'','mainframe2','qt.png');
							d.add(104,6,'主任工程师',"${ctx}/jsp/reputation/reputation.jsp?departments=0634843c4a274134979766e5be120212",'','mainframe2','qt.png');
							d.add(105,6,'调度',"${ctx}/jsp/reputation/reputation.jsp?departments=be415d887f4b4578bda7a66443fd2d4d",'','mainframe2','qt.png');
							d.add(106,6,'技术组',"${ctx}/jsp/reputation/reputation.jsp?departments=627db3ee45d044858cbbc63c17bccdaf",'','mainframe2','qt.png');
							d.add(107,6,'成本组',"${ctx}/jsp/reputation/reputation.jsp?departments=9bed72f7244e451e8979d51bf19ec617",'','mainframe2','qt.png');
							d.add(108,6,'材料组',"${ctx}/jsp/reputation/reputation.jsp?departments=17087445a5b0488ea6461953f08af7fd",'','mainframe2','qt.png');
							d.add(109,6,'材料员',"${ctx}/jsp/reputation/reputation.jsp?departments=a994f3310ef44ae9ba4bb9c0a062e68d",'','mainframe2','qt.png');
							d.add(110,6,'库管员',"${ctx}/jsp/reputation/reputation.jsp?departments=f7e3eedbfb5a454c99f421e95a63b170",'','mainframe2','qt.png');
							d.add(111,6,'节水办',"${ctx}/jsp/reputation/reputation.jsp?departments=ca09037e24124dc9a86c653150cd6be4",'','mainframe2','qt.png');
							d.add(112,6,'综合二队办公室',"${ctx}/jsp/reputation/reputation.jsp?departments=5316905635a14415b7769bdc1a88c206",'','mainframe2','qt.png');
							d.add(113,6,'供电队办公室',"${ctx}/jsp/reputation/reputation.jsp?departments=628c45eaa41e423caa7f28ab466531b0",'','mainframe2','qt.png');
							d.add(114,6,'动力队办公室',"${ctx}/jsp/reputation/reputation.jsp?departments=ffca94daaa0d47e6b5a29760a5bd01ae",'','mainframe2','qt.png');
							d.add(115,6,'副立井维护组',"${ctx}/jsp/reputation/reputation.jsp?departments=96b7cd90409748fcb5446a492c85e6af",'','mainframe2','qt.png');
							d.add(116,6,'副立井绞车房',"${ctx}/jsp/reputation/reputation.jsp?departments=76de382c6d0f46988973e8d444bf4a4c",'','mainframe2','qt.png');
							d.add(117,6,'综合一队办公室',"${ctx}/jsp/reputation/reputation.jsp?departments=5c44a1b27cf543ffb102f3a208b7e9d9",'','mainframe2','qt.png');
							d.add(118,6,'维护组',"${ctx}/jsp/reputation/reputation.jsp?departments=316459a10ac642eab789f68db1eaaf33",'','mainframe2','qt.png');

							
							d.add(7,0,'洗煤厂',"${ctx}/jsp/reputation/reputation.jsp?departmentf=6d36603331004cf2a45644357f6dc684",'','mainframe2','qt.png');
							d.add(119,7,'办公室',"${ctx}/jsp/reputation/reputation.jsp?departments=12ff39a3cd8a491eaf5577de71d31abc",'','mainframe2','qt.png');
							d.add(120,7,'总支干事',"${ctx}/jsp/reputation/reputation.jsp?departments=b5f0e24f8a614db48acd579e9063badb",'','mainframe2','qt.png');
							d.add(121,7,'厂长',"${ctx}/jsp/reputation/reputation.jsp?departments=cdcf347a63d34311856ea3a875e41c0e",'','mainframe2','qt.png');
							d.add(122,7,'总支书记',"${ctx}/jsp/reputation/reputation.jsp?departments=df10e779655e4623b080fa600203035e",'','mainframe2','qt.png');
							d.add(123,7,'常务主任',"${ctx}/jsp/reputation/reputation.jsp?departments=ddbd2e9212a04a26aee2718b801ac9de",'','mainframe2','qt.png');
							d.add(124,7,'常务副厂长',"${ctx}/jsp/reputation/reputation.jsp?departments=432fe71d2fcb46228563508dfeca5c41",'','mainframe2','qt.png');
							d.add(125,7,'技术主管',"${ctx}/jsp/reputation/reputation.jsp?departments=c4604950e4ee40e7bbda20b52b9dcae1",'','mainframe2','qt.png');
							d.add(126,7,'副厂长',"${ctx}/jsp/reputation/reputation.jsp?departments=8acb18410987409e88d1c0ccff6be31a",'','mainframe2','qt.png');
							d.add(127,7,'调度站、集控室',"${ctx}/jsp/reputation/reputation.jsp?departments=2b10235b00954ea19dafcf9ddb4c3d57",'','mainframe2','qt.png');
							d.add(128,7,'考核办',"${ctx}/jsp/reputation/reputation.jsp?departments=d2c6d9b969ec49f3be6d46bf95bdd372",'','mainframe2','qt.png');
							d.add(129,7,'工会干事',"${ctx}/jsp/reputation/reputation.jsp?departments=8c477dd6ef394e41ac347ec0e5099fc0",'','mainframe2','qt.png');
							d.add(130,7,'技术组',"${ctx}/jsp/reputation/reputation.jsp?departments=ddd119a7cf864c309f02a145c9c4dfab",'','mainframe2','qt.png');
							d.add(131,7,'职教干事',"${ctx}/jsp/reputation/reputation.jsp?departments=18d662b43db942fcaefd257e8cd64661",'','mainframe2','qt.png');
							d.add(132,7,'自动化',"${ctx}/jsp/reputation/reputation.jsp?departments=c491dfc1b8c64762b13146a82f6c1cd7",'','mainframe2','qt.png');
							d.add(133,7,'材料组',"${ctx}/jsp/reputation/reputation.jsp?departments=6265a564817d4bd4a74264911e88cb50",'','mainframe2','qt.png');
							d.add(134,7,'配件员',"${ctx}/jsp/reputation/reputation.jsp?departments=b09fd936e19c47ef8c1d50b9f0800f49",'','mainframe2','qt.png');
							d.add(135,7,'成本员',"${ctx}/jsp/reputation/reputation.jsp?departments=113e8f1caa8a4152928c5e8c7ed1be41",'','mainframe2','qt.png');
							d.add(136,7,'统计员',"${ctx}/jsp/reputation/reputation.jsp?departments=f46a0acc410942039e7bdcb4982c6afb",'','mainframe2','qt.png');
							d.add(137,7,'煤质办',"${ctx}/jsp/reputation/reputation.jsp?departments=29dbbb1c87cc4078a6fdfe23c20548b2",'','mainframe2','qt.png');
							d.add(138,7,'安监',"${ctx}/jsp/reputation/reputation.jsp?departments=432fe71d2fcb46228563508dfeca5c41",'','mainframe2','qt.png');
							d.add(139,7,'重介一队办公室',"${ctx}/jsp/reputation/reputation.jsp?departments=f1f8497fe9c04f349bee09dd10914dc3",'','mainframe2','qt.png');
							d.add(140,7,'重介二队办公室',"${ctx}/jsp/reputation/reputation.jsp?departments=b6b7fd45c9db487c978f806256ab5ccc",'','mainframe2','qt.png');
							d.add(141,7,'原煤队办公室',"${ctx}/jsp/reputation/reputation.jsp?departments=381da0ec7025409e85bdcade049af63d",'','mainframe2','qt.png');
							d.add(142,7,'装车队办公室',"${ctx}/jsp/reputation/reputation.jsp?departments=e36204d97ae4424689ba108f6202c060",'','mainframe2','qt.png');
							d.add(143,7,'煤泥水队办公室',"${ctx}/jsp/reputation/reputation.jsp?departments=9e3006f076ce41b19e83c15c4a0bf239",'','mainframe2','qt.png');
							d.add(144,7,'机电队办公室',"${ctx}/jsp/reputation/reputation.jsp?departments=e636c1bf294248ac8db88cf0176746d5",'','mainframe2','qt.png');
													
							d.add(8,0,'物资供应部',"${ctx}/jsp/reputation/reputation.jsp?departmentf=28aa351ace4b40da87af60410fc34f80",'','mainframe2','qt.png');
							d.add(145,8,'办公室',"${ctx}/jsp/reputation/reputation.jsp?departments=9d9f5f61ad80419bb10a5248c72e0b06",'','mainframe2','qt.png');
							d.add(146,8,'支部办公室',"${ctx}/jsp/reputation/reputation.jsp?departments=7483c70db78d47bc9c8daf9f685982db",'','mainframe2','qt.png');
							d.add(147,8,'部长',"${ctx}/jsp/reputation/reputation.jsp?departments=c666fd4cba6949bdabcd30e492c3c886",'','mainframe2','qt.png');
							d.add(148,8,'书记',"${ctx}/jsp/reputation/reputation.jsp?departments=3c14be92c9d34c68afe19b8cf67a25d4",'','mainframe2','qt.png');
							d.add(149,8,'助理',"${ctx}/jsp/reputation/reputation.jsp?departments=223fd9e4bcd14bbd9ae2ab1b059d4214",'','mainframe2','qt.png');
							d.add(150,8,'仓库队',"${ctx}/jsp/reputation/reputation.jsp?departments=493f9171c0164c29b96a1d4dfb8b5640",'','mainframe2','qt.png');
							d.add(151,8,'木场队',"${ctx}/jsp/reputation/reputation.jsp?departments=8fef289abdc64b26a6f1c6c153fb7e85",'','mainframe2','qt.png');
							d.add(152,8,'计划业务组',"${ctx}/jsp/reputation/reputation.jsp?departments=f17b61b47c8b4c9ea724ac3b1e395808",'','mainframe2','qt.png');
							d.add(153,8,'一科',"${ctx}/jsp/reputation/reputation.jsp?departments=78302e04c71e439dac73635bc599240e",'','mainframe2','qt.png');
							d.add(154,8,'二科',"${ctx}/jsp/reputation/reputation.jsp?departments=8b1767f513074e5b967b2f3271d80ce1",'','mainframe2','qt.png');
							d.add(155,8,'三科',"${ctx}/jsp/reputation/reputation.jsp?departments=96d363e5ba414fcab282fe526f915ef9",'','mainframe2','qt.png');
							d.add(156,8,'四科',"${ctx}/jsp/reputation/reputation.jsp?departments=747809a9c648489496b4c903d515273e",'','mainframe2','qt.png');
							d.add(157,8,'办公用品',"${ctx}/jsp/reputation/reputation.jsp?departments=be8beb936b03424ca059e6caf12a9d80",'','mainframe2','qt.png');
							d.add(158,8,'配件业务组',"${ctx}/jsp/reputation/reputation.jsp?departments=d6b8d027bb08434da0c43e3cdcfc88e1",'','mainframe2','qt.png');
							d.add(159,8,'财务组',"${ctx}/jsp/reputation/reputation.jsp?departments=9e682900cac14679818ab597e73e4f5a",'','mainframe2','qt.png');
							d.add(160,8,'统计管理组',"${ctx}/jsp/reputation/reputation.jsp?departments=0380de13a823487998c016652f3f7165",'','mainframe2','qt.png');
							d.add(161,8,'坑木坑代组',"${ctx}/jsp/reputation/reputation.jsp?departments=22ae0433511f4e13921d39b40c9b8d21",'','mainframe2','qt.png');
							d.add(162,8,'二科计划',"${ctx}/jsp/reputation/reputation.jsp?departments=38a3494d96ee4fd69cab5ad832198086",'','mainframe2','qt.png');
							d.add(163,8,'仓库保管组',"${ctx}/jsp/reputation/reputation.jsp?departments=d07db5c4a38c489f9bba73fd2667b9f6",'','mainframe2','qt.png');
							d.add(164,8,'验收组',"${ctx}/jsp/reputation/reputation.jsp?departments=9adb4db2881d4a60ae64fc2cb571dc4b",'','mainframe2','qt.png');
							d.add(165,8,'发料中心组',"${ctx}/jsp/reputation/reputation.jsp?departments=f51c62cacc8b43e594898bb6e2b48476",'','mainframe2','qt.png');


							
							d.add(9,0,'生产服务中心',"${ctx}/jsp/reputation/reputation.jsp?departmentf=3b0af89beb3548868debe1ea950c43c5",'','mainframe2','qt.png');
							d.add(166,9,'办公室',"${ctx}/jsp/reputation/reputation.jsp?departments=09c6e1bd418549b78b1efa5332add44b",'','mainframe2','qt.png');
							d.add(167,9,'经理',"${ctx}/jsp/reputation/reputation.jsp?departments=44f7293b4caf44d9b2e48c33450e6940",'','mainframe2','qt.png');
							d.add(168,9,'书记',"${ctx}/jsp/reputation/reputation.jsp?departments=1e62407ed7f244b2a9a999b1ebb40adb",'','mainframe2','qt.png');
							d.add(169,9,'助理',"${ctx}/jsp/reputation/reputation.jsp?departments=f2d2ff0e9a6c4dd28129097741308097",'','mainframe2','qt.png');
							d.add(170,9,'金属网队',"${ctx}/jsp/reputation/reputation.jsp?departments=8e16ac52d5994453852d824c694ffe93",'','mainframe2','qt.png');
							d.add(171,9,'工程服务队',"${ctx}/jsp/reputation/reputation.jsp?departments=16a4d7550ade4a45966ccd4b3d540105",'','mainframe2','qt.png');
							d.add(172,9,'管理组',"${ctx}/jsp/reputation/reputation.jsp?departments=1df7a17498de4370a1b4e9417d4e67c3",'','mainframe2','qt.png');
							 							
							d.config.closeSameLevel = true;//打开本文件夹关闭同级的其他文件夹    	
							d.config.useSelection = true;//选中的节点背景色设置
						
							document.write(d);
							d.openAll(); 	
						</script>
					</div>
				</div>
			</td>
			<td valign="top">
				<iframe id="mainframe2" name="mainframe2" src="${ctx}/jsp/reputation/reputation.jsp" style="height:600px;width:98%" frameborder="0" ></iframe>
		    </td>
    	</tr>
	</table>
</body>
</html>
