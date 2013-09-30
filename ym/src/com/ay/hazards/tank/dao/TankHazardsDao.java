package com.ay.hazards.tank.dao;

import com.ay.hazards.tank.pojo.TankHazards;
import com.ay.framework.core.dao.BaseDao;
/**
 * 重大危险源贮罐数据库控制层
 * @author zhangxiang
 * 2013-04-09
 */
public class TankHazardsDao extends BaseDao<TankHazards> {
	@Override
	public String getEntityName() {
		return "TankHazards";
	}
	@Override
	public String getTableName() {
		return "TB_TANK_HAZARDS";
	}

}