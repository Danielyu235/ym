package com.ay.hazards.pressurevessel.pojo;

import com.ay.framework.annotation.ChineseName;
import com.ay.framework.annotation.MultiLineField;
import com.ay.framework.annotation.PersistenceIgnore;
import com.ay.framework.core.pojo.MapPojo;
import com.ay.framework.core.pojo.MapType;
import com.ay.hazards.hazardousmaterials.pojo.Materials;
import com.ay.hazards.identification.HazardsType;
import com.ay.hazards.identification.IHazards;

//@ChineseName("压力容器")
public class PressureVesselHazards extends MapPojo implements IHazards {
	
    @Override
	public MapType getMapType() {
		// TODO Auto-generated method stub
		return MapType.pressurevessel;
	}
	/**
     * 包含的危险物质
     */
    @PersistenceIgnore
    private Materials materials;
    @ChineseName("所属单位")
    private String dwdm;
    /**
     * 企业名称不需要持久化
     */
    @PersistenceIgnore
    private String corpName;
    @ChineseName("名称")
    private String name;
    @ChineseName("编号")
    private String ownId;
    @ChineseName("注册编号")
    private String registerId;
    @ChineseName("使用证编号")
    private String certificateId;
    @ChineseName("类别")
    private String type;
    @ChineseName("设计单位")
    private String designDept;
    @ChineseName("投用年月")
    private String useTime;
    @ChineseName("使用单位")
    private String useDept;
    @ChineseName("制造单位")
    private String createDept;
    @ChineseName("制造年月")
    private String createYear;
    @ChineseName("出厂编号")
    private String facoryId;
    
    @ChineseName("筒体")
    private String tongti;
    @ChineseName("封头")
    private String fengtou;
    @ChineseName("内衬")
    private String neichen;
    
    @ChineseName("内径")
    private String neijing;
    @ChineseName("设计压力")
    private String designPresure;
    @ChineseName("壁厚")
    private String bihou;
    @ChineseName("最高工作压力")
    private String zggzyl;
    @ChineseName("高（长）")
    private String height;
    @ChineseName("设计温度")
    private String designTemp;
    @ChineseName("容积")
    private String volume;
    @ChineseName("介质Id")
    private String materialsId;
    @ChineseName("介质")
    private String jiezhi;
    @ChineseName("有无保温、绝热")
    private String haveBw;
    @ChineseName("是否有安全阀")
    private String haveAqf;
    @ChineseName("是否有爆破片")
    private String haveBpp;
    @ChineseName("是否有紧急切断阀")
    private String haveJjqdf;
    @ChineseName("是否有压力表")
    private String haveYlb;
    @ChineseName("是否有液面计")
    private String haveYmy;
    @ChineseName("安全状况等级")
    @MultiLineField
    private String safeLevel;
    @ChineseName("定期检验情况")
    @MultiLineField
    private String regularCheck;
    @ChineseName("备注")
    @MultiLineField
    private String remark;
    
    @ChineseName("填表人")
    private String saveMan;
    @ChineseName("联系电话")
    private String contactPhone;
    @ChineseName("填表日期")
    private String saveTime;
    
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
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getOwnId() {
        return ownId;
    }
    public void setOwnId(String ownId) {
        this.ownId = ownId;
    }
    public String getRegisterId() {
        return registerId;
    }
    public void setRegisterId(String registerId) {
        this.registerId = registerId;
    }
    public String getCertificateId() {
        return certificateId;
    }
    public void setCertificateId(String certificateId) {
        this.certificateId = certificateId;
    }
    public String getType() {
        return type;
    }
    public void setType(String type) {
        this.type = type;
    }
    public String getDesignDept() {
        return designDept;
    }
    public void setDesignDept(String designDept) {
        this.designDept = designDept;
    }
    public String getUseTime() {
        return useTime;
    }
    public void setUseTime(String useTime) {
        this.useTime = useTime;
    }
    public String getUseDept() {
        return useDept;
    }
    public void setUseDept(String useDept) {
        this.useDept = useDept;
    }
    public String getCreateDept() {
        return createDept;
    }
    public void setCreateDept(String createDept) {
        this.createDept = createDept;
    }
    public String getCreateYear() {
        return createYear;
    }
    public void setCreateYear(String createYear) {
        this.createYear = createYear;
    }
    public String getFacoryId() {
        return facoryId;
    }
    public void setFacoryId(String facoryId) {
        this.facoryId = facoryId;
    }
    public String getTongti() {
        return tongti;
    }
    public void setTongti(String tongti) {
        this.tongti = tongti;
    }
    public String getFengtou() {
        return fengtou;
    }
    public void setFengtou(String fengtou) {
        this.fengtou = fengtou;
    }
    public String getNeichen() {
        return neichen;
    }
    public void setNeichen(String neichen) {
        this.neichen = neichen;
    }
    public String getNeijing() {
        return neijing;
    }
    public void setNeijing(String neijing) {
        this.neijing = neijing;
    }
    public String getDesignPresure() {
        return designPresure;
    }
    public void setDesignPresure(String designPresure) {
        this.designPresure = designPresure;
    }
    public String getBihou() {
        return bihou;
    }
    public void setBihou(String bihou) {
        this.bihou = bihou;
    }
    public String getZggzyl() {
        return zggzyl;
    }
    public void setZggzyl(String zggzyl) {
        this.zggzyl = zggzyl;
    }
    public String getHeight() {
        return height;
    }
    public void setHeight(String height) {
        this.height = height;
    }
    public String getDesignTemp() {
        return designTemp;
    }
    public void setDesignTemp(String designTemp) {
        this.designTemp = designTemp;
    }
    public String getVolume() {
        return volume;
    }
    public void setVolume(String volume) {
        this.volume = volume;
    }
    public String getJiezhi() {
        return jiezhi;
    }
    public void setJiezhi(String jiezhi) {
        this.jiezhi = jiezhi;
    }
    public String getHaveBw() {
        return haveBw;
    }
    public void setHaveBw(String haveBw) {
        this.haveBw = haveBw;
    }
    public String getHaveAqf() {
        return haveAqf;
    }
    public void setHaveAqf(String haveAqf) {
        this.haveAqf = haveAqf;
    }
    public String getHaveBpp() {
        return haveBpp;
    }
    public void setHaveBpp(String haveBpp) {
        this.haveBpp = haveBpp;
    }
    public String getHaveJjqdf() {
        return haveJjqdf;
    }
    public void setHaveJjqdf(String haveJjqdf) {
        this.haveJjqdf = haveJjqdf;
    }
    public String getHaveYlb() {
        return haveYlb;
    }
    public void setHaveYlb(String haveYlb) {
        this.haveYlb = haveYlb;
    }
    public String getHaveYmy() {
        return haveYmy;
    }
    public void setHaveYmy(String haveYmy) {
        this.haveYmy = haveYmy;
    }
    public String getSafeLevel() {
        return safeLevel;
    }
    public void setSafeLevel(String safeLevel) {
        this.safeLevel = safeLevel;
    }
    public String getRegularCheck() {
        return regularCheck;
    }
    public void setRegularCheck(String regularCheck) {
        this.regularCheck = regularCheck;
    }
    public String getRemark() {
        return remark;
    }
    public void setRemark(String remark) {
        this.remark = remark;
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
	return HazardsType.pressurevessel;
    }
    

}