package com.ay.hazards.identification.impl;

import java.util.List;

import com.ay.hazards.hazardousmaterials.pojo.Materials;
import com.ay.hazards.identification.HazardsInfo;
import com.ay.hazards.identification.IHazards;
import com.ay.hazards.identification.IHazardsIdentification;
import com.ay.hazards.identification.IdentificationResult;
import com.ay.hazards.materials.pojo.MaterialsHazards;
import com.ay.hazards.tank.pojo.TankHazards;
import com.ay.hazards.workplace.pojo.WorkplaceHazards;

/** 
 * @Description 生产场所辨识类
 * @date 2013-4-11
 * @author WangXin
 */
public class WorkplaceIdentification implements IHazardsIdentification {

    @Override
    public IdentificationResult isMajorHazards(IHazards hazards) {
	WorkplaceHazards hw = (WorkplaceHazards) hazards;
	HazardsInfo hi = new HazardsInfo(hw.getDymc(),hw.getId(), hw.getHazardsType(), "生产场所",
		hw.getDwdm(), hw.getCorpName());
	List<MaterialsHazards> list = hw.getList();
	if(list == null || list.isEmpty()) return IdentificationResult.error(hi, "没有危险物质信息");
	float result = 0;
	for(MaterialsHazards hm: list) {
	    //现存物质总量(t)
	    String xcwzzl = hm.getXcwzzl();
	    //危险物质
	    Materials m =hm.getMaterials();
	    if(m == null) return IdentificationResult.error(hi, "没有危险物质信息");
	    //危险物质的临界量
	    String quantity = m.getThresholdQuantity();
	    float q = 0;
	    float Q = 0;
	    try {
		q = Float.parseFloat(xcwzzl);
	    } catch (NumberFormatException e1) {
		return IdentificationResult.error(hi, "现存物质总量数据错误");
	    }
	    try {
		Q = Float.parseFloat(quantity);
	    } catch (NumberFormatException e) {
		return IdentificationResult.error(hi, "危险物质临界量数据错误");
	    }
	    result += (float)q/Q;
	}
	if(result >= 1) {
	    return IdentificationResult.isMajorHazards(hi);
	} 
	return IdentificationResult.isNotMajorHazards(hi);
    }

}

