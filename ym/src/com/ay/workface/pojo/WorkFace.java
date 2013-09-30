package com.ay.workface.pojo;

import com.ay.framework.annotation.ChineseName;
import com.ay.framework.core.pojo.BasePojo;

/**
 * 煤矿危险源库（工作面部分）实体类
 * @author qianjinhao
 * 2013年6月7日 
 */
//@ChineseName("工作面部分")
public class WorkFace extends BasePojo
{
    @ChineseName("工作面编号")
    private String number;
    @ChineseName("工作面名称")
    private String workFaceName;
    @ChineseName("工作面位置")
    private String workFacePlace;
    @ChineseName("工作面情况")
    private String workFaceCase;
    @ChineseName("危险源")
    private String dangerous;
    @ChineseName("可能造成的伤害和损失")
    private String loss;
    @ChineseName("当事人应该采取的措施")
    private String step;
    @ChineseName("备注")
    private String bz;
    
    public String getNumber()
    {
        return number;
    }
    public void setNumber(String number)
    {
        this.number = number;
    }
    public String getWorkFaceName()
    {
        return workFaceName;
    }
    public void setWorkFaceName(String workFaceName)
    {
        this.workFaceName = workFaceName;
    }
    public String getWorkFacePlace()
    {
        return workFacePlace;
    }
    public void setWorkFacePlace(String workFacePlace)
    {
        this.workFacePlace = workFacePlace;
    }
    public String getWorkFaceCase()
    {
        return workFaceCase;
    }
    public void setWorkFaceCase(String workFaceCase)
    {
        this.workFaceCase = workFaceCase;
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
    public String getBz()
    {
        return bz;
    }
    public void setBz(String bz)
    {
        this.bz = bz;
    }
}
