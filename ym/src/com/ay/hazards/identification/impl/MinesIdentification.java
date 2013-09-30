package com.ay.hazards.identification.impl;

import com.ay.hazards.identification.HazardsInfo;
import com.ay.hazards.identification.IHazards;
import com.ay.hazards.identification.IHazardsIdentification;
import com.ay.hazards.identification.IdentificationResult;
import com.ay.hazards.mines.pojo.MinesHazards;

/** 
 * @Description 金属非金属地下矿山辨识类
 * @date 2013-4-11
 * @author WangXin
 */
public class MinesIdentification implements IHazardsIdentification {

    @Override
    public IdentificationResult isMajorHazards(IHazards hazards) {
	MinesHazards mh = (MinesHazards) hazards;
	HazardsInfo hi = new HazardsInfo(mh.getMineName(),mh.getId(), mh.getHazardsType(), "金属非金属地下矿山",
		mh.getDwdm(), mh.getCorpName());
	return IdentificationResult.isMajorHazards(hi);
    }

}

