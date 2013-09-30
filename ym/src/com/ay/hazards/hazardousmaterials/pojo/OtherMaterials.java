package com.ay.hazards.hazardousmaterials.pojo;

import com.ay.framework.annotation.ChineseName;
import com.ay.framework.core.pojo.BasePojo;

/** 
 * @Description 自定义的危险物质
 * @date 2013-4-15
 * @author WangXin
 */
//@ChineseName("自定义危险物质")
public class OtherMaterials extends BasePojo {
    @ChineseName("物质名称")
    private String name;
    @ChineseName("类型")
    private String type;
    @ChineseName("危险性分类及说明")
    private String description;
    @ChineseName("临界量")
    private String thresholdQuantity;
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getType() {
        return type;
    }
    public void setType(String type) {
        this.type = type;
    }
    public String getDescription() {
        return description;
    }
    public void setDescription(String description) {
        this.description = description;
    }
    public String getThresholdQuantity() {
        return thresholdQuantity;
    }
    public void setThresholdQuantity(String thresholdQuantity) {
        this.thresholdQuantity = thresholdQuantity;
    }
    
}

