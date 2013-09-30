package com.ay.themezt.coalzt.service;

import java.util.List;

import com.ay.framework.core.service.BaseService;
import com.ay.themezt.coalzt.dao.CoalOutputDao;
import com.ay.themezt.coalzt.pojo.CoalOutGraph;
import com.ay.themezt.coalzt.pojo.CoalOutput;

public class CoalOutputService extends BaseService<CoalOutput, CoalOutputDao> {
	/**
	 * 全矿煤产量
	 * @param month
	 * @return
	 */
	public List<CoalOutGraph> getMonthCoalData(String month){
		return this.dao.getMonthCoalData(month);
	}
}