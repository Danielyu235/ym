package com.ay.hazards.colliery.pojo;

import com.ay.framework.annotation.ChineseName;
import com.ay.framework.annotation.MultiLineField;
import com.ay.framework.annotation.PersistenceIgnore;
import com.ay.framework.core.pojo.BasePojo;
import com.ay.framework.core.pojo.MapPojo;
import com.ay.framework.core.pojo.MapType;
import com.ay.hazards.identification.HazardsType;
import com.ay.hazards.identification.IHazards;

/** 
 * @Description
 * @date 2013-4-8
 * @author WangXin
 */
//@ChineseName("煤矿")
public class CollieryHazards extends MapPojo implements IHazards{
	
	
    @Override
	public MapType getMapType() {
		// TODO Auto-generated method stub
		return MapType.colliery;
	}
	@ChineseName("所属单位")
    private String dwdm;
    /**
     * 企业名称不需要持久化
     */
    @PersistenceIgnore
    private String corpName;
    @ChineseName("矿井名称")
    private String name;
    @ChineseName("详细地址")
    private String address;
    @ChineseName("邮政编码")
    private String postcode;
    @ChineseName("主要负责人")
    private String chargePerson;
    @ChineseName("联系电话")
    private String chargePersonPhone;
    @ChineseName("上级法人单位")
    private String legalCompany;
    @ChineseName("建矿日期")
    private String bulidDate;
    @ChineseName("设计能力")
    private String designAblity;
    @ChineseName("实际产量")
    private String realOutput;
    @ChineseName("煤的牌号")
    private String brand;
    @ChineseName("从业人数")
    private String workPersonNum;
    @ChineseName("固定资产")
    private String fixedAssets;
    @ChineseName("年利润")
    private String yearProfit;
    @ChineseName("开拓方式")
    private String ktStyle;
    @ChineseName("通风方式")
    private String tfStyle;
    @ChineseName("反风方式")
    private String ffStyle;
    @ChineseName("提升方式")
    private String tsStyle;
    @ChineseName("供电方式")
    private String gdStyle;
    @ChineseName("主采煤层倾角")
    private String zcmcqj;
    @ChineseName("主采煤层厚度(m)")
    private String zcmchd;
    @ChineseName("矿井开采深度(m)")
    private String kjkcsd;
    @ChineseName("生产采区个数")
    private String sccqgs;
    @ChineseName("回采工作面个数")
    private String hcgzmgs;
    @ChineseName("掘进工作面个数")
    private String jjgzmgs;
    @ChineseName("工作面回采方式")
    private String gzmhcStyle;
    @ChineseName("采高(m)")
    private String height;
    @ChineseName("主要落煤方式")
    private String zylmStyle;
    @ChineseName("主要支护型式")
    private String zyzhStyle;
    @ChineseName("顶板处理方法")
    private String dbclStyle;
    @ChineseName("矿井瓦斯等级")
    private String gasLevel;
    @ChineseName("煤层的自燃倾向性")
    private String pyrophorisity;
    @ChineseName("煤层的煤尘爆炸性")
    private String explosivity;
    @ChineseName("煤层顶底板含水层情况")
    private String containWater;
    @ChineseName("水文地质条件复杂程度")
    private String complexDegree;
    @ChineseName("矿井开采是否受地表水体或洪水的威胁")
    private String waterThreat;
    @ChineseName("煤层冲击地压危害程度")
    private String harmDegree;
    @ChineseName("煤层赋存状况（根据煤层厚度和倾角变化、裂隙发育情况、断层、冲刷带、陷落柱、岩浆岩侵入破坏等判断）")
    private String coalOcurrence;
    @ChineseName("开拓巷道的围岩稳定性")
    private String stability;
    @ChineseName("矿井相对瓦斯涌出量(m3/min)")
    private String relativeComingAmount;
    @ChineseName("矿井绝对瓦斯涌出量(m3/min)")
    private String absoluteComingAmount;
    @ChineseName("煤层自燃发火期")
    private String pyrophorisityPeriod;
    @ChineseName("全矿近三个月瓦斯超限次数")
    private String recentMonthGasOverTime;
    @ChineseName("近三年内瓦斯突出次数")
    private String recentYearGasOverTime;
    @ChineseName("近三年内煤层自燃地点数")
    private String recentCoalPyrophorisityTime;
    @ChineseName("近三年内主扇故障检修次数")
    private String recentRepairTime;
    @ChineseName("近三年内供电系统故障检修次数")
    private String recentElecRepairTime;
    @ChineseName("总粉尘(mg/m3)")
    private String totalDust;
    @ChineseName("呼吸性粉尘(mg/m3)")
    private String breathDust;
    @ChineseName("矿井总进风量(m3/min)")
    private String totalIntakeAmount;
    @ChineseName("矿井有效风量率(m3/min)")
    private String effectIntakeAmount;
    @ChineseName("矿井最大涌水量(m3/h)")
    private String WaterInMAX;
    @ChineseName("矿井最大综合排水量(m3/h)")
    private String WaterOutMAX;
    @ChineseName("地面消防水池容量(m3)")
    private String poolVolumn;
    @ChineseName("井下消防水管长度(m)")
    private String pipeLength;
    //@ChineseName("地面爆破材料储存情况")
    //private String groundExplosion;
    @ChineseName("库房数")
    private String groundRoom;
    @ChineseName("炸药")
    private String groundExplosion;
    @ChineseName("雷管")
    private String groundPrimer;
    //@ChineseName("井下爆破材料储存情况")
    //private String undergroundExplosion;
    @ChineseName("峒室数")
    private String undergroundRoom;
    @ChineseName("炸药")
    private String undergroundExplosion;
    @ChineseName("雷管")
    private String undergroundPrimer;
    @ChineseName("有无瓦斯异常涌出区域")
    private String hasGasOutArea;
    @ChineseName("有无未熄灭的火区")
    private String hasUndeadFire;
    @ChineseName("全矿通风系统复杂程度")
    private String windComplex;
    @ChineseName("总进风道和总回风道之间的联络巷道数量")
    private String totalStreetAmount;
    @ChineseName("总进风道和总回风道之间的联络巷道的挡风墙坚固程度")
    private String totalHardDegree;
    @ChineseName("有无在水淹区积水面以下的采掘工作")
    private String hasUnderWaterWork;
    @ChineseName("是否是在建筑物下、水体下或铁路下开采")
    private String isUnderBulidingWork;
    @ChineseName("矿井安全是否受其它小矿乱采乱掘的影响")
    private String isEffected;
    /**
     * 下面四个是
     * 近5年内伤亡事故
     */
    @ChineseName("起数")
    private String deadWoundNum;
    @ChineseName("轻伤人数")
    private String slightWoundNum;
    @ChineseName("重伤人数")
    private String badWoundNum;
    @ChineseName("死亡人数")
    private String deadNum;
    
    /**
     * 下面五个是
     * 建矿以来曾发生重大事故（指造成3人以上死亡或全矿或部分区域停产）
     */
    @ChineseName("瓦斯（煤尘）爆炸")
    private String explosionAccident;
    @ChineseName("火灾")
    private String fireAccident;
    @ChineseName("水灾")
    private String waterAccident;
    @ChineseName("瓦斯突出")
    private String gasAccident;
    @ChineseName("其他（注明事故类型）")
    private String otherAccident;
    
    @ChineseName("主风机型号,台数")
    @MultiLineField
    private String zfjEquip;
    @ChineseName("局扇型号,台数")
    @MultiLineField
    private String jsEquip;
    @ChineseName("主排水泵型号,台数")
    @MultiLineField
    private String zpsbEquip;
    @ChineseName("探放水设备型号,台数")
    @MultiLineField
    private String tfsEquip;
    @ChineseName("绞车提升设备型号,台数")
    @MultiLineField
    private String jctsEquip;
    @ChineseName("带式输送机型号,部数")
    @MultiLineField
    private String dsssjEquip; 
    @ChineseName("瓦斯抽放系统型号,数量")
    @MultiLineField
    private String wscfEquip;
    @ChineseName("安全监测系统型号,数量")
    @MultiLineField
    private String aqjcEquip;
    @ChineseName("传感器使用数量")
    private String sensorNum;
    @ChineseName("闭锁断电装置型号,数量")
    @MultiLineField
    private String bsdjEquip;
    @ChineseName("瓦检仪型号,数量")
    @MultiLineField
    private String wjyEquip;
    @ChineseName("自救器型号,数量")
    @MultiLineField
    private String zjqEquip;
    @ChineseName("井下固定敷设高压电缆型号,数量")
    @MultiLineField
    private String jxgydlEquip;
    @ChineseName("瓦检员人数")
    private String inspectorNum;
    @ChineseName("放炮员人数")
    private String blasterNum;
    @ChineseName("绞车司机人数")
    private String driverNum;
    @ChineseName("电工人数")
    private String electricianNum;
    @ChineseName("安技管理人员数")
    private String safeManageManNum;
    @ChineseName("安全员人数")
    private String safeManNum;
    /**
     * 下面三个是
     * 全矿技术人员数
     */
    @ChineseName("高级")
    private String highLevelNum;
    @ChineseName("中级")
    private String middleLevelNum;
    @ChineseName("初级")
    private String lowLevelNum;
    
    @ChineseName("下井同时作业人数")
    private String undergroundWorkerNum;
    @ChineseName("下井人员中农民工、协议工、外包工所占比例")
    private String peasantPercent;
    @ChineseName("影响矿井安全生产的主要问题说明（不少于三条内容）")
    @MultiLineField
    private String mainDesc;
    @ChineseName("备注")
    @MultiLineField
    private String remark;
    
    @ChineseName("填表人")
    private String saveMan;
    @ChineseName("联系电话")
    private String contactPhone;
    @ChineseName("填表日期")
    private String saveTime;
    
    public String getCorpName() {
        return corpName;
    }
    public void setCorpName(String corpName) {
        this.corpName = corpName;
    }
    public String getDwdm() {
        return dwdm;
    }
    public void setDwdm(String dwdm) {
        this.dwdm = dwdm;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getAddress() {
        return address;
    }
    public void setAddress(String address) {
        this.address = address;
    }
    public String getPostcode() {
        return postcode;
    }
    public void setPostcode(String postcode) {
        this.postcode = postcode;
    }
    public String getChargePerson() {
        return chargePerson;
    }
    public void setChargePerson(String chargePerson) {
        this.chargePerson = chargePerson;
    }
    public String getChargePersonPhone() {
        return chargePersonPhone;
    }
    public void setChargePersonPhone(String chargePersonPhone) {
        this.chargePersonPhone = chargePersonPhone;
    }
    public String getLegalCompany() {
        return legalCompany;
    }
    public void setLegalCompany(String legalCompany) {
        this.legalCompany = legalCompany;
    }
    public String getBulidDate() {
        return bulidDate;
    }
    public void setBulidDate(String bulidDate) {
        this.bulidDate = bulidDate;
    }
    public String getDesignAblity() {
        return designAblity;
    }
    public void setDesignAblity(String designAblity) {
        this.designAblity = designAblity;
    }
    public String getRealOutput() {
        return realOutput;
    }
    public void setRealOutput(String realOutput) {
        this.realOutput = realOutput;
    }
    public String getBrand() {
        return brand;
    }
    public void setBrand(String brand) {
        this.brand = brand;
    }
    public String getWorkPersonNum() {
        return workPersonNum;
    }
    public void setWorkPersonNum(String workPersonNum) {
        this.workPersonNum = workPersonNum;
    }
    public String getFixedAssets() {
        return fixedAssets;
    }
    public void setFixedAssets(String fixedAssets) {
        this.fixedAssets = fixedAssets;
    }
    public String getYearProfit() {
        return yearProfit;
    }
    public void setYearProfit(String yearProfit) {
        this.yearProfit = yearProfit;
    }
    public String getKtStyle() {
        return ktStyle;
    }
    public void setKtStyle(String ktStyle) {
        this.ktStyle = ktStyle;
    }
    public String getTfStyle() {
        return tfStyle;
    }
    public void setTfStyle(String tfStyle) {
        this.tfStyle = tfStyle;
    }
    public String getFfStyle() {
        return ffStyle;
    }
    public void setFfStyle(String ffStyle) {
        this.ffStyle = ffStyle;
    }
    public String getTsStyle() {
        return tsStyle;
    }
    public void setTsStyle(String tsStyle) {
        this.tsStyle = tsStyle;
    }
    public String getGdStyle() {
        return gdStyle;
    }
    public void setGdStyle(String gdStyle) {
        this.gdStyle = gdStyle;
    }
    public String getZcmcqj() {
        return zcmcqj;
    }
    public void setZcmcqj(String zcmcqj) {
        this.zcmcqj = zcmcqj;
    }
    public String getZcmchd() {
        return zcmchd;
    }
    public void setZcmchd(String zcmchd) {
        this.zcmchd = zcmchd;
    }
    public String getKjkcsd() {
        return kjkcsd;
    }
    public void setKjkcsd(String kjkcsd) {
        this.kjkcsd = kjkcsd;
    }
    public String getSccqgs() {
        return sccqgs;
    }
    public void setSccqgs(String sccqgs) {
        this.sccqgs = sccqgs;
    }
    public String getHcgzmgs() {
        return hcgzmgs;
    }
    public void setHcgzmgs(String hcgzmgs) {
        this.hcgzmgs = hcgzmgs;
    }
    public String getJjgzmgs() {
        return jjgzmgs;
    }
    public void setJjgzmgs(String jjgzmgs) {
        this.jjgzmgs = jjgzmgs;
    }
    public String getGzmhcStyle() {
        return gzmhcStyle;
    }
    public void setGzmhcStyle(String gzmhcStyle) {
        this.gzmhcStyle = gzmhcStyle;
    }
    public String getHeight() {
        return height;
    }
    public void setHeight(String height) {
        this.height = height;
    }
    public String getZylmStyle() {
        return zylmStyle;
    }
    public void setZylmStyle(String zylmStyle) {
        this.zylmStyle = zylmStyle;
    }
    public String getZyzhStyle() {
        return zyzhStyle;
    }
    public void setZyzhStyle(String zyzhStyle) {
        this.zyzhStyle = zyzhStyle;
    }
    public String getDbclStyle() {
        return dbclStyle;
    }
    public void setDbclStyle(String dbclStyle) {
        this.dbclStyle = dbclStyle;
    }
    public String getGasLevel() {
        return gasLevel;
    }
    public void setGasLevel(String gasLevel) {
        this.gasLevel = gasLevel;
    }
    public String getPyrophorisity() {
        return pyrophorisity;
    }
    public void setPyrophorisity(String pyrophorisity) {
        this.pyrophorisity = pyrophorisity;
    }
    public String getExplosivity() {
        return explosivity;
    }
    public void setExplosivity(String explosivity) {
        this.explosivity = explosivity;
    }
    public String getContainWater() {
        return containWater;
    }
    public void setContainWater(String containWater) {
        this.containWater = containWater;
    }
    public String getComplexDegree() {
        return complexDegree;
    }
    public void setComplexDegree(String complexDegree) {
        this.complexDegree = complexDegree;
    }
    public String getWaterThreat() {
        return waterThreat;
    }
    public void setWaterThreat(String waterThreat) {
        this.waterThreat = waterThreat;
    }
    public String getHarmDegree() {
        return harmDegree;
    }
    public void setHarmDegree(String harmDegree) {
        this.harmDegree = harmDegree;
    }
    public String getCoalOcurrence() {
        return coalOcurrence;
    }
    public void setCoalOcurrence(String coalOcurrence) {
        this.coalOcurrence = coalOcurrence;
    }
    public String getStability() {
        return stability;
    }
    public void setStability(String stability) {
        this.stability = stability;
    }
    public String getRelativeComingAmount() {
        return relativeComingAmount;
    }
    public void setRelativeComingAmount(String relativeComingAmount) {
        this.relativeComingAmount = relativeComingAmount;
    }
    public String getAbsoluteComingAmount() {
        return absoluteComingAmount;
    }
    public void setAbsoluteComingAmount(String absoluteComingAmount) {
        this.absoluteComingAmount = absoluteComingAmount;
    }
    public String getPyrophorisityPeriod() {
        return pyrophorisityPeriod;
    }
    public void setPyrophorisityPeriod(String pyrophorisityPeriod) {
        this.pyrophorisityPeriod = pyrophorisityPeriod;
    }
    public String getRecentMonthGasOverTime() {
        return recentMonthGasOverTime;
    }
    public void setRecentMonthGasOverTime(String recentMonthGasOverTime) {
        this.recentMonthGasOverTime = recentMonthGasOverTime;
    }
    public String getRecentYearGasOverTime() {
        return recentYearGasOverTime;
    }
    public void setRecentYearGasOverTime(String recentYearGasOverTime) {
        this.recentYearGasOverTime = recentYearGasOverTime;
    }
    public String getRecentCoalPyrophorisityTime() {
        return recentCoalPyrophorisityTime;
    }
    public void setRecentCoalPyrophorisityTime(String recentCoalPyrophorisityTime) {
        this.recentCoalPyrophorisityTime = recentCoalPyrophorisityTime;
    }
    public String getRecentRepairTime() {
        return recentRepairTime;
    }
    public void setRecentRepairTime(String recentRepairTime) {
        this.recentRepairTime = recentRepairTime;
    }
    public String getRecentElecRepairTime() {
        return recentElecRepairTime;
    }
    public void setRecentElecRepairTime(String recentElecRepairTime) {
        this.recentElecRepairTime = recentElecRepairTime;
    }
    public String getTotalDust() {
        return totalDust;
    }
    public void setTotalDust(String totalDust) {
        this.totalDust = totalDust;
    }
    public String getBreathDust() {
        return breathDust;
    }
    public void setBreathDust(String breathDust) {
        this.breathDust = breathDust;
    }
    public String getTotalIntakeAmount() {
        return totalIntakeAmount;
    }
    public void setTotalIntakeAmount(String totalIntakeAmount) {
        this.totalIntakeAmount = totalIntakeAmount;
    }
    public String getEffectIntakeAmount() {
        return effectIntakeAmount;
    }
    public void setEffectIntakeAmount(String effectIntakeAmount) {
        this.effectIntakeAmount = effectIntakeAmount;
    }
    public String getWaterInMAX() {
        return WaterInMAX;
    }
    public void setWaterInMAX(String waterInMAX) {
        WaterInMAX = waterInMAX;
    }
    public String getWaterOutMAX() {
        return WaterOutMAX;
    }
    public void setWaterOutMAX(String waterOutMAX) {
        WaterOutMAX = waterOutMAX;
    }
    public String getPoolVolumn() {
        return poolVolumn;
    }
    public void setPoolVolumn(String poolVolumn) {
        this.poolVolumn = poolVolumn;
    }
    public String getPipeLength() {
        return pipeLength;
    }
    public void setPipeLength(String pipeLength) {
        this.pipeLength = pipeLength;
    }
    
    public String getGroundRoom() {
        return groundRoom;
    }
    public void setGroundRoom(String groundRoom) {
        this.groundRoom = groundRoom;
    }
    public String getGroundExplosion() {
        return groundExplosion;
    }
    public void setGroundExplosion(String groundExplosion) {
        this.groundExplosion = groundExplosion;
    }
    public String getGroundPrimer() {
        return groundPrimer;
    }
    public void setGroundPrimer(String groundPrimer) {
        this.groundPrimer = groundPrimer;
    }
    public String getUndergroundRoom() {
        return undergroundRoom;
    }
    public void setUndergroundRoom(String undergroundRoom) {
        this.undergroundRoom = undergroundRoom;
    }
    public String getUndergroundExplosion() {
        return undergroundExplosion;
    }
    public void setUndergroundExplosion(String undergroundExplosion) {
        this.undergroundExplosion = undergroundExplosion;
    }
    public String getUndergroundPrimer() {
        return undergroundPrimer;
    }
    public void setUndergroundPrimer(String undergroundPrimer) {
        this.undergroundPrimer = undergroundPrimer;
    }
    public String getHasGasOutArea() {
        return hasGasOutArea;
    }
    public void setHasGasOutArea(String hasGasOutArea) {
        this.hasGasOutArea = hasGasOutArea;
    }
    public String getHasUndeadFire() {
        return hasUndeadFire;
    }
    public void setHasUndeadFire(String hasUndeadFire) {
        this.hasUndeadFire = hasUndeadFire;
    }
    public String getWindComplex() {
        return windComplex;
    }
    public void setWindComplex(String windComplex) {
        this.windComplex = windComplex;
    }
    public String getTotalStreetAmount() {
        return totalStreetAmount;
    }
    public void setTotalStreetAmount(String totalStreetAmount) {
        this.totalStreetAmount = totalStreetAmount;
    }
    public String getTotalHardDegree() {
        return totalHardDegree;
    }
    public void setTotalHardDegree(String totalHardDegree) {
        this.totalHardDegree = totalHardDegree;
    }
    public String getHasUnderWaterWork() {
        return hasUnderWaterWork;
    }
    public void setHasUnderWaterWork(String hasUnderWaterWork) {
        this.hasUnderWaterWork = hasUnderWaterWork;
    }
    public String getIsUnderBulidingWork() {
        return isUnderBulidingWork;
    }
    public void setIsUnderBulidingWork(String isUnderBulidingWork) {
        this.isUnderBulidingWork = isUnderBulidingWork;
    }
    public String getIsEffected() {
        return isEffected;
    }
    public void setIsEffected(String isEffected) {
        this.isEffected = isEffected;
    }
    public String getDeadWoundNum() {
        return deadWoundNum;
    }
    public void setDeadWoundNum(String deadWoundNum) {
        this.deadWoundNum = deadWoundNum;
    }
    public String getSlightWoundNum() {
        return slightWoundNum;
    }
    public void setSlightWoundNum(String slightWoundNum) {
        this.slightWoundNum = slightWoundNum;
    }
    public String getBadWoundNum() {
        return badWoundNum;
    }
    public void setBadWoundNum(String badWoundNum) {
        this.badWoundNum = badWoundNum;
    }
    public String getDeadNum() {
        return deadNum;
    }
    public void setDeadNum(String deadNum) {
        this.deadNum = deadNum;
    }
    public String getExplosionAccident() {
        return explosionAccident;
    }
    public void setExplosionAccident(String explosionAccident) {
        this.explosionAccident = explosionAccident;
    }
    public String getFireAccident() {
        return fireAccident;
    }
    public void setFireAccident(String fireAccident) {
        this.fireAccident = fireAccident;
    }
    public String getWaterAccident() {
        return waterAccident;
    }
    public void setWaterAccident(String waterAccident) {
        this.waterAccident = waterAccident;
    }
    public String getGasAccident() {
        return gasAccident;
    }
    public void setGasAccident(String gasAccident) {
        this.gasAccident = gasAccident;
    }
    public String getOtherAccident() {
        return otherAccident;
    }
    public void setOtherAccident(String otherAccident) {
        this.otherAccident = otherAccident;
    }
    public String getZfjEquip() {
        return zfjEquip;
    }
    public void setZfjEquip(String zfjEquip) {
        this.zfjEquip = zfjEquip;
    }
    public String getJsEquip() {
        return jsEquip;
    }
    public void setJsEquip(String jsEquip) {
        this.jsEquip = jsEquip;
    }
    public String getZpsbEquip() {
        return zpsbEquip;
    }
    public void setZpsbEquip(String zpsbEquip) {
        this.zpsbEquip = zpsbEquip;
    }
    public String getTfsEquip() {
        return tfsEquip;
    }
    public void setTfsEquip(String tfsEquip) {
        this.tfsEquip = tfsEquip;
    }
    public String getJctsEquip() {
        return jctsEquip;
    }
    public void setJctsEquip(String jctsEquip) {
        this.jctsEquip = jctsEquip;
    }
    public String getDsssjEquip() {
        return dsssjEquip;
    }
    public void setDsssjEquip(String dsssjEquip) {
        this.dsssjEquip = dsssjEquip;
    }
    public String getWscfEquip() {
        return wscfEquip;
    }
    public void setWscfEquip(String wscfEquip) {
        this.wscfEquip = wscfEquip;
    }
    public String getAqjcEquip() {
        return aqjcEquip;
    }
    public void setAqjcEquip(String aqjcEquip) {
        this.aqjcEquip = aqjcEquip;
    }
    public String getSensorNum() {
        return sensorNum;
    }
    public void setSensorNum(String sensorNum) {
        this.sensorNum = sensorNum;
    }
    public String getBsdjEquip() {
        return bsdjEquip;
    }
    public void setBsdjEquip(String bsdjEquip) {
        this.bsdjEquip = bsdjEquip;
    }
    public String getWjyEquip() {
        return wjyEquip;
    }
    public void setWjyEquip(String wjyEquip) {
        this.wjyEquip = wjyEquip;
    }
    public String getZjqEquip() {
        return zjqEquip;
    }
    public void setZjqEquip(String zjqEquip) {
        this.zjqEquip = zjqEquip;
    }
    public String getJxgydlEquip() {
        return jxgydlEquip;
    }
    public void setJxgydlEquip(String jxgydlEquip) {
        this.jxgydlEquip = jxgydlEquip;
    }
    public String getInspectorNum() {
        return inspectorNum;
    }
    public void setInspectorNum(String inspectorNum) {
        this.inspectorNum = inspectorNum;
    }
    public String getBlasterNum() {
        return blasterNum;
    }
    public void setBlasterNum(String blasterNum) {
        this.blasterNum = blasterNum;
    }
    public String getDriverNum() {
        return driverNum;
    }
    public void setDriverNum(String driverNum) {
        this.driverNum = driverNum;
    }
    public String getElectricianNum() {
        return electricianNum;
    }
    public void setElectricianNum(String electricianNum) {
        this.electricianNum = electricianNum;
    }
    public String getSafeManageManNum() {
        return safeManageManNum;
    }
    public void setSafeManageManNum(String safeManageManNum) {
        this.safeManageManNum = safeManageManNum;
    }
    public String getSafeManNum() {
        return safeManNum;
    }
    public void setSafeManNum(String safeManNum) {
        this.safeManNum = safeManNum;
    }
    public String getHighLevelNum() {
        return highLevelNum;
    }
    public void setHighLevelNum(String highLevelNum) {
        this.highLevelNum = highLevelNum;
    }
    public String getMiddleLevelNum() {
        return middleLevelNum;
    }
    public void setMiddleLevelNum(String middleLevelNum) {
        this.middleLevelNum = middleLevelNum;
    }
    public String getLowLevelNum() {
        return lowLevelNum;
    }
    public void setLowLevelNum(String lowLevelNum) {
        this.lowLevelNum = lowLevelNum;
    }
    public String getUndergroundWorkerNum() {
        return undergroundWorkerNum;
    }
    public void setUndergroundWorkerNum(String undergroundWorkerNum) {
        this.undergroundWorkerNum = undergroundWorkerNum;
    }
    public String getPeasantPercent() {
        return peasantPercent;
    }
    public void setPeasantPercent(String peasantPercent) {
        this.peasantPercent = peasantPercent;
    }
    public String getMainDesc() {
        return mainDesc;
    }
    public void setMainDesc(String mainDesc) {
        this.mainDesc = mainDesc;
    }
    public String getRemark() {
        return remark;
    }
    public void setRemark(String remark) {
        this.remark = remark;
    }
    public String getSaveMan() {
        return saveMan;
    }
    public void setSaveMan(String saveMan) {
        this.saveMan = saveMan;
    }
    public String getContactPhone() {
        return contactPhone;
    }
    public void setContactPhone(String contactPhone) {
        this.contactPhone = contactPhone;
    }
    public String getSaveTime() {
        return saveTime;
    }
    public void setSaveTime(String saveTime) {
        this.saveTime = saveTime;
    }
    @Override
    public HazardsType getHazardsType() {
	return HazardsType.colliery;
    }
    
    
    
}

