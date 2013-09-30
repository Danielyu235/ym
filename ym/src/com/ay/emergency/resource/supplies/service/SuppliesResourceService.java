package com.ay.emergency.resource.supplies.service;

import java.util.List;

import com.ay.credit.examine.testPaperManage.pojo.selectPaper;
import com.ay.emergency.resource.supplies.dao.SuppliesResourceDao;
import com.ay.emergency.resource.supplies.pojo.SuppliesResource;
import com.ay.framework.core.service.BaseService;

/**
 * 救援物资 服务层
 * @author yuzhou
 * 2013年3月19日 
 *
 */
public class SuppliesResourceService extends BaseService<SuppliesResource,SuppliesResourceDao> {
	/**
     * 查看试题数据信息
     * @return
     */
    public List<SuppliesResource> getSelectSupp(){
    	return this.dao.getSelectSupp();
    }
}