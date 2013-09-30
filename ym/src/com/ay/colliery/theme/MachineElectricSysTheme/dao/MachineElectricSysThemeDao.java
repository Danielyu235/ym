package com.ay.colliery.theme.MachineElectricSysTheme.dao;

import java.util.List;

import com.ay.colliery.theme.MachineElectricSysTheme.pojo.MachineElectricSysTheme;
import com.ay.colliery.theme.MachineElectricSysTheme.pojo.MachineGraph;
import com.ay.framework.core.dao.BaseDao;

public class MachineElectricSysThemeDao extends BaseDao<MachineElectricSysTheme> {
	@Override
	public String getEntityName() {
		return "MachineElectricSysTheme";
	}
	@Override
	public String getTableName() {
		return "TB_MACHINE_ELECTRIC_SYS_THEME";
	}
	/**
	 * 查询系统  柱形图 
	 * @param date 年份
	 * @return 返回实体类对象
	 */
	public List<MachineGraph> getMineSum(String date)
	{
		return (List<MachineGraph>) getSqlMapClientTemplate().queryForList(
				getEntityName() + ".sum",date);
	}
	
}