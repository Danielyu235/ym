package com.ay.knowlbase.law.dao;

import com.ay.framework.core.dao.BaseDao;
import com.ay.knowlbase.law.pojo.LawKnowlbase;


/**
 * 安全生产法规数据访问层
 * @author SangWei
 * 2013-3-18
 */
public class LawKnowlbaseDao extends BaseDao<LawKnowlbase>
{

    @Override
    /** 取得表名*/
    public String getTableName()
    {
        return "TB_PRODUCTION_REGULATIONS";
    }

    @Override
    /** 取得sqlMapper命名空间名*/
    public String getEntityName()
    {
        return "LawKnowlbase";
    }

}
