    package com.ay.hazards.dangerousplace.dao;

    import com.ay.framework.core.dao.BaseDao;
    import com.ay.hazards.dangerousplace.pojo.DangerousplaceInfo;
    
    /**
     * 危险场所数据访问层类
     * @author liuhu
     *
     */
    public class DangerousplaceDao extends BaseDao<DangerousplaceInfo>
    {
	    	
	    /**
	     * 获取数据库表名
	     */
		public String getTableName() 
		{
			return  "TB_DANGEROUSPLACE";
		}
	    
		/**
		 * 获取sqlMap命名空间
		 */
		public String getEntityName() 
		{
			return "dangerplace";
		}

    }
