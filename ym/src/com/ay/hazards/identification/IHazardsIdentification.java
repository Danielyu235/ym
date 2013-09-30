package com.ay.hazards.identification;

/** 
 * @Description 危险源辨识接口
 * @date 2013-4-11
 * @author WangXin
 */
public interface IHazardsIdentification {
    /**
     * 辨识方法（判断是否为重大危险源）
     * @param hazards
     * @return
     * @return IdentificationResult
     */
    IdentificationResult isMajorHazards(IHazards hazards);
}

