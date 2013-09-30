package com.ay.hazards.all.pojo;

import com.ay.framework.annotation.ChineseName;
import com.ay.framework.core.pojo.BasePojo;

/** 
 * @Description 危险源辨识结果
 * @date 2013-4-17
 * @author WangXin
 */
//@ChineseName("辨识结果")
public class HazardsResult extends BasePojo {
    @ChineseName("危险源Id")
    private String hazardsId;
    @ChineseName("辨识信息")
    private String info;
    @ChineseName("辨识原因")
    private String reason;
    
    public String getHazardsId() {
        return hazardsId;
    }
    public void setHazardsId(String hazardsId) {
        this.hazardsId = hazardsId;
    }
    public String getInfo() {
        return info;
    }
    public void setInfo(String info) {
        this.info = info;
    }
    public String getReason() {
        return reason;
    }
    public void setReason(String reason) {
        this.reason = reason;
    }
    
}

