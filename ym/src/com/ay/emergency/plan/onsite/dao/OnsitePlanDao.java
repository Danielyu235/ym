
package com.ay.emergency.plan.onsite.dao;

import com.ay.emergency.plan.onsite.pojo.OnsitePlan;
import com.ay.framework.core.dao.BaseDao;

/**
 *现场处置应急预案数据库控制层
 * @author lihe
 * @version2013年3月14日 
 */
public class OnsitePlanDao extends BaseDao<OnsitePlan> {
	
	@Override
	/** 取得sqlMapper命名空间名*/
	public String getEntityName() {
		return "TbPlanDisposal";
	}
	
	@Override
	/** 取得表名*/
	public String getTableName() {
		return "TB_PLAN_DISPOSAL";
	}

}