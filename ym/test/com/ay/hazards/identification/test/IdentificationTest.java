package com.ay.hazards.identification.test;

import java.util.ArrayList;
import java.util.List;

import org.junit.Assert;
import org.junit.Test;

import com.ay.hazards.boiler.pojo.BoilerHazards;
import com.ay.hazards.colliery.pojo.CollieryHazards;
import com.ay.hazards.identification.IdentificationFactory;
import com.ay.hazards.identification.IdentificationResult;
import com.ay.hazards.reservoirarea.pojo.ReservoirAreaHazards;
import com.ay.hazards.reservoirarea.pojo.ReservoirHazards;

/**
 * @Description 危险源辨识测试类
 * @date 2013-4-11
 * @author WangXin
 */
public class IdentificationTest {
    /**
     * 煤矿辨识测试方法
     * 
     * @return void
     */
    @Test
    public void collieryIdentificationTest() {
	Assert.assertTrue(IdentificationFactory
		.identification(new CollieryHazards()).getInfo().equals(IdentificationResult.YES));
    }
    /**
     * 锅炉辨识测试方法
     * 
     * @return void
     */
    @Test
    public void boilerIdentificationTest() {
	BoilerHazards bh = new BoilerHazards();
	bh.setBoilerType("蒸汽锅炉");
	bh.setDesginWorkPressure("2.6");
	bh.setLimitOutput("10");
	Assert.assertTrue(IdentificationFactory
		.identification(bh).getInfo().equals(IdentificationResult.YES));
    }
    /**
     * 库区辨识测试方法
     * 
     * @return void
     */
    @Test
    public void reservoirareaIdentificationTest() {
	ReservoirAreaHazards rah = new ReservoirAreaHazards();
	ReservoirHazards rh1 = new ReservoirHazards();
	rh1.setExplosionExplosive("10");
	rh1.setExplosionMaterials("100");
	ReservoirHazards rh2 = new ReservoirHazards();
	rh2.setExplosionExplosive("20");
	rh2.setExplosionMaterials("25");
	List<ReservoirHazards> reservoirs = new ArrayList<ReservoirHazards>();
	reservoirs.add(rh1);
	reservoirs.add(rh2);
	rah.setReservoirs(reservoirs);
	Assert.assertTrue(IdentificationFactory
		.identification(rah).getInfo().equals(IdentificationResult.YES));
    }
}
