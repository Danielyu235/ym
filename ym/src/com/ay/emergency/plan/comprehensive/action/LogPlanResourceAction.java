package com.ay.emergency.plan.comprehensive.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ay.emergency.plan.comprehensive.pojo.LogPlanResource;
import com.ay.emergency.plan.comprehensive.pojo.PlanResource;
import com.ay.emergency.plan.comprehensive.service.LogPlanResourceService;
import com.ay.emergency.plan.comprehensive.service.PlanResourceService;
import com.ay.framework.bean.DataStore;
import com.ay.framework.bean.OperateInfo;
import com.ay.framework.core.action.BaseAction;
import com.ay.framework.core.dao.pagination.Page;
import com.ay.framework.core.utils.mapper.JsonMapper;
import com.ay.framework.core.utils.web.struts.Struts2Utils;

/**
 *  综合预案与救援资源关联——表现层
 * @author zhangxiang
 * @version 2013-03-13
 */
public class LogPlanResourceAction extends BaseAction {
	
	//综合预案与救援资源关联
	private LogPlanResourceService logplanResourceService;
	
	//综合预案与救援资源实体类
	private LogPlanResource LogplanResource;
	
	//当前页
	private String page;
	
	//每页显示的行数
	private String rows;
	private String ids;
	private String resId;
	
	/**
	 * 新增综合预案与救援关联信息
	 */
	public void add()
	{
		//将其转换成指定的格式
		OperateInfo operateInfo = new OperateInfo();
		try {
			//调用服务类新增方法
		    logplanResourceService.insert(LogplanResource);
			operateInfo.setOperateMessage("新增成功！");
			operateInfo.setOperateSuccess(true);
		} catch (Exception e) {
			e.printStackTrace();
			operateInfo.setOperateMessage("新增失败！");
			operateInfo.setOperateSuccess(false);
		}
		String json = new JsonMapper().toJson(operateInfo);
		Struts2Utils.renderText(json);
	}
	
	/**
	 * 修改综合预案与救援关联信息
	 */
	public void update()
	{
		//将其转换成指定的格式
		OperateInfo operateInfo = new OperateInfo();
		try {
			//调用服务类修改方法
		    logplanResourceService.update(LogplanResource);
			operateInfo.setOperateMessage("更新成功！");
			operateInfo.setOperateSuccess(true);
		} catch (Exception e) {
			e.printStackTrace();
			operateInfo.setOperateMessage("更新失败！");
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
		String[] idsParam = ids.split("[,]");
		OperateInfo operateInfo = new OperateInfo();
		boolean flag = false;
		try {
			flag = logplanResourceService.deleteByIds(idsParam);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if (flag)
		{
			//返回信息删除成功结果
		    operateInfo.setOperateMessage("删除成功！");
		    operateInfo.setOperateSuccess(true);
		}else
		{
			//返回信息删除失败结果
		    operateInfo.setOperateMessage("删除失败");
		    operateInfo.setOperateSuccess(false);
		}
		String json = new JsonMapper().toJson(operateInfo);
		Struts2Utils.renderText(json);
	}
	
	/**
	 * 分页进行显示的工作
	 */
	public void list() {
		
		DataStore<LogPlanResource> dataStore = new DataStore<LogPlanResource>();
		
		//获取分页对象
		Page pageTemp =Page.getNewInstance(page, rows);
		
		//创建Map对象
		Map paramMap = new HashMap();
		
		//获取页面传来的值
		paramMap.put("id", LogplanResource.getId());
		paramMap.put("accidentId", LogplanResource.getAccidentId());
		Page resultPage = null;
		try 
		{
			//查询List数据 参数1：查询条件 参数2：分页
			resultPage = logplanResourceService.pageQuery(paramMap, pageTemp);
		} catch (Exception e) {
			e.printStackTrace();
		}
		List<LogPlanResource> resultList = (List<LogPlanResource>) resultPage.getCollection();
		dataStore.setTotal(new Long(resultPage.getCount()));
		dataStore.setRows(resultList);
		String json = new JsonMapper().toJson(dataStore);
		Struts2Utils.renderText(json);
	}

    public LogPlanResourceService getLogplanResourceService()
    {
        return logplanResourceService;
    }

    public void setLogplanResourceService(
            LogPlanResourceService logplanResourceService)
    {
        this.logplanResourceService = logplanResourceService;
    }

    public LogPlanResource getLogplanResource()
    {
        return LogplanResource;
    }

    public void setLogplanResource(LogPlanResource logplanResource)
    {
        LogplanResource = logplanResource;
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

    public String getIds()
    {
        return ids;
    }

    public void setIds(String ids)
    {
        this.ids = ids;
    }

    public String getResId()
    {
        return resId;
    }

    public void setResId(String resId)
    {
        this.resId = resId;
    }

	
}
