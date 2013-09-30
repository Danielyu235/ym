package com.ay.colliery.theme.MachineElectricSysTheme.service;

import java.util.List;

import com.ay.colliery.theme.MachineElectricSysTheme.dao.MachineElectricSysThemeDao;
import com.ay.colliery.theme.MachineElectricSysTheme.pojo.MachineElectricSysTheme;
import com.ay.colliery.theme.MachineElectricSysTheme.pojo.MachineGraph;
import com.ay.framework.core.service.BaseService;

public class MachineElectricSysThemeService extends BaseService<MachineElectricSysTheme, MachineElectricSysThemeDao> {
	/**
	 * 查询系统  柱形图 
	 * @param date 年份
	 * @return 返回实体类对象
	 */
	public List<MachineGraph> getMineSum(String date)
	{
		return this.dao.getMineSum(date);
	}
}