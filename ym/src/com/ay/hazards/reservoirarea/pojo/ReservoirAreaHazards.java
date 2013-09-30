package com.ay.hazards.reservoirarea.pojo;

import java.util.List;

import com.ay.framework.annotation.ChineseName;
import com.ay.framework.annotation.PersistenceIgnore;
import com.ay.framework.core.pojo.MapPojo;
import com.ay.framework.core.pojo.MapType;
import com.ay.hazards.identification.HazardsType;
import com.ay.hazards.identification.IHazards;

/** 
 * @Description 库区
 * @date 2013-4-10
 * @author WangXin
 */
//@ChineseName("库区")
public class ReservoirAreaHazards extends MapPojo implements IHazards {
	
    @Override
	public MapType getMapType() {
		// TODO Auto-generated method stub
		return MapType.reservoirarea;
	}
	@ChineseName("所属单位")
    private String dwdm;
    /**
     * 企业名称不需要持久化
     */
    @PersistenceIgnore
    private String corpName;
    @ChineseName("编号")
    private String no;
    @ChineseName("库区名称")
    private String name;
    @ChineseName("具体位置")
    private String location;
    @ChineseName("所处环境功能区")
    private String environment;
    @ChineseName("库区占地面积")
    private String area;
    @ChineseName("库房个数")
    private String size;
    @ChineseName("填表人")
    private String saveMan;
    @ChineseName("联系电话")
    private String contactPhone;
    @ChineseName("填表日期")
    private String saveTime;
    @PersistenceIgnore
    private List<ReservoirHazards> reservoirs;
    
    public List<ReservoirHazards> getReservoirs() {
        return reservoirs;
    }
    public void setReservoirs(List<ReservoirHazards> reservoirs) {
        this.reservoirs = reservoirs;
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
    public String getNo() {
        return no;
    }
    public void setNo(String no) {
        this.no = no;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getLocation() {
        return location;
    }
    public void setLocation(String location) {
        this.location = location;
    }
    public String getEnvironment() {
        return environment;
    }
    public void setEnvironment(String environment) {
        this.environment = environment;
    }
    public String getArea() {
        return area;
    }
    public void setArea(String area) {
        this.area = area;
    }
    public String getSize() {
        return size;
    }
    public void setSize(String size) {
        this.size = size;
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
	return HazardsType.reservoirarea;
    }
    
    
}

