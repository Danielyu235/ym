package com.ay.emergency.plan.comprehensive.dao;

import java.util.List;

import com.ay.emergency.plan.comprehensive.pojo.PlanResource;
import com.ay.emergency.resource.supplies.pojo.SuppliesResource;
import com.ay.framework.core.dao.BaseDao;
/**
 *  综合预案与救援专家——数据库控制层
 * @author zhangxiang
 * @version 2013-03-13
 */
public class PlanResourceDao extends BaseDao<PlanResource>{

	/**
	 * 获取数据库表名
	 */
	@Override
	public String getTableName() {
		// TODO Auto-generated method stub
		return "VI_PLAN_RESOURCE";
	}

	/**
	 * 获取实体类名
	 */
	@Override
	public String getEntityName() {
		// TODO Auto-generated method stub
		return "planResource";
	}
	/**
	 * 查询试题数据
	 * @return
	 */
	public List<PlanResource> getSelectRes(String id){
		return (List<PlanResource>) getSqlMapClientTemplate().queryForList(
				getEntityName()+".resList",id);
	}

}
