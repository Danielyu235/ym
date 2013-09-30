package com.ay.hazards.mines.dao;

import com.ay.hazards.mines.pojo.MinesHazards;
import com.ay.framework.core.dao.BaseDao;
/***
 * 金属非金属矿山数据空控制层
 * @author zhangxiang
 *  2013-04-07
 */
public class MinesHazardsDao extends BaseDao<MinesHazards> {
	@Override
	public String getEntityName() {
		return "MinesHazards";
	}
	@Override
	public String getTableName() {
		return "TB_MINES_HAZARDS";
	}

}