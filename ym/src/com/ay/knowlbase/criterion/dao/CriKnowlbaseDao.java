package com.ay.knowlbase.criterion.dao;

import com.ay.framework.core.dao.BaseDao;
import com.ay.knowlbase.criterion.pojo.CriKnowlbase;



/**
 * 安全生产标准数据访问层
 * @author SangWei
 * 2013-3-18
 */
public class CriKnowlbaseDao extends BaseDao<CriKnowlbase>
{

    @Override
    /** 取得表名*/
    public String getTableName()
    {
        return "TB_PRODUCTION_STANDARD";
    }

    @Override
    /** 取得sqlMapper命名空间名*/
    public String getEntityName()
    {
        return "CriKnowlbase";
    }

}
