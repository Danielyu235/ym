package com.ay.hazards.all.dao;

import com.ay.hazards.all.pojo.HazardsResult;
import com.ay.framework.core.dao.BaseDao;

public class HazardsResultDao extends BaseDao<HazardsResult> {
	@Override
	public String getEntityName() {
		return "HazardsResult";
	}
	@Override
	public String getTableName() {
		return "TB_HAZARDS_RESULT";
	}
	public HazardsResult getByHazardsId(String id) {
	    return (HazardsResult) getSqlMapClientTemplate().queryForObject(getEntityName() +".getByHazardsId", id);
	}
	public boolean updateByHazardsId(HazardsResult hr) {
	    int rows = getSqlMapClientTemplate().update(getEntityName() +".updateByHazardsId", hr);
	    return rows == 1;
	}
	public boolean insertOrUpdate(HazardsResult hr) {
	    boolean flag = false;
	    try {
		if(getByHazardsId(hr.getHazardsId()) == null) {
		    insert(hr);
		} else {
		    flag = updateByHazardsId(hr);
		}
	    } catch (Exception e) {
		e.printStackTrace();
		return false;
	    }
	    return true;
	}
}