package com.ay.themezt.coalzt.action;

import java.util.List;
import java.util.Map;

import com.ay.framework.bean.DataStore;
import com.ay.framework.bean.OperateInfo;
import com.ay.framework.core.action.BaseAction;
import com.ay.framework.core.dao.pagination.Page;
import com.ay.framework.core.utils.mapper.JsonMapper;
import com.ay.framework.core.utils.web.struts.Struts2Utils;
import com.ay.framework.util.BeanUtil;
import com.ay.framework.util.EncodingHeaderUtil;
import com.ay.themezt.coalzt.pojo.CoalOutGraph;
import com.ay.themezt.coalzt.pojo.CoalOutput;
import com.ay.themezt.coalzt.service.CoalOutputService;

@SuppressWarnings("all")
public class CoalOutputAction extends BaseAction {
	private CoalOutputService coalOutputService;
	private CoalOutput coalOutput;
	private String page;
	private String rows;
	private String sort;
	private String order;
	private String id;
	private String ids;
	
	public void add() {
		OperateInfo operateInfo = new OperateInfo();
		try {
			coalOutputService.insert(coalOutput);
			operateInfo.setOperateMessage("添加成功");
			operateInfo.setOperateSuccess(true);
		} catch (Exception e) {
			operateInfo.setOperateMessage("添加失败");
			operateInfo.setOperateSuccess(false);
		}
		
		String json = new JsonMapper().toJson(operateInfo);
		Struts2Utils.renderText(json);
	}
	
	public void update() {
		OperateInfo operateInfo = new OperateInfo();
		boolean flag = coalOutputService.update(coalOutput);
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
	
	public void delete() {
		OperateInfo operateInfo = new OperateInfo();
		boolean flag = false;
		if (ids.contains(",")) {
			String idsParam[] = ids.split(",");
			flag = coalOutputService.delete(idsParam);
		} else {
			flag = coalOutputService.delete(ids);
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
	
	public void list() {
		DataStore<CoalOutput> dataStore = new DataStore<CoalOutput>();
		Page pageTemp = new Page();
		//当前页 
		int intPage = Integer.parseInt((page == null || page == "0") ? "1" : page);
		//每页显示条数  
		int number = Integer.parseInt((rows == null || rows == "0") ? "10" : rows);
		int start = (intPage -1) * number;
		pageTemp.setCurrentPage(intPage);
		pageTemp.setRecPerPage(number);
		pageTemp.setFrom(start);
		Map paramMap = BeanUtil.Bean2Map(coalOutput);
		Page resultPage = coalOutputService.pageQuery(paramMap, pageTemp);
		List<CoalOutput> resultList = (List<CoalOutput>) resultPage.getCollection();
		dataStore.setTotal(new Long(resultPage.getCount()));
		dataStore.setRows(resultList);
		String json = new JsonMapper().toJson(dataStore);
		Struts2Utils.renderText(json);
	}
	
	public void getById() {
		Struts2Utils.renderJson(coalOutputService.getById(id),
				EncodingHeaderUtil.HEADERENCODING,
				EncodingHeaderUtil.CACHEENCODING);		
	}
	public void getMonthCoalData(){
		String[] temp=null;
		try {
			String month = coalOutput.getMonthPlan();
			List<CoalOutGraph> resultList = coalOutputService.getMonthCoalData(month);
			//计数器
			int index =0;
			temp = new String[resultList.size()];
			if(resultList.size()>0){
				//循环读取数据
				for (CoalOutGraph coal : resultList) {
					String jsonStr = "";
					index +=1;
					jsonStr += "{";
					jsonStr += "type: 'line',";
					jsonStr += "name:'<b style=\"color:white;\">矿产量</b>',";
					jsonStr += "data: ["+Double.parseDouble(coal.getY())+ "," +Double.parseDouble(coal.getE())+","+Double.parseDouble(coal.getS())+","
							  +Double.parseDouble(coal.getSi())+","+Double.parseDouble(coal.getW())+","+Double.parseDouble(coal.getL())+","+Double.parseDouble(coal.getQ())+","
							  +Double.parseDouble(coal.getB())+","+Double.parseDouble(coal.getJ())+","+Double.parseDouble(coal.getShi())+","+Double.parseDouble(coal.getSy())+","
							  +Double.parseDouble(coal.getSe())+"]";
					jsonStr += "}";
					temp[index -1] = jsonStr;
				}
			}
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Struts2Utils.renderJson(new Object[]{temp},
				EncodingHeaderUtil.HEADERENCODING,
				EncodingHeaderUtil.CACHEENCODING);
	}
	public void getMonthCoalDataColumn(){
		String[] temp=null;
		try {
			String month = coalOutput.getMonthPlan();
			List<CoalOutGraph> resultList = coalOutputService.getMonthCoalData(month);
			//计数器
			int index =0;
			temp = new String[resultList.size()];
			if(resultList.size()>0){
				//循环读取数据
				for (CoalOutGraph coal : resultList) {
					String jsonStr = "";
					index +=1;
					jsonStr += "{";
					jsonStr += "type: 'column',";
					jsonStr += "name:'<b style=\"color:white;\">矿产量</b>',";
					jsonStr += "data: ["+Double.parseDouble(coal.getY())+ "," +Double.parseDouble(coal.getE())+","+Double.parseDouble(coal.getS())+","
							  +Double.parseDouble(coal.getSi())+","+Double.parseDouble(coal.getW())+","+Double.parseDouble(coal.getL())+","+Double.parseDouble(coal.getQ())+","
							  +Double.parseDouble(coal.getB())+","+Double.parseDouble(coal.getJ())+","+Double.parseDouble(coal.getShi())+","+Double.parseDouble(coal.getSy())+","
							  +Double.parseDouble(coal.getSe())+"]";
					jsonStr += "}";
					temp[index -1] = jsonStr;
				}
			}
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Struts2Utils.renderJson(new Object[]{temp},
				EncodingHeaderUtil.HEADERENCODING,
				EncodingHeaderUtil.CACHEENCODING);
	}
    public CoalOutput getCoalOutput() {
		return coalOutput;
	}

	public void setCoalOutput(CoalOutput coalOutput) {
		this.coalOutput = coalOutput;
	}

	public CoalOutputService getCoalOutputService() {
		return coalOutputService;
	}

	public void setCoalOutputService(CoalOutputService coalOutputService) {
		this.coalOutputService = coalOutputService;
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
