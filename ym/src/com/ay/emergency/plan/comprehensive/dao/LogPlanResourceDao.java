package com.ay.emergency.plan.comprehensive.dao;

import com.ay.emergency.plan.comprehensive.pojo.LogPlanResource;
import com.ay.emergency.plan.comprehensive.pojo.PlanResource;
import com.ay.framework.core.dao.BaseDao;
/**
 * 
 * @author zhangxiang
 * @version 2013-03-13
 */
public class LogPlanResourceDao extends BaseDao<LogPlanResource>{

	/**
	 * 获取数据库表名
	 */
	@Override
	public String getTableName() {
		// TODO Auto-generated method stub
		return "TB_LogRescoure";
	}

	/**
	 * 获取实体类名
	 */
	@Override
	public String getEntityName() {
		// TODO Auto-generated method stub
		return "logplanResource";
	}

}
