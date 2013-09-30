package com.ay.electromechanical.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ay.electromechanical.pojo.Electromechanical;
import com.ay.framework.core.dao.BaseDao;
import com.ay.steep.pojo.Steep;

public class ElectromechanicalDao extends BaseDao<Electromechanical> {
	@Override
	public String getEntityName() {
		return "Electromechanical";
	}
	@Override
	public String getTableName() {
		return "TB_ELECTROMECHANICAL";
	}
	@SuppressWarnings("unchecked")
	public List<Electromechanical> getListById(String[] ids){
		Map map = null;
		if(ids != null){
			map = new HashMap();
			map.put("ids", ids);
		}
		return this.getSqlMapClientTemplate().queryForList(
					getEntityName()+".flist",map);
	}
}