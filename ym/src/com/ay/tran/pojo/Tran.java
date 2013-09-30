package com.ay.tran.pojo;

import com.ay.framework.annotation.ChineseName;
import com.ay.framework.core.pojo.BasePojo;

/**
 * 运输系统数据入口实体类
 * @author Qian Jinhao
 * 2013年9月23日 
 */
//@ChineseName("运输系统数据入口")
public class Tran extends BasePojo
{
    @ChineseName("工作面")
    private String workFace;
    
    @ChineseName("统计时间")
    private String statisticalTime;
    
    @ChineseName("无故障运行天数")
    private String turns;
    
    //工作面中文名称
    private String workFaceByName;

    public String getWorkFaceByName()
    {
        return workFaceByName;
    }

    public void setWorkFaceByName(String workFaceByName)
    {
        this.workFaceByName = workFaceByName;
    }

    public String getWorkFace()
    {
        return workFace;
    }

    public void setWorkFace(String workFace)
    {
        this.workFace = workFace;
    }

    public String getStatisticalTime()
    {
        return statisticalTime;
    }

    public void setStatisticalTime(String statisticalTime)
    {
        this.statisticalTime = statisticalTime;
    }

    public String getTurns()
    {
        return turns;
    }

    public void setTurns(String turns)
    {
        this.turns = turns;
    }
}
