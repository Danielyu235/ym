package com.ay.hazards.identification.impl;

import java.util.List;

import org.jfree.util.Log;

import com.ay.framework.annotation.ChineseName;
import com.ay.hazards.identification.HazardsInfo;
import com.ay.hazards.identification.IHazards;
import com.ay.hazards.identification.IHazardsIdentification;
import com.ay.hazards.identification.IdentificationResult;
import com.ay.hazards.reservoirarea.pojo.ReservoirAreaHazards;
import com.ay.hazards.reservoirarea.pojo.ReservoirHazards;

/** 
 * @Description 库区辨识类
 * @date 2013-4-11
 * @author WangXin
 */
public class ReservoirareaIdentification implements IHazardsIdentification {
    /**
     * 下面全部是临界量值
     */
    /**
     * 以下3个属于
     * 民用爆破器材
     */
    /** 起爆器材 */
    private static final int explosionEquipment = 1;
    /** 工业炸药 */
    private static final int explosionExplosive = 50;
    /** 爆炸危险原材料 */
    private static final int explosionMaterials = 250;
    
    /** 烟火剂、烟花爆竹 */
    private static final int firecracker = 5;
    
    /**
     * 以下2个属于
     * 易燃液体
     */
    /** 闪点＜28℃ */
    private static final int liquidLess = 20;
    /** 28℃≤闪点＜60℃ */
    private static final int liquidMore = 100;
    /**
     * 以下2个属于
     * 可燃气体
     */
    /** 爆炸下限＜10% */
    private static final int gasLess = 10;
    /** 爆炸下限≥10% */
    private static final int gasMore = 20;
    /**
     * 以下3个属于
     * 毒性物质
     */
    /** 剧毒品 */
    private static final int poisonMost = 1;
    /** 有毒品 */
    private static final int poisonMore = 100;
    /** 有害品 */
    private static final int poisonLittle = 20;
    
    @Override
    public IdentificationResult isMajorHazards(IHazards hazards) {
	ReservoirAreaHazards rah = (ReservoirAreaHazards) hazards;
	HazardsInfo hi = new HazardsInfo(rah.getName(),rah.getId(), rah.getHazardsType(), "库区",
		rah.getDwdm(), rah.getCorpName());
	List<ReservoirHazards> reservoirs = rah.getReservoirs();
	int explosionEquipmentTemp = 0;
	int explosionExplosiveTemp = 0;
	int explosionMaterialsTemp = 0;
	int firecrackerTemp = 0;
	int liquidLessTemp = 0;
	int liquidMoreTemp = 0;
	int gasLessTemp = 0;
	int gasMoreTemp = 0;
	int poisonMostTemp = 0;
	int poisonMoreTemp = 0;
	int poisonLittleTemp = 0;
	if(reservoirs == null || reservoirs.isEmpty()) return IdentificationResult.error(hi, "没有库房信息");
	for(ReservoirHazards res: reservoirs) {
	    explosionEquipmentTemp = addToTemp(explosionEquipmentTemp, res.getExplosionEquipment());
	    explosionExplosiveTemp = addToTemp(explosionExplosiveTemp, res.getExplosionExplosive());
	    explosionMaterialsTemp = addToTemp(explosionMaterialsTemp, res.getExplosionMaterials());
	    firecrackerTemp = addToTemp(firecrackerTemp, res.getFirecracker());
	    liquidLessTemp = addToTemp(liquidLessTemp, res.getLiquidLess());
	    liquidMoreTemp = addToTemp(liquidMoreTemp, res.getLiquidMore());
	    gasLessTemp = addToTemp(gasLessTemp, res.getGasLess());
	    gasMoreTemp = addToTemp(gasMoreTemp, res.getGasMore());
	    poisonMostTemp = addToTemp(poisonMostTemp, res.getPoisonMost());
	    poisonMoreTemp = addToTemp(poisonMoreTemp, res.getPoisonMore());
	    poisonLittleTemp = addToTemp(poisonLittleTemp, res.getPoisonLittle());
	}
	float result = 0;
	result += (float)explosionEquipmentTemp/explosionEquipment;
	result += (float)explosionExplosiveTemp/explosionExplosive;
	result += (float)explosionMaterialsTemp/explosionMaterials;
	result += (float)firecrackerTemp/firecracker;
	result += (float)liquidLessTemp/liquidLess;
	result += (float)liquidMoreTemp/liquidMore;
	result += (float)gasLessTemp/gasLess;
	result += (float)gasMoreTemp/gasMore;
	result += (float)poisonMostTemp/poisonMost;
	result += (float)poisonMoreTemp/poisonMore;
	result += (float)poisonLittleTemp/poisonLittle;
	if(result >= 1)
	    return IdentificationResult.isMajorHazards(hi);
	else
	    return IdentificationResult.isNotMajorHazards(hi);
    }

    private int addToTemp(int temp, String str) {
	if(str == null || str.trim().isEmpty()) return temp;
	int number = 0;
	try {
	    number = Integer.parseInt(str);
	} catch (NumberFormatException e) {
	    Log.debug(str + "不能转为数字");
	}
	return temp + number;
    }

}

