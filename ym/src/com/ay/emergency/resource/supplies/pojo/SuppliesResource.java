package com.ay.emergency.resource.supplies.pojo;

import java.util.ArrayList;
import java.util.List;

import com.ay.framework.core.pojo.MapPojo;
import com.ay.framework.core.pojo.MapType;

/**
 * 救援物资 实体类
 * @author 软件工程部产品小组 yuzhou
 * 2013年3月19日 
 */
public class SuppliesResource extends MapPojo  {
	
    @Override
	public MapType getMapType() {
		return MapType.supplies;
	}
    List<SuppliesResource> suppList;
    
	public List<SuppliesResource> getSuppList() {
		return suppList;
	}
	public void setSuppList(List<SuppliesResource> suppList) {
		this.suppList = suppList;
	}
	//物资名称
    private String wzmc;
    
    //物资类别
    private String wzlb;
    
  //物资类别中文
    private String wzlbtext;
    
  //物资类型
    private String wzlx;
    
  //物资数量
    private String wzsl;
    
  //自备车辆
    private String zbcl;
    
  //有效期至
    private String valid;
    
    //所属单位
    private String ssdw;
    
    //所属部门
    private String ssbm;
    
  //负责人
    private String fzr;
    
  //负责人手机
    private String fzrsj;
    
    //存放位置
    private String cfwz;
    
    //备注
    private String remark;

    public void setWzmc(String wzmc){
    	this.wzmc=wzmc;
    }
    public String getWzmc(){
    	return	this.wzmc;
    }
    public void setWzlb(String wzlb){
    	this.wzlb=wzlb;
    }
    public String getWzlb(){
    	return	this.wzlb;
    }
    public String getWzlbtext()
    {
        return wzlbtext;
    }
    public void setWzlbtext(String wzlbtext)
    {
        this.wzlbtext = wzlbtext;
    }
    public void setWzlx(String wzlx){
    	this.wzlx=wzlx;
    }
    public String getWzlx(){
    	return	this.wzlx;
    }
    public void setWzsl(String wzsl){
    	this.wzsl=wzsl;
    }
    public String getWzsl(){
    	return	this.wzsl;
    }
    public void setZbcl(String zbcl){
    	this.zbcl=zbcl;
    }
    public String getZbcl(){
    	return	this.zbcl;
    }
    public void setValid(String valid){
    	this.valid=valid;
    }
    public String getValid(){
    	return	this.valid;
    }
    public void setSsdw(String ssdw){
    	this.ssdw=ssdw;
    }
    public String getSsdw(){
    	return	this.ssdw;
    }
    public void setSsbm(String ssbm){
    	this.ssbm=ssbm;
    }
    public String getSsbm(){
    	return	this.ssbm;
    }
    public void setFzr(String fzr){
    	this.fzr=fzr;
    }
    public String getFzr(){
    	return	this.fzr;
    }
    public void setFzrsj(String fzrsj){
    	this.fzrsj=fzrsj;
    }
    public String getFzrsj(){
    	return	this.fzrsj;
    }
    public void setCfwz(String cfwz){
    	this.cfwz=cfwz;
    }
    public String getCfwz(){
    	return	this.cfwz;
    }
    public void setRemark(String remark){
    	this.remark=remark;
    }
    public String getRemark(){
    	return	this.remark;
    }

}