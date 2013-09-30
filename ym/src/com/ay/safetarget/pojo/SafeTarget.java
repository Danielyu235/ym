package com.ay.safetarget.pojo;

import com.ay.framework.annotation.ChineseName;
import com.ay.framework.core.pojo.BasePojo;

//@ChineseName("安全评价指标体系")
public class SafeTarget extends BasePojo{
	@ChineseName("分数")
	private String value;
	
	@ChineseName("概率值")
	private String gl;
	
	@ChineseName("模拟类型")
	private String testType;
	
	@ChineseName("时间")
	private String testTime;

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public String getGl() {
		return gl;
	}

	public void setGl(String gl) {
		this.gl = gl;
	}

	public String getTestType() {
		return testType;
	}

	public void setTestType(String testType) {
		this.testType = testType;
	}

	public String getTestTime() {
		return testTime;
	}

	public void setTestTime(String testTime) {
		this.testTime = testTime;
	}


	
     
}
















