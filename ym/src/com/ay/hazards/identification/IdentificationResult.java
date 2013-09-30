package com.ay.hazards.identification;

/** 
 * @Description 辨识结果类
 * @date 2013-4-11
 * @author WangXin
 */
public class IdentificationResult {
    public static final String YES = "重大危险源";
    public static final String NO = "非重大危险源";
    public static final String ERROR = "辨识失败";
    private String info;
    private String reason;
    private HazardsInfo hazardsInfo;
    private IdentificationResult() {}
    /**
     * 得到辨识为重大危险源的结果
     * @param hazardsInfo 危险源信息
     * @return
     * @return IdentificationResult
     */
    public static IdentificationResult isMajorHazards(HazardsInfo hazardsInfo) {
	IdentificationResult ir = new IdentificationResult();
	ir.setInfo(YES);
	ir.setHazardsInfo(hazardsInfo);
	return ir;
    }
    /**
     * 得到辨识为非重大危险源的结果
     * @param hazardsInfo 危险源信息
     * @return
     * @return IdentificationResult
     */
    public static IdentificationResult isNotMajorHazards(HazardsInfo hazardsInfo) {
	IdentificationResult ir = new IdentificationResult();
	ir.setInfo(NO);
	ir.setHazardsInfo(hazardsInfo);
	return ir;
    }
    /**
     * 得到辨识异常的结果
     * @param hazardsInfo 危险源信息
     * @return
     * @return IdentificationResult
     */
    public static IdentificationResult error(HazardsInfo hazardsInfo) {
	IdentificationResult ir = new IdentificationResult();
	ir.setInfo(ERROR);
	ir.setHazardsInfo(hazardsInfo);
	return ir;
    }
    /**
     * 得到辨识异常的结果
     * @param hazardsInfo 危险源信息
     * @param reason 原因
     * @return
     * @return IdentificationResult
     */
    public static IdentificationResult error(HazardsInfo hazardsInfo, String reason) {
	IdentificationResult ir = new IdentificationResult();
	ir.setInfo(ERROR);
	ir.setHazardsInfo(hazardsInfo);
	ir.setReason(reason);
	return ir;
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
    public HazardsInfo getHazardsInfo() {
        return hazardsInfo;
    }
    public void setHazardsInfo(HazardsInfo hazardsInfo) {
        this.hazardsInfo = hazardsInfo;
    }
    
}

