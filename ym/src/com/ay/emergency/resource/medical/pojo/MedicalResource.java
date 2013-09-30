package com.ay.emergency.resource.medical.pojo;

import com.ay.framework.core.pojo.MapPojo;
import com.ay.framework.core.pojo.MapType;

/**
 * 医疗保障 实体类
 * @author 软件工程部产品小组 yuzhou
 * 2013年3月19日 
 */
public class MedicalResource extends MapPojo  { 
    
    @Override
	public MapType getMapType() {
		return MapType.mdeical;
	}
	//机构名称
    private String jgmc;
    
    //医疗机构类别
    private String yljglb;
    
    //医疗机构  中文
    private String yljglbtext;
    
    //隶属关系
    private String affiliation;
    
    //所有制形式
    private String syzxs;
    
    //救护人员
    private Integer jhry;
    
    //救护车辆
    private Integer jhcl;
    
    //床位
    private Integer bed;
    
    //其他物资
    private Integer qtwz;
    
    //医疗机构等级
    private String yljgdj;
    
    //地址
    private String address;
    
    //电话
    private String tel;
    
    //传真
    private String byValue;
    
    
    //负责人姓名
    private String fzrxm;
    
    //负责人性别
    private String fzrxb;
    
    //负责人专业
    private String fzrzy;
    
    //负责人职务
    private String fzrzw;
    
    //负责人职称
    private String fzrzc;
    
    //负责人办公电话
    private String fzrbgdh;
    
    //负责人住宅电话
    private String fzrzzdh;
    
    //负责人手机
    private String fzrsj;
    
    //联系人姓名
    private String lxrxm;
    
    //联系人性别
    private String lxrxb;
    
    //联系人专业
    private String lxrzy;
    
    //联系人职务
    private String lxrzw;
    
    //联系人职称
    private String lxrzc;
    
    //联系人办公电话
    private String lxrbgdh;
    
    //联系人住宅电话
    private String lxrzzdh;
    
    //联系人手机
    private String lxrsj;
    
    //备注
    private String remark;

    public void setJgmc(String jgmc){
    	this.jgmc=jgmc;
    }
    public String getJgmc(){
    	return	this.jgmc;
    }
    public void setYljglb(String yljglb){
    	this.yljglb=yljglb;
    }
    public String getYljglb(){
    	return	this.yljglb;
    }
    public String getYljglbtext()
    {
        return yljglbtext;
    }
    public void setYljglbtext(String yljglbtext)
    {
        this.yljglbtext = yljglbtext;
    }
    public void setAffiliation(String affiliation){
    	this.affiliation=affiliation;
    }
    public String getAffiliation(){
    	return	this.affiliation;
    }
    public void setSyzxs(String syzxs){
    	this.syzxs=syzxs;
    }
    public String getSyzxs(){
    	return	this.syzxs;
    }
    public void setJhry(Integer jhry){
    	this.jhry=jhry;
    }
    public Integer getJhry(){
    	return	this.jhry;
    }
    public void setJhcl(Integer jhcl){
    	this.jhcl=jhcl;
    }
    public Integer getJhcl(){
    	return	this.jhcl;
    }
    public void setBed(Integer bed){
    	this.bed=bed;
    }
    public Integer getBed(){
    	return	this.bed;
    }
    public void setQtwz(Integer qtwz){
    	this.qtwz=qtwz;
    }
    public Integer getQtwz(){
    	return	this.qtwz;
    }
    public void setYljgdj(String yljgdj){
    	this.yljgdj=yljgdj;
    }
    public String getYljgdj(){
    	return	this.yljgdj;
    }
    public void setAddress(String address){
    	this.address=address;
    }
    public String getAddress(){
    	return	this.address;
    }
    public void setTel(String tel){
    	this.tel=tel;
    }
    public String getTel(){
    	return	this.tel;
    }
    public void setByValue(String byValue){
    	this.byValue=byValue;
    }
    public String getByValue(){
    	return	this.byValue;
    }
    public void setFzrxm(String fzrxm){
    	this.fzrxm=fzrxm;
    }
    public String getFzrxm(){
    	return	this.fzrxm;
    }
    public void setFzrxb(String fzrxb){
    	this.fzrxb=fzrxb;
    }
    public String getFzrxb(){
    	return	this.fzrxb;
    }
    public void setFzrzy(String fzrzy){
    	this.fzrzy=fzrzy;
    }
    public String getFzrzy(){
    	return	this.fzrzy;
    }
    public void setFzrzw(String fzrzw){
    	this.fzrzw=fzrzw;
    }
    public String getFzrzw(){
    	return	this.fzrzw;
    }
    public void setFzrzc(String fzrzc){
    	this.fzrzc=fzrzc;
    }
    public String getFzrzc(){
    	return	this.fzrzc;
    }
    public void setFzrbgdh(String fzrbgdh){
    	this.fzrbgdh=fzrbgdh;
    }
    public String getFzrbgdh(){
    	return	this.fzrbgdh;
    }
    public void setFzrzzdh(String fzrzzdh){
    	this.fzrzzdh=fzrzzdh;
    }
    public String getFzrzzdh(){
    	return	this.fzrzzdh;
    }
    public void setFzrsj(String fzrsj){
    	this.fzrsj=fzrsj;
    }
    public String getFzrsj(){
    	return	this.fzrsj;
    }
    public void setLxrxm(String lxrxm){
    	this.lxrxm=lxrxm;
    }
    public String getLxrxm(){
    	return	this.lxrxm;
    }
    public void setLxrxb(String lxrxb){
    	this.lxrxb=lxrxb;
    }
    public String getLxrxb(){
    	return	this.lxrxb;
    }
    public void setLxrzy(String lxrzy){
    	this.lxrzy=lxrzy;
    }
    public String getLxrzy(){
    	return	this.lxrzy;
    }
    public void setLxrzw(String lxrzw){
    	this.lxrzw=lxrzw;
    }
    public String getLxrzw(){
    	return	this.lxrzw;
    }
    public void setLxrzc(String lxrzc){
    	this.lxrzc=lxrzc;
    }
    public String getLxrzc(){
    	return	this.lxrzc;
    }
    public void setLxrbgdh(String lxrbgdh){
    	this.lxrbgdh=lxrbgdh;
    }
    public String getLxrbgdh(){
    	return	this.lxrbgdh;
    }
    public void setLxrzzdh(String lxrzzdh){
    	this.lxrzzdh=lxrzzdh;
    }
    public String getLxrzzdh(){
    	return	this.lxrzzdh;
    }
    public void setLxrsj(String lxrsj){
    	this.lxrsj=lxrsj;
    }
    public String getLxrsj(){
    	return	this.lxrsj;
    }
    public void setRemark(String remark){
    	this.remark=remark;
    }
    public String getRemark(){
    	return	this.remark;
    }

}