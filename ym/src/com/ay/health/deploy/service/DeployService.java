package com.ay.health.deploy.service;

import java.util.Map;

import com.ay.health.deploy.dao.DeployDao;
import com.ay.health.deploy.pojo.Deploy;
import com.ay.framework.core.service.BaseService;

public class DeployService extends BaseService<Deploy, DeployDao> {
    public int count() {
        return dao.count();
    }

	
}