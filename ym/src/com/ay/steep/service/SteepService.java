package com.ay.steep.service;

import java.util.List;

import com.ay.steep.dao.SteepDao;
import com.ay.steep.pojo.Steep;
import com.ay.coal.pojo.Coal;
import com.ay.framework.core.service.BaseService;

public class SteepService extends BaseService<Steep, SteepDao> {
	public List<Steep> getListById(String[] ids){
		return this.dao.getListById(ids);
	}
}