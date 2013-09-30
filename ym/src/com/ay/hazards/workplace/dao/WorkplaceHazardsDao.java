
package com.ay.hazards.workplace.dao;

import com.ay.framework.core.dao.BaseDao;
import com.ay.hazards.workplace.pojo.WorkplaceHazards;

/**
 * 生产场所数据库控制层
 * @author yuzhou
 *  2013-04-22
 */
public class WorkplaceHazardsDao extends BaseDao<WorkplaceHazards> {
	@Override
	public String getEntityName() {
		return "TbHazhardsWorkplace";
	}
	
	@Override
	public String getTableName() {
		return "TB_HAZHARDS_WORKPLACE";
	}

}