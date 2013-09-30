package com.ay.health.checkup.pojo;

import com.ay.framework.annotation.ChineseName;
import com.ay.framework.annotation.MultiLineField;
import com.ay.framework.core.pojo.BasePojo;

/** 
 * @Description
 * @date 2013-6-7
 * @author shenhuanan
 */
//@ChineseName("体检信息")
public class CheckUp extends BasePojo{
    private String pid;
    private String employeeName;
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
    @ChineseName("备注")
    @MultiLineField
    private String remark;
    private String date;
    private String high;
    private String low;
    //工号
	private String jobNum;
	//员工姓名
	private String name;
	//员工专业
	private String major;
	//员工岗位
	private String post;
	//结果
	private String result;
	//部门
	private String done;
	private String dtwo;
	//身份证ID
	private String idNumber;
	
	
    public String getIdNumber() {
		return idNumber;
	}
	public void setIdNumber(String idNumber) {
		this.idNumber = idNumber;
	}
	public String getDone() {
		return done;
	}
	public void setDone(String done) {
		this.done = done;
	}
	public String getDtwo() {
		return dtwo;
	}
	public void setDtwo(String dtwo) {
		this.dtwo = dtwo;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	public String getJobNum() {
		return jobNum;
	}
	public void setJobNum(String jobNum) {
		this.jobNum = jobNum;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	public String getPost() {
		return post;
	}
	public void setPost(String post) {
		this.post = post;
	}
	public String getEmployeeName() {
		return employeeName;
	}
	public void setEmployeeName(String employeeName) {
		this.employeeName = employeeName;
	}
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
    public String getRemark()
    {
        return remark;
    }
    public void setRemark(String remark)
    {
        this.remark = remark;
    }
    public String getPid()
    {
        return pid;
    }
    public void setPid(String pid)
    {
        this.pid = pid;
    }
    public String getDate()
    {
        return date;
    }
    public void setDate(String date)
    {
        this.date = date;
    }
    public String getHigh()
    {
        return high;
    }
    public void setHigh(String high)
    {
        this.high = high;
    }
    public String getLow()
    {
        return low;
    }
    public void setLow(String low)
    {
        this.low = low;
    }
	
   
   
}
