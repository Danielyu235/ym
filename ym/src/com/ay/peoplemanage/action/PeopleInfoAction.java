package com.ay.peoplemanage.action;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.apache.shiro.SecurityUtils;

import com.ay.framework.bean.DataStore;
import com.ay.framework.bean.OperateInfo;
import com.ay.framework.core.action.BaseAction;
import com.ay.framework.core.dao.pagination.Page;
import com.ay.framework.core.utils.mapper.JsonMapper;
import com.ay.framework.core.utils.web.struts.Struts2Utils;
import com.ay.framework.util.BeanUtil;
import com.ay.framework.util.EncodingHeaderUtil;
import com.ay.peoplemanage.pojo.PeopleInfo;
import com.ay.peoplemanage.service.PeopleInfoService;

@SuppressWarnings("serial")
public class PeopleInfoAction extends BaseAction{
	
	public static final Logger logger = Logger.getLogger(PeopleInfoAction.class);
	 /**
	 * 联系人的服务类 
	 */
	private PeopleInfoService peopleInfoService;
	/**
	 *  联系人的实体类 
	 */
	private PeopleInfo peopleInfo;
	/** 
	 * 当前页
	 */
	private String page;
	/** 
	 * 每页显示的数量
	 */
	private String rows;
	/**
	 * 排序
	 */
	private String sort;
	/**
	 * 排序方式
	 */
	private String order;
	/** 联系人ID */
	private String id;
	/** ID的集合 */
	private String ids;
	
	/**
	 * 增加联系人信息
	 */
	public void add(){
		OperateInfo opr = new OperateInfo();
		
		String str = (String) SecurityUtils.getSubject().getSession().getAttribute("user_id");
		peopleInfo.setCreated(str);
		//联系人信息入库的时间
		peopleInfo.setCreateTime(new Date());
		
		try{
			logger.info(peopleInfo.toString());
			//执行联系人增加的操作
			peopleInfoService.insert(peopleInfo);
			opr.setOperateMessage("添加成功");
			opr.setOperateSuccess(true);
			}catch(Exception e){
		    logger.error(e.getMessage());
			opr.setOperateMessage("添加失败");
			opr.setOperateSuccess(false);
		}
			
		String json = new JsonMapper().toJson(opr);
		Struts2Utils.renderText(json);
		
	}
	
	/**
	 * 根据ID查看联系人信息
	 * @return void
	 */
	public void getById() {
		
		Struts2Utils.renderJson(peopleInfoService.getById(id),
				EncodingHeaderUtil.HEADERENCODING,
				EncodingHeaderUtil.CACHEENCODING);		
	}
	
	
	
	/**
	 * 修改联系人信息
	 */
	public void update(){
		
		OperateInfo operateInfo = new OperateInfo();
		peopleInfo.setUpdated((String) SecurityUtils.getSubject().getSession().getAttribute("user_id"));
		//更新联系人信息的时间
		peopleInfo.setUpdateTime(new Date());
		//执行更新联系人操作
		boolean flag = peopleInfoService.update(peopleInfo);
		logger.info(peopleInfo.toString());
		
		if (flag) {
			operateInfo.setOperateMessage("更新成功");
			operateInfo.setOperateSuccess(true);
		} else {
			operateInfo.setOperateMessage("更新失败");
			operateInfo.setOperateSuccess(false);
		}
		
		//返回提示信息
		String json = new JsonMapper().toJson(operateInfo);
		Struts2Utils.renderText(json);
		
		
	}
	
    /**
     * 删除联系人信息
     */
	
	public void deleteByIds(){
		String[] idsParam = ids.split("[,]");
		OperateInfo operateInfo = new OperateInfo();
		boolean flag = peopleInfoService.deleteByIds(idsParam);
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
	 * 查询联系人信息
	 */
	public void list(){
		DataStore<PeopleInfo> dataStore = new DataStore<PeopleInfo>();
		//获取分页对象
		Page pageTemp =Page.getNewInstance(page, rows);
		Map paramMap = BeanUtil.Bean2Map(peopleInfo);
		//执行查询操作
		Page resultPage = peopleInfoService.pageQuery(paramMap, pageTemp);
		List<PeopleInfo> resultList = (List<PeopleInfo>) resultPage.getCollection();
		dataStore.setTotal(new Long(resultPage.getCount()));
		dataStore.setRows(resultList);
		String json = new JsonMapper().toJson(dataStore);
		//返回结果
		Struts2Utils.renderText(json);
	} 
	
	/*public void addActionError(String anErrorMessage){
		   String s=anErrorMessage;
		   System.out.println(s);
		  }
		  public void addActionMessage(String aMessage){
		   String s=aMessage;
		   System.out.println(s);
		  
		  }
		  public void addFieldError(String fieldName, String errorMessage){
		   String s=errorMessage;
		   String f=fieldName;
		   System.out.println(s);
		   System.out.println(f);
		  
    }*/


	public PeopleInfoService getPeopleInfoService() {
		return peopleInfoService;
	}

	public void setPeopleInfoService(PeopleInfoService peopleInfoService) {
		this.peopleInfoService = peopleInfoService;
	}

	public PeopleInfo getPeopleInfo() {
		return peopleInfo;
	}

	public void setPeopleInfo(PeopleInfo peopleInfo) {
		this.peopleInfo = peopleInfo;
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
