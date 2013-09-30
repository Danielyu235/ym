package com.ay.emergency.plan.comprehensive.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ay.emergency.plan.comprehensive.pojo.PlanExpert;
import com.ay.emergency.plan.comprehensive.service.PlanExpertService;
import com.ay.framework.bean.DataStore;
import com.ay.framework.bean.OperateInfo;
import com.ay.framework.core.action.BaseAction;
import com.ay.framework.core.dao.pagination.Page;
import com.ay.framework.core.utils.mapper.JsonMapper;
import com.ay.framework.core.utils.web.struts.Struts2Utils;
/**
 * 应急预案综合预案与指挥人员关联——表现层
 * @author zhangxaing
 * @version 2013-03-12
 */
public class PlanExpertAction extends BaseAction {
	//综合预案与指挥人员关联的服务类
	private PlanExpertService planExpService;
	
	//综合预案与指挥人员关联的实体类
	private PlanExpert planExp;
	
	//分页对象
	private String page;
	
	//每页显示的数量
	private String rows;
	
	//专家信息对象ID
	private String expId;
	
	//综合预案id
	private String id;

	//多个id集合
	private String ids;
	
	//多个角色集合
	private String roles;
	
	/**
	 * 新增预案与专家信息关联
	 */
	public void add() {
		OperateInfo operateInfo = new OperateInfo();
		try 
		{
			//执行添加关联数据
			planExpService.insert(planExp);
			
			//返回信息添加成功结果
			operateInfo.setOperateMessage("添加成功");
			operateInfo.setOperateSuccess(true);
		} catch (Exception e) {
			e.printStackTrace();
			//返回信息添加失败结果
			operateInfo.setOperateMessage("添加失败");
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
		String[] rolesParam = roles.split("[,]");
		OperateInfo operateInfo = new OperateInfo();
		//做为删除的条件
		String where =ConString(idsParam,rolesParam);
		boolean flag = false;
		try {
			flag = planExpService.deleteRole(where);
		} catch (Exception e) {
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
	 * 拼接字符串，用于删除应急预案与专家关联的信息
	 * @param id 集合
	 * @param role 集合
	 * @return 返回字符串格式为(id ='' and role ='')or (id ='' and role ='')
	 */
	public String ConString(String[] id,String[] role){
		String where=" where ";
		for (int i = 0; i < id.length; i++) {
			where += "(id = '"+ id[i] + "' and role = '" + role[i] + "' )";
			if( i != (id.length-1)){
				where += "or" ;
			}
		}
		return where;
	}
	/**
	 * 分页进行显示的工作
	 */
	public void list() {
		
		DataStore<PlanExpert> dataStore = new DataStore<PlanExpert>();
		
		//获取分页对象
		Page pageTemp =Page.getNewInstance(page, rows);
		
		//创建Map对象
		Map paramMap = new HashMap();
		
		//获取页面传来的值
		paramMap.put("id", planExp.getId());	
		Page resultPage = null;
		try 
		{
			//查询List数据 参数1：查询条件 参数2：分页
			resultPage = planExpService.pageQuery(paramMap, pageTemp);
		} catch (Exception e) {
			e.printStackTrace();
		}
		List<PlanExpert> resultList = (List<PlanExpert>) resultPage.getCollection();
		dataStore.setTotal(new Long(resultPage.getCount()));
		dataStore.setRows(resultList);
		String json = new JsonMapper().toJson(dataStore);
		Struts2Utils.renderText(json);
	}
	
	public String getRoles() {
		return roles;
	}
	public void setRoles(String roles) {
		this.roles = roles;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public PlanExpertService getPlanExpService() {
		return planExpService;
	}

	public void setPlanExpService(PlanExpertService planExpService) {
		this.planExpService = planExpService;
	}

	public PlanExpert getPlanExp() {
		return planExp;
	}

	public void setPlanExp(PlanExpert planExp) {
		this.planExp = planExp;
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

	public String getExpId() {
		return expId;
	}

	public void setExpId(String expId) {
		this.expId = expId;
	}
	public String getIds() {
		return ids;
	}
	public void setIds(String ids) {
		this.ids = ids;
	}
}
