package com.ay.hazards.reservoirarea.dao;

import com.ay.hazards.reservoirarea.pojo.ReservoirHazards;
import com.ay.framework.core.dao.BaseDao;
/** 
 * @Description 重大危险源 库房数据库控制层
 * @date 2013-4-11
 * @author WangXin
 */
public class ReservoirHazardsDao extends BaseDao<ReservoirHazards> {
	@Override
	public String getEntityName() {
		return "ReservoirHazards";
	}
	@Override
	public String getTableName() {
		return "TB_RESERVOIR_HAZARDS";
	}

}