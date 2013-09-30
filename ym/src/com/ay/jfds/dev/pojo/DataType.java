package com.ay.jfds.dev.pojo;

import java.util.Date;

import org.apache.commons.lang.builder.ToStringBuilder;

import com.ay.framework.core.pojo.BasePojo;

/**
 * 元数据类别
 * 
 * @author PS
 * 
 */
public class DataType extends BasePojo {

	/** 类别名称 */
	private String typeName;

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}
}
