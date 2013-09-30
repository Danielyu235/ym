package com.ay.emergency.plan.comprehensive.dao;

import java.io.Serializable;

import com.ay.emergency.plan.comprehensive.pojo.PlanExpert;
import com.ay.framework.core.dao.BaseDao;
/**
 * 综合预案与救援专家关联  数据库控制层
 * @author zhangxaing
 * @version 2013-03-12
 */
public class PlanExpertDao extends BaseDao<PlanExpert> {

	/**
	 * 获取数据库表名
	 */
	@Override
	public String getTableName() {
		// TODO Auto-generated method stub
		return "TB_PLAN_EXPERT";
	}
	/**
	 * 获取实体类名
	 */
	@Override
	public String getEntityName() {
		// TODO Auto-generated method stub
		return "planExp";
	}
	
	/**
	 * 用于删除应急预案与专家关联的信息
	 * 
	 * @param where
	 *            
	 * @return 删除的记录数是否为1
	 */
	public boolean deleteRole(String where) {
		int rows = getSqlMapClientTemplate().delete(
				getEntityName() + ".deleteRoles", where);
		return rows > 0;
	}
}
