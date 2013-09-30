package com.ay.hazards.all.service;

import com.ay.hazards.all.dao.HazardsDao;
import com.ay.hazards.all.pojo.Hazards;
import com.ay.hazards.identification.IHazards;
import com.ay.framework.core.service.BaseService;

public class HazardsService extends BaseService<Hazards, HazardsDao> {
    public IHazards findHazards(String type, String id) {
	return dao.findHazards(getNameSpace(type), id);
    }
    
    private String getNameSpace(String type) {
	return type;
    }
}