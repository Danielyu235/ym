package com.ay.enterprise.dao;

import com.ay.enterprise.pojo.Enterprise;
import com.ay.framework.core.dao.BaseDao;
/**
* 企业信息模块Dao
* @author WangXin
* @version 2013-3-18
*/
public class EnterpriseDao extends BaseDao<Enterprise>
{
    @Override
    /** 取得sqlMapper命名空间名*/
    public String getEntityName()
    {
        return "Enterprise";
    }

    @Override
    /** 取得表名*/
    public String getTableName()
    {
        return "TB_ENTERPRISE";
    }

}