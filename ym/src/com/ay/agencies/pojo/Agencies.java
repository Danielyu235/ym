package com.ay.agencies.pojo;

import com.ay.framework.annotation.ChineseName;
import com.ay.framework.core.pojo.BasePojo;
//@ChineseName("救援机构反馈信息")
public class Agencies extends BasePojo
{   
    @ChineseName("事故ID")
    private String accidentId;
    
    
    @ChineseName("救援机构")
    private String aidAgencies;
    
    @ChineseName("救援措施")
    private String measures;
    
    @ChineseName("负责人")
    private String head;
    
    @ChineseName("执行时间")
    private String executeTime;
    
    
    public String getAccidentId()
    {
        return accidentId;
    }

    public void setAccidentId(String accidentId)
    {
        this.accidentId = accidentId;
    }

    public String getAidAgencies()
    {
        return aidAgencies;
    }

    public void setAidAgencies(String aidAgencies)
    {
        this.aidAgencies = aidAgencies;
    }

    public String getMeasures()
    {
        return measures;
    }

    public void setMeasures(String measures)
    {
        this.measures = measures;
    }

    public String getHead()
    {
        return head;
    }

    public void setHead(String head)
    {
        this.head = head;
    }

    public String getExecuteTime()
    {
        return executeTime;
    }

    public void setExecuteTime(String executeTime)
    {
        this.executeTime = executeTime;
    }
    
    


}
