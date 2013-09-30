package com.ay.emergency.plan.comprehensive.service;

import java.util.List;

import com.ay.emergency.plan.comprehensive.dao.PlanResourceDao;
import com.ay.emergency.plan.comprehensive.pojo.PlanResource;
import com.ay.emergency.resource.supplies.pojo.SuppliesResource;
import com.ay.framework.core.service.BaseService;
/**
 * 综合预案与救援资源关联——服务层
 * @author zhangxiang
 * @version 2013-03-13
 */
public class PlanResourceService extends BaseService<PlanResource, PlanResourceDao> {
	/**
     * 查看数据信息
     * @return
     */
    public List<PlanResource> getSelectRes(String id){
    	return this.dao.getSelectRes(id);
    }
}
