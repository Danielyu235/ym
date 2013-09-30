package com.ay.hazards.reservoirarea.pojo;

import com.ay.framework.annotation.ChineseName;
import com.ay.framework.annotation.PersistenceIgnore;
import com.ay.framework.core.pojo.BasePojo;

/** 
 * @Description 库房
 * @date 2013-4-10
 * @author WangXin
 */
//@ChineseName("库房")
public class ReservoirHazards extends BasePojo {
    @PersistenceIgnore
    private ReservoirAreaHazards reservoirArea;
    /**
     * 库区的ID FK
     */
    @ChineseName("库区ID")
    private String areaId;
    @ChineseName("库房序号")
    private String no;
    @ChineseName("库房名称")
    private String name;
    @ChineseName("库房形式")
    private String style;
    @ChineseName("库房结构")
    private String structure;
    @ChineseName("设计使用年限")
    private String useYearTime;
    @ChineseName("竣工时间")
    private String buildTime;
    @ChineseName("占地面积")
    private String area;
    @ChineseName("有无防火墙")
    private String hasFireWall;
    /**
     * 以下3个属于
     * 民用爆破器材
     */
    @ChineseName("起爆器材")
    private String explosionEquipment;
    @ChineseName("工业炸药")
    private String explosionExplosive;
    @ChineseName("爆炸危险原材料")
    private String explosionMaterials;
    
    @ChineseName("烟火剂、烟花爆竹")
    private String firecracker;
    
    /**
     * 以下2个属于
     * 易燃液体
     */
    @ChineseName("闪点＜28℃")
    private String liquidLess;
    @ChineseName("28℃≤闪点＜60℃")
    private String liquidMore;
    /**
     * 以下2个属于
     * 可燃气体
     */
    @ChineseName("爆炸下限＜10%")
    private String gasLess;
    @ChineseName("爆炸下限≥10%")
    private String gasMore;
    /**
     * 以下3个属于
     * 毒性物质
     */
    @ChineseName("剧毒品")
    private String poisonMost;
    @ChineseName("有毒品")
    private String poisonMore;
    @ChineseName("有害品")
    private String poisonLittle;
    
    public ReservoirAreaHazards getReservoirArea() {
        return reservoirArea;
    }
    public void setReservoirArea(ReservoirAreaHazards reservoirArea) {
        this.reservoirArea = reservoirArea;
    }
    public String getAreaId() {
        return areaId;
    }
    public void setAreaId(String areaId) {
        this.areaId = areaId;
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
    public String getStyle() {
        return style;
    }
    public void setStyle(String style) {
        this.style = style;
    }
    public String getStructure() {
        return structure;
    }
    public void setStructure(String structure) {
        this.structure = structure;
    }
    public String getUseYearTime() {
        return useYearTime;
    }
    public void setUseYearTime(String useYearTime) {
        this.useYearTime = useYearTime;
    }
    public String getBuildTime() {
        return buildTime;
    }
    public void setBuildTime(String buildTime) {
        this.buildTime = buildTime;
    }
    public String getArea() {
        return area;
    }
    public void setArea(String area) {
        this.area = area;
    }
    public String getHasFireWall() {
        return hasFireWall;
    }
    public void setHasFireWall(String hasFireWall) {
        this.hasFireWall = hasFireWall;
    }
    public String getExplosionEquipment() {
        return explosionEquipment;
    }
    public void setExplosionEquipment(String explosionEquipment) {
        this.explosionEquipment = explosionEquipment;
    }
    public String getExplosionExplosive() {
        return explosionExplosive;
    }
    public void setExplosionExplosive(String explosionExplosive) {
        this.explosionExplosive = explosionExplosive;
    }
    public String getExplosionMaterials() {
        return explosionMaterials;
    }
    public void setExplosionMaterials(String explosionMaterials) {
        this.explosionMaterials = explosionMaterials;
    }
    public String getFirecracker() {
        return firecracker;
    }
    public void setFirecracker(String firecracker) {
        this.firecracker = firecracker;
    }
    public String getLiquidLess() {
        return liquidLess;
    }
    public void setLiquidLess(String liquidLess) {
        this.liquidLess = liquidLess;
    }
    public String getLiquidMore() {
        return liquidMore;
    }
    public void setLiquidMore(String liquidMore) {
        this.liquidMore = liquidMore;
    }
    public String getGasLess() {
        return gasLess;
    }
    public void setGasLess(String gasLess) {
        this.gasLess = gasLess;
    }
    public String getGasMore() {
        return gasMore;
    }
    public void setGasMore(String gasMore) {
        this.gasMore = gasMore;
    }
    public String getPoisonMost() {
        return poisonMost;
    }
    public void setPoisonMost(String poisonMost) {
        this.poisonMost = poisonMost;
    }
    public String getPoisonMore() {
        return poisonMore;
    }
    public void setPoisonMore(String poisonMore) {
        this.poisonMore = poisonMore;
    }
    public String getPoisonLittle() {
        return poisonLittle;
    }
    public void setPoisonLittle(String poisonLittle) {
        this.poisonLittle = poisonLittle;
    }
    
}

