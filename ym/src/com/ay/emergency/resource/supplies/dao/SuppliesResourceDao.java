
package com.ay.emergency.resource.supplies.dao;

import java.util.List;

import com.ay.emergency.resource.supplies.pojo.SuppliesResource;
import com.ay.framework.core.dao.BaseDao;

/**
 * 救援物资 控制层
 * @author yuzhou
 * 2013年3月19日 
 *
 */
public class SuppliesResourceDao extends BaseDao<SuppliesResource> {
	@Override
	public String getEntityName() {
		return "TbRescueSupplies";
	}
	
	@Override
	public String getTableName() {
		return "TB_RESCUE_SUPPLIES";
	}
	/**
	 * 查询试题数据
	 * @return
	 */
	public List<SuppliesResource> getSelectSupp(){
		return (List<SuppliesResource>) getSqlMapClientTemplate().queryForList(
				getEntityName()+".suppList");
	}

}