package com.ay.knowlbase.criterion.pojo;


import com.ay.framework.core.pojo.BasePojo;

/**
 * 安全生产标准
 * @author SangWei
 * 2013-3-18
 */
@SuppressWarnings("all")
public class CriKnowlbase extends BasePojo
{
    /** 标准编号 */
    private String bzNum;
    
    /** 标准名称 */
    private String bzName;
    
    /** 标准类型 */
    private String bzType;
     
    /** 标准类型中文 */
    private String bzTypeId;

    /** 颁布日期 */
    private String publishTime;
    
    /** 实施日期 */
    private String implementTime;
    
    /** 生效日期 */
    private String effectiveTime;
    
    /** 颁布部门 */
    private String promDepartment;
    
    /** 标准内容 */
    private String content;
    
    /** 附件路径 */
    private String attachPath;

    public String getBzNum()
    {
        return bzNum;
    }

    public void setBzNum(String bzNum)
    {
        this.bzNum = bzNum;
    }

    public String getBzName()
    {
        return bzName;
    }

    public void setBzName(String bzName)
    {
        this.bzName = bzName;
    }

    public String getBzType()
    {
        return bzType;
    }

    public void setBzType(String bzType)
    {
        this.bzType = bzType;
    }
    
    public String getBzTypeId()
    {
        return bzTypeId;
    }

    public void setBzTypeId(String bzTypeId)
    {
        this.bzTypeId = bzTypeId;
    }
    
    public String getPublishTime()
    {
        return publishTime;
    }

    public void setPublishTime(String publishTime)
    {
        this.publishTime = publishTime;
    }

    public String getImplementTime()
    {
        return implementTime;
    }

    public void setImplementTime(String implementTime)
    {
        this.implementTime = implementTime;
    }

    public String getEffectiveTime()
    {
        return effectiveTime;
    }

    public void setEffectiveTime(String effectiveTime)
    {
        this.effectiveTime = effectiveTime;
    }

    public String getPromDepartment()
    {
        return promDepartment;
    }

    public void setPromDepartment(String promDepartment)
    {
        this.promDepartment = promDepartment;
    }

    public String getContent()
    {
        return content;
    }

    public void setContent(String content)
    {
        this.content = content;
    }

    public String getAttachPath()
    {
        return attachPath;
    }

    public void setAttachPath(String attachPath)
    {
        this.attachPath = attachPath;
    }

    
}
