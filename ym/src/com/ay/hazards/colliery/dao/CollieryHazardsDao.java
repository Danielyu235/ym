package com.ay.hazards.colliery.dao;

import com.ay.hazards.colliery.pojo.CollieryHazards;
import com.ay.framework.core.dao.BaseDao;
/** 
 * @Description 重大危险源 煤矿数据库控制层
 * @date 2013-4-11
 * @author WangXin
 */
public class CollieryHazardsDao extends BaseDao<CollieryHazards> {
	@Override
	public String getEntityName() {
		return "CollieryHazards";
	}
	@Override
	public String getTableName() {
		return "TB_COLLIERY_HAZARDS";
	}

}