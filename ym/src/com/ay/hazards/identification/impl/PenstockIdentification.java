package com.ay.hazards.identification.impl;

import com.ay.hazards.hazardousmaterials.pojo.Materials;
import com.ay.hazards.identification.HazardsInfo;
import com.ay.hazards.identification.IHazards;
import com.ay.hazards.identification.IHazardsIdentification;
import com.ay.hazards.identification.IdentificationResult;
import com.ay.hazards.penstock.pojo.PenstockHazards;

/** 
 * @Description 压力管道辨识类
 * @date 2013-4-11
 * @author WangXin
 */
public class PenstockIdentification implements IHazardsIdentification {

    @Override
    public IdentificationResult isMajorHazards(IHazards hazards) { //need to alter
	PenstockHazards ph = (PenstockHazards) hazards;
	HazardsInfo hi = new HazardsInfo(ph.getGdmc(),ph.getId(), ph.getHazardsType(), "压力管道",
		ph.getDwdm(), ph.getCorpName());
	//管道类别
	String type = ph.getGdlb();
	//传输介质名称
	Materials m = ph.getMaterials();
	if (m == null) return IdentificationResult.error(hi, "没有传输介质信息");
	String materialsType = m.getType();
	if(materialsType == null) return IdentificationResult.error(hi, "没有传输介质类型信息");
	//危险物质
	if(type == null) return IdentificationResult.error(hi, "没有管道类别信息");
	//工作压力（MPa）
	String pressure = ph.getGzyl();
	//公称直径（mm）
	String zj = ph.getGdzj();
	//管道长度（m）
	String length = ph.getGdcd();
	//工作温度（℃）
	String temp = ph.getGzwd();
	float pressureNum = 0;
	float zjNum = 0;
	float lengthNum = 0;
	float tempNum = 0;
	try {
	    pressureNum = Float.parseFloat(pressure);
	} catch (NumberFormatException e) {
	    return IdentificationResult.error(hi, "工作压力数据错误");
	}
	try {
	    zjNum = Float.parseFloat(zj);
	} catch (NumberFormatException e) {
	    return IdentificationResult.error(hi, "公称直径数据错误");
	}
	try {
	    lengthNum = Float.parseFloat(length);
	} catch (NumberFormatException e) {
	    return IdentificationResult.error(hi, "管道长度数据错误");
	}
	try {
	    tempNum = Float.parseFloat(temp);
	} catch (NumberFormatException e) {
	    return IdentificationResult.error(hi, "工作温度数据错误");
	}
	if(type.equals("长输管道")) {
	    if (materialsType.contains("毒") || materialsType.contains("燃")
		    || materialsType.contains("爆")) {
		if(pressureNum >= 1.6 || (lengthNum >= 200*1000 && zjNum >=300)) {
		    return IdentificationResult.isMajorHazards(hi);
		}
	    }
	} else if(type.equals("公用管道")) {
	    if(zjNum >= 200) {
		return IdentificationResult.isMajorHazards(hi);
	    }
	} else if(type.equals("工业管道")) { 
	    if ((materialsType.contains("毒") && zjNum >= 100)
		    || (materialsType.contains("燃") && zjNum >= 100 && pressureNum >= 4)
		    || (zjNum >= 100 && pressureNum >= 4 && tempNum >= 400)) {
		return IdentificationResult.isMajorHazards(hi);
	    }
	}
	return IdentificationResult.isNotMajorHazards(hi);
    }

}

