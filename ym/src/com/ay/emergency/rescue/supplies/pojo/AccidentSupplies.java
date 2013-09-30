package com.ay.emergency.rescue.supplies.pojo;

import com.ay.framework.annotation.ChineseName;
import com.ay.framework.core.pojo.BasePojo;
//@ChineseName("事故调用物资")
public class AccidentSupplies extends BasePojo {
	@ChineseName("事故Id")
	private String acId;
	@ChineseName("物质名称")
	private String materialName;
	@ChineseName("型号")
	private String model;
	@ChineseName("单位")
	private String unit;
	@ChineseName("数量")
	private String num;
	@ChineseName("库号")
	private String warehouse;
	@ChineseName("备注")
	private String remark;
	public String getAcId() {
		return acId;
	}
	public void setAcId(String acId) {
		this.acId = acId;
	}
	public String getMaterialName() {
		return materialName;
	}
	public void setMaterialName(String materialName) {
		this.materialName = materialName;
	}
	public String getModel() {
		return model;
	}
	public void setModel(String model) {
		this.model = model;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getWarehouse() {
		return warehouse;
	}
	public void setWarehouse(String warehouse) {
		this.warehouse = warehouse;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	
}
