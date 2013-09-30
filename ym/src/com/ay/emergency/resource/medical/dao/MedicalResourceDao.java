
package com.ay.emergency.resource.medical.dao;

import com.ay.emergency.resource.medical.pojo.MedicalResource;
import com.ay.framework.core.dao.BaseDao;

/**
 * 医疗保障数据库控制层
 * @author yuzhou
 * 2013年3月19日 
 *
 */
public class MedicalResourceDao extends BaseDao<MedicalResource> {
	@Override
	public String getEntityName() {
		return "rescueMedical";
	}
	
	@Override
	public String getTableName() {
		return "TB_RESCUE_medical";
	}

}