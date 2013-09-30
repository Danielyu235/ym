package com.ay.hazards.hazardousmaterials.service;

import java.util.List;

import com.ay.framework.core.service.BaseService;
import com.ay.hazards.hazardousmaterials.dao.ChemicalsHazardousDao;
import com.ay.hazards.hazardousmaterials.pojo.ChemicalsHazardous;
import com.ay.jfds.dev.pojo.Data;
/**
 * 危险化学品服务类
 * @author zhangxiang
 * 2013-04-18
 */
public class ChemicalsHazardousService extends BaseService<ChemicalsHazardous, ChemicalsHazardousDao> {
	/**
	 * 
	 * @return 一级菜单数据
	 */
	public List<ChemicalsHazardous> findDataByTypeFirstLevel() {
	    return this.getDao().findDataByTypeFirstLevel();
	}
	
	/**
	 * 
	 * @param wxhxplb一级菜单类型
	 * @return 二级菜单数据
	 */
	public List<ChemicalsHazardous> findDataByTypeTwoLevel(String wxhxplb) {
	    return this.getDao().findDataByTypeTwoLevel(wxhxplb);
	}
}
