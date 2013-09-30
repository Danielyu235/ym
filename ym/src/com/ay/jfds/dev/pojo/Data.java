package com.ay.jfds.dev.pojo;

import java.util.Date;

import org.apache.commons.lang.builder.ToStringBuilder;

import com.ay.framework.core.pojo.BasePojo;

/**
 * 元数据
 * 
 * @author PS
 * 
 */
@SuppressWarnings("all")
public class Data extends BasePojo {
	/** 类别ID */
	private String typeId;

	/** 数据编码 */
	private String dataCode;

	/** 数据名称 */
	private String dataName;

	/** 数据顺序 */
	private int dataOrder;

	/** 父节点ID */
	private String parentId;

	public String getTypeId() {
		return typeId;
	}

	public void setTypeId(String typeId) {
		this.typeId = typeId;
	}

	public String getDataCode() {
		return dataCode;
	}

	public void setDataCode(String dataCode) {
		this.dataCode = dataCode;
	}

	public String getDataName() {
		return dataName;
	}

	public void setDataName(String dataName) {
		this.dataName = dataName;
	}

	public int getDataOrder() {
		return dataOrder;
	}

	public void setDataOrder(int dataOrder) {
		this.dataOrder = dataOrder;
	}

	public String getParentId() {
		return parentId;
	}

	public void setParentId(String parentId) {
		this.parentId = parentId;
	}

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}

}
