package com.ay.emergency.plan.special.dao;

import com.ay.emergency.plan.special.pojo.SpecialPlan;
import com.ay.framework.core.dao.BaseDao;
/**
 * 专项应急预案数据空控制层
 * @author wgw
 * @version 2013年3月14日 
 */
public class SpecialPlanDao extends BaseDao<SpecialPlan>{

	/**
	 * 获取数据库表名
	 * 
	 */
	@Override
	public String getTableName() {
		return "TB_SPECIAL_PLAN";
	}

	/**
	 * 获取实体类名
	 * 
	 */
	@Override
	public String getEntityName() {
		return "specialPlan";
	}

}
