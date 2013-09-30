package com.ay.ventilation.service;

import java.util.List;

import com.ay.framework.core.service.BaseService;
import com.ay.ventilation.dao.VentilationDao;
import com.ay.ventilation.pojo.Ventilation;

public class VentilationService extends BaseService<Ventilation, VentilationDao> {
	public List<Ventilation> getListById(String[] ids){
		return this.dao.getListById(ids);
	}
}