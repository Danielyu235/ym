package com.ay.knowlbase.msds.pojo;

import com.ay.framework.core.pojo.BasePojo;

/**
 * 危化品特征库
 * @author yuzhou
 * @version 2013年3月18日 
 */
public class MsdsKnowlbase extends BasePojo  { 
    /**中文名*/
    private String zwm;
    /**英文名*/
    private String ywm;
    /**分子式*/
    private String fzs;
    /**分子量*/
    private String fzl;
    /**CAS号*/
    private String cas;
    /**RTECS号*/
    private String rtecs;
    /**UN编号*/
    private String un;
    /**危险货物编号*/
    private String wxhwbh;
    /**IMDG规则页码*/
    private String imdg;
    /**外观与形状*/
    private String wgyxz;
    /**主要用途*/
    private String zyyt;
    /**熔点*/
    private String rd;
    /**沸点*/
    private String fd;
    /**相对密度水*/
    private String xdmds;
    /**相对密度空气*/
    private String xdmdkq;
    /**饱和蒸汽水*/
    private String bhzqs;
    /**溶解性*/
    private String rjx;
    /**燃烧性*/
    private String rsx;
    /**监规火险分级*/
    private String jghxfj;
    /**闪点*/
    private String sd;
    /**自然温度*/
    private String zrwd;
    /**爆炸下限*/
    private String bzxx;
    /**爆炸上限*/
    private String bzsx;
    /**危险特性*/
    private String wxtx;
    /**燃烧分解产物*/
    private String wxfjch;
    /**稳定性*/
    private String wdx;
    /**聚合危害*/
    private String jhwh;
    /**禁忌物*/
    private String jjw;
    /**灭火方法*/
    private String mhff;
    /**危险性类别*/
    private String wxxlb;
    /**危险货物包装标志*/
    private String wxhwbzbz;
    /**包装类别*/
    private String bzlb;
    /**储运注意事项*/
    private String cyzysx;
    /**接触限值*/
    private String jcxz;
    /**侵入途径*/
    private String qrtj;
    /**毒性*/
    private String dx;
    /**健康危害*/
    private String jkwh;
    /**皮肤接触*/
    private String pfjc;
    /**眼镜接触*/
    private String yjjc;
    /**吸入*/
    private String xr;
    /**食入*/
    private String sr;
    /**工程控制*/
    private String gckz;
    /**呼吸系统保护*/
    private String hxxtbh;
    /**眼镜保护*/
    private String yjbh;
    /**防护服*/
    private String fhf;
    /**手防护*/
    private String sfh;
    /**临界温度*/
    private String ljwd;
    /**临界压力*/
    private String ljyl;
    /**燃烧热*/
    private String rsr;
    /**避免接触的条件*/
    private String bmjctj;
    /**泄漏处置*/
    private String xlcz;
    /**其他*/
    private String qt;
    /**num*/
    private String num;
    /**少量泄漏隔离半径*/
    private String slxlglbj;
    /**少量泄漏白天疏散半径*/
    private String slxlbtssbj;
    /**少量泄漏夜间疏散半径*/
    private String slxlyjssbj;
    /**大量泄漏隔离半径*/
    private String dlxlglbj;
    /**大量泄漏白天疏散半径*/
    private String dlxlbtssbj;
    /**大量泄漏夜间疏散半径*/
    private String dlxlyjssbj;
    /**zcljl*/
    private String zcljl;
    /**scljl*/
    private String scljl;

    public void setZwm(String zwm){
    	this.zwm=zwm;
    }
    public String getZwm(){
    	return	this.zwm;
    }
    public void setYwm(String ywm){
    	this.ywm=ywm;
    }
    public String getYwm(){
    	return	this.ywm;
    }
    public void setFzs(String fzs){
    	this.fzs=fzs;
    }
    public String getFzs(){
    	return	this.fzs;
    }
    public void setFzl(String fzl){
    	this.fzl=fzl;
    }
    public String getFzl(){
    	return	this.fzl;
    }
    public void setCas(String cas){
    	this.cas=cas;
    }
    public String getCas(){
    	return	this.cas;
    }
    public void setRtecs(String rtecs){
    	this.rtecs=rtecs;
    }
    public String getRtecs(){
    	return	this.rtecs;
    }
    public void setUn(String un){
    	this.un=un;
    }
    public String getUn(){
    	return this.un=un;
    }
    public void setWxhwbh(String wxhwbh){
    	this.wxhwbh=wxhwbh;
    }
    public String getWxhwbh(){
    	return	this.wxhwbh;
    }
    public void setImdg(String imdg){
    	this.imdg=imdg;
    }
    public String getImdg(){
    	return	this.imdg;
    }
    public void setWgyxz(String wgyxz){
    	this.wgyxz=wgyxz;
    }
    public String getWgyxz(){
    	return	this.wgyxz;
    }
    public void setZyyt(String zyyt){
    	this.zyyt=zyyt;
    }
    public String getZyyt(){
    	return	this.zyyt;
    }
    public void setRd(String rd){
    	this.rd=rd;
    }
    public String getRd(){
    	return	this.rd;
    }
    public void setFd(String fd){
    	this.fd=fd;
    }
    public String getFd(){
    	return	this.fd;
    }
    public void setXdmds(String xdmds){
    	this.xdmds=xdmds;
    }
    public String getXdmds(){
    	return	this.xdmds;
    }
    public void setXdmdkq(String xdmdkq){
    	this.xdmdkq=xdmdkq;
    }
    public String getXdmdkq(){
    	return	this.xdmdkq;
    }
    public void setBhzqs(String bhzqs){
    	this.bhzqs=bhzqs;
    }
    public String getBhzqs(){
    	return	this.bhzqs;
    }
    public void setRjx(String rjx){
    	this.rjx=rjx;
    }
    public String getRjx(){
    	return	this.rjx;
    }
    public void setRsx(String rsx){
    	this.rsx=rsx;
    }
    public String getRsx(){
    	return	this.rsx;
    }
    public void setJghxfj(String jghxfj){
    	this.jghxfj=jghxfj;
    }
    public String getJghxfj(){
    	return	this.jghxfj;
    }
    public void setSd(String sd){
    	this.sd=sd;
    }
    public String getSd(){
    	return	this.sd;
    }
    public void setZrwd(String zrwd){
    	this.zrwd=zrwd;
    }
    public String getZrwd(){
    	return	this.zrwd;
    }
    public void setBzxx(String bzxx){
    	this.bzxx=bzxx;
    }
    public String getBzxx(){
    	return	this.bzxx;
    }
    public void setBzsx(String bzsx){
    	this.bzsx=bzsx;
    }
    public String getBzsx(){
    	return	this.bzsx;
    }
    public void setWxtx(String wxtx){
    	this.wxtx=wxtx;
    }
    public String getWxtx(){
    	return	this.wxtx;
    }
    public void setWxfjch(String wxfjch){
    	this.wxfjch=wxfjch;
    }
    public String getWxfjch(){
    	return	this.wxfjch;
    }
    public void setWdx(String wdx){
    	this.wdx=wdx;
    }
    public String getWdx(){
    	return	this.wdx;
    }
    public void setJhwh(String jhwh){
    	this.jhwh=jhwh;
    }
    public String getJhwh(){
    	return	this.jhwh;
    }
    public void setJjw(String jjw){
    	this.jjw=jjw;
    }
    public String getJjw(){
    	return	this.jjw;
    }
    public void setMhff(String mhff){
    	this.mhff=mhff;
    }
    public String getMhff(){
    	return	this.mhff;
    }
    public void setWxxlb(String wxxlb){
    	this.wxxlb=wxxlb;
    }
    public String getWxxlb(){
    	return	this.wxxlb;
    }
    public void setWxhwbzbz(String wxhwbzbz){
    	this.wxhwbzbz=wxhwbzbz;
    }
    public String getWxhwbzbz(){
    	return	this.wxhwbzbz;
    }
    public void setBzlb(String bzlb){
    	this.bzlb=bzlb;
    }
    public String getBzlb(){
    	return	this.bzlb;
    }
    public void setCyzysx(String cyzysx){
    	this.cyzysx=cyzysx;
    }
    public String getCyzysx(){
    	return	this.cyzysx;
    }
    public void setJcxz(String jcxz){
    	this.jcxz=jcxz;
    }
    public String getJcxz(){
    	return	this.jcxz;
    }
    public void setQrtj(String qrtj){
    	this.qrtj=qrtj;
    }
    public String getQrtj(){
    	return	this.qrtj;
    }
    public void setDx(String dx){
    	this.dx=dx;
    }
    public String getDx(){
    	return	this.dx;
    }
    public void setJkwh(String jkwh){
    	this.jkwh=jkwh;
    }
    public String getJkwh(){
    	return	this.jkwh;
    }
    public void setPfjc(String pfjc){
    	this.pfjc=pfjc;
    }
    public String getPfjc(){
    	return	this.pfjc;
    }
    public void setYjjc(String yjjc){
    	this.yjjc=yjjc;
    }
    public String getYjjc(){
    	return	this.yjjc;
    }
    public void setXr(String xr){
    	this.xr=xr;
    }
    public String getXr(){
    	return	this.xr;
    }
    public void setSr(String sr){
    	this.sr=sr;
    }
    public String getSr(){
    	return	this.sr;
    }
    public void setGckz(String gckz){
    	this.gckz=gckz;
    }
    public String getGckz(){
    	return	this.gckz;
    }
    public void setHxxtbh(String hxxtbh){
    	this.hxxtbh=hxxtbh;
    }
    public String getHxxtbh(){
    	return	this.hxxtbh;
    }
    public void setYjbh(String yjbh){
    	this.yjbh=yjbh;
    }
    public String getYjbh(){
    	return	this.yjbh;
    }
    public void setFhf(String fhf){
    	this.fhf=fhf;
    }
    public String getFhf(){
    	return	this.fhf;
    }
    public void setSfh(String sfh){
    	this.sfh=sfh;
    }
    public String getSfh(){
    	return	this.sfh;
    }
    public void setLjwd(String ljwd){
    	this.ljwd=ljwd;
    }
    public String getLjwd(){
    	return	this.ljwd;
    }
    public void setLjyl(String ljyl){
    	this.ljyl=ljyl;
    }
    public String getLjyl(){
    	return	this.ljyl;
    }
    public void setRsr(String rsr){
    	this.rsr=rsr;
    }
    public String getRsr(){
    	return	this.rsr;
    }
    public void setBmjctj(String bmjctj){
    	this.bmjctj=bmjctj;
    }
    public String getBmjctj(){
    	return	this.bmjctj;
    }
    public void setXlcz(String xlcz){
    	this.xlcz=xlcz;
    }
    public String getXlcz(){
    	return	this.xlcz;
    }
    public void setQt(String qt){
    	this.qt=qt;
    }
    public String getQt(){
    	return	this.qt;
    }
    public void setNum(String num){
    	this.num=num;
    }
    public String getNum(){
    	return	this.num;
    }
    public void setSlxlglbj(String slxlglbj){
    	this.slxlglbj=slxlglbj;
    }
    public String getSlxlglbj(){
    	return	this.slxlglbj;
    }
    public void setSlxlbtssbj(String slxlbtssbj){
    	this.slxlbtssbj=slxlbtssbj;
    }
    public String getSlxlbtssbj(){
    	return	this.slxlbtssbj;
    }
    public void setSlxlyjssbj(String slxlyjssbj){
    	this.slxlyjssbj=slxlyjssbj;
    }
    public String getSlxlyjssbj(){
    	return	this.slxlyjssbj;
    }
    public void setDlxlglbj(String dlxlglbj){
    	this.dlxlglbj=dlxlglbj;
    }
    public String getDlxlglbj(){
    	return	this.dlxlglbj;
    }
    public void setDlxlbtssbj(String dlxlbtssbj){
    	this.dlxlbtssbj=dlxlbtssbj;
    }
    public String getDlxlbtssbj(){
    	return	this.dlxlbtssbj;
    }
    public void setDlxlyjssbj(String dlxlyjssbj){
    	this.dlxlyjssbj=dlxlyjssbj;
    }
    public String getDlxlyjssbj(){
    	return	this.dlxlyjssbj;
    }
    public void setZcljl(String zcljl){
    	this.zcljl=zcljl;
    }
    public String getZcljl(){
    	return	this.zcljl;
    }
    public void setScljl(String scljl){
    	this.scljl=scljl;
    }
    public String getScljl(){
    	return	this.scljl;
    }

}