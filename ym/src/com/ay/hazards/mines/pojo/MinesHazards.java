package com.ay.hazards.mines.pojo;

import com.ay.framework.annotation.ChineseName;
import com.ay.framework.annotation.MultiLineField;
import com.ay.framework.annotation.PersistenceIgnore;
import com.ay.framework.core.pojo.MapPojo;
import com.ay.framework.core.pojo.MapType;
import com.ay.hazards.identification.HazardsType;
import com.ay.hazards.identification.IHazards;
/**
 * 金属非金属地下矿山 实体类
 * @author zhangxiang
 * 2013-04-07
 */
//@ChineseName("金属非金属地下矿山")
public class MinesHazards extends MapPojo implements IHazards {
	
	@Override
	public MapType getMapType() {
		// TODO Auto-generated method stub
		return MapType.mines;
	}

	@ChineseName("单位代码")
	private String dwdm;
	
	@ChineseName("矿井名称")
	private String mineName;
	
	@PersistenceIgnore
	private String corpName;
	
	@ChineseName("详细地址")
	private String address;
	
	@ChineseName("邮政编码")
	private String yzbm;
	
	@ChineseName("主要负责人")
	private String zyfzr;
	
	@ChineseName("联系电话")
	private String lxdh;
	
	@ChineseName("上级法人单位")
	private String sjfrdw;
	
	@ChineseName("建矿日期")
	private String ckrq;
	
	@ChineseName("设计能力")
	private String designAblity;
	
	@ChineseName("实际能力")
	private String realAblity;
	
	@ChineseName("开采矿种")
	private String kckz;
	
	@ChineseName("可采储量")
	private String kccl;
	
	@ChineseName("固定资产")
	private String gdzc;
	
	@ChineseName("年利润")
	private String nlr;
	
	@ChineseName("经济类型")
	private String jjlx;
	
	@ChineseName("开拓方式")
	private String ktfs;
	
	@ChineseName("通风方式")
	private String tffs;
	
	@ChineseName("提升方式")
	private String tsfs;
	
	@ChineseName("供电方式")
	private String gdfs;
	
	@ChineseName("同时生产的中段数")
	private String tsscdzds;
	
	@ChineseName("准备生产的中段数")
	private String zbscdzds;
	
	@ChineseName("同时生产的采场数")
	private String tsscdccs;
	
	@ChineseName("井下同时作业人数")
	private String jxtszyrs;
	
	@ChineseName("矿井总进风量")
	private String kjzjfl;
	
	@ChineseName("矿井有效风量率")
	private String kjyxfll;
	
	@ChineseName("矿井最大涌水量")
	private String kjzdysl;
	
	@ChineseName("矿井最大综合排水量")
	private String zjzdzhpsl;
	
	@ChineseName("是否是以下类型的矿井 瓦斯矿井")
	private String yxlxdkjws;
	
	@ChineseName("是否是以下类型的矿井 其他与煤共生的矿井 ")
	private String yxlxdkjm;
	
	@ChineseName("是否是以下类型的矿井 有自燃发火危险的矿井")
	private String yxlxdkjfh;
	
	@ChineseName("是否是以下类型的矿井 矿尘有爆炸性")
	private String yxlxdkjkc;
	
	@ChineseName("是否是以下类型的矿井 煤系硫铁矿井 ")
	private String yxlxdkjmxdk;
	
	@ChineseName("是否是以下类型的矿井 放射性的矿井")
	private String yxlxdkjfsx;
	
	@ChineseName("是否是以下类型的矿井 高硫矿")
	private String yxlxdkjglk;
	
	@ChineseName("是否是以下类型的矿井 有冲击地压危害")
	private String yxlxdkjcjdy;
	
	@ChineseName("竖井或倾角在45度及其以上的井巷")
	private String sjhqjdjx;
	
	@ChineseName("水平巷道或倾角在45度以下的井巷内")
	private String spxdhjqdjx;
	
	@ChineseName("地面爆炸材料储存情况 库房数")
	private String dmbzclkfs;
	
	@ChineseName("地面爆炸材料储存情况 炸药")
	private String dmbzclzy;
	
	@ChineseName("地面爆炸材料储存情况 雷管")
	private String dmbzcllg;
	
	@ChineseName("井下爆炸材料储存情况 峒室数")
	private String jxbzcltss;
	
	@ChineseName("井下爆炸材料储存情况 炸药")
	private String jxbzclzy;
	
	@ChineseName("井下爆炸材料储存情况 雷管")
	private String jsbzcllg;
	
	@ChineseName("1矿区及其附近地表水流系统和汇水面积、疏水能力、水利工程等情况")
	private String kqfjqk;
	
	@ChineseName("历年最高洪水位,洪水量地面水体、各含水层及井下水的动态")
	private String lnsw;
	
	@ChineseName("3矿区内小矿井、老井、老采空区")
	private String kqqtkq;
	
	@ChineseName("4矿区内的钻孔和封孔质量")
	private String kqzkzl;
	
	@ChineseName("5现有生产井中的积水区、含水层、岩溶带、地质构造等详细情况")
	private String xyscjqk;
	
	@ChineseName("6矿井水与地下水、地表水和大气降雨的水力联系")
	private String kjsdsllx;
	
	@ChineseName("是否是水文地质条件复杂的矿井")
	private String swdzkj;
	
	@ChineseName("矿体顶底板含水层情况")
	private String ktddbhscqk;
	
	@ChineseName("矿体顶底板有无承压含水层")
	private String ktddbyfhsc;
	
	@ChineseName("矿井开采是否受地表水体或洪水的威胁")
	private String kjsfstwx; 
	
	@ChineseName("冲击地压（岩爆）危害")
	private String cjdywh;
	
	@ChineseName("矿区内影响生产与安全的断层数目")
	private String kqdcsm;
	
	@ChineseName("巷道围岩的稳定性")
	private String xdwywdx;
	
	@ChineseName("井下柴油设备数量")
	private String jxcysbsl;
	
	@ChineseName("井下油压设备数量")
	private String jxyysbsl;
	
	@ChineseName("井下各种油类名称和存放地点")
	@MultiLineField
	private String jxgzylcfdd;
	
	@ChineseName("井下各种油类的存放数量")
	private String jxgzylcfsl;
	
	@ChineseName("带式输送机数量（部）")
	private String dsssjsl;
	
	@ChineseName("有哪些防火措施 1滚筒驱动带式输送机使用阻燃输送带")
	private String ynxfhcsssd;
	
	@ChineseName("有哪些防火措施  2液力偶合器使用不燃性传动介质　")
	private String ynxfhcsjz;
	
	@ChineseName("有哪些防火措施 3输送机的机头前后两端20m范围内使用不燃性材料支护")
	private String ynxfhcszh;
	
	@ChineseName("有哪些防火措施 4配备灭火器材")
	private String ynxfhcsqc;
	
	@ChineseName("有哪些防火措施 5设驱动滚筒防滑保护、堆煤保护、防跑偏装置")
	private String ynxfhcszz;
	
	@ChineseName("有哪些防火措施 6设温度保护、烟雾保护")
	private String ynxfhcswd;
	
	@ChineseName("其它措施")
	private String qtcs;
	
	@ChineseName("地面消防水池容量施")
	private String dmfscrl;
	
	@ChineseName("井下消防水管长度")
	private String jxxfsgcd;
	
	@ChineseName("井下有何种有害气体大量涌出")
	private String jxyhqt;
	
	@ChineseName("矿井有无未熄灭的火区")
	private String kjywhq;
	
	@ChineseName("矿区内有无威胁矿井安全生产的塌陷区或有塌陷危险的区域")
	private String kqnywtxwxqy;
	
	@ChineseName("是否是在建筑物下、水体下或铁路下开采")
	private String sfjzstdlkc;
	
	@ChineseName("矿井安全是否受其它小矿乱采乱掘的影响")
	private String kjaqsfsljyx;
	
	@ChineseName("近5年内伤亡事故")
	private String jwnsg;
	
	@ChineseName("轻伤人数")
	private String qsrs;
	
	@ChineseName("重伤人数")
	private String zsrs;
	
	@ChineseName("死亡人数")
	private String swrs;
	
	@ChineseName("建矿以来曾发生重大事故（指造成3人以上死亡或全矿或部分区域停产）	水灾")
	private String jkylzdsgsz;
	@ChineseName("建矿以来曾发生重大事故（指造成3人以上死亡或全矿或部分区域停产）	火灾")
	private String jkylzdsghz;
	
	@ChineseName("建矿以来曾发生重大事故（指造成3人以上死亡或全矿或部分区域停产）	大面积冒顶")
	private String jkylzdsgmd;
	
	@ChineseName("建矿以来曾发生重大事故（指造成3人以上死亡或全矿或部分区域停产）	坠罐或跑车")
	private String jkylzdsgzgmc;
	
	@ChineseName("建矿以来曾发生重大事故（指造成3人以上死亡或全矿或部分区域停产）	其他措施")
	private String jkylzdsgqt;
	
	@ChineseName("主扇型号")
	private String zsxh;
	
	@ChineseName("主扇数量")
	private String zssl;
	
	@ChineseName("局扇型号")
	private String jsxh;
	
	@ChineseName("局扇数量")
	private String jssl;
	
	@ChineseName("主排水泵型号")
	private String zpsgxh;
	
	@ChineseName("主排水泵数量")
	private String zpsgsl;
	
	@ChineseName("探放水设备型号")
	private String tfssbxh;
	
	@ChineseName("探放水设备数量")
	private String tfssbsl;
	
	@ChineseName("绞车提升设备型号")
	private String jctssbxh;
	
	@ChineseName("绞车提升设备数量")
	private String jctssbsl;
	
	@ChineseName("技术人员数高级")
	private String jsrysgj;
	
	@ChineseName("技术人员数中级")
	private String jsryszj;
	
	@ChineseName("技术人员数初级")
	private String jsryscj;
	
	@ChineseName("电工人数")
	private String dgrs;
	
	@ChineseName("绞车司机人数")
	private String jcsjrs;
	
	@ChineseName("放炮员人数")
	private String fbrs;
	
	@ChineseName("采矿方法")
	@MultiLineField
	private String ckff;
	
	@ChineseName("影响矿井安全生产的主要问题说明：(不少于三条内容)")
	@MultiLineField
	private String xykjwtsm;
	
	@ChineseName("备注")
	@MultiLineField
	private String bz;
	
	@ChineseName("填表联系电话")
	private String tblxdh;
	
	@ChineseName("填表人")
	private String tbr;
	
	@ChineseName("填表日期")
	private String tbrq;

	
	public String getTblxdh() {
		return tblxdh;
	}

	public void setTblxdh(String tblxdh) {
		this.tblxdh = tblxdh;
	}

	public String getTbr() {
		return tbr;
	}

	public void setTbr(String tbr) {
		this.tbr = tbr;
	}

	public String getTbrq() {
		return tbrq;
	}

	public void setTbrq(String tbrq) {
		this.tbrq = tbrq;
	}

	public String getDwdm() {
		return dwdm;
	}

	public void setDwdm(String dwdm) {
		this.dwdm = dwdm;
	}

	public String getMineName() {
		return mineName;
	}

	public void setMineName(String mineName) {
		this.mineName = mineName;
	}

	public String getAddress() {
		return address;
	}

	
	public String getYxlxdkjws() {
		return yxlxdkjws;
	}

	public void setYxlxdkjws(String yxlxdkjws) {
		this.yxlxdkjws = yxlxdkjws;
	}

	public String getYxlxdkjm() {
		return yxlxdkjm;
	}

	public void setYxlxdkjm(String yxlxdkjm) {
		this.yxlxdkjm = yxlxdkjm;
	}

	public String getYxlxdkjfh() {
		return yxlxdkjfh;
	}

	public void setYxlxdkjfh(String yxlxdkjfh) {
		this.yxlxdkjfh = yxlxdkjfh;
	}

	public String getYxlxdkjkc() {
		return yxlxdkjkc;
	}

	public void setYxlxdkjkc(String yxlxdkjkc) {
		this.yxlxdkjkc = yxlxdkjkc;
	}

	public String getYxlxdkjmxdk() {
		return yxlxdkjmxdk;
	}

	public void setYxlxdkjmxdk(String yxlxdkjmxdk) {
		this.yxlxdkjmxdk = yxlxdkjmxdk;
	}

	public String getYxlxdkjfsx() {
		return yxlxdkjfsx;
	}

	public void setYxlxdkjfsx(String yxlxdkjfsx) {
		this.yxlxdkjfsx = yxlxdkjfsx;
	}

	public String getYxlxdkjglk() {
		return yxlxdkjglk;
	}

	public void setYxlxdkjglk(String yxlxdkjglk) {
		this.yxlxdkjglk = yxlxdkjglk;
	}

	public String getYxlxdkjcjdy() {
		return yxlxdkjcjdy;
	}

	public void setYxlxdkjcjdy(String yxlxdkjcjdy) {
		this.yxlxdkjcjdy = yxlxdkjcjdy;
	}

	public String getDmbzclzy() {
		return dmbzclzy;
	}

	public void setDmbzclzy(String dmbzclzy) {
		this.dmbzclzy = dmbzclzy;
	}

	public String getJxbzclzy() {
		return jxbzclzy;
	}

	public void setJxbzclzy(String jxbzclzy) {
		this.jxbzclzy = jxbzclzy;
	}

	public String getYnxfhcsssd() {
		return ynxfhcsssd;
	}

	public void setYnxfhcsssd(String ynxfhcsssd) {
		this.ynxfhcsssd = ynxfhcsssd;
	}

	public String getYnxfhcsjz() {
		return ynxfhcsjz;
	}

	public void setYnxfhcsjz(String ynxfhcsjz) {
		this.ynxfhcsjz = ynxfhcsjz;
	}

	public String getYnxfhcszh() {
		return ynxfhcszh;
	}

	public void setYnxfhcszh(String ynxfhcszh) {
		this.ynxfhcszh = ynxfhcszh;
	}

	public String getYnxfhcsqc() {
		return ynxfhcsqc;
	}

	public void setYnxfhcsqc(String ynxfhcsqc) {
		this.ynxfhcsqc = ynxfhcsqc;
	}

	public String getYnxfhcszz() {
		return ynxfhcszz;
	}

	public void setYnxfhcszz(String ynxfhcszz) {
		this.ynxfhcszz = ynxfhcszz;
	}

	public String getYnxfhcswd() {
		return ynxfhcswd;
	}

	public void setYnxfhcswd(String ynxfhcswd) {
		this.ynxfhcswd = ynxfhcswd;
	}

	public String getSwrs() {
		return swrs;
	}

	public void setSwrs(String swrs) {
		this.swrs = swrs;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getYzbm() {
		return yzbm;
	}

	public void setYzbm(String yzbm) {
		this.yzbm = yzbm;
	}

	public String getZyfzr() {
		return zyfzr;
	}

	public void setZyfzr(String zyfzr) {
		this.zyfzr = zyfzr;
	}

	public String getLxdh() {
		return lxdh;
	}

	public void setLxdh(String lxdh) {
		this.lxdh = lxdh;
	}

	public String getSjfrdw() {
		return sjfrdw;
	}

	public void setSjfrdw(String sjfrdw) {
		this.sjfrdw = sjfrdw;
	}

	public String getCkrq() {
		return ckrq;
	}

	public void setCkrq(String ckrq) {
		this.ckrq = ckrq;
	}

	public String getDesignAblity() {
		return designAblity;
	}

	public void setDesignAblity(String designAblity) {
		this.designAblity = designAblity;
	}

	public String getRealAblity() {
		return realAblity;
	}

	public void setRealAblity(String realAblity) {
		this.realAblity = realAblity;
	}

	public String getKckz() {
		return kckz;
	}

	public void setKckz(String kckz) {
		this.kckz = kckz;
	}

	public String getKccl() {
		return kccl;
	}

	public void setKccl(String kccl) {
		this.kccl = kccl;
	}

	public String getGdzc() {
		return gdzc;
	}

	public void setGdzc(String gdzc) {
		this.gdzc = gdzc;
	}

	public String getNlr() {
		return nlr;
	}

	public void setNlr(String nlr) {
		this.nlr = nlr;
	}

	public String getJjlx() {
		return jjlx;
	}

	public void setJjlx(String jjlx) {
		this.jjlx = jjlx;
	}

	public String getKtfs() {
		return ktfs;
	}

	public void setKtfs(String ktfs) {
		this.ktfs = ktfs;
	}

	public String getTffs() {
		return tffs;
	}

	public void setTffs(String tffs) {
		this.tffs = tffs;
	}

	public String getTsfs() {
		return tsfs;
	}

	public void setTsfs(String tsfs) {
		this.tsfs = tsfs;
	}

	public String getGdfs() {
		return gdfs;
	}

	public void setGdfs(String gdfs) {
		this.gdfs = gdfs;
	}

	public String getTsscdzds() {
		return tsscdzds;
	}

	public void setTsscdzds(String tsscdzds) {
		this.tsscdzds = tsscdzds;
	}

	public String getZbscdzds() {
		return zbscdzds;
	}

	public void setZbscdzds(String zbscdzds) {
		this.zbscdzds = zbscdzds;
	}

	public String getTsscdccs() {
		return tsscdccs;
	}

	public void setTsscdccs(String tsscdccs) {
		this.tsscdccs = tsscdccs;
	}

	public String getJxtszyrs() {
		return jxtszyrs;
	}

	public void setJxtszyrs(String jxtszyrs) {
		this.jxtszyrs = jxtszyrs;
	}

	public String getKjzjfl() {
		return kjzjfl;
	}

	public void setKjzjfl(String kjzjfl) {
		this.kjzjfl = kjzjfl;
	}

	public String getKjyxfll() {
		return kjyxfll;
	}

	public void setKjyxfll(String kjyxfll) {
		this.kjyxfll = kjyxfll;
	}

	public String getKjzdysl() {
		return kjzdysl;
	}

	public void setKjzdysl(String kjzdysl) {
		this.kjzdysl = kjzdysl;
	}

	public String getZjzdzhpsl() {
		return zjzdzhpsl;
	}

	public void setZjzdzhpsl(String zjzdzhpsl) {
		this.zjzdzhpsl = zjzdzhpsl;
	}

	public String getSjhqjdjx() {
		return sjhqjdjx;
	}

	public void setSjhqjdjx(String sjhqjdjx) {
		this.sjhqjdjx = sjhqjdjx;
	}

	public String getSpxdhjqdjx() {
		return spxdhjqdjx;
	}

	public void setSpxdhjqdjx(String spxdhjqdjx) {
		this.spxdhjqdjx = spxdhjqdjx;
	}

	public String getDmbzclkfs() {
		return dmbzclkfs;
	}

	public void setDmbzclkfs(String dmbzclkfs) {
		this.dmbzclkfs = dmbzclkfs;
	}

	public String getDmbzcllg() {
		return dmbzcllg;
	}

	public void setDmbzcllg(String dmbzcllg) {
		this.dmbzcllg = dmbzcllg;
	}

	public String getJxbzcltss() {
		return jxbzcltss;
	}

	public void setJxbzcltss(String jxbzcltss) {
		this.jxbzcltss = jxbzcltss;
	}

	public String getJsbzcllg() {
		return jsbzcllg;
	}

	public void setJsbzcllg(String jsbzcllg) {
		this.jsbzcllg = jsbzcllg;
	}

	public String getKqfjqk() {
		return kqfjqk;
	}

	public void setKqfjqk(String kqfjqk) {
		this.kqfjqk = kqfjqk;
	}

	public String getLnsw() {
		return lnsw;
	}

	public void setLnsw(String lnsw) {
		this.lnsw = lnsw;
	}

	public String getKqqtkq() {
		return kqqtkq;
	}

	public void setKqqtkq(String kqqtkq) {
		this.kqqtkq = kqqtkq;
	}

	public String getKqzkzl() {
		return kqzkzl;
	}

	public void setKqzkzl(String kqzkzl) {
		this.kqzkzl = kqzkzl;
	}

	public String getXyscjqk() {
		return xyscjqk;
	}

	public void setXyscjqk(String xyscjqk) {
		this.xyscjqk = xyscjqk;
	}

	public String getKjsdsllx() {
		return kjsdsllx;
	}

	public void setKjsdsllx(String kjsdsllx) {
		this.kjsdsllx = kjsdsllx;
	}

	public String getSwdzkj() {
		return swdzkj;
	}

	public void setSwdzkj(String swdzkj) {
		this.swdzkj = swdzkj;
	}

	public String getKtddbhscqk() {
		return ktddbhscqk;
	}

	public void setKtddbhscqk(String ktddbhscqk) {
		this.ktddbhscqk = ktddbhscqk;
	}

	public String getKtddbyfhsc() {
		return ktddbyfhsc;
	}

	public void setKtddbyfhsc(String ktddbyfhsc) {
		this.ktddbyfhsc = ktddbyfhsc;
	}

	public String getKjsfstwx() {
		return kjsfstwx;
	}

	public void setKjsfstwx(String kjsfstwx) {
		this.kjsfstwx = kjsfstwx;
	}

	public String getCjdywh() {
		return cjdywh;
	}

	public void setCjdywh(String cjdywh) {
		this.cjdywh = cjdywh;
	}

	public String getKqdcsm() {
		return kqdcsm;
	}

	public void setKqdcsm(String kqdcsm) {
		this.kqdcsm = kqdcsm;
	}

	public String getXdwywdx() {
		return xdwywdx;
	}

	public void setXdwywdx(String xdwywdx) {
		this.xdwywdx = xdwywdx;
	}

	public String getJxcysbsl() {
		return jxcysbsl;
	}

	public void setJxcysbsl(String jxcysbsl) {
		this.jxcysbsl = jxcysbsl;
	}

	public String getJxyysbsl() {
		return jxyysbsl;
	}

	public void setJxyysbsl(String jxyysbsl) {
		this.jxyysbsl = jxyysbsl;
	}

	public String getJxgzylcfdd() {
		return jxgzylcfdd;
	}

	public void setJxgzylcfdd(String jxgzylcfdd) {
		this.jxgzylcfdd = jxgzylcfdd;
	}

	public String getJxgzylcfsl() {
		return jxgzylcfsl;
	}

	public void setJxgzylcfsl(String jxgzylcfsl) {
		this.jxgzylcfsl = jxgzylcfsl;
	}

	public String getDsssjsl() {
		return dsssjsl;
	}

	public void setDsssjsl(String dsssjsl) {
		this.dsssjsl = dsssjsl;
	}

	public String getQtcs() {
		return qtcs;
	}

	public void setQtcs(String qtcs) {
		this.qtcs = qtcs;
	}

	public String getDmfscrl() {
		return dmfscrl;
	}

	public void setDmfscrl(String dmfscrl) {
		this.dmfscrl = dmfscrl;
	}

	public String getJxxfsgcd() {
		return jxxfsgcd;
	}

	public void setJxxfsgcd(String jxxfsgcd) {
		this.jxxfsgcd = jxxfsgcd;
	}

	public String getJxyhqt() {
		return jxyhqt;
	}

	public void setJxyhqt(String jxyhqt) {
		this.jxyhqt = jxyhqt;
	}

	public String getKjywhq() {
		return kjywhq;
	}

	public void setKjywhq(String kjywhq) {
		this.kjywhq = kjywhq;
	}

	public String getKqnywtxwxqy() {
		return kqnywtxwxqy;
	}

	public void setKqnywtxwxqy(String kqnywtxwxqy) {
		this.kqnywtxwxqy = kqnywtxwxqy;
	}

	public String getSfjzstdlkc() {
		return sfjzstdlkc;
	}

	public void setSfjzstdlkc(String sfjzstdlkc) {
		this.sfjzstdlkc = sfjzstdlkc;
	}

	public String getKjaqsfsljyx() {
		return kjaqsfsljyx;
	}

	public void setKjaqsfsljyx(String kjaqsfsljyx) {
		this.kjaqsfsljyx = kjaqsfsljyx;
	}

	public String getJwnsg() {
		return jwnsg;
	}

	public void setJwnsg(String jwnsg) {
		this.jwnsg = jwnsg;
	}

	public String getQsrs() {
		return qsrs;
	}

	public void setQsrs(String qsrs) {
		this.qsrs = qsrs;
	}

	public String getZsrs() {
		return zsrs;
	}

	public void setZsrs(String zsrs) {
		this.zsrs = zsrs;
	}

	public String getJkylzdsgsz() {
		return jkylzdsgsz;
	}

	public void setJkylzdsgsz(String jkylzdsgsz) {
		this.jkylzdsgsz = jkylzdsgsz;
	}

	public String getJkylzdsghz() {
		return jkylzdsghz;
	}

	public void setJkylzdsghz(String jkylzdsghz) {
		this.jkylzdsghz = jkylzdsghz;
	}

	public String getJkylzdsgmd() {
		return jkylzdsgmd;
	}

	public void setJkylzdsgmd(String jkylzdsgmd) {
		this.jkylzdsgmd = jkylzdsgmd;
	}

	public String getJkylzdsgzgmc() {
		return jkylzdsgzgmc;
	}

	public void setJkylzdsgzgmc(String jkylzdsgzgmc) {
		this.jkylzdsgzgmc = jkylzdsgzgmc;
	}

	public String getJkylzdsgqt() {
		return jkylzdsgqt;
	}

	public void setJkylzdsgqt(String jkylzdsgqt) {
		this.jkylzdsgqt = jkylzdsgqt;
	}

	public String getZsxh() {
		return zsxh;
	}

	public void setZsxh(String zsxh) {
		this.zsxh = zsxh;
	}

	public String getZssl() {
		return zssl;
	}

	public void setZssl(String zssl) {
		this.zssl = zssl;
	}

	public String getJsxh() {
		return jsxh;
	}

	public void setJsxh(String jsxh) {
		this.jsxh = jsxh;
	}

	public String getJssl() {
		return jssl;
	}

	public void setJssl(String jssl) {
		this.jssl = jssl;
	}

	public String getZpsgxh() {
		return zpsgxh;
	}

	public void setZpsgxh(String zpsgxh) {
		this.zpsgxh = zpsgxh;
	}

	public String getZpsgsl() {
		return zpsgsl;
	}

	public void setZpsgsl(String zpsgsl) {
		this.zpsgsl = zpsgsl;
	}

	public String getTfssbxh() {
		return tfssbxh;
	}

	public void setTfssbxh(String tfssbxh) {
		this.tfssbxh = tfssbxh;
	}

	public String getTfssbsl() {
		return tfssbsl;
	}

	public void setTfssbsl(String tfssbsl) {
		this.tfssbsl = tfssbsl;
	}

	public String getJctssbxh() {
		return jctssbxh;
	}

	public void setJctssbxh(String jctssbxh) {
		this.jctssbxh = jctssbxh;
	}

	public String getJctssbsl() {
		return jctssbsl;
	}

	public void setJctssbsl(String jctssbsl) {
		this.jctssbsl = jctssbsl;
	}

	public String getJsrysgj() {
		return jsrysgj;
	}

	public void setJsrysgj(String jsrysgj) {
		this.jsrysgj = jsrysgj;
	}

	public String getJsryszj() {
		return jsryszj;
	}

	public void setJsryszj(String jsryszj) {
		this.jsryszj = jsryszj;
	}

	public String getJsryscj() {
		return jsryscj;
	}

	public void setJsryscj(String jsryscj) {
		this.jsryscj = jsryscj;
	}

	public String getDgrs() {
		return dgrs;
	}

	public void setDgrs(String dgrs) {
		this.dgrs = dgrs;
	}

	public String getJcsjrs() {
		return jcsjrs;
	}

	public void setJcsjrs(String jcsjrs) {
		this.jcsjrs = jcsjrs;
	}

	public String getFbrs() {
		return fbrs;
	}

	public void setFbrs(String fbrs) {
		this.fbrs = fbrs;
	}

	public String getCkff() {
		return ckff;
	}

	public void setCkff(String ckff) {
		this.ckff = ckff;
	}

	public String getXykjwtsm() {
		return xykjwtsm;
	}

	public void setXykjwtsm(String xykjwtsm) {
		this.xykjwtsm = xykjwtsm;
	}

	public String getBz() {
		return bz;
	}

	public void setBz(String bz) {
		this.bz = bz;
	}

	public String getCorpName() {
		return corpName;
	}

	public void setCorpName(String corpName) {
		this.corpName = corpName;
	}

	@Override
	public HazardsType getHazardsType() {
	    return HazardsType.mines;
	}
}
