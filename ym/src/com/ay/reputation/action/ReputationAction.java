package com.ay.reputation.action;

import java.util.List;
import java.util.Map;

import com.ay.framework.bean.DataStore;
import com.ay.framework.core.action.BaseAction;
import com.ay.framework.core.dao.pagination.Page;
import com.ay.framework.core.utils.mapper.JsonMapper;
import com.ay.framework.core.utils.web.struts.Struts2Utils;
import com.ay.framework.util.BeanUtil;
import com.ay.reputation.pojo.HistoryScope;
import com.ay.reputation.pojo.Reputation;
import com.ay.reputation.service.ReputationService;
import com.ay.safe.punish.pojo.PunishSafe;

@SuppressWarnings("all")
public class ReputationAction extends BaseAction {
	
	private ReputationService reputationService;
	private Reputation reputation;
	private String page;
	private String rows;
	private String sort;
	private String order;
	private String id;
	private String ids;
	private String ename;
	
	public void list() {
		DataStore<Reputation> dataStore = new DataStore<Reputation>();
		Page pageTemp = new Page();
		//当前页 
		int intPage = Integer.parseInt((page == null || page == "0") ? "1" : page);
		//每页显示条数  
		int number = Integer.parseInt((rows == null || rows == "0") ? "10" : rows);
		int start = (intPage -1) * number;
		pageTemp.setCurrentPage(intPage);
		pageTemp.setRecPerPage(number);
		pageTemp.setFrom(start);
		Map paramMap = BeanUtil.Bean2Map(reputation);
		Page resultPage = reputationService.pageQuery(paramMap, pageTemp);
		List<Reputation> resultList = (List<Reputation>) resultPage.getCollection();
		System.out.println(resultList);
		dataStore.setTotal(new Long(resultPage.getCount()));
		dataStore.setRows(resultList);
		String json = new JsonMapper().toJson(dataStore);
		Struts2Utils.renderText(json);
	} 
	
	public void getScopeList(){
		List<Reputation> listReputation;
		try {			
			listReputation = reputationService.getReputationList(reputation);
			StringBuilder result = new StringBuilder("[");
			for(Reputation re : listReputation){
				result.append(re.getAchievement()).append(",");
			}
			result.delete(result.length()-1, result.length());
			result.append("]");
			Struts2Utils.renderText(result.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public void getHistoryScopeList(){
		List<HistoryScope> list = reputationService.getHistoryScopeList(reputation.getEmployeeId());
		String json = new JsonMapper().toJson(list);
		Struts2Utils.renderJson(json);
	}
	
	
	public ReputationService getReputationService() {
		return reputationService;
	}
	public void setReputationService(ReputationService reputationService) {
		this.reputationService = reputationService;
	}
	public Reputation getReputation() {
		return reputation;
	}
	public void setReputation(Reputation reputation) {
		this.reputation = reputation;
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


	public String getEname() {
		return ename;
	}


	public void setEname(String ename) {
		this.ename = ename;
	}
	
	
	
}
