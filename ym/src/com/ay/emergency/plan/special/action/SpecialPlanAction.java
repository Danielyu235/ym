package com.ay.emergency.plan.special.action;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.shiro.SecurityUtils;

import com.ay.emergency.plan.special.pojo.SpecialPlan;
import com.ay.emergency.plan.special.service.SpecialPlanService;
import com.ay.framework.bean.DataStore;
import com.ay.framework.bean.OperateInfo;
import com.ay.framework.core.action.BaseAction;
import com.ay.framework.core.dao.pagination.Page;
import com.ay.framework.core.utils.mapper.JsonMapper;
import com.ay.framework.core.utils.web.struts.Struts2Utils;
import com.ay.framework.util.BeanUtil;
import com.ay.framework.util.EncodingHeaderUtil;

/**
 * 专项应急预案表现层
 * @author wgw
 * @version 2013年3月14日 
 */
public class SpecialPlanAction extends BaseAction{
	
	//专项应急预案服务类
	private SpecialPlanService specialPlanService;
	
	//专项应急预案实体类
	private SpecialPlan specialPlan;
	
	//当前页码
	private String page;
	
	//每页显示的行数
	private String rows;
	
	//专项应急预案ID
	private String id;
	
	//专项应急预案ID 集合
	private String ids;
	
	/**
	 * 新增专项应急预案
	 */
	public void add() {
		OperateInfo operateInfo = new OperateInfo();
		specialPlan.setCreated((String) SecurityUtils.getSubject().getSession().getAttribute("user_id"));
		specialPlan.setCreateTime(new Date());
		//将当前时间转换成字符串
		Date date=new Date();  
		SimpleDateFormat formatter=new SimpleDateFormat("yyyy-MM-dd");  
		String time=formatter.format(date);
		specialPlan.setTime(time);
		try {
			specialPlanService.insert(specialPlan);
			operateInfo.setOperateMessage("添加成功");
			operateInfo.setOperateSuccess(true);
		} catch (Exception e) {
			e.printStackTrace();
			operateInfo.setOperateMessage("添加失败");
			operateInfo.setOperateSuccess(false);
		}

		String json = new JsonMapper().toJson(operateInfo);
		Struts2Utils.renderText(json);
	}
	
	/**
	 * 修改专项应急预案
	 */
	public void update() {
		OperateInfo operateInfo = new OperateInfo();
		specialPlan.setUpdated((String) SecurityUtils.getSubject().getSession().getAttribute("user_id"));
		specialPlan.setUpdateTime(new Date());
		boolean flag = specialPlanService.update(specialPlan);
		if (flag) {
			operateInfo.setOperateMessage("更新成功");
			operateInfo.setOperateSuccess(true);
		} else {
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
		String[] idsParam = ids.split("[,]");
		OperateInfo operateInfo = new OperateInfo();
		boolean flag = specialPlanService.deleteByIds(idsParam);
		if (flag)
		{
		    operateInfo.setOperateMessage("删除成功！");
		    operateInfo.setOperateSuccess(true);
		}else
		{
		    operateInfo.setOperateMessage("删除失败");
		    operateInfo.setOperateSuccess(false);
		}
		String json = new JsonMapper().toJson(operateInfo);
		Struts2Utils.renderText(json);
	}
	
	/**
	 * 删除专项应急预案
	 */
	public void delete() {
		OperateInfo operateInfo = new OperateInfo();
		boolean flag = false;
		if (ids.contains(",")) {
			String idsParam[] = ids.split(",");
			flag = specialPlanService.delete(idsParam);
		} else {
			flag = specialPlanService.delete(ids);
		}
		if (flag) {
			operateInfo.setOperateMessage("删除成功");
			operateInfo.setOperateSuccess(true);
		} else {
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
		try {
			DataStore<SpecialPlan> dataStore = new DataStore<SpecialPlan>();
			Page pageTemp =Page.getNewInstance(page, rows);
			Map paramMap = BeanUtil.Bean2Map(specialPlan);
			Page resultPage = specialPlanService.pageQuery(paramMap, pageTemp);
			List<SpecialPlan> resultList = (List<SpecialPlan>) resultPage.getCollection();
			dataStore.setTotal(new Long(resultPage.getCount()));
			dataStore.setRows(resultList);
			String json = new JsonMapper().toJson(dataStore);
			Struts2Utils.renderText(json);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 专项应急预案 根据ID 查询对应的专项预案信息
	 */
	public void getById() {
		Struts2Utils.renderJson(specialPlanService.getById(id),
				EncodingHeaderUtil.HEADERENCODING,
				EncodingHeaderUtil.CACHEENCODING);		
	}


	public SpecialPlanService getSpecialPlanService() {
		return specialPlanService;
	}


	public void setSpecialPlanService(SpecialPlanService specialPlanService) {
		this.specialPlanService = specialPlanService;
	}


	public SpecialPlan getSpecialPlan() {
		return specialPlan;
	}


	public void setSpecialPlan(SpecialPlan specialPlan) {
		this.specialPlan = specialPlan;
	}


	public String getPage() {
		return page;
	}


	public void setPage(String page) {
		this.page = page;
	}


	public String getRows() {
		return rows;
	}


	public void setRows(String rows) {
		this.rows = rows;
	}

	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getIds() {
		return ids;
	}


	public void setIds(String ids) {
		this.ids = ids;
	}
	
	
}
