package com.ay.emergency.plan.comprehensive.service;

import java.util.HashMap;
import java.util.List;

import com.ay.emergency.plan.comprehensive.dao.PlanExpertDao;
import com.ay.emergency.plan.comprehensive.pojo.PlanExpert;
import com.ay.framework.core.dao.pagination.Page;
import com.ay.framework.core.service.BaseService;
import com.ay.jfds.sys.pojo.Department;
import com.ay.jfds.sys.pojo.User;

/**
 * 综合应急预案与救援专家关联 服务层
 * @author zhangxiang
 * @version 2013-03-12
 */
public class PlanExpertService extends BaseService<PlanExpert, PlanExpertDao> {
	
	/**
	 * 用于删除应急预案与专家关联的信息
	 * @param where 删除条件
	 * @return
	 */
	public boolean deleteRole(String where) {
		return this.getDao().deleteRole(where);
	}
}
