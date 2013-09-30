package com.ay.wash.pojo;

import com.ay.framework.annotation.ChineseName;
import com.ay.framework.annotation.PersistenceIgnore;
import com.ay.framework.core.pojo.BasePojo;

/**
 * 煤矿危险源库（专业部分，洗煤专业）实体类
 * @author qianjinhao
 * 2013年6月4日 
 */
//@ChineseName("洗煤专业")
public class Wash extends BasePojo
{
    @ChineseName("序号")
    private String corpKey;
    
    @ChineseName("危险源")
    private String dangerous;
    
    @ChineseName("可能造成的伤害和损失")
    private String loss;
    
    @ChineseName("当事人应该采取的措施")
    private String step;
    
    @ChineseName("适用岗位")
    private String station;
    
    @ChineseName("适用工种")
    private String craft;
    
    /**
     * 岗位指标字段
     */
    //"一、岗标操作要领   
    private String czyl;
    
    //二、手指口述要点
    private String ksyd;
    
    //三、典型事故案例
    private String sgal;
    
    //专业类型
    private String sszyByType;
    
    //岗位
    private String ssgzByType;
    
    //专业岗位中文名
    @PersistenceIgnore
    private String craftTypeName;
    
    public String getCzyl()
    {
        return czyl;
    }

    public void setCzyl(String czyl)
    {
        this.czyl = czyl;
    }

    public String getKsyd()
    {
        return ksyd;
    }

    public void setKsyd(String ksyd)
    {
        this.ksyd = ksyd;
    }

    public String getSgal()
    {
        return sgal;
    }

    public void setSgal(String sgal)
    {
        this.sgal = sgal;
    }

    public String getSszyByType()
    {
        return sszyByType;
    }

    public void setSszyByType(String sszyByType)
    {
        this.sszyByType = sszyByType;
    }

    public String getSsgzByType()
    {
        return ssgzByType;
    }

    public void setSsgzByType(String ssgzByType)
    {
        this.ssgzByType = ssgzByType;
    }

    public String getCraftTypeName()
    {
        return craftTypeName;
    }

    public void setCraftTypeName(String craftTypeName)
    {
        this.craftTypeName = craftTypeName;
    }

    public String getCorpKey()
    {
        return corpKey;
    }

    public void setCorpKey(String corpKey)
    {
        this.corpKey = corpKey;
    }

    public String getDangerous()
    {
        return dangerous;
    }

    public void setDangerous(String dangerous)
    {
        this.dangerous = dangerous;
    }

    public String getLoss()
    {
        return loss;
    }

    public void setLoss(String loss)
    {
        this.loss = loss;
    }

    public String getStep()
    {
        return step;
    }

    public void setStep(String step)
    {
        this.step = step;
    }

    public String getStation()
    {
        return station;
    }

    public void setStation(String station)
    {
        this.station = station;
    }

    public String getCraft()
    {
        return craft;
    }

    public void setCraft(String craft)
    {
        this.craft = craft;
    }
}
