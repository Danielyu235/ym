package com.ay.hazards.dangerousplace.pojo;

import java.util.Date;
import java.util.List;

import com.ay.framework.core.pojo.MapPojo;
import com.ay.framework.core.pojo.MapType;
import com.ay.hazards.dangerousplacematerials.pojo.DangerousPlaceMaterialsInfo;
import com.ay.hazards.identification.HazardsType;
import com.ay.hazards.identification.IHazards;

/**
 ** 封装危险场所信息
 ** 
 * @author liuhu
 ** 
 **/
public class DangerousplaceInfo extends MapPojo implements IHazards {
	
    @Override
	public MapType getMapType() {
		return MapType.dangerousplace;
	}

	/**
     * 所属单位代码
     */
    private String dwdm;
    /**
     ** 所属单位
     **/
    private String corpName;
    /**
     ** 危险场所名称
     **/
    private String dangerplacename;
    /**
     ** 危险场所地址
     **/
    private String dangerplaceadress;
    /**
     * 危险场所投用时间
     */
    private String dangerplacetime;
    /**
     * 危险场所级别
     */
    private String dangerplacelevel;
    /**
     * R值
     */
    private String rvalue;
    /**
     * 单元规模
     */
    private String unitsize;
    /**
     * 是否位于化工园区
     */
    private String isparkTrue;
    /**
     * 是否位于化工园区(名称)
     */
    private String ispark;
    /**
     * 最近距离
     */
    private String distance;
    /**
     * 估算值
     */
    private String estimatedvalue;
    /**
     * 化学品事故情况
     */
    private String situation;
    /**
     * 填表人
     */
    private String formpeople;
    /**
     * 联系电话
     */
    private String phonenumber;
    /**
     * 填表时间
     */
    private String formdate;
    /**
     * 所包含的危险物质
     */
    private List<DangerousPlaceMaterialsInfo> list;

    public String getCorpName() {
	return corpName;
    }

    public void setCorpName(String corpName) {
	this.corpName = corpName;
    }

    public String getDangerplacename() {
	return dangerplacename;
    }

    public void setDangerplacename(String dangerplacename) {
	this.dangerplacename = dangerplacename;
    }

    public String getDangerplaceadress() {
	return dangerplaceadress;
    }

    public void setDangerplaceadress(String dangerplaceadress) {
	this.dangerplaceadress = dangerplaceadress;
    }



    public String getDangerplacelevel() {
	return dangerplacelevel;
    }

    public void setDangerplacelevel(String dangerplacelevel) {
	this.dangerplacelevel = dangerplacelevel;
    }

    public String getRvalue() {
	return rvalue;
    }

    public void setRvalue(String rvalue) {
	this.rvalue = rvalue;
    }

    public String getUnitsize() {
	return unitsize;
    }

    public void setUnitsize(String unitsize) {
	this.unitsize = unitsize;
    }
    
    public String getIsparkTrue() {
        return isparkTrue;
    }

    public void setIsparkTrue(String isparkTrue) {
        this.isparkTrue = isparkTrue;
    }

    public String getIspark() {
	return ispark;
    }

    public void setIspark(String ispark) {
	this.ispark = ispark;
    }

    public String getDistance() {
	return distance;
    }

    public void setDistance(String distance) {
	this.distance = distance;
    }

    public String getEstimatedvalue() {
	return estimatedvalue;
    }

    public void setEstimatedvalue(String estimatedvalue) {
	this.estimatedvalue = estimatedvalue;
    }

    public String getSituation() {
	return situation;
    }

    public void setSituation(String situation) {
	this.situation = situation;
    }

    public String getFormpeople() {
	return formpeople;
    }

    public void setFormpeople(String formpeople) {
	this.formpeople = formpeople;
    }

    public String getPhonenumber() {
	return phonenumber;
    }

    public void setPhonenumber(String phonenumber) {
	this.phonenumber = phonenumber;
    }



    

	public String getDangerplacetime() {
		return dangerplacetime;
	}

	public void setDangerplacetime(String dangerplacetime) {
		this.dangerplacetime = dangerplacetime;
	}

	public String getFormdate() {
		return formdate;
	}

	public void setFormdate(String formdate) {
		this.formdate = formdate;
	}

	public List<DangerousPlaceMaterialsInfo> getList() {
	return list;
    }

    public String getDwdm() {
	return dwdm;
    }

    public void setDwdm(String dwdm) {
	this.dwdm = dwdm;
    }

    public void setList(List<DangerousPlaceMaterialsInfo> list) {
	this.list = list;
    }

    @Override
    public HazardsType getHazardsType() {
	return HazardsType.dangerousplace;
    }

}
