package com.ay.knowlbase.law.pojo;


import com.ay.framework.core.pojo.BasePojo;

/**
 * 安全生产法规
 * @author SangWei
 * 2013-3-18
 */
@SuppressWarnings("all")
public class LawKnowlbase extends BasePojo
{
    /** 法规编号 */
    private String fgNum;
    
    /** 法规名称 */
    private String fgName;
    
    /** 法规类型 */
    private String fgType;
    
    /** 法规类型ID */
    private String fgTypeId;

    /** 颁布日期 */
    private String publishTime;
    
    /** 实施日期 */
    private String implementTime;
    
    /** 生效日期 */
    private String effectiveTime;
    
    /** 颁布部门 */
    private String promDepartment;
    
    /** 颁布地区 */
    private String promArea;
    private String promAreaId;
    
    /** 法规内容 */
    private String content;
    
    /** 附件路径 */
    private String attachPath;

    public String getPromAreaId()
    {
        return promAreaId;
    }

    public void setPromAreaId(String promAreaId)
    {
        this.promAreaId = promAreaId;
    }

    public String getFgNum()
    {
        return fgNum;
    }

    public void setFgNum(String fgNum)
    {
        this.fgNum = fgNum;
    }

    public String getFgName()
    {
        return fgName;
    }

    public void setFgName(String fgName)
    {
        this.fgName = fgName;
    }

    public String getFgType()
    {
        return fgType;
    }

    public void setFgType(String fgType)
    {
        this.fgType = fgType;
    }
    
    public String getFgTypeId()
    {
        return fgTypeId;
    }

    public void setFgTypeId(String fgTypeId)
    {
        this.fgTypeId = fgTypeId;
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

    public String getPromArea()
    {
        return promArea;
    }

    public void setPromArea(String promArea)
    {
        this.promArea = promArea;
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
