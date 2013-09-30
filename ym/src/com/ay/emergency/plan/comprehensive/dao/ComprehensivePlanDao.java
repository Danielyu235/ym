
package com.ay.emergency.plan.comprehensive.dao;

import com.ay.emergency.plan.comprehensive.pojo.ComprehensivePlan;
import com.ay.framework.core.dao.BaseDao;

/**
 * 应急预案控制层
 * @author zhangxiang
 * @version 2013-03-11
 */
public class ComprehensivePlanDao extends BaseDao<ComprehensivePlan> {
	/**
	 * 获取实体类名
	 */
	@Override
	public String getEntityName() {
		return "energencyPlan";
	}
	/**
	 * 获取数据库表名
	 */
	@Override
	public String getTableName() {
		return "TB_ENERGENCY_PLAN";
	}

}