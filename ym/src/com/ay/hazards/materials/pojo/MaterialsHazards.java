package com.ay.hazards.materials.pojo;

import java.sql.Date;

import com.ay.framework.annotation.ChineseName;
import com.ay.framework.annotation.PersistenceIgnore;
import com.ay.framework.core.pojo.BasePojo;
import com.ay.hazards.hazardousmaterials.pojo.Materials;

/**
 * 生产场所 中存放物质实体类
 * @author yuzhou
 *  2013-04-22
 */
public class MaterialsHazards extends BasePojo  { 
	/**
     * 包含的危险物质
     */
    @PersistenceIgnore
    private Materials materials;
	@ChineseName("危险物质ID")
	private String materialsId;
	/** 生产场所ID **/
    private String fid;
    /** 物质名称 **/
    private String wzmc;
    /** 现存物质总量 **/
    private String xcwzzl;
    /** 工艺过程中的物质量 **/
    private String gygczdwzl;
    /** 存储的物质量(t) **/
    private String ccdwzl;
    /** 废弃物质量(t) **/
    private String fqwzl;

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
	public void setFid(String fid){
    	this.fid=fid;
    }
    public String getFid(){
    	return	this.fid;
    }
    public void setWzmc(String wzmc){
    	this.wzmc=wzmc;
    }
    public String getWzmc(){
    	return	this.wzmc;
    }
    public void setXcwzzl(String xcwzzl){
    	this.xcwzzl=xcwzzl;
    }
    public String getXcwzzl(){
    	return	this.xcwzzl;
    }
    public void setGygczdwzl(String gygczdwzl){
    	this.gygczdwzl=gygczdwzl;
    }
    public String getGygczdwzl(){
    	return	this.gygczdwzl;
    }
    public void setCcdwzl(String ccdwzl){
    	this.ccdwzl=ccdwzl;
    }
    public String getCcdwzl(){
    	return	this.ccdwzl;
    }
    public void setFqwzl(String fqwzl){
    	this.fqwzl=fqwzl;
    }
    public String getFqwzl(){
    	return	this.fqwzl;
    }

}