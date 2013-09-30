package com.ay.emergency.rescue.accidentsurvey.pojo;

import com.ay.framework.annotation.ChineseName;
import com.ay.framework.core.pojo.BasePojo;

//@ChineseName("事故调查")
public class AccidentSurvery extends BasePojo
{
	
	//事故ID
	private String aid;
	
    @ChineseName("事故类型")
    private  String type;
    
    @ChineseName("事故发生时间")
    private String happenTime;
    
    @ChineseName("事故地点")
    private String address;
    
    @ChineseName("事故地点概况")
    private String siteProfile;
    
    @ChineseName("事故前安全监管情况")
    private  String safetyRegulation;
    
    @ChineseName("事故发生情况及抢救情况")
    private String safeRescueSituation;
    
    @ChineseName("人员伤亡和直接经济损失")
    private String losses;
    
    @ChineseName("直接原因")
    private String immediateCause;
    
    @ChineseName("间接原因")
    private String indirectReason;
    
    @ChineseName("事故性质")
    private String accdientNature;
    
    @ChineseName("责任划分与处理建议")
    private String responsibility;

    
    
    public String getAid() {
		return aid;
	}

	public void setAid(String aid) {
		this.aid = aid;
	}

	public String getType()
    {
        return type;
    }

    public void setType(String type)
    {
        this.type = type;
    }

    public String getHappenTime()
    {
        return happenTime;
    }

    public void setHappenTime(String happenTime)
    {
        this.happenTime = happenTime;
    }

    public String getAddress()
    {
        return address;
    }

    public void setAddress(String address)
    {
        this.address = address;
    }

    public String getSiteProfile()
    {
        return siteProfile;
    }

    public void setSiteProfile(String siteProfile)
    {
        this.siteProfile = siteProfile;
    }

    public String getSafetyRegulation()
    {
        return safetyRegulation;
    }

    public void setSafetyRegulation(String safetyRegulation)
    {
        this.safetyRegulation = safetyRegulation;
    }

    public String getSafeRescueSituation()
    {
        return safeRescueSituation;
    }

    public void setSafeRescueSituation(String safeRescueSituation)
    {
        this.safeRescueSituation = safeRescueSituation;
    }

    public String getLosses()
    {
        return losses;
    }

    public void setLosses(String losses)
    {
        this.losses = losses;
    }

    public String getImmediateCause()
    {
        return immediateCause;
    }

    public void setImmediateCause(String immediateCause)
    {
        this.immediateCause = immediateCause;
    }

    public String getIndirectReason()
    {
        return indirectReason;
    }

    public void setIndirectReason(String indirectReason)
    {
        this.indirectReason = indirectReason;
    }

    public String getAccdientNature()
    {
        return accdientNature;
    }

    public void setAccdientNature(String accdientNature)
    {
        this.accdientNature = accdientNature;
    }

    public String getResponsibility()
    {
        return responsibility;
    }

    public void setResponsibility(String responsibility)
    {
        this.responsibility = responsibility;
    }
    
    
}
