package com.ay.tran.dao;

import java.util.List;

import com.ay.tran.pojo.Tran;
import com.ay.tran.pojo.TranMonth;
import com.ay.framework.core.dao.BaseDao;

public class TranDao extends BaseDao<Tran> {
	@Override
	public String getEntityName() {
		return "Tran";
	}
	@Override
	public String getTableName() {
		return "TB_TRAN";
	}
	
	@SuppressWarnings("unchecked")
    public List<TranMonth> getStaff(String month){
        return (List<TranMonth>) getSqlMapClientTemplate().queryForList( 
                getEntityName() +".getStaff",month);
    }
	
	@SuppressWarnings("unchecked")
    public List<TranMonth> getCol(String month){
        return (List<TranMonth>) getSqlMapClientTemplate().queryForList( 
                getEntityName() +".getCol",month);
    }
}