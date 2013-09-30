package com.ay.colliery.theme.CoalMiningSysTheme.pojo;

import com.ay.framework.annotation.ChineseName;
import com.ay.framework.annotation.PersistenceIgnore;
import com.ay.framework.core.pojo.BasePojo;
/***
 * 采煤系统主题实体类
 * @author zhangxiang
 * 2013-05-21
 */
//@ChineseName("采煤系统")
public class CoalMiningSysTheme extends BasePojo {
	@ChineseName("实际产量")
	private String realityOutput;
	@ChineseName("计划产量")
	private String planOutput;
	@ChineseName("开采日期")
	private String mine_date;
	@ChineseName("所属工作面")
	private String workingFaceId;
	//所属工作面对应的中文
	@PersistenceIgnore
	private String workingFaceName;
	public String getRealityOutput() {
		return realityOutput;
	}
	public void setRealityOutput(String realityOutput) {
		this.realityOutput = realityOutput;
	}
	public String getPlanOutput() {
		return planOutput;
	}
	public void setPlanOutput(String planOutput) {
		this.planOutput = planOutput;
	}
	public String getMine_date() {
		return mine_date;
	}
	public void setMine_date(String mineDate) {
		mine_date = mineDate;
	}
	public String getWorkingFaceId() {
		return workingFaceId;
	}
	public void setWorkingFaceId(String workingFaceId) {
		this.workingFaceId = workingFaceId;
	}
	public String getWorkingFaceName() {
		return workingFaceName;
	}
	public void setWorkingFaceName(String workingFaceName) {
		this.workingFaceName = workingFaceName;
	}
	@Override
	public String toString() {
		return "CoalMiningSysTheme [mine_date=" + mine_date + ", planOutput="
				+ planOutput + ", realityOutput=" + realityOutput
				+ ", workingFaceId=" + workingFaceId + ", workingFaceName="
				+ workingFaceName + "]";
	}
	
}
