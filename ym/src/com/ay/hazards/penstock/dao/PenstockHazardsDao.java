
package com.ay.hazards.penstock.dao;

import com.ay.framework.core.dao.BaseDao;
import com.ay.hazards.penstock.pojo.PenstockHazards;

/**
 *压力管道数据库控制层
 * @author yuzhou
 *  2013-04-22
 */
public class PenstockHazardsDao extends BaseDao<PenstockHazards> {
	@Override
	public String getEntityName() {
		return "TbHazhardsPenstock";
	}
	
	@Override
	public String getTableName() {
		return "TB_HAZHARDS_PENSTOCK";
	}

}