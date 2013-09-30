package com.ay.emergency.rescue.accidentconclusion.pojo;

import com.ay.framework.annotation.ChineseName;
import com.ay.framework.core.pojo.BasePojo;
//@ChineseName("事故总结报告")
public class AccidentConclusion extends BasePojo
{   
	//事故ID
	private String aid;
	
    @ChineseName("报告名称")
    private String reportName;
    
    @ChineseName("事故信息")
    private String accidentInfo;
    
    @ChineseName("事故类型")
    private String type;
    
    @ChineseName("事故发生时间")
    private String happenTime;
    
    @ChineseName("事故地点")
    private String accidentAddress;
    
    @ChineseName("事故过程描述")
    private String accidentProcess;
    
    @ChineseName("报警人")
    private String callPolice;
    
    @ChineseName("报警人电话")
    private String callPhone;
    
    @ChineseName("接警人")
    private String calledMan;
    
    @ChineseName("接警时间")
    private String calledTime;
    
    @ChineseName("启用预案名称")
    private String planName;
    
    @ChineseName("预案级别")
    private String planLevel;
    
    @ChineseName("预案类型")
    private String planType;
    
    @ChineseName("死亡人数")
    private String deadNum;
    
    @ChineseName("受伤人数")
    private String injuredNum;
    
    @ChineseName("失踪人数")
    private String missingNum;
    
    @ChineseName("住院人数")
    private String hospitalNum;
    
    @ChineseName("直接财产损失")
    private String directLose;
    
    @ChineseName("间接财产损失")
    private String indirectLose;
    
    @ChineseName("事故评价")
    private String accidentEvaluation;
    
    @ChineseName("专家意见")
    private String expertOpinion;
    
    @ChineseName("总指挥意见")
    private String zzhOpinion;
    
    @ChineseName("备注")
    private String note;
      
    
    @Override
	public String toString() {
		return "AccidentConclusion [accidentAddress=" + accidentAddress
				+ ", accidentEvaluation=" + accidentEvaluation
				+ ", accidentInfo=" + accidentInfo + ", accidentProcess="
				+ accidentProcess + ", aid=" + aid + ", callPhone=" + callPhone
				+ ", callPolice=" + callPolice + ", calledMan=" + calledMan
				+ ", calledTime=" + calledTime + ", deadNum=" + deadNum
				+ ", directLose=" + directLose + ", expertOpinion="
				+ expertOpinion + ", happenTime=" + happenTime
				+ ", hospitalNum=" + hospitalNum + ", indirectLose="
				+ indirectLose + ", injuredNum=" + injuredNum + ", missingNum="
				+ missingNum + ", note=" + note + ", planLevel=" + planLevel
				+ ", planName=" + planName + ", planType=" + planType
				+ ", reportName=" + reportName + ", type=" + type
				+ ", zzhOpinion=" + zzhOpinion + "]";
	}

	public String getAid() {
		return aid;
	}

	public void setAid(String aid) {
		this.aid = aid;
	}

	public String getReportName()
    {
        return reportName;
    }

    public void setReportName(String reportName)
    {
        this.reportName = reportName;
    }

    public String getAccidentInfo()
    {
        return accidentInfo;
    }

    public void setAccidentInfo(String accidentInfo)
    {
        this.accidentInfo = accidentInfo;
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

    public String getAccidentAddress()
    {
        return accidentAddress;
    }

    public void setAccidentAddress(String accidentAddress)
    {
        this.accidentAddress = accidentAddress;
    }

    public String getAccidentProcess()
    {
        return accidentProcess;
    }

    public void setAccidentProcess(String accidentProcess)
    {
        this.accidentProcess = accidentProcess;
    }

    public String getCallPolice()
    {
        return callPolice;
    }

    public void setCallPolice(String callPolice)
    {
        this.callPolice = callPolice;
    }

    public String getCallPhone()
    {
        return callPhone;
    }

    public void setCallPhone(String callPhone)
    {
        this.callPhone = callPhone;
    }

    public String getCalledMan()
    {
        return calledMan;
    }

    public void setCalledMan(String calledMan)
    {
        this.calledMan = calledMan;
    }

    public String getCalledTime()
    {
        return calledTime;
    }

    public void setCalledTime(String calledTime)
    {
        this.calledTime = calledTime;
    }

    public String getPlanName()
    {
        return planName;
    }

    public void setPlanName(String planName)
    {
        this.planName = planName;
    }

    public String getPlanLevel()
    {
        return planLevel;
    }

    public void setPlanLevel(String planLevel)
    {
        this.planLevel = planLevel;
    }

    public String getPlanType()
    {
        return planType;
    }

    public void setPlanType(String planType)
    {
        this.planType = planType;
    }

    public String getDeadNum()
    {
        return deadNum;
    }

    public void setDeadNum(String deadNum)
    {
        this.deadNum = deadNum;
    }

    public String getInjuredNum()
    {
        return injuredNum;
    }

    public void setInjuredNum(String injuredNum)
    {
        this.injuredNum = injuredNum;
    }

    public String getMissingNum()
    {
        return missingNum;
    }

    public void setMissingNum(String missingNum)
    {
        this.missingNum = missingNum;
    }

    public String getHospitalNum()
    {
        return hospitalNum;
    }

    public void setHospitalNum(String hospitalNum)
    {
        this.hospitalNum = hospitalNum;
    }

    public String getDirectLose()
    {
        return directLose;
    }

    public void setDirectLose(String directLose)
    {
        this.directLose = directLose;
    }

    public String getIndirectLose()
    {
        return indirectLose;
    }

    public void setIndirectLose(String indirectLose)
    {
        this.indirectLose = indirectLose;
    }

    public String getAccidentEvaluation()
    {
        return accidentEvaluation;
    }

    public void setAccidentEvaluation(String accidentEvaluation)
    {
        this.accidentEvaluation = accidentEvaluation;
    }

    public String getExpertOpinion()
    {
        return expertOpinion;
    }

    public void setExpertOpinion(String expertOpinion)
    {
        this.expertOpinion = expertOpinion;
    }

    public String getZzhOpinion()
    {
        return zzhOpinion;
    }

    public void setZzhOpinion(String zzhOpinion)
    {
        this.zzhOpinion = zzhOpinion;
    }

    public String getNote()
    {
        return note;
    }

    public void setNote(String note)
    {
        this.note = note;
    }
    
    
}
