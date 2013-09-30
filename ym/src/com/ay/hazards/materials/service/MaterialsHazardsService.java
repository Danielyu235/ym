package com.ay.hazards.materials.service;

import java.util.List;

import com.ay.framework.core.service.BaseService;
import com.ay.hazards.materials.dao.MaterialsHazardsDao;
import com.ay.hazards.materials.pojo.MaterialsHazards;

/**
 * 生产场所 中存放物质服务类
 * @author yuzhou
 *  2013-04-22
 */
public class MaterialsHazardsService extends BaseService<MaterialsHazards, MaterialsHazardsDao> {
	
	/**
	 * 获取所有对应生产场所的物品
	 * @return
	 */
	public List<MaterialsHazards> getEntityList(String fid)
	{
		return dao.getEntityList(fid);
	}
	
}