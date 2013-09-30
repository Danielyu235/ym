package com.ay.hazards.tailingspond.pojo;

import com.ay.framework.annotation.ChineseName;
import com.ay.framework.annotation.MultiLineField;
import com.ay.framework.annotation.PersistenceIgnore;
import com.ay.framework.core.pojo.MapPojo;
import com.ay.framework.core.pojo.MapType;
import com.ay.hazards.identification.HazardsType;
import com.ay.hazards.identification.IHazards;

/**
 * 重大危险源尾矿库
 * @author yuzhou
 *  2013-04-11
 */
//@ChineseName("尾矿库")
public class TailingspondHazards extends MapPojo implements IHazards { 
	
	@Override
	public MapType getMapType() {
		// TODO Auto-generated method stub
		return MapType.tailingspond;
	}
	@ChineseName("企业名称")
    private String qymc;
	@PersistenceIgnore
	private String corpName;
	@ChineseName("主要负责人")
    private String zyfzr;
	@ChineseName("详细地址")
    private String xxdz;
	@ChineseName("联系电话")
    private String lxdh;
	@ChineseName("上级主管")
    private String sjzg;
	@ChineseName("邮政编码")
    private String yzbm;
	@ChineseName("建长日期")
    private String jcrq;
	@ChineseName("从业人数")
    private String cyrs;
	@ChineseName("经济类型")
    private String jjlx;
	@ChineseName("矿种")
    private String kz;
    @ChineseName("固定资产（万元）")
    private String kdzc;
    @ChineseName("年利润（万元）")
    private String nlr;
    @ChineseName("尾矿库名称")
    private String wkkmc;
    @ChineseName("地理位置")
    private String dlwz;
    @ChineseName("尾矿库型式")
    private String wkkxs;
    @ChineseName("尾矿库型式  其它")
    private String wkkxsqt;
    @ChineseName("尾矿库等别")
    private String wkkdb;
    @ChineseName("全库容（万m³）")
    private String qkr;
    @ChineseName("坝高（m）")
    private String bg;
    @ChineseName("设计总库容（万m³）")
    private String sjzkr;
    @ChineseName("设计总坝高")
    private String sjzbg;
    @ChineseName("坝长（m）")
    private String bc;
    @ChineseName("最小干滩度（m）")
    private String zxgtcd;
    @ChineseName("沉积干滩平均坡度（m）")
    private String cjgtpjpd;
    @ChineseName("尾矿库危害程度分类")
    private String wkkwhcdfl;
    @ChineseName("尾矿库安全度分类")
    private String wkkaqdfl;
    @ChineseName("如果尾矿库失事是否会使下游重要城镇、工矿企业、重要铁路干线遭受严重灾害")
    private String sfyzwh;
    @ChineseName("坝址区地震基本烈度")
    private String jbld;
    @ChineseName("库区有无滑坡体")
    private String ywhpt;
    @ChineseName("库区有无产生泥石流的条件")
    private String ywnsl;
    @ChineseName("库区是否处于岩溶或裂隙发育地区")
    private String fydq;
    @ChineseName("库区有无滥伐、滥垦、滥牧现象")
    private String ywlf;
    @ChineseName("坝型")
    private String bx;
    @ChineseName("坝高（m）")
    private String cqbg;
    @ChineseName("坝长（m）")
    private String cqbc;
    @ChineseName("堆坝方法")
    private String dbff;
    @ChineseName("堆高（m）")
    private String dg;
    @ChineseName("尾矿分级设备型号")
    private String wkfjsbxh;
    @ChineseName("数量")
    private String sl;
    @ChineseName("汇水面积（km²）")
    private String hsmj;
    @ChineseName("初期（年）")
    private String cq;
    @ChineseName("中、后期（年）")
    private String zhq;
    @ChineseName("尾矿坝安全超高")
    private String wkbaqcg;
    @ChineseName("尾矿库调洪库容（万m³）")
    private String wkkdhkr;
    @ChineseName("排洪系统的型式")
    private String phxtdxs;
    @ChineseName("尾矿粒度d（mm）")
    private String wkld;
    @ChineseName("尾矿比重	（t/m3）")
    private String wkbz;
    @ChineseName("尾矿坝的观测项目")
    private String wkkdgcxm;
    @ChineseName("尾矿库的尾矿浓缩分级、放矿筑坝、回水排水、防汛渡汛、抗震等工作概述")
    @MultiLineField
    private String wkkgs;
    @ChineseName("如果是危库、险库或病库,对危险情况作出概述")
    @MultiLineField
    private String wkxkbkgs;
    @ChineseName("尾矿库曾出现的问题及采取的解决办法")
    @MultiLineField
    private String jjff;
    @ChineseName("备注")
    @MultiLineField
    private String bz;
    @ChineseName("填表人")
    private String tbr;
    @ChineseName("填表人联系电话")
    private String tbrlxdh;
    @ChineseName("填表日期")
    private String tbrq;
    
    
    public String getWkkxsqt() {
		return wkkxsqt;
	}
	public void setWkkxsqt(String wkkxsqt) {
		this.wkkxsqt = wkkxsqt;
	}
	public String getCorpName() {
		return corpName;
	}
	public void setCorpName(String corpName) {
		this.corpName = corpName;
	}
	public void setQymc(String qymc){
    	this.qymc=qymc;
    }
    public String getQymc(){
    	return	this.qymc;
    }
    public void setZyfzr(String zyfzr){
    	this.zyfzr=zyfzr;
    }
    public String getZyfzr(){
    	return	this.zyfzr;
    }
    public void setXxdz(String xxdz){
    	this.xxdz=xxdz;
    }
    public String getXxdz(){
    	return	this.xxdz;
    }
    public void setLxdh(String lxdh){
    	this.lxdh=lxdh;
    }
    public String getLxdh(){
    	return	this.lxdh;
    }
    public void setSjzg(String sjzg){
    	this.sjzg=sjzg;
    }
    public String getSjzg(){
    	return	this.sjzg;
    }
    public void setYzbm(String yzbm){
    	this.yzbm=yzbm;
    }
    public String getYzbm(){
    	return	this.yzbm;
    }
    public void setJcrq(String jcrq){
    	this.jcrq=jcrq;
    }
    public String getJcrq(){
    	return	this.jcrq;
    }
    public void setCyrs(String cyrs){
    	this.cyrs=cyrs;
    }
    public String getCyrs(){
    	return	this.cyrs;
    }
    public void setJjlx(String jjlx){
    	this.jjlx=jjlx;
    }
    public String getJjlx(){
    	return	this.jjlx;
    }
    public void setKz(String kz){
    	this.kz=kz;
    }
    public String getKz(){
    	return	this.kz;
    }
    public void setKdzc(String kdzc){
    	this.kdzc=kdzc;
    }
    public String getKdzc(){
    	return	this.kdzc;
    }
    public void setNlr(String nlr){
    	this.nlr=nlr;
    }
    public String getNlr(){
    	return	this.nlr;
    }
    public void setWkkmc(String wkkmc){
    	this.wkkmc=wkkmc;
    }
    public String getWkkmc(){
    	return	this.wkkmc;
    }
   
    public String getDlwz() {
		return dlwz;
	}
	public void setDlwz(String dlwz) {
		this.dlwz = dlwz;
	}
	public void setWkkxs(String wkkxs){
    	this.wkkxs=wkkxs;
    }
    public String getWkkxs(){
    	return	this.wkkxs;
    }
    public void setWkkdb(String wkkdb){
    	this.wkkdb=wkkdb;
    }
    public String getWkkdb(){
    	return	this.wkkdb;
    }
    public void setQkr(String qkr){
    	this.qkr=qkr;
    }
    public String getQkr(){
    	return	this.qkr;
    }
    public void setBg(String bg){
    	this.bg=bg;
    }
    public String getBg(){
    	return	this.bg;
    }
    public void setSjzkr(String sjzkr){
    	this.sjzkr=sjzkr;
    }
    public String getSjzkr(){
    	return	this.sjzkr;
    }
    public void setSjzbg(String sjzbg){
    	this.sjzbg=sjzbg;
    }
    public String getSjzbg(){
    	return	this.sjzbg;
    }
    public void setBc(String bc){
    	this.bc=bc;
    }
    public String getBc(){
    	return	this.bc;
    }
    public void setZxgtcd(String zxgtcd){
    	this.zxgtcd=zxgtcd;
    }
    public String getZxgtcd(){
    	return	this.zxgtcd;
    }
    public void setCjgtpjpd(String cjgtpjpd){
    	this.cjgtpjpd=cjgtpjpd;
    }
    public String getCjgtpjpd(){
    	return	this.cjgtpjpd;
    }
    public void setWkkwhcdfl(String wkkwhcdfl){
    	this.wkkwhcdfl=wkkwhcdfl;
    }
    public String getWkkwhcdfl(){
    	return	this.wkkwhcdfl;
    }
    public void setWkkaqdfl(String wkkaqdfl){
    	this.wkkaqdfl=wkkaqdfl;
    }
    public String getWkkaqdfl(){
    	return	this.wkkaqdfl;
    }
    public void setSfyzwh(String sfyzwh){
    	this.sfyzwh=sfyzwh;
    }
    public String getSfyzwh(){
    	return	this.sfyzwh;
    }
    public void setJbld(String jbld){
    	this.jbld=jbld;
    }
    public String getJbld(){
    	return	this.jbld;
    }
    public void setYwhpt(String ywhpt){
    	this.ywhpt=ywhpt;
    }
    public String getYwhpt(){
    	return	this.ywhpt;
    }
    public void setYwnsl(String ywnsl){
    	this.ywnsl=ywnsl;
    }
    public String getYwnsl(){
    	return	this.ywnsl;
    }
    public void setFydq(String fydq){
    	this.fydq=fydq;
    }
    public String getFydq(){
    	return	this.fydq;
    }
    public void setYwlf(String ywlf){
    	this.ywlf=ywlf;
    }
    public String getYwlf(){
    	return	this.ywlf;
    }
    public void setBx(String bx){
    	this.bx=bx;
    }
    public String getBx(){
    	return	this.bx;
    }
    public void setCqbg(String cqbg){
    	this.cqbg=cqbg;
    }
    public String getCqbg(){
    	return	this.cqbg;
    }
    public void setCqbc(String cqbc){
    	this.cqbc=cqbc;
    }
    public String getCqbc(){
    	return	this.cqbc;
    }
    public void setDbff(String dbff){
    	this.dbff=dbff;
    }
    public String getDbff(){
    	return	this.dbff;
    }
    public void setDg(String dg){
    	this.dg=dg;
    }
    public String getDg(){
    	return	this.dg;
    }
    public void setWkfjsbxh(String wkfjsbxh){
    	this.wkfjsbxh=wkfjsbxh;
    }
    public String getWkfjsbxh(){
    	return	this.wkfjsbxh;
    }
    public void setSl(String sl){
    	this.sl=sl;
    }
    public String getSl(){
    	return	this.sl;
    }
    public void setHsmj(String hsmj){
    	this.hsmj=hsmj;
    }
    public String getHsmj(){
    	return	this.hsmj;
    }
    public void setCq(String cq){
    	this.cq=cq;
    }
    public String getCq(){
    	return	this.cq;
    }
    public void setZhq(String zhq){
    	this.zhq=zhq;
    }
    public String getZhq(){
    	return	this.zhq;
    }
    public void setWkbaqcg(String wkbaqcg){
    	this.wkbaqcg=wkbaqcg;
    }
    public String getWkbaqcg(){
    	return	this.wkbaqcg;
    }
    public void setWkkdhkr(String wkkdhkr){
    	this.wkkdhkr=wkkdhkr;
    }
    public String getWkkdhkr(){
    	return	this.wkkdhkr;
    }
    public void setPhxtdxs(String phxtdxs){
    	this.phxtdxs=phxtdxs;
    }
    public String getPhxtdxs(){
    	return	this.phxtdxs;
    }
    public void setWkld(String wkld){
    	this.wkld=wkld;
    }
    public String getWkld(){
    	return	this.wkld;
    }
    public void setWkbz(String wkbz){
    	this.wkbz=wkbz;
    }
    public String getWkbz(){
    	return	this.wkbz;
    }
    public void setWkkdgcxm(String wkkdgcxm){
    	this.wkkdgcxm=wkkdgcxm;
    }
    public String getWkkdgcxm(){
    	return	this.wkkdgcxm;
    }
    public void setWkkgs(String wkkgs){
    	this.wkkgs=wkkgs;
    }
    public String getWkkgs(){
    	return	this.wkkgs;
    }
    public void setWkxkbkgs(String wkxkbkgs){
    	this.wkxkbkgs=wkxkbkgs;
    }
    public String getWkxkbkgs(){
    	return	this.wkxkbkgs;
    }
    public void setJjff(String jjff){
    	this.jjff=jjff;
    }
    public String getJjff(){
    	return	this.jjff;
    }
    public void setBz(String bz){
    	this.bz=bz;
    }
    public String getBz(){
    	return	this.bz;
    }
    public void setTbr(String tbr){
    	this.tbr=tbr;
    }
    public String getTbr(){
    	return	this.tbr;
    }
    public void setTbrlxdh(String tbrlxdh){
    	this.tbrlxdh=tbrlxdh;
    }
    public String getTbrlxdh(){
    	return	this.tbrlxdh;
    }
    public void setTbrq(String tbrq){
    	this.tbrq=tbrq;
    }
    public String getTbrq(){
    	return	this.tbrq;
    }
    @Override
    public HazardsType getHazardsType() {
	return HazardsType.tailingspond;
    }

}