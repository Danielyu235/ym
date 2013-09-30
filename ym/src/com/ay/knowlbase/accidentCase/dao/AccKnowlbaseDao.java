package com.ay.knowlbase.accidentCase.dao;

import com.ay.framework.core.dao.BaseDao;
import com.ay.knowlbase.accidentCase.pojo.AccKnowlbase;


/**
 * 典型事故案例数据访问层
 * @author SangWei
 * 2013-3-18
 */
public class AccKnowlbaseDao extends BaseDao<AccKnowlbase>
{

    @Override
    /** 取得表名*/
    public String getTableName()
    {
        return "TB_ACCIDENT_CASE";
    }

    @Override
    /** 取得sqlMapper命名空间名*/
    public String getEntityName()
    {
        return "AccKnowlbase";
    }

}
