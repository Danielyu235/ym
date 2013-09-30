package com.ay.hazards.dangerousplacematerials.dao;

import java.util.List;

import com.ay.framework.core.dao.BaseDao;
import com.ay.hazards.dangerousplacematerials.pojo.DangerousPlaceMaterialsInfo;

public class DangerousPlaceMaterialsDao extends BaseDao<DangerousPlaceMaterialsInfo>{
    	
    	/**
    	 * 获取数据库表名
    	 */
    	public String getTableName()
    	{
    		
    		return "TB_DANGEROUSCARGO";
		
		}
    	
    	/**
    	 * 获得sqlMap命名空间
    	 */
    	public String getEntityName() 
    	{
    		
    		return "dangeCargo";
    		
    	}
    	
}
