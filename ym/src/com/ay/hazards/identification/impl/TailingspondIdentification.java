package com.ay.hazards.identification.impl;

import com.ay.hazards.identification.HazardsInfo;
import com.ay.hazards.identification.IHazards;
import com.ay.hazards.identification.IHazardsIdentification;
import com.ay.hazards.identification.IdentificationResult;
import com.ay.hazards.tailingspond.pojo.TailingspondHazards;

/** 
 * @Description 尾矿库辨识类
 * @date 2013-4-11
 * @author WangXin
 */
public class TailingspondIdentification implements IHazardsIdentification {

    @Override
    public IdentificationResult isMajorHazards(IHazards hazards) {
	TailingspondHazards hts = (TailingspondHazards) hazards;
	HazardsInfo hi = new HazardsInfo(hts.getWkkmc(),hts.getId(), hts.getHazardsType(), "尾矿库", hts.getQymc(), hts.getCorpName());
	//全库容
	String qkr = hts.getQkr();
	//坝高
	String bg = hts.getBg();
	float size = 0;
	float height = 0;
	try {
	    size = Float.parseFloat(qkr);
	} catch (NumberFormatException e) {
	    return IdentificationResult.error(hi, "全库容数据错误");
	}
	try {
	    height = Float.parseFloat(bg);
	} catch (NumberFormatException e) {
	    return IdentificationResult.error(hi, "坝高数据错误");
	}
	if(size >= 100 || height >= 30) {
	    return IdentificationResult.isMajorHazards(hi);
	} else {
	    return IdentificationResult.isNotMajorHazards(hi);
	}
    }

}

