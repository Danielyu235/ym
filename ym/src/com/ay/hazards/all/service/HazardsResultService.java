package com.ay.hazards.all.service;

import com.ay.hazards.all.dao.HazardsResultDao;
import com.ay.hazards.all.pojo.HazardsResult;
import com.ay.framework.core.service.BaseService;

public class HazardsResultService extends BaseService<HazardsResult, HazardsResultDao> {
    public boolean insertOrUpdate(HazardsResult hr) {
	return dao.insertOrUpdate(hr);
    }
}