package com.ay.jfds.sys.pojo;

import org.apache.commons.lang.builder.ToStringBuilder;

import com.ay.framework.core.pojo.BasePojo;

/**
 * 部门表
 */
@SuppressWarnings("serial")
public class Department extends BasePojo {
	/** 部门的父类 */
	private String parentId;
	
	/** 部门名称 */
	private String deptName;
	
	/** 排序 */
	private int deptOrder;
	
	public String getParentId() {
		return parentId;
	}

	public void setParentId(String parentId) {
		this.parentId = parentId;
	}

	public String getDeptName() {
		return deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	public int getDeptOrder() {
		return deptOrder;
	}

	public void setDeptOrder(int deptOrder) {
		this.deptOrder = deptOrder;
	}

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}
}
