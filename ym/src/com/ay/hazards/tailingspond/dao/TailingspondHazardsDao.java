package com.ay.hazards.tailingspond.dao;

import com.ay.hazards.tailingspond.pojo.TailingspondHazards;
import com.ay.framework.core.dao.BaseDao;
/**
 * 重大危险源尾矿库 数据库控制层
 * @author yuzhou
 *  2013-04-11
 */
public class TailingspondHazardsDao extends BaseDao<TailingspondHazards> {
	@Override
	public String getEntityName() {
		return "HazhardsTailingspond";
	}
	@Override
	public String getTableName() {
		return "TB_HAZHARDS_TAILINGSPOND";
	}

}