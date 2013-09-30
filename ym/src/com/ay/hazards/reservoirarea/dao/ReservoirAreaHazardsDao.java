package com.ay.hazards.reservoirarea.dao;

import com.ay.hazards.reservoirarea.pojo.ReservoirAreaHazards;
import com.ay.framework.core.dao.BaseDao;
/** 
 * @Description 重大危险源 库区数据库控制层
 * @date 2013-4-11
 * @author WangXin
 */
public class ReservoirAreaHazardsDao extends BaseDao<ReservoirAreaHazards> {
	@Override
	public String getEntityName() {
		return "ReservoirAreaHazards";
	}
	@Override
	public String getTableName() {
		return "TB_RESERVOIR_AREA_HAZARDS";
	}

}