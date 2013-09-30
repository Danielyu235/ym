package com.ay.ventilation.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ay.framework.core.dao.BaseDao;
import com.ay.ventilation.pojo.Ventilation;

public class VentilationDao extends BaseDao<Ventilation> {
	@Override
	public String getEntityName() {
		return "Ventilation";
	}
	@Override
	public String getTableName() {
		return "TB_VENTILATION";
	}
	@SuppressWarnings("unchecked")
	public List<Ventilation> getListById(String[] ids){
		Map map = null;
		if(ids != null){
			map = new HashMap();
			map.put("ids", ids);
		}
		return this.getSqlMapClientTemplate().queryForList(
					getEntityName()+".flist",map);
	}
}