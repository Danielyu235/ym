package com.ay.hazards.pressurevessel.dao;

import com.ay.hazards.pressurevessel.pojo.PressureVesselHazards;
import com.ay.framework.core.dao.BaseDao;
/** 
 * @Description 重大危险源 压力容器数据库控制层
 * @date 2013-4-11
 * @author WangXin
 */
public class PressureVesselHazardsDao extends BaseDao<PressureVesselHazards> {
	@Override
	public String getEntityName() {
		return "PressureVesselHazards";
	}
	@Override
	public String getTableName() {
		return "TB_PRESSURE_VESSEL_HAZARDS";
	}

}