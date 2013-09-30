package com.ay.danger.dao;

import java.util.List;

import com.ay.danger.pojo.HiddenDanger;
import com.ay.danger.pojo.HiddenDangerMonth;
import com.ay.framework.core.dao.BaseDao;

public class HiddenDangerDao extends BaseDao<HiddenDanger> {
	@Override
	public String getEntityName() {
		return "HiddenDanger";
	}
	@Override
	public String getTableName() {
		return "TB_HIDDEN_DANGER";
	}

	@SuppressWarnings("unchecked")
    public List<HiddenDangerMonth> getStaff(String month){
        return (List<HiddenDangerMonth>) getSqlMapClientTemplate().queryForList( 
                getEntityName() +".getStaff",month);
    }
}