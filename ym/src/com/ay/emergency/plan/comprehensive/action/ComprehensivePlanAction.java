package com.ay.emergency.plan.comprehensive.action;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.ay.emergency.plan.comprehensive.pojo.ComprehensivePlan;
import com.ay.emergency.plan.comprehensive.service.ComprehensivePlanService;
import com.ay.framework.bean.DataStore;
import com.ay.framework.bean.OperateInfo;
import com.ay.framework.core.action.BaseAction;
import com.ay.framework.core.dao.pagination.Page;
import com.ay.framework.core.utils.mapper.JsonMapper;
import com.ay.framework.core.utils.web.struts.Struts2Utils;
import com.ay.framework.util.BeanUtil;
import com.ay.framework.util.EncodingHeaderUtil;

/**
 * 综合应急预案表现层
 * @author zhangxiang
 * @version 2013-03-11
 */
@SuppressWarnings("all")
public class ComprehensivePlanAction extends BaseAction {
	//综合应急预案 服务类
	private ComprehensivePlanService EnergencyPlanService;
	
	//综合应急预案实体类
	private ComprehensivePlan EnergencyPlan;
	
	//当前页
	private String page;
	
	//分页显示的行数
	private String rows;
	
	//综合应急预案ID
	private String id;
	
	//综合应急预案ID集合
	private String ids;
	
	/**
	 * 添加综合应急预与专家信息关联信息
	 */
	public void add() {
		OperateInfo operateInfo = new OperateInfo();
		EnergencyPlan.setCreated((String) SecurityUtils.getSubject().getSession().getAttribute("user_id"));
		EnergencyPlan.setCreateTime(new Date());
		//将当前时间转换成字符串
		Date date=new Date();  
		SimpleDateFormat formatter=new SimpleDateFormat("yyyy-MM-dd");  
		String time=formatter.format(date);  
		EnergencyPlan.setTime(time);
		try {
			EnergencyPlanService.insert(EnergencyPlan);
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
	 * 修改综合应急预与专家信息关联信息
	 */
	public void update() {
		OperateInfo operateInfo = new OperateInfo();
		EnergencyPlan.setUpdated((String) SecurityUtils.getSubject().getSession().getAttribute("user_id"));
		EnergencyPlan.setUpdateTime(new Date());
		//将当前时间转换成字符串
		Date date=new Date();  
		SimpleDateFormat formatter=new SimpleDateFormat("yyyy-MM-dd");  
		String time=formatter.format(date);  
		EnergencyPlan.setTime(time);
		boolean flag = EnergencyPlanService.update(EnergencyPlan);
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
		boolean flag = EnergencyPlanService.deleteByIds(idsParam);
		if (flag)
		{
		    operateInfo.setOperateMessage("删除成功！");
		    operateInfo.setOperateSuccess(true);
		}else{
		    operateInfo.setOperateMessage("删除失败");
		    operateInfo.setOperateSuccess(false);
		}
		String json = new JsonMapper().toJson(operateInfo);
		Struts2Utils.renderText(json);
	}
	
	public void delete() {
		OperateInfo operateInfo = new OperateInfo();
		boolean flag = false;
		if (ids.contains(",")) {
			String idsParam[] = ids.split(",");
			flag = EnergencyPlanService.delete(idsParam);
		} else {
			flag = EnergencyPlanService.delete(ids);
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
		DataStore<ComprehensivePlan> dataStore = new DataStore<ComprehensivePlan>();
		Page pageTemp =Page.getNewInstance(page, rows);
		Map paramMap = BeanUtil.Bean2Map(EnergencyPlan);
		
		Page resultPage = EnergencyPlanService.pageQuery(paramMap, pageTemp);
		List<ComprehensivePlan> resultList = (List<ComprehensivePlan>) resultPage.getCollection();
		dataStore.setTotal(new Long(resultPage.getCount()));
		dataStore.setRows(resultList);
		String json = new JsonMapper().toJson(dataStore);
		Struts2Utils.renderText(json);
	}
	
	/**
	 * 查询单个综合应急预案信息
	 */
	public void getById() {
		Struts2Utils.renderJson(EnergencyPlanService.getById(id),
				EncodingHeaderUtil.HEADERENCODING,
				EncodingHeaderUtil.CACHEENCODING);		
	}
	

    public ComprehensivePlan getEnergencyPlan() {
		return EnergencyPlan;
	}

	public void setEnergencyPlan(ComprehensivePlan EnergencyPlan) {
		this.EnergencyPlan = EnergencyPlan;
	}

	public ComprehensivePlanService getEnergencyPlanService() {
		return EnergencyPlanService;
	}

	@Autowired
	public void setEnergencyPlanService(ComprehensivePlanService EnergencyPlanService) {
		this.EnergencyPlanService = EnergencyPlanService;
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
