
package com.ay.hazards.boiler.dao;

import com.ay.framework.core.dao.BaseDao;
import com.ay.hazards.boiler.pojo.BoilerHazards;

/**
 *  重大危险源 锅炉数据库控制层
 * @author zhangxiang
 * 2013-04-03
 */
public class BoilerHazardsDao extends BaseDao<BoilerHazards> {
	
	/**
	 * 获取实体类名
	 * @return 实体类名
	 */
	@Override
	public String getEntityName() {
		return "Boiler";
	}
	
	/**
	 * 获取数据库表名
	 * @return 数据库表名
	 */
	@Override
	public String getTableName() {
		return "TB_BOILER";
	}

}