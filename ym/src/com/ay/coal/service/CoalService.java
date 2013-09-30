package com.ay.coal.service;

import java.util.List;

import com.ay.coal.dao.CoalDao;
import com.ay.coal.pojo.Coal;
import com.ay.framework.core.service.BaseService;
import com.ay.geological.pojo.Geological;

public class CoalService extends BaseService<Coal, CoalDao> {
	public List<Coal> getListById(String[] ids){
		return this.dao.getListById(ids);
	}
}