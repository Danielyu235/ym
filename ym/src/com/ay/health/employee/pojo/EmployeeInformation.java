package com.ay.health.employee.pojo;

import com.ay.framework.annotation.ChineseName;
import com.ay.framework.core.pojo.BasePojo;
import com.ay.framework.core.pojo.MapPojo;
import com.ay.framework.core.pojo.MapType;
/** 
 * @Description
 * @date 2013-6-5
 * @author shenhuanan
 */
//@ChineseName("员工信息")
public class EmployeeInformation extends BasePojo{
   
    @ChineseName("工号")
    private String jobNumber;
    @ChineseName("姓名")
    private String name;
    @ChineseName("性别")
    private String sex;
    @ChineseName("出生日期")
    private String date;
    @ChineseName("所在岗位")
    private String specialities;
    private String post;
    @ChineseName("检查结果")
    private String result;
    private String telephone;
    private String email;
    private String address;
    private String specialitiesByType;
    private String postByType;
    
    public String getSpecialitiesByType()
    {
        return specialitiesByType;
    }
    public void setSpecialitiesByType(String specialitiesByType)
    {
        this.specialitiesByType = specialitiesByType;
    }
    public String getPostByType()
    {
        return postByType;
    }
    public void setPostByType(String postByType)
    {
        this.postByType = postByType;
    }
    public String getJobNumber()
    {
        return jobNumber;
    }
    public void setJobNumber(String jobNumber)
    {
        this.jobNumber = jobNumber;
    }
    public String getName()
    {
        return name;
    }
    public void setName(String name)
    {
        this.name = name;
    }
    public String getSex()
    {
        return sex;
    }
    public void setSex(String sex)
    {
        this.sex = sex;
    }
    public String getDate()
    {
        return date;
    }
    public void setDate(String date)
    {
        this.date = date;
    }
    
    public String getResult()
    {
        return result;
    }
    public void setResult(String result)
    {
        this.result = result;
    }
    
    public String getTelephone()
    {
        return telephone;
    }
    public void setTelephone(String telephone)
    {
        this.telephone = telephone;
    }
    public String getEmail()
    {
        return email;
    }
    public void setEmail(String email)
    {
        this.email = email;
    }
    public String getAddress()
    {
        return address;
    }
    public void setAddress(String address)
    {
        this.address = address;
    }
    public String getSpecialities()
    {
        return specialities;
    }
    public void setSpecialities(String specialities)
    {
        this.specialities = specialities;
    }
    public String getPost()
    {
        return post;
    }
    public void setPost(String post)
    {
        this.post = post;
    }
  
    
    
}
