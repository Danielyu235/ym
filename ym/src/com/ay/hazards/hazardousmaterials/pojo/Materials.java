package com.ay.hazards.hazardousmaterials.pojo;

import com.ay.framework.annotation.ChineseName;
import com.ay.framework.core.pojo.BasePojo;

/** 
 * @Description 危化品库的中危险物质
 * @date 2013-4-15
 * @author WangXin
 */
//@ChineseName("危险物质")
public class Materials extends BasePojo{
    @ChineseName("物质类型")
    private String type;
    @ChineseName("物质名称")
    private String name;
    @ChineseName("临界量")
    private String thresholdQuantity;
    public String getType() {
        return type;
    }
    public void setType(String type) {
        this.type = type;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getThresholdQuantity() {
        return thresholdQuantity;
    }
    public void setThresholdQuantity(String thresholdQuantity) {
        this.thresholdQuantity = thresholdQuantity;
    }
    
}

