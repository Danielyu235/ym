package com.ay.hazards.penstock.pojo;

import com.ay.framework.annotation.ChineseName;
import com.ay.framework.annotation.PersistenceIgnore;
import com.ay.framework.core.pojo.MapPojo;
import com.ay.framework.core.pojo.MapType;
import com.ay.hazards.hazardousmaterials.pojo.Materials;
import com.ay.hazards.identification.HazardsType;
import com.ay.hazards.identification.IHazards;

/**
 *压力管道实体类
 * @author yuzhou
 *  2013-04-22
 */
public class PenstockHazards extends MapPojo implements IHazards { 
	
	@Override
	public MapType getMapType() {
		// TODO Auto-generated method stub
		return MapType.penstock;
	}
	/**
     * 包含的危险物质
     */
    @PersistenceIgnore
    private Materials materials;
	@ChineseName("危险物质ID")
	private String materialsId;
	private String dwdm;
	private String corpName;
    private String gdmc;
    private String gdbh;
    private String gdlb;
    private String gdzj;
    private String cz;
    private String bh;
    private String gdcd;
    private String gzyl;
    private String qdsyyl;
    private String ymxsyyl;
    private String csjz;
    private String gzwd;
    private String tyrq;
    private String fsfs;
    private String fffs;
    private String jrfs;
    private String sjgf;
    private String sjdw;
    private String azgf;
    private String azdw;
    private String gdth;
    private String gdjgdq;
    private String ygdxldtyz;
    private String tbr;
    private String lxdh;
    private String tbrq;

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
	public Materials getMaterials() {
		return materials;
	}
	public void setMaterials(Materials materials) {
		this.materials = materials;
	}
	public String getMaterialsId() {
		return materialsId;
	}
	public void setMaterialsId(String materialsId) {
		this.materialsId = materialsId;
	}
	public void setGdmc(String gdmc){
    	this.gdmc=gdmc;
    }
    public String getGdmc(){
    	return	this.gdmc;
    }
    public void setGdbh(String gdbh){
    	this.gdbh=gdbh;
    }
    public String getGdbh(){
    	return	this.gdbh;
    }
    public void setGdlb(String gdlb){
    	this.gdlb=gdlb;
    }
    public String getGdlb(){
    	return	this.gdlb;
    }
    public void setGdzj(String gdzj){
    	this.gdzj=gdzj;
    }
    public String getGdzj(){
    	return	this.gdzj;
    }
    public void setCz(String cz){
    	this.cz=cz;
    }
    public String getCz(){
    	return	this.cz;
    }
    public void setBh(String bh){
    	this.bh=bh;
    }
    public String getBh(){
    	return	this.bh;
    }
    public void setGdcd(String gdcd){
    	this.gdcd=gdcd;
    }
    public String getGdcd(){
    	return	this.gdcd;
    }
    public void setGzyl(String gzyl){
    	this.gzyl=gzyl;
    }
    public String getGzyl(){
    	return	this.gzyl;
    }
    public void setQdsyyl(String qdsyyl){
    	this.qdsyyl=qdsyyl;
    }
    public String getQdsyyl(){
    	return	this.qdsyyl;
    }
    public void setYmxsyyl(String ymxsyyl){
    	this.ymxsyyl=ymxsyyl;
    }
    public String getYmxsyyl(){
    	return	this.ymxsyyl;
    }
    public void setCsjz(String csjz){
    	this.csjz=csjz;
    }
    public String getCsjz(){
    	return	this.csjz;
    }
    public void setGzwd(String gzwd){
    	this.gzwd=gzwd;
    }
    public String getGzwd(){
    	return	this.gzwd;
    }
    public void setTyrq(String tyrq){
    	this.tyrq=tyrq;
    }
    public String getTyrq(){
    	return	this.tyrq;
    }
    public void setFsfs(String fsfs){
    	this.fsfs=fsfs;
    }
    public String getFsfs(){
    	return	this.fsfs;
    }
    public void setFffs(String fffs){
    	this.fffs=fffs;
    }
    public String getFffs(){
    	return	this.fffs;
    }
    public void setJrfs(String jrfs){
    	this.jrfs=jrfs;
    }
    public String getJrfs(){
    	return	this.jrfs;
    }
    public void setSjgf(String sjgf){
    	this.sjgf=sjgf;
    }
    public String getSjgf(){
    	return	this.sjgf;
    }
    public void setSjdw(String sjdw){
    	this.sjdw=sjdw;
    }
    public String getSjdw(){
    	return	this.sjdw;
    }
    public void setAzgf(String azgf){
    	this.azgf=azgf;
    }
    public String getAzgf(){
    	return	this.azgf;
    }
    public void setAzdw(String azdw){
    	this.azdw=azdw;
    }
    public String getAzdw(){
    	return	this.azdw;
    }
    public void setGdth(String gdth){
    	this.gdth=gdth;
    }
    public String getGdth(){
    	return	this.gdth;
    }
    public void setGdjgdq(String gdjgdq){
    	this.gdjgdq=gdjgdq;
    }
    public String getGdjgdq(){
    	return	this.gdjgdq;
    }
    public void setYgdxldtyz(String ygdxldtyz){
    	this.ygdxldtyz=ygdxldtyz;
    }
    public String getYgdxldtyz(){
    	return	this.ygdxldtyz;
    }
    public void setTbr(String tbr){
    	this.tbr=tbr;
    }
    public String getTbr(){
    	return	this.tbr;
    }
    public void setLxdh(String lxdh){
    	this.lxdh=lxdh;
    }
    public String getLxdh(){
    	return	this.lxdh;
    }
    public void setTbrq(String tbrq){
    	this.tbrq=tbrq;
    }
    public String getTbrq(){
    	return	this.tbrq;
    }
    @Override
    public HazardsType getHazardsType() {
	return HazardsType.penstock;
    }

}