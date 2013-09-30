package com.ay.enterprise.action;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.shiro.SecurityUtils;

import com.ay.enterprise.pojo.Enterprise;
import com.ay.enterprise.service.EnterpriseService;
import com.ay.framework.bean.DataStore;
import com.ay.framework.bean.OperateInfo;
import com.ay.framework.core.dao.pagination.Page;
import com.ay.framework.core.utils.mapper.JsonMapper;
import com.ay.framework.core.utils.web.struts.Struts2Utils;
import com.ay.framework.util.BeanUtil;
import com.ay.framework.util.EncodingHeaderUtil;
import com.ay.framework.core.action.BaseAction;
/**
* 企业信息模块Action
* @author WangXin
* @version 2013-3-18
*/
@SuppressWarnings("all")
public class EnterpriseAction extends BaseAction
{
    /** 企业信息的服务类 */
    private EnterpriseService enterpriseService;
    /** 企业信息的实体类 */
    private Enterprise enterprise;
    /** 分页对象 */
    private String page;
    /** 每页显示的数量 */
    private String rows;
    /** 企业信息ID */
    private String id;
    /** ID的集合 */
    private String ids;
    /**
     * 添加企业信息方法 
     * @return void
     */
    public void add()
    {
        OperateInfo operateInfo = new OperateInfo();
        try
        {
            enterpriseService.insert(enterprise);
            //返回信息添加成功结果
            operateInfo.setOperateMessage("添加成功");
            operateInfo.setOperateSuccess(true);
        }
        catch (Exception e)
        {
            //返回信息添加失败结果
            operateInfo.setOperateMessage("添加失败");
            operateInfo.setOperateSuccess(false);
        }

        String json = new JsonMapper().toJson(operateInfo);
        Struts2Utils.renderText(json);
    }
    /**
     * 更新企业信息方法 
     * @return void
     */
    public void update()
    {
        OperateInfo operateInfo = new OperateInfo();
        //执行更新企业信息操作
        boolean flag = enterpriseService.update(enterprise);
        if (flag)
        {
            //返回信息更新成功结果
            operateInfo.setOperateMessage("更新成功");
            operateInfo.setOperateSuccess(true);
        }
        else
        {
            //返回信息更新失败结果
            operateInfo.setOperateMessage("更新失败");
            operateInfo.setOperateSuccess(false);
        }

        String json = new JsonMapper().toJson(operateInfo);
        Struts2Utils.renderText(json);
    }
    /**
     * 删除企业信息方法 
     * @return void
     */
    public void delete()
    {
        OperateInfo operateInfo = new OperateInfo();
        boolean flag = false;
        if (ids.contains(","))
        {
            String idsParam[] = ids.split(",");
            //执行批量删除操作
            flag = enterpriseService.deleteByIds(idsParam);
        }
        else
        {
            //执行删除操作
            flag = enterpriseService.delete(ids);
        }
        if (flag)
        {
            //返回信息删除成功结果
            operateInfo.setOperateMessage("删除成功");
            operateInfo.setOperateSuccess(true);
        }
        else
        {
            //返回信息删除失败结果
            operateInfo.setOperateMessage("删除失败");
            operateInfo.setOperateSuccess(false);
        }
        String json = new JsonMapper().toJson(operateInfo);
        Struts2Utils.renderText(json);
    }
    /**
     * 企业信息列表方法 
     * @return void
     */
    public void list()
    {
        DataStore<Enterprise> dataStore = new DataStore<Enterprise>();
        //获取分页对象
        Page pageTemp = Page.getNewInstance(page, rows);
        //构建查询map
        Map paramMap = BeanUtil.Bean2Map(enterprise);
        //查询List数据
        Page resultPage = enterpriseService.pageQuery(paramMap, pageTemp);
        List<Enterprise> resultList = (List<Enterprise>) resultPage
                .getCollection();
        dataStore.setTotal(new Long(resultPage.getCount()));
        dataStore.setRows(resultList);
        String json = new JsonMapper().toJson(dataStore);
        //返回结果
        Struts2Utils.renderText(json);
    }
    /**
     * 企业信息查看方法 
     * @return void
     */
    public void getById()
    {
        //查找单条数据并返回json
        Struts2Utils.renderJson(enterpriseService.getById(id),
                EncodingHeaderUtil.HEADERENCODING,
                EncodingHeaderUtil.CACHEENCODING);
    }

    public Enterprise getEnterprise()
    {
        return enterprise;
    }

    public void setEnterprise(Enterprise enterprise)
    {
        this.enterprise = enterprise;
    }

    public EnterpriseService getEnterpriseService()
    {
        return enterpriseService;
    }

    public void setEnterpriseService(EnterpriseService enterpriseService)
    {
        this.enterpriseService = enterpriseService;
    }

    public String getPage()
    {
        return page;
    }

    public void setPage(String page)
    {
        this.page = page;
    }

    public String getRows()
    {
        return rows;
    }

    public void setRows(String rows)
    {
        this.rows = rows;
    }

    public String getId()
    {
        return id;
    }

    public void setId(String id)
    {
        this.id = id;
    }

    public String getIds()
    {
        return ids;
    }

    public void setIds(String ids)
    {
        this.ids = ids;
    }

}
