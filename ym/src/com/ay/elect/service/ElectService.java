package com.ay.elect.service;

import java.util.List;

import com.ay.elect.dao.ElectDao;
import com.ay.elect.pojo.Elect;
import com.ay.elect.pojo.ElectMonth;
import com.ay.framework.core.service.BaseService;

public class ElectService extends BaseService<Elect, ElectDao> {
    /**
     * 掘进人员效率
     * @param month
     * @return
     */
    public List<ElectMonth> getStaff(String month){
        return this.dao.getStaff(month);
    }
    
    public List<ElectMonth> getCol(String month){
        return this.dao.getCol(month);
    }
}