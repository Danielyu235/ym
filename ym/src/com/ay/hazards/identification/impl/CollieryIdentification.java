package com.ay.hazards.identification.impl;

import com.ay.hazards.colliery.pojo.CollieryHazards;
import com.ay.hazards.identification.HazardsInfo;
import com.ay.hazards.identification.IHazards;
import com.ay.hazards.identification.IHazardsIdentification;
import com.ay.hazards.identification.IdentificationResult;

/** 
 * @Description 煤矿辨识类
 * @date 2013-4-11
 * @author WangXin
 */
public class CollieryIdentification implements IHazardsIdentification {

    @Override
    public IdentificationResult isMajorHazards(IHazards hazards) {
	CollieryHazards ch = (CollieryHazards) hazards;
	HazardsInfo hi = new HazardsInfo(ch.getName(),ch.getId(), ch.getHazardsType(), "煤矿", ch.getDwdm(), ch.getCorpName());
	return IdentificationResult.isMajorHazards(hi);
    }

}

