package com.ay.hazards.identification;

/** 
 * @Description 返回结果中的危险源信息
 * @date 2013-4-18
 * @author WangXin
 */
public class HazardsInfo {
    /** 危险源ID */
    private String hazardsId;
    /** 危险源类型 */
    private HazardsType hazardsType;
    /** 危险源名称 **/
    private String hazardsName;
    /** 危险源类型中文 */
    private String type;
    /** 危险源所属单位ID */
    private String dwdm;
    /** 危险源所属单位名称 */
    private String corpName;
    public String getHazardsId() {
        return hazardsId;
    }
    public void setHazardsId(String hazardsId) {
        this.hazardsId = hazardsId;
    }
    public HazardsType getHazardsType() {
        return hazardsType;
    }
    public void setHazardsType(HazardsType hazardsType) {
        this.hazardsType = hazardsType;
    }
    public String getType() {
        return type;
    }
    public void setType(String type) {
        this.type = type;
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
    public String getHazardsName() {
		return hazardsName;
	}
	public void setHazardsName(String hazardsName) {
		this.hazardsName = hazardsName;
	}
	
	public HazardsInfo() {
	super();
    }
    public HazardsInfo(String hazardsName,String hazardsId, HazardsType hazardsType, String type,
	    String dwdm, String corpName) {
	super();
	this.setHazardsName(hazardsName);
	this.hazardsId = hazardsId;
	this.hazardsType = hazardsType;
	this.type = type;
	this.dwdm = dwdm;
	this.corpName = corpName;
    }
    
}

