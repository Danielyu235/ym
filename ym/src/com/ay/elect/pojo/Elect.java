package com.ay.elect.pojo;

import com.ay.framework.annotation.ChineseName;
import com.ay.framework.core.pojo.BasePojo;

/**
 * 机电系统主题预算实体类
 * @author Qian Jinhao
 * 2013年9月16日
 */
//@ChineseName("机电系统主题预算")
public class Elect extends BasePojo
{
    private static final long serialVersionUID = 1L;
    @ChineseName("项目")
    private String xm;
    
    //项目名称中文
    private String xmType;

    @ChineseName("电量（万千瓦时）")
    private String dl;
    
    @ChineseName("电费（万元）")
    private String df;
    
    @ChineseName("单耗（千瓦时/吨）")
    private String dh;
    
    @ChineseName("吨煤电费（元/吨）")
    private String dmdf;
    
    @ChineseName("峰谷比")
    private String fgb;
    
    @ChineseName("计划电价（元/千瓦时）")
    private String jhdj;
    
    @ChineseName("预算日期")
    private String ysrq;
    
    //预算与登记状态，0：预算，1：登记
    private String ysType;
    
    public String getYsType()
    {
        return ysType;
    }

    public void setYsType(String ysType)
    {
        this.ysType = ysType;
    }

    public String getYsrq()
    {
        return ysrq;
    }

    public void setYsrq(String ysrq)
    {
        this.ysrq = ysrq;
    }

    public String getXmType()
    {
        return xmType;
    }

    public void setXmType(String xmType)
    {
        this.xmType = xmType;
    }

    public String getXm()
    {
        return xm;
    }

    public void setXm(String xm)
    {
        this.xm = xm;
    }

    public String getDl()
    {
        return dl;
    }

    public void setDl(String dl)
    {
        this.dl = dl;
    }

    public String getDf()
    {
        return df;
    }

    public void setDf(String df)
    {
        this.df = df;
    }

    public String getDh()
    {
        return dh;
    }

    public void setDh(String dh)
    {
        this.dh = dh;
    }

    public String getDmdf()
    {
        return dmdf;
    }

    public void setDmdf(String dmdf)
    {
        this.dmdf = dmdf;
    }

    public String getFgb()
    {
        return fgb;
    }

    public void setFgb(String fgb)
    {
        this.fgb = fgb;
    }

    public String getJhdj()
    {
        return jhdj;
    }

    public void setJhdj(String jhdj)
    {
        this.jhdj = jhdj;
    }
}
