package com.ay.knowlbase.accidentCase.action;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.shiro.SecurityUtils;

import com.ay.framework.bean.DataStore;
import com.ay.framework.bean.OperateInfo;
import com.ay.framework.core.action.BaseAction;
import com.ay.framework.core.dao.pagination.Page;
import com.ay.framework.core.utils.mapper.JsonMapper;
import com.ay.framework.core.utils.web.struts.Struts2Utils;
import com.ay.framework.util.BeanUtil;
import com.ay.framework.util.EncodingHeaderUtil;
import com.ay.knowlbase.accidentCase.pojo.AccKnowlbase;
import com.ay.knowlbase.accidentCase.service.AccKnowlbaseService;


/**
 * 典型事故案例表现层
 * @author SangWei 
 * 2013-3-18
 */
@SuppressWarnings("all")
public class AccKnowlbaseAction extends BaseAction
{
    /** 典型事故案例服务层对象 */
    private AccKnowlbaseService accidentCaseService;

    /** 典型事故案例实体类 */
    private AccKnowlbase accidentCase;

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
        DataStore<AccKnowlbase> dataStore = new DataStore<AccKnowlbase>();
        // 获取分页对象
        Page pageTemp = Page.getNewInstance(page, rows);
        // 创建Map对象
        Map paramMap = BeanUtil.Bean2Map(accidentCase);
        if (null == paramMap)
        {
            paramMap = new HashMap();

        }
        // 查询List数据 参数1：查询条件 参数2：分页
        Page resultPage = accidentCaseService.pageQuery(paramMap, pageTemp);
        List<AccKnowlbase> resultList = (List<AccKnowlbase>) resultPage.getCollection();
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
            accidentCaseService.insert(accidentCase);
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
        AccKnowlbase instence = new AccKnowlbase();
        // 根据传入执行查询
        instence = accidentCaseService.getById(id);

        Struts2Utils.renderJson(instence, EncodingHeaderUtil.HEADERENCODING);
    }

    /**
     * 修改
     */
    public void update()
    {
        OperateInfo operateInfo = new OperateInfo();
        // 执行修改操作
        boolean flag = accidentCaseService.update(accidentCase);
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
            flag = accidentCaseService.delete(idsParam);
        }
        else
        {
            flag = accidentCaseService.delete(ids);
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
    
    public void delete()
    {
	OperateInfo operateInfo = new OperateInfo();
	boolean flag = false;
	if (ids.contains(","))
	{
	    String idsParam[] = ids.split(",");
	    flag = accidentCaseService.delete(idsParam);
	}
	else
	{
	    flag = accidentCaseService.delete(ids);
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


    public AccKnowlbaseService getAccidentCaseService()
    {
        return accidentCaseService;
    }

    public void setAccidentCaseService(AccKnowlbaseService accidentCaseService)
    {
        this.accidentCaseService = accidentCaseService;
    }

    public AccKnowlbase getAccidentCase()
    {
        return accidentCase;
    }

    public void setAccidentCase(AccKnowlbase accidentCase)
    {
        this.accidentCase = accidentCase;
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
