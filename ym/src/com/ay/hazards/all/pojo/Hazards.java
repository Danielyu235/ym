package com.ay.hazards.all.pojo;

import com.ay.framework.annotation.ChineseName;
import com.ay.framework.core.pojo.BasePojo;

/** 
 * @Description 危险源总的实体类
 * @date 2013-4-17
 * @author WangXin
 */
//@ChineseName("危险源")
public class Hazards extends BasePojo {
    @ChineseName("危险源名称")
    private String name;
    @ChineseName("单位代码")
    private String dwdm;
    @ChineseName("危险源类型")
    private String type;
    @ChineseName("所属单位")
    private String corpName;
    /** 辨识信息 */
    private String info;
    /** 辨识原因 */
    private String reason;
    /** 命名空间 */
    private String nameSpace;
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getDwdm() {
        return dwdm;
    }
    public void setDwdm(String dwdm) {
        this.dwdm = dwdm;
    }
    public String getType() {
        return type;
    }
    public void setType(String type) {
        this.type = type;
    }
    public String getCorpName() {
        return corpName;
    }
    public void setCorpName(String corpName) {
        this.corpName = corpName;
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
    public String getNameSpace() {
        return nameSpace;
    }
    public void setNameSpace(String nameSpace) {
        this.nameSpace = nameSpace;
    }
    
}

