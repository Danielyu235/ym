package com.ay.emergency.resource.headquarters.pojo;

import com.ay.framework.annotation.ChineseName;
import com.ay.framework.core.pojo.BasePojo;

//@ChineseName("应急指挥中心")
public class Headquarters extends BasePojo {
	
	@ChineseName("指挥中心名称")
	private String name;
	
	@ChineseName("指挥中心地址")
	private String address;
	
	@ChineseName("指挥中心电话")
	private String phoneNumber;
	
	@ChineseName("负责人")
	private String personincharge;
	
	@ChineseName("负责人电话")
	private String chargePhoneNumber;
	
	@ChineseName("事故类型")
	private String type;
    
	
	public String getType()
    {
        return type;
    }

    public void setType(String type)
    {
        this.type = type;
    }

    public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getPersonincharge() {
		return personincharge;
	}

	public void setPersonincharge(String personincharge) {
		this.personincharge = personincharge;
	}

	public String getChargePhoneNumber() {
		return chargePhoneNumber;
	}

	public void setChargePhoneNumber(String chargePhoneNumber) {
		this.chargePhoneNumber = chargePhoneNumber;
	}

	@Override
	public String toString() {
		return "Headquarters [address=" + address + ", chargePhoneNumber="
				+ chargePhoneNumber + ", name=" + name + ", personincharge="
				+ personincharge + ", phoneNumber=" + phoneNumber + "]";
	}	
	
}
