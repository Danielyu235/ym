package com.ay.framework.core.pojo;

import com.ay.hazards.identification.HazardsType;

/** 
 * @Description
 * @date 2013-4-23
 * @author WangXin
 */
public abstract class MapPojo extends BasePojo {
    private String hasMap;
    public String getHasMap() {
        return hasMap;
    }

    public void setHasMap(String hasMap) {
        this.hasMap = hasMap;
    }
    public abstract MapType getMapType();
}

