package com.ay.knowlbase.accidentCase.pojo;


import com.ay.framework.core.pojo.BasePojo;

/**
 * 安全生产标准
 * @author SangWei
 * 2013-3-18
 */
@SuppressWarnings("all")
public class AccKnowlbase extends BasePojo
{
    /** 事故标题*/
    private String caseTitle;
    
    /** 发生日期*/
    private String caseTime;
    
    /** 发生地点*/
    private String caseAddress;
    
    /** 事故类型*/
    private String caseType;
    
    /** 事故类型ID*/
    private String caseTypeId;

    /** 涉及行业*/
    private String caseTrade;
    
    /** 事故模型*/
    private String model;
    
    /**事故起因*/
    private String caseCause;
    
    /** 预防措施*/
    private String precaution;

    public String getCaseTitle()
    {
        return caseTitle;
    }

    public void setCaseTitle(String caseTitle)
    {
        this.caseTitle = caseTitle;
    }

    public String getCaseTime()
    {
        return caseTime;
    }

    public void setCaseTime(String caseTime)
    {
        this.caseTime = caseTime;
    }

    public String getCaseAddress()
    {
        return caseAddress;
    }

    public void setCaseAddress(String caseAddress)
    {
        this.caseAddress = caseAddress;
    }

    public String getCaseType()
    {
        return caseType;
    }

    public void setCaseType(String caseType)
    {
        this.caseType = caseType;
    }

    public String getCaseTypeId()
    {
        return caseTypeId;
    }

    public void setCaseTypeId(String caseTypeId)
    {
        this.caseTypeId = caseTypeId;
    }
    
    public String getCaseTrade()
    {
        return caseTrade;
    }

    public void setCaseTrade(String caseTrade)
    {
        this.caseTrade = caseTrade;
    }

    public String getModel()
    {
        return model;
    }

    public void setModel(String model)
    {
        this.model = model;
    }

    public String getCaseCause()
    {
        return caseCause;
    }

    public void setCaseCause(String caseCause)
    {
        this.caseCause = caseCause;
    }

    public String getPrecaution()
    {
        return precaution;
    }

    public void setPrecaution(String precaution)
    {
        this.precaution = precaution;
    }
    
    
}
