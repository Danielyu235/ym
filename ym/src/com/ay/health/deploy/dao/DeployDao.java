package com.ay.health.deploy.dao;

import java.util.Map;

import com.ay.health.deploy.pojo.Deploy;
import com.ay.framework.core.dao.BaseDao;

public class DeployDao extends BaseDao<Deploy> {
	@Override
	public String getEntityName() {
		return "Deploy";
	}
	@Override
	public String getTableName() {
		return "TB_DEPLOY";
	}
	public int count() {
        return (Integer) getSqlMapClientTemplate().queryForObject(
                getEntityName() + ".count");
    }
}