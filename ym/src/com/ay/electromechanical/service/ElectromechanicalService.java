package com.ay.electromechanical.service;

import java.util.List;

import com.ay.electromechanical.dao.ElectromechanicalDao;
import com.ay.electromechanical.pojo.Electromechanical;
import com.ay.framework.core.service.BaseService;
import com.ay.steep.pojo.Steep;

public class ElectromechanicalService extends BaseService<Electromechanical, ElectromechanicalDao> {
	public List<Electromechanical> getListById(String[] ids){
		return this.dao.getListById(ids);
	}
}