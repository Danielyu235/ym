package com.ay.hazards.dangerousplacematerials.pojo;

import com.ay.framework.annotation.ChineseName;
import com.ay.framework.annotation.PersistenceIgnore;
import com.ay.framework.core.pojo.BasePojo;
import com.ay.hazards.hazardousmaterials.pojo.Materials;

/**
 * 危险场所危险物质
 * @author Administrator
 *
 */
public class DangerousPlaceMaterialsInfo extends BasePojo
{
	/**
	 ** 包含的危险物质
	 **/
    @PersistenceIgnore
    private Materials materials;
    @ChineseName("危险物质ID")
    private String materialsId;
    private String fid;
    /**
      *危险物质名称
      */
    private String dangercargoname;
   
    /**
     * UN编号
     */
    private String dangernumber;
    /**
     * 生产用途
     */
    private String dangeruse ;
    /**
     * 生产工艺
     */
    private String dangertech;
    /**
     * 物理状态
     */
    private String physical;
    /**
     * 操作温度
     */
    private String dangercartem;
    /**
     * 操作压力
     */
    private String dangermpa;
    /**
     * 存量
     */
    private String dangerstore;
    /**
     * 单元内存量
     */
    private String dangerunitstore;
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
	public String getFid() {
		return fid;
	}
	public void setFid(String fid) {
		this.fid = fid;
	}
	public String getDangercargoname() {
		return dangercargoname;
	}
	public void setDangercargoname(String dangercargoname) {
		this.dangercargoname = dangercargoname;
	}
	public String getDangernumber() {
		return dangernumber;
	}
	public void setDangernumber(String dangernumber) {
		this.dangernumber = dangernumber;
	}
	public String getDangeruse() {
		return dangeruse;
	}
	public void setDangeruse(String dangeruse) {
		this.dangeruse = dangeruse;
	}
	public String getDangertech() {
		return dangertech;
	}
	public void setDangertech(String dangertech) {
		this.dangertech = dangertech;
	}
	public String getPhysical() {
		return physical;
	}
	public void setPhysical(String physical) {
		this.physical = physical;
	}
	public String getDangercartem() {
		return dangercartem;
	}
	public void setDangercartem(String dangercartem) {
		this.dangercartem = dangercartem;
	}
	public String getDangermpa() {
		return dangermpa;
	}
	public void setDangermpa(String dangermpa) {
		this.dangermpa = dangermpa;
	}
	public String getDangerstore() {
		return dangerstore;
	}
	public void setDangerstore(String dangerstore) {
		this.dangerstore = dangerstore;
	}
	public String getDangerunitstore() {
		return dangerunitstore;
	}
	public void setDangerunitstore(String dangerunitstore) {
		this.dangerunitstore = dangerunitstore;
	}
    	
    	

}
