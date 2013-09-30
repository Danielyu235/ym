package com.ay.emergency.plan.publicPart.pojo;

import com.ay.framework.annotation.ChineseName;
import com.ay.framework.core.pojo.BasePojo;

/**
 * 煤矿危险源库（公共部分）实体类
 * @author qianjinhao
 * 2013-05-15
 */
//@ChineseName("公共部分")
public class PublicPart extends BasePojo
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
    

    public String getStation()
    {
        return station;
    }

    public void setStation(String station)
    {
        this.station = station;
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

	@Override
	public String toString() {
		return "PublicPart [corpKey=" + corpKey + ", dangerous=" + dangerous
				+ ", loss=" + loss + ", station=" + station + ", step=" + step
				+ "]";
	}

}
