package com.ay.danger.service;

import java.util.List;

import com.ay.danger.dao.HiddenDangerDao;
import com.ay.danger.pojo.HiddenDanger;
import com.ay.danger.pojo.HiddenDangerMonth;
import com.ay.framework.core.service.BaseService;

public class HiddenDangerService extends BaseService<HiddenDanger, HiddenDangerDao> {
    public List<HiddenDangerMonth> getStaff(String month){
        return this.dao.getStaff(month);
    }
}