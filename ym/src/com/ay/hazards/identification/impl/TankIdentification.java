package com.ay.hazards.identification.impl;

import java.util.List;

import com.ay.hazards.hazardousmaterials.pojo.Materials;
import com.ay.hazards.identification.HazardsInfo;
import com.ay.hazards.identification.IHazards;
import com.ay.hazards.identification.IHazardsIdentification;
import com.ay.hazards.identification.IdentificationResult;
import com.ay.hazards.tank.pojo.TankAraeHazards;
import com.ay.hazards.tank.pojo.TankHazards;

/** 
 * @Description 贮罐区辨识类
 * @date 2013-4-11
 * @author WangXin
 */
public class TankIdentification implements IHazardsIdentification {

    @Override
    public IdentificationResult isMajorHazards(IHazards hazards) {
	TankAraeHazards tah = (TankAraeHazards) hazards;
	HazardsInfo hi = new HazardsInfo(tah.getTankName(),tah.getId(), tah.getHazardsType(),
		"贮罐区", tah.getDwdm(), tah.getCorpName());
	//贮罐list
	List<TankHazards> ths = tah.getTanks();
	if(ths == null || ths.isEmpty()) return IdentificationResult.error(hi, "没有贮罐信息");
	float result = 0;
	for(TankHazards th: ths) {
	    //日常最大贮存量
	    String maxKeep = th.getMaxKeep();
	    //危险物质
	    Materials m =th.getMaterials();
	    if(m == null) return IdentificationResult.error(hi, "没有危险物质信息");
	    //危险物质的临界量
	    String quantity = m.getThresholdQuantity();
	    float q = 0;
	    float Q = 0;
	    try {
		q = Float.parseFloat(maxKeep);
	    } catch (NumberFormatException e1) {
		return IdentificationResult.error(hi, "危险物质贮存量数据错误");
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

