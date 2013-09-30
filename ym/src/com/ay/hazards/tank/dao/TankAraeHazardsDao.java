package com.ay.hazards.tank.dao;

import com.ay.hazards.tank.pojo.TankAraeHazards;
import com.ay.framework.core.dao.BaseDao;
/**
 * 重大危险源贮罐区数据库控制层
 * @author zhangxiang
 * 2013-04-09
 */
public class TankAraeHazardsDao extends BaseDao<TankAraeHazards> {
	@Override
	public String getEntityName() {
		return "TankAraeHazards";
	}
	@Override
	public String getTableName() {
		return "TB_TANK_ARAE_HAZARDS";
	}

}