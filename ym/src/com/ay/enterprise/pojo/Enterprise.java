package com.ay.enterprise.pojo;

import com.ay.framework.annotation.ChineseName;
import com.ay.framework.annotation.MultiLineField;
import com.ay.framework.core.pojo.MapPojo;
import com.ay.framework.core.pojo.MapType;

/**
* 企业信息
* @author WangXin
* @version 2013-3-18
*/
public class Enterprise extends MapPojo
{
    /** 企业工商注册号 */
    @ChineseName("企业工商注册号")
    private String corpNumber;
    /** 单位组织机构代码 */
    @ChineseName("单位组织机构代码")
    private String corpCode;
    /** 集团/总公司工商注册号 */
    @ChineseName("集团/总公司工商注册号")
    private String headCorpNumber;
    /** 单位名称 */
    @ChineseName("单位名称")
    private String corpName;
    /** 传 真 */
    @ChineseName("传真")
    private String fax;
    /** 邮 编 */
    @ChineseName("邮编")
    private String postCode;
    /** 法定代表人 */
    @ChineseName("法定代表人")
    private String legalPerson;
    /** 法人邮箱 */
    @ChineseName("法人邮箱")
    private String lpersonMail;
    /** 法人电话 */
    @ChineseName("法人电话")
    private String lpersonPhone;
    /** 法人手机 */
    @ChineseName("法人手机")
    private String lpersonMobile;
    /** 法人代表职务 */
    @ChineseName("法人代表职务")
    private String lpersonJob;
    /** 法人代表职称 */
    @ChineseName("法人代表职称")
    private String lpersonTitle;
    /** 法人代表身份证号 */
    @ChineseName("法人代表身份证号")
    private String lpersonCardid;
    /** 企业经理职务 */
    @ChineseName("企业经理职务")
    private String corpManagerJob;
    /** 企业经理职称 */
    @ChineseName("企业经理职称")
    private String corpManagerPosition;
    /** 企业分管安全领导 */
    @ChineseName("企业分管安全领导")
    private String corpSafeLeader;
    /** 隶属关系 */
    @ChineseName("隶属关系")
    private String ordination;
    /** 所在网格 */
    @ChineseName("所在网格")
    private String area;
    /** 企业规模 */
    @ChineseName("企业规模")
    private String corpScale;
    /** 经济类型 */
    @ChineseName("经济类型")
    private String ecoType;
    /** 注册资本(万元)： */
    @ChineseName("注册资本(万元)")
    private String registerMoney;
    /** 资产总额(万元)： */
    @ChineseName("资产总额(万元)")
    private String totalMoney;
    /** 成立时间 */
    @ChineseName("成立时间")
    private String registerDate;
    /** 主项资质及等级 */
    @ChineseName("主项资质及等级")
    private String mainGrade;
    /** 监管分类 */
    @ChineseName("监管分类")
    private String managerType;
    /** 副监管分类 */
    @ChineseName("副监管分类 ")
    private String subManagerType;
    /** 是否有重大危险源,0:没有,1:有 */
    @ChineseName("是否有重大危险源,0:没有,1:有")
    private String isGreatHazard;
    /** 监管部门 */
    @ChineseName("监管部门")
    private String managerDept;
    /** 城镇建成区 */
    @ChineseName("城镇建成区")
    private String townBuildArea;
    /** 年总收入(万元) */
    @ChineseName("年总收入(万元)")
    private String yearIncome;
    /** 年主营业务收入(万元) */
    @ChineseName("资产总额(万元)：")
    private String yearMainIncome;
    /** 企业生产所在地 */
    @ChineseName("企业生产所在地")
    @MultiLineField
    private String corpProductAddr;
    /** 单位注册地址 */
    @ChineseName("单位注册地址")
    @MultiLineField
    private String corpRegisterAddr;
    /** 行政区划代码 */
    @ChineseName("行政区划代码")
    private String addrCode;
    /** 行业分类 */
    @ChineseName("行业分类 ")
    private String industryType;
    /** 副行业分类 */
    @ChineseName("副行业分类")
    private String subIndustryType;
    /** 生产经营范围 */
    @ChineseName("生产经营范围")
    @MultiLineField
    private String icProductRange;

    public void setCorpNumber(String corpNumber)
    {
        this.corpNumber = corpNumber;
    }

    public String getCorpNumber()
    {
        return this.corpNumber;
    }

    public void setCorpCode(String corpCode)
    {
        this.corpCode = corpCode;
    }

    public String getCorpCode()
    {
        return this.corpCode;
    }

    public void setHeadCorpNumber(String headCorpNumber)
    {
        this.headCorpNumber = headCorpNumber;
    }

    public String getHeadCorpNumber()
    {
        return this.headCorpNumber;
    }

    public void setCorpName(String corpName)
    {
        this.corpName = corpName;
    }

    public String getCorpName()
    {
        return this.corpName;
    }

    public void setFax(String fax)
    {
        this.fax = fax;
    }

    public String getFax()
    {
        return this.fax;
    }

    public void setPostCode(String postCode)
    {
        this.postCode = postCode;
    }

    public String getPostCode()
    {
        return this.postCode;
    }

    public void setLegalPerson(String legalPerson)
    {
        this.legalPerson = legalPerson;
    }

    public String getLegalPerson()
    {
        return this.legalPerson;
    }

    public void setLpersonMail(String lpersonMail)
    {
        this.lpersonMail = lpersonMail;
    }

    public String getLpersonMail()
    {
        return this.lpersonMail;
    }

    public void setLpersonPhone(String lpersonPhone)
    {
        this.lpersonPhone = lpersonPhone;
    }

    public String getLpersonPhone()
    {
        return this.lpersonPhone;
    }

    public void setLpersonJob(String lpersonJob)
    {
        this.lpersonJob = lpersonJob;
    }

    public String getLpersonJob()
    {
        return this.lpersonJob;
    }

    public void setLpersonCardid(String lpersonCardid)
    {
        this.lpersonCardid = lpersonCardid;
    }

    public String getLpersonCardid()
    {
        return this.lpersonCardid;
    }

    public void setCorpManagerJob(String corpManagerJob)
    {
        this.corpManagerJob = corpManagerJob;
    }

    public String getCorpManagerJob()
    {
        return this.corpManagerJob;
    }

    public void setCorpManagerPosition(String corpManagerPosition)
    {
        this.corpManagerPosition = corpManagerPosition;
    }

    public String getCorpManagerPosition()
    {
        return this.corpManagerPosition;
    }

    public void setCorpSafeLeader(String corpSafeLeader)
    {
        this.corpSafeLeader = corpSafeLeader;
    }

    public String getCorpSafeLeader()
    {
        return this.corpSafeLeader;
    }

    public void setOrdination(String ordination)
    {
        this.ordination = ordination;
    }

    public String getOrdination()
    {
        return this.ordination;
    }

    public void setArea(String area)
    {
        this.area = area;
    }

    public String getArea()
    {
        return this.area;
    }

    public void setCorpScale(String corpScale)
    {
        this.corpScale = corpScale;
    }

    public String getCorpScale()
    {
        return this.corpScale;
    }

    public void setEcoType(String ecoType)
    {
        this.ecoType = ecoType;
    }

    public String getEcoType()
    {
        return this.ecoType;
    }

    public void setRegisterMoney(String registerMoney)
    {
        this.registerMoney = registerMoney;
    }

    public String getRegisterMoney()
    {
        return this.registerMoney;
    }

    public void setTotalMoney(String totalMoney)
    {
        this.totalMoney = totalMoney;
    }

    public String getTotalMoney()
    {
        return this.totalMoney;
    }

    public void setMainGrade(String mainGrade)
    {
        this.mainGrade = mainGrade;
    }

    public String getMainGrade()
    {
        return this.mainGrade;
    }

    public void setManagerType(String managerType)
    {
        this.managerType = managerType;
    }

    public String getManagerType()
    {
        return this.managerType;
    }

    public void setIsGreatHazard(String isGreatHazard)
    {
        this.isGreatHazard = isGreatHazard;
    }

    public String getIsGreatHazard()
    {
        return this.isGreatHazard;
    }

    public void setManagerDept(String managerDept)
    {
        this.managerDept = managerDept;
    }

    public String getManagerDept()
    {
        return this.managerDept;
    }

    public void setTownBuildArea(String townBuildArea)
    {
        this.townBuildArea = townBuildArea;
    }

    public String getTownBuildArea()
    {
        return this.townBuildArea;
    }

    public void setYearIncome(String yearIncome)
    {
        this.yearIncome = yearIncome;
    }

    public String getYearIncome()
    {
        return this.yearIncome;
    }

    public void setYearMainIncome(String yearMainIncome)
    {
        this.yearMainIncome = yearMainIncome;
    }

    public String getYearMainIncome()
    {
        return this.yearMainIncome;
    }

    public void setCorpProductAddr(String corpProductAddr)
    {
        this.corpProductAddr = corpProductAddr;
    }

    public String getCorpProductAddr()
    {
        return this.corpProductAddr;
    }

    public void setCorpRegisterAddr(String corpRegisterAddr)
    {
        this.corpRegisterAddr = corpRegisterAddr;
    }

    public String getCorpRegisterAddr()
    {
        return this.corpRegisterAddr;
    }

    public void setIndustryType(String industryType)
    {
        this.industryType = industryType;
    }

    public String getIndustryType()
    {
        return this.industryType;
    }

    public void setIcProductRange(String icProductRange)
    {
        this.icProductRange = icProductRange;
    }

    public String getIcProductRange()
    {
        return this.icProductRange;
    }

    public String getRegisterDate()
    {
        return registerDate;
    }

    public void setRegisterDate(String registerDate)
    {
        this.registerDate = registerDate;
    }

    public String getAddrCode()
    {
        return addrCode;
    }

    public void setAddrCode(String addrCode)
    {
        this.addrCode = addrCode;
    }

    public String getLpersonMobile()
    {
        return lpersonMobile;
    }

    public void setLpersonMobile(String lpersonMobile)
    {
        this.lpersonMobile = lpersonMobile;
    }

    public String getLpersonTitle()
    {
        return lpersonTitle;
    }

    public void setLpersonTitle(String lpersonTitle)
    {
        this.lpersonTitle = lpersonTitle;
    }

    public String getSubManagerType()
    {
        return subManagerType;
    }

    public void setSubManagerType(String subManagerType)
    {
        this.subManagerType = subManagerType;
    }

    public String getSubIndustryType()
    {
        return subIndustryType;
    }

    public void setSubIndustryType(String subIndustryType)
    {
        this.subIndustryType = subIndustryType;
    }

    @Override
    public String toString()
    {
        return "BusCorpInfo [addrCode=" + addrCode + "]";
    }

    @Override
    public MapType getMapType() {
	return MapType.enterprise;
    }

}