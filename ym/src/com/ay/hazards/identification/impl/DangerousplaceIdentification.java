package com.ay.hazards.identification.impl;

import java.util.List;

import com.ay.hazards.dangerousplace.pojo.DangerousplaceInfo;
import com.ay.hazards.dangerousplacematerials.pojo.DangerousPlaceMaterialsInfo;
import com.ay.hazards.hazardousmaterials.pojo.Materials;
import com.ay.hazards.identification.HazardsInfo;
import com.ay.hazards.identification.IHazards;
import com.ay.hazards.identification.IHazardsIdentification;
import com.ay.hazards.identification.IdentificationResult;
import com.ay.hazards.tank.pojo.TankAraeHazards;
import com.ay.hazards.tank.pojo.TankHazards;

/** 
 * @Description 危险场所辨识类
 * @date 2013-4-11
 * @author WangXin
 */
public class DangerousplaceIdentification implements IHazardsIdentification {

    @Override
    public IdentificationResult isMajorHazards(IHazards hazards) {
	DangerousplaceInfo dp = (DangerousplaceInfo) hazards;
	HazardsInfo hi = new HazardsInfo(dp.getDangerplacename(),dp.getId(), dp.getHazardsType(),
		"危险场所", dp.getDwdm(), dp.getCorpName());
	//贮罐list
	List<DangerousPlaceMaterialsInfo> list = dp.getList();
	if(list == null || list.isEmpty()) return IdentificationResult.error(hi, "没有包含的危险物质信息");
	float result = 0;
	for(DangerousPlaceMaterialsInfo dpm: list) {
	    //单元内危险化学品存量（t）
	    String store = dpm.getDangerunitstore();
	    //危险物质
	    Materials m = dpm.getMaterials();
	    if(m == null) return IdentificationResult.error(hi, "没有危险物质信息");
	    //危险物质的临界量
	    String quantity = m.getThresholdQuantity();
	    float q = 0;
	    float Q = 0;
	    try {
		q = Float.parseFloat(store);
	    } catch (NumberFormatException e1) {
		return IdentificationResult.error(hi, "危险物质存量数据错误");
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

