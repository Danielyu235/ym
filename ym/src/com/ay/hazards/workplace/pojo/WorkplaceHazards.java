package com.ay.hazards.workplace.pojo;

import java.util.List;

import com.ay.framework.core.pojo.MapPojo;
import com.ay.framework.core.pojo.MapType;
import com.ay.hazards.identification.HazardsType;
import com.ay.hazards.identification.IHazards;
import com.ay.hazards.materials.pojo.MaterialsHazards;

/**
 * 生产场所实体类
 * @author yuzhou
 *  2013-04-22
 */
public class WorkplaceHazards extends MapPojo implements IHazards { 
	
	@Override
	public MapType getMapType() {
		// TODO Auto-generated method stub
		return MapType.workplace;
	}
	/** 所属单位代码 **/
	private String dwdm;
	/** 所属单位名称 **/
	private String corpName;
	/** 单元名称 **/
    private String dymc;
    /** 固定资产总值 **/
    private String gdzczz;
    /** 具体位置 **/
    private String jtwz;
    /** 所处环境功能区 **/
    private String schjgnq;
    /** 占地面积 **/
    private String zdmj;
    /** 正常当班人数 **/
    private Integer zcdbrs;
    //物品对象
    private List<MaterialsHazards> list;
    
    public List<MaterialsHazards> getList() {
		return list;
	}
	public void setList(List<MaterialsHazards> list) {
		this.list = list;
	}
	public String getDwdm() {
		return dwdm;
	}
	public void setDwdm(String dwdm) {
		this.dwdm = dwdm;
	}
	public String getCorpName() {
		return corpName;
	}
	public void setCorpName(String corpName) {
		this.corpName = corpName;
	}
	public void setDymc(String dymc){
    	this.dymc=dymc;
    }
    public String getDymc(){
    	return	this.dymc;
    }
    public void setGdzczz(String gdzczz){
    	this.gdzczz=gdzczz;
    }
    public String getGdzczz(){
    	return	this.gdzczz;
    }
    public void setJtwz(String jtwz){
    	this.jtwz=jtwz;
    }
    public String getJtwz(){
    	return	this.jtwz;
    }
    public void setSchjgnq(String schjgnq){
    	this.schjgnq=schjgnq;
    }
    public String getSchjgnq(){
    	return	this.schjgnq;
    }
    public void setZdmj(String zdmj){
    	this.zdmj=zdmj;
    }
    public String getZdmj(){
    	return	this.zdmj;
    }
    public void setZcdbrs(Integer zcdbrs){
    	this.zcdbrs=zcdbrs;
    }
    public Integer getZcdbrs(){
    	return	this.zcdbrs;
    }
    @Override
    public HazardsType getHazardsType() {
	return HazardsType.workplace;
    }

}