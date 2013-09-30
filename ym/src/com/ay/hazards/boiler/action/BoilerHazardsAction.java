package com.ay.hazards.boiler.action;

import java.text.SimpleDateFormat;
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
import com.ay.framework.util.EncodingHeaderUtil;
import com.ay.framework.util.BeanUtil;
import org.springframework.beans.factory.annotation.Autowired;
import com.ay.hazards.boiler.pojo.BoilerHazards;
import com.ay.hazards.boiler.service.BoilerHazardsService;

/**
 *  重大危险源 锅炉表现层
 * @author zhangxiang
 * 2013-04-03
 */
@SuppressWarnings("all")
public class BoilerHazardsAction extends BaseAction {
	
	//锅炉服务类
	private BoilerHazardsService boilerService;
	
	//锅炉实体类
	private BoilerHazards boiler;
	
	//分页当前页数
	private String page;
	
	//分页每页显示的行数
	private String rows;
	
	//排序
	private String sort;
	
	//排序
	private String order;
	
	//锅炉ID 
	private String id;
	
	//锅炉ID集合
	private String ids;
	
	/**
	 * 新增锅炉信息
	 */
	public void add() {
		OperateInfo operateInfo = new OperateInfo();
		boiler.setCreated((String) SecurityUtils.getSubject().getSession().getAttribute("user_id"));
		boiler.setCreateTime(new Date());
//		//将当前时间转换成字符串
//		Date date=new Date();  
//		SimpleDateFormat formatter=new SimpleDateFormat("yyyy-MM-dd");  
//		String time=formatter.format(date);  
//		boiler.setTbrq(time);
		try {
			//调用业务层新增方法
			try {
				boilerService.insert(boiler);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			operateInfo.setOperateMessage("添加成功");
			operateInfo.setOperateSuccess(true);
		} catch (Exception e) {
			operateInfo.setOperateMessage("添加失败");
			operateInfo.setOperateSuccess(false);
		}
		
		String json = new JsonMapper().toJson(operateInfo);
		Struts2Utils.renderText(json);
	}
	
	/**
	 * 修改锅炉信息
	 */
	public void update() {
		OperateInfo operateInfo = new OperateInfo();
		boiler.setUpdated((String) SecurityUtils.getSubject().getSession().getAttribute("user_id"));
		boiler.setUpdateTime(new Date());
//		//将当前时间转换成字符串
//		Date date=new Date();  
//		SimpleDateFormat formatter=new SimpleDateFormat("yyyy-MM-dd");  
//		String time=formatter.format(date);  
//		boiler.setTbrq(time);
		
		//调用业务层修改方法
		boolean flag = boilerService.update(boiler);
		
		//判断修改是否成功
		if (flag) 
		{
			operateInfo.setOperateMessage("更新成功");
			operateInfo.setOperateSuccess(true);
		} else 
		{
			operateInfo.setOperateMessage("更新失败");
			operateInfo.setOperateSuccess(false);
		}
		
		String json = new JsonMapper().toJson(operateInfo);
		Struts2Utils.renderText(json);
	}
	
	/**
	 * 根据多个ID进行删除锅炉信息的操作
	 */
	public void deleteByIds()
	{
		//分割ids组合
		String[] idsParam = ids.split("[,]");
		OperateInfo operateInfo = new OperateInfo();
		
		//调用业务层删除方法
		boolean flag = boilerService.deleteByIds(idsParam);
		
		//判断删除是否成功
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
	 * 根据ID 删除锅炉信息
	 */
	public void delete() {
		OperateInfo operateInfo = new OperateInfo();
		boolean flag = false;
		
		//判断ids参数中是否含有"," 是表示由多个ID组合
		if (ids.contains(",")) 
		{
			String idsParam[] = ids.split(",");
			//调用业务层删除方法（多个ID组合）
			flag = boilerService.deleteByIds(idsParam);		
			
		} else 
		{
			//调用业务层删除方法
			flag = boilerService.delete(ids);
		}
		
		//判断删除是否成功
		if (flag)
		{
			operateInfo.setOperateMessage("删除成功");
			operateInfo.setOperateSuccess(true);
		} else 
		{
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
		DataStore<BoilerHazards> dataStore = new DataStore<BoilerHazards>();
		
		//获取分页对象
		Page pageTemp =Page.getNewInstance(page, rows);
		
		//map 保存实体类属性值，用于条件查询
		Map paramMap = BeanUtil.Bean2Map(boiler);
		
		//调用服务类，获取查询结果集
		Page resultPage = boilerService.pageQuery(paramMap, pageTemp);
		
		//获取对象集合
		List<BoilerHazards> resultList = (List<BoilerHazards>) resultPage.getCollection();
		dataStore.setTotal(new Long(resultPage.getCount()));
		dataStore.setRows(resultList);
		String json = new JsonMapper().toJson(dataStore);
		Struts2Utils.renderText(json);
	}
	
	/**
	 * 根据ID 获取锅炉信息
	 */
	public void getById() {
		
		//调用业务层getByid方法，根据ID 查询结果
		Struts2Utils.renderJson(boilerService.getById(id),
				EncodingHeaderUtil.HEADERENCODING,
				EncodingHeaderUtil.CACHEENCODING);		
	}
	
	public BoilerHazardsService getBoilerService() {
		return boilerService;
	}

	public void setBoilerService(BoilerHazardsService boilerService) {
		this.boilerService = boilerService;
	}

	public BoilerHazards getBoiler() {
		return boiler;
	}

	public void setBoiler(BoilerHazards boiler) {
		this.boiler = boiler;
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

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}

	public String getOrder() {
		return order;
	}

	public void setOrder(String order) {
		this.order = order;
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
