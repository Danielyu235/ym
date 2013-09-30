package com.ay.emergency.plan.publicPart.service;

import java.util.List;

import com.ay.emergency.plan.publicPart.dao.PublicPartDao;
import com.ay.emergency.plan.publicPart.pojo.PublicPart;
import com.ay.framework.core.service.BaseService;

public class PublicPartService extends BaseService<PublicPart, PublicPartDao> {
	
	public List<PublicPart> getListById(String[] ids){
		return this.dao.getListById(ids);
	}
}