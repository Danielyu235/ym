package com.ay.tran.service;

import java.util.List;

import com.ay.tran.dao.TranDao;
import com.ay.tran.pojo.Tran;
import com.ay.tran.pojo.TranMonth;
import com.ay.framework.core.service.BaseService;

public class TranService extends BaseService<Tran, TranDao> {
	
    public List<TranMonth> getStaff(String month){
        return this.dao.getStaff(month);
    }
    
    public List<TranMonth> getCol(String month){
        return this.dao.getCol(month);
    }
}