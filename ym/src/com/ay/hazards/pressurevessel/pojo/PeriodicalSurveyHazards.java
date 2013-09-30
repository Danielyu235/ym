package com.ay.hazards.pressurevessel.pojo;

import com.ay.framework.annotation.ChineseName;
import com.ay.framework.core.pojo.BasePojo;

/** 
 * @Description 压力容器中的定期检查情况
 * @date 2013-4-9
 * @author WangXin
 */
//@ChineseName("定期检查情况")
public class PeriodicalSurveyHazards extends BasePojo {
    /**
     * 压力容器的ID FK
     */
    @ChineseName("压力容器ID")
    private String pressureId;
    @ChineseName("检查时间")
    private String date;
    @ChineseName("检查结果")
    private String result;
    @ChineseName("检查情况")
    private String situation;
    public String getPressureId() {
        return pressureId;
    }
    public void setPressureId(String pressureId) {
        this.pressureId = pressureId;
    }
    public String getDate() {
        return date;
    }
    public void setDate(String date) {
        this.date = date;
    }
    public String getResult() {
        return result;
    }
    public void setResult(String result) {
        this.result = result;
    }
    public String getSituation() {
        return situation;
    }
    public void setSituation(String situation) {
        this.situation = situation;
    }
    
    
}

