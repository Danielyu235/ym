package com.ay.hazards.identification.impl;

import com.ay.hazards.boiler.pojo.BoilerHazards;
import com.ay.hazards.identification.HazardsInfo;
import com.ay.hazards.identification.IHazards;
import com.ay.hazards.identification.IHazardsIdentification;
import com.ay.hazards.identification.IdentificationResult;
import com.fasterxml.jackson.annotation.JsonTypeInfo.Id;

/** 
 * @Description 锅炉辨识类
 * @date 2013-4-11
 * @author WangXin
 */
public class BoilerIdentification implements IHazardsIdentification {
    /**
     * 1T/h=1000kg/h=0.7MW=720kW=60万kcal/h=600Mcal/h
     * 1Mcal/h = 0.7/600MW
     */
    @Override
    public IdentificationResult isMajorHazards(IHazards hazards) {
	BoilerHazards bh = (BoilerHazards) hazards;
	HazardsInfo hi = new HazardsInfo(bh.getBoilerName(),bh.getId(), bh.getHazardsType(), "锅炉",
		bh.getDwdm(), bh.getCorpName());
	String type = bh.getBoilerType();
	if(type != null && type.equals("蒸汽锅炉")) {
	    //设计工作压力	MPa
	    float desginWorkPressure = 0;
	    //额定出力	  t/h
	    float limitOutput = 0;
	    try {
		desginWorkPressure = Float.parseFloat(bh.getDesginWorkPressure());
	    } catch (NumberFormatException e) {
		return IdentificationResult.error(hi, "额定蒸汽压力错误");
	    }
	    try {
		limitOutput = Float.parseFloat(bh.getLimitOutput());
	    } catch (NumberFormatException e) {
		return IdentificationResult.error(hi, "额定蒸发量错误");
	    }
	    if(desginWorkPressure > 2.5f && limitOutput >= 10) {
		return IdentificationResult.isMajorHazards(hi);
	    } else {
		return IdentificationResult.isNotMajorHazards(hi);
	    }
	} else { 
	    //热水锅炉
	    
	    //介质出口温度	℃
	    float agentEcportTemperature = 0;
	    //额定供热量 KCal/h
	    float fixLayHeat = 0;
	    try {
		agentEcportTemperature = Float.parseFloat(bh.getAgentEcportTemperature());
	    } catch (NumberFormatException e) {
		return IdentificationResult.error(hi, "额定出水温度错误");
	    }
	    try {
		fixLayHeat = Float.parseFloat(bh.getFixLayHeat());
	    } catch (NumberFormatException e) {
		return IdentificationResult.error(hi, "额定功率错误");
	    }
	    //14MW = 12000KCal/h
	    if(agentEcportTemperature >= 120 && fixLayHeat >= 12000) {
		return IdentificationResult.isMajorHazards(hi);
	    } else {
		return IdentificationResult.isNotMajorHazards(hi);
	    }
	}
    }
    

}

