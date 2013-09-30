package com.ay.wash.service;

import java.util.List;

import com.ay.steep.pojo.Steep;
import com.ay.wash.dao.WashDao;
import com.ay.wash.pojo.Wash;
import com.ay.framework.core.service.BaseService;

public class WashService extends BaseService<Wash, WashDao> {
	public List<Wash> getListById(String[] ids){
		return this.dao.getListById(ids);
	}
}