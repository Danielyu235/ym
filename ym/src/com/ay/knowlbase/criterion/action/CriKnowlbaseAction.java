package com.ay.knowlbase.criterion.action;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.shiro.SecurityUtils;
import org.junit.Test;

import com.ay.framework.bean.DataStore;
import com.ay.framework.bean.OperateInfo;
import com.ay.framework.core.action.BaseAction;
import com.ay.framework.core.dao.pagination.Page;
import com.ay.framework.core.utils.mapper.JsonMapper;
import com.ay.framework.core.utils.web.struts.Struts2Utils;
import com.ay.framework.util.BeanUtil;
import com.ay.framework.util.EncodingHeaderUtil;
import com.ay.knowlbase.criterion.pojo.CriKnowlbase;
import com.ay.knowlbase.criterion.service.CriKnowlbaseService;


/**
 * 安全生产标准
 * @author SangWei 
 * 2013-3-18
 */
@SuppressWarnings("all")
public class CriKnowlbaseAction extends BaseAction
{
    /** 安全生产标准服务类 */
    private CriKnowlbaseService criterionService;

    /** 安全生产标准对象 */
    private CriKnowlbase criterion;

    /** 分页对象 */
    private String page;

    /** 每页显示的数量 */
    private String rows;

    /** 典型事故案例ID */
    private String id;

    private String sort;
    private String order;
    private String ids;

    /**
     * 分页查询list列表
     */
    public void pageList()
    {
        DataStore<CriKnowlbase> dataStore = new DataStore<CriKnowlbase>();
        // 获取分页对象
        Page pageTemp = Page.getNewInstance(page, rows);
        // 创建Map对象
        Map paramMap = BeanUtil.Bean2Map(criterion);
        if (null == paramMap)
        {
            paramMap = new HashMap();

        }
        // 查询List数据 参数1：查询条件 参数2：分页
        Page resultPage = criterionService.pageQuery(paramMap, pageTemp);
        List<CriKnowlbase> resultList = (List<CriKnowlbase>) resultPage.getCollection();
        // 获得页面上的信息条数
        dataStore.setTotal(new Long(resultPage.getCount()));
        dataStore.setRows(resultList);
        String json = new JsonMapper().toJson(dataStore);
        Struts2Utils.renderText(json);
    }

    /**
     * 添加
     */
    public void add()
    {
        OperateInfo operateInfo = new OperateInfo();

        try
        {
            // 执行添加操作
            criterionService.insert(criterion);
            // 返回信息添加成功结果
            operateInfo.setOperateMessage("添加成功");
            operateInfo.setOperateSuccess(true);
        }
        catch (Exception e)
        {
            // 返回信息添加失败结果
            operateInfo.setOperateMessage("添加失败");
            operateInfo.setOperateSuccess(false);
        }

        String json = new JsonMapper().toJson(operateInfo);
        Struts2Utils.renderText(json);
    }

    /**
     * 根据ID查询
     */
    public void getById()
    {
        CriKnowlbase law = new CriKnowlbase();
        // 根据传入执行查询
        law = criterionService.getById(id);

        Struts2Utils.renderJson(law, EncodingHeaderUtil.HEADERENCODING);
    }

    /**
     * 更新
     */
    public void update()
    {
        OperateInfo operateInfo = new OperateInfo();
        // 执行修改操作
        boolean flag = criterionService.update(criterion);
        if (flag)
        {
            // 返回信息修改成功结果
            operateInfo.setOperateMessage("更新成功");
            operateInfo.setOperateSuccess(true);
        }
        else
        {
            // 返回信息修改失败结果
            operateInfo.setOperateMessage("更新失败");
            operateInfo.setOperateSuccess(false);
        }

        String json = new JsonMapper().toJson(operateInfo);
        Struts2Utils.renderText(json);
    }

    /**
     * 根据多个ID进行删除的操作
     */
    public void deleteByIds()
    {
        OperateInfo operateInfo = new OperateInfo();
        boolean flag = false;
        if (ids.contains(","))
        {
            String idsParam[] = ids.split(",");
            flag = criterionService.delete(idsParam);
        }
        else
        {
            flag = criterionService.delete(ids);
        }
        if (flag)
        {
            // 返回信息删除成功结果
            operateInfo.setOperateMessage("删除成功");
            operateInfo.setOperateSuccess(true);
        }
        else
        {
            // 返回信息删除失败结果
            operateInfo.setOperateMessage("删除失败");
            operateInfo.setOperateSuccess(false);
        }
        String json = new JsonMapper().toJson(operateInfo);
        Struts2Utils.renderText(json);
    }


    public CriKnowlbaseService getCriterionService()
    {
        return criterionService;
    }

    public void setCriterionService(CriKnowlbaseService criterionService)
    {
        this.criterionService = criterionService;
    }

    public CriKnowlbase getCriterion()
    {
        return criterion;
    }

    public void setCriterion(CriKnowlbase criterion)
    {
        this.criterion = criterion;
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

    public String getSort()
    {
        return sort;
    }

    public void setSort(String sort)
    {
        this.sort = sort;
    }

    public String getOrder()
    {
        return order;
    }

    public void setOrder(String order)
    {
        this.order = order;
    }

    public String getIds()
    {
        return ids;
    }

    public void setIds(String ids)
    {
        this.ids = ids;
    }

    public String getId()
    {
        return id;
    }

    public void setId(String id)
    {
        this.id = id;
    }
}
