package com.ay.hazards.all.dao;

import java.util.List;

import org.apache.poi.ss.formula.functions.T;
import org.springframework.dao.DataAccessException;

import com.ay.framework.core.dao.BaseDao;
import com.ay.framework.util.collenction.ListUtil;
import com.ay.hazards.all.pojo.Hazards;
import com.ay.hazards.identification.IHazards;

public class HazardsDao extends BaseDao<Hazards> {
	@Override
	public String getEntityName() {
		return "Hazards";
	}
	@Override
	public String getTableName() {
		return "VIEW_HAZARDS";
	}
	public IHazards findHazards(String nameSpace, String id) {
	    IHazards hazards = null;
	    try {
		hazards = (IHazards) getSqlMapClientTemplate().queryForObject(nameSpace + ".getById", id);
	    } catch (DataAccessException e) {
		e.printStackTrace();
	    }
	    return hazards;
	}
}