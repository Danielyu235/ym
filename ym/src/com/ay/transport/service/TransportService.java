package com.ay.transport.service;

import java.util.List;

import com.ay.steep.pojo.Steep;
import com.ay.transport.dao.TransportDao;
import com.ay.transport.pojo.Transport;
import com.ay.framework.core.service.BaseService;

public class TransportService extends BaseService<Transport, TransportDao> {
	public List<Transport> getListById(String[] ids){
		return this.dao.getListById(ids);
	}
}