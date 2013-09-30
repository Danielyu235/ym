package com.ay.health.deploy.pojo;

import com.ay.framework.annotation.ChineseName;
import com.ay.framework.core.pojo.BasePojo;
/** 
 * @Description
 * @date 2013-6-7
 * @author shenhuanan
 */
//@ChineseName("体检结果配置")
public class Deploy extends BasePojo
{
    
    @ChineseName("血压-低")
    private String bloodPressureLow;
    @ChineseName("血压-高")
    private String bloodPressureHigh;
    @ChineseName("脉率")
    private String pulseRate;
    @ChineseName("心电图")
    private String electrocardiogram ;
    @ChineseName("B超")
    private String bc;
    @ChineseName("尘肺病")
    private String pneumoconiosis;
    @ChineseName("血液检查")
    private String bloodExamination;
    @ChineseName("肝肾功能")
    private String lkExamination;
    @ChineseName("神经系统")
    private String nervousSystem;
    @ChineseName("甲状腺")
    private String  thyroid;
    @ChineseName("浅表淋巴结")
    private String  superficialLymphadenopathy;
    @ChineseName("皮肤黏膜")
    private String  skinAndMucosa;
    public String getBloodPressureLow()
    {
        return bloodPressureLow;
    }
    public void setBloodPressureLow(String bloodPressureLow)
    {
        this.bloodPressureLow = bloodPressureLow;
    }
    public String getBloodPressureHigh()
    {
        return bloodPressureHigh;
    }
    public void setBloodPressureHigh(String bloodPressureHigh)
    {
        this.bloodPressureHigh = bloodPressureHigh;
    }
    public String getPulseRate()
    {
        return pulseRate;
    }
    public void setPulseRate(String pulseRate)
    {
        this.pulseRate = pulseRate;
    }
    public String getElectrocardiogram()
    {
        return electrocardiogram;
    }
    public void setElectrocardiogram(String electrocardiogram)
    {
        this.electrocardiogram = electrocardiogram;
    }
    public String getBc()
    {
        return bc;
    }
    public void setBc(String bc)
    {
        this.bc = bc;
    }
    public String getPneumoconiosis()
    {
        return pneumoconiosis;
    }
    public void setPneumoconiosis(String pneumoconiosis)
    {
        this.pneumoconiosis = pneumoconiosis;
    }
    public String getBloodExamination()
    {
        return bloodExamination;
    }
    public void setBloodExamination(String bloodExamination)
    {
        this.bloodExamination = bloodExamination;
    }
    public String getLkExamination()
    {
        return lkExamination;
    }
    public void setLkExamination(String lkExamination)
    {
        this.lkExamination = lkExamination;
    }
    public String getNervousSystem()
    {
        return nervousSystem;
    }
    public void setNervousSystem(String nervousSystem)
    {
        this.nervousSystem = nervousSystem;
    }
    public String getThyroid()
    {
        return thyroid;
    }
    public void setThyroid(String thyroid)
    {
        this.thyroid = thyroid;
    }
    public String getSuperficialLymphadenopathy()
    {
        return superficialLymphadenopathy;
    }
    public void setSuperficialLymphadenopathy(String superficialLymphadenopathy)
    {
        this.superficialLymphadenopathy = superficialLymphadenopathy;
    }
    public String getSkinAndMucosa()
    {
        return skinAndMucosa;
    }
    public void setSkinAndMucosa(String skinAndMucosa)
    {
        this.skinAndMucosa = skinAndMucosa;
    }
    
    
}
