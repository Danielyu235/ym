package com.ay.emergency.resource.headquarters.service;

import java.util.List;

import com.ay.emergency.resource.headquarters.dao.HeadquartersDao;
import com.ay.emergency.resource.headquarters.pojo.Headquarters;
import com.ay.emergency.resource.headquarters.pojo.Hperson;
import com.ay.framework.core.service.BaseService;

public class HeadquartersService extends BaseService<Headquarters, HeadquartersDao> {
	
	public List<Hperson> getHpersonList(Hperson hperson){
		return this.dao.getHpersonList(hperson);
	}
	
	public int addHperson(Hperson hperson){
		this.dao.addHperson(hperson);
		return 1;
	}
	
	public int delHperson(String id){
		return this.dao.delHperson(id);
	}
	
	public int updateHperson(Hperson hperson){
		return this.dao.updateHperson(hperson);
	}
}