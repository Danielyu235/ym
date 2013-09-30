package com.ay.essentials.pojo;

import com.ay.framework.annotation.ChineseName;
import com.ay.framework.core.pojo.BasePojo;

/**
 * 煤矿危险源库（专业部分,岗位操作要领维护）实体类
 * @author qianjinhao
 * 2013年5月21日 
 */
//@ChineseName("岗位要领维护")
public class Essentials extends BasePojo
{
    @ChineseName("一、岗标操作要领")
    private String czyl;
    
    @ChineseName("二、手指口述要点")
    private String ksyd;
    
    @ChineseName("三、典型事故案例")
    private String sgal;
    
    @ChineseName("所属专业")
    private String sszy;
    
    //所属专业中文
    private String sszyByType;
    
    @ChineseName("所属工种")
    private String ssgz;
    
    //所属工种中文
    private String ssgzByType;
    
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

    public String getSszy()
    {
        return sszy;
    }

    public void setSszy(String sszy)
    {
        this.sszy = sszy;
    }

    public String getSsgz()
    {
        return ssgz;
    }

    public void setSsgz(String ssgz)
    {
        this.ssgz = ssgz;
    }
}
