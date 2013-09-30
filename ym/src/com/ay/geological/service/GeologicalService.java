package com.ay.geological.service;

import java.util.List;

import com.ay.geological.dao.GeologicalDao;
import com.ay.geological.pojo.Geological;
import com.ay.ventilation.pojo.Ventilation;
import com.ay.framework.core.service.BaseService;

public class GeologicalService extends BaseService<Geological, GeologicalDao> {
	public List<Geological> getListById(String[] ids){
		return this.dao.getListById(ids);
	}
}