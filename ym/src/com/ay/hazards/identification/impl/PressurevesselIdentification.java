package com.ay.hazards.identification.impl;

import com.ay.hazards.hazardousmaterials.pojo.Materials;
import com.ay.hazards.identification.HazardsInfo;
import com.ay.hazards.identification.IHazards;
import com.ay.hazards.identification.IHazardsIdentification;
import com.ay.hazards.identification.IdentificationResult;
import com.ay.hazards.pressurevessel.pojo.PressureVesselHazards;

/** 
 * @Description 压力容器辨识类
 * @date 2013-4-11
 * @author WangXin
 */
public class PressurevesselIdentification implements IHazardsIdentification {

    @Override
    public IdentificationResult isMajorHazards(IHazards hazards) {
	PressureVesselHazards pv = (PressureVesselHazards) hazards;
	HazardsInfo hi = new HazardsInfo(pv.getName(),pv.getId(), pv.getHazardsType(), "压力容器", pv.getDwdm(), pv.getCorpName());
	Materials m = pv.getMaterials();
	if(m == null || m.getType() == null) {
	    return IdentificationResult.error(hi, "没有危险物质信息");
	}
	if(m.getType().contains("毒")) { //毒的程度暂时无法判断
	    return IdentificationResult.isMajorHazards(hi);
	} else if(m.getType().contains("燃")) {
	    String pressure = pv.getZggzyl();
	    String volumn = pv.getVolume();
	    //PV值是指压力容器的P（pressure压力）和V(volume容积)的乘积。
	    float p = 0;
	    float v = 0;
	    try {
		p = Float.parseFloat(pressure);
	    } catch (NumberFormatException e) {
		return IdentificationResult.error(hi, "最高工作压力数据错误");
	    }
	    try {
		v = Float.parseFloat(volumn);
	    } catch (NumberFormatException e) {
		return IdentificationResult.error(hi, "容积数据错误");
	    }
	    if(p >= 0.1 && p*v >= 100) {
		return IdentificationResult.isMajorHazards(hi);
	    }
	}
	return IdentificationResult.isNotMajorHazards(hi);
    }

}

