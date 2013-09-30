package com.ay.colliery.theme.MachineElectricSysTheme.action;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;

import org.apache.shiro.SecurityUtils;

import com.ay.framework.bean.DataStore;
import com.ay.framework.bean.OperateInfo;
import com.ay.framework.core.dao.pagination.Page;
import com.ay.framework.core.utils.mapper.JsonMapper;
import com.ay.framework.core.utils.web.struts.Struts2Utils;
import com.ay.framework.util.BeanUtil;
import com.ay.framework.util.EncodingHeaderUtil;
import com.ay.colliery.theme.MachineElectricSysTheme.pojo.MachineElectricSysTheme;
import com.ay.colliery.theme.MachineElectricSysTheme.pojo.MachineGraph;
import com.ay.colliery.theme.MachineElectricSysTheme.service.MachineElectricSysThemeService;
import com.ay.framework.core.action.BaseAction;

@SuppressWarnings("all")
public class MachineElectricSysThemeAction extends BaseAction {
	private MachineElectricSysThemeService machineElectricSysThemeService;
	private MachineElectricSysTheme machineElectricSysTheme;
	private String page;
	private String rows;
	private String sort;
	private String order;
	private String id;
	private String ids;
	private String date;
	public void add() {
		OperateInfo operateInfo = new OperateInfo();
		try {
			machineElectricSysThemeService.insert(machineElectricSysTheme);
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
		boolean flag = machineElectricSysThemeService.update(machineElectricSysTheme);
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
			flag = machineElectricSysThemeService.delete(idsParam);
		} else {
			flag = machineElectricSysThemeService.delete(ids);
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
		DataStore<MachineElectricSysTheme> dataStore = new DataStore<MachineElectricSysTheme>();
		Page pageTemp = new Page();
		//当前页 
		int intPage = Integer.parseInt((page == null || page == "0") ? "1" : page);
		//每页显示条数  
		int number = Integer.parseInt((rows == null || rows == "0") ? "10" : rows);
		int start = (intPage -1) * number;
		pageTemp.setCurrentPage(intPage);
		pageTemp.setRecPerPage(number);
		pageTemp.setFrom(start);
		Map paramMap = BeanUtil.Bean2Map(machineElectricSysTheme);
		Page resultPage = machineElectricSysThemeService.pageQuery(paramMap, pageTemp);
		List<MachineElectricSysTheme> resultList = (List<MachineElectricSysTheme>) resultPage.getCollection();
		dataStore.setTotal(new Long(resultPage.getCount()));
		dataStore.setRows(resultList);
		String json = new JsonMapper().toJson(dataStore);
		Struts2Utils.renderText(json);
	}
	
	public void getById() {
		Struts2Utils.renderJson(machineElectricSysThemeService.getById(id),
				EncodingHeaderUtil.HEADERENCODING,
				EncodingHeaderUtil.CACHEENCODING);		
	}
	/**
	 * 统计图标
	 */
	public void getColumn()
	{
		List dataList =new ArrayList();
		List<MachineGraph> list = null;
		try {
			list = list = machineElectricSysThemeService.getMineSum(date);;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//json格式
		//计数器
		int index =0;
		String[] temp = new String[list.size()];
		//判断是否有数据
		if(list.size()>0){
			//循环读取数据
			for (MachineGraph machineGraph : list) {
				String jsonStr = "";
				index +=1;
				jsonStr += "{";
				jsonStr += "type: 'column',";
				jsonStr += "name:'"+machineGraph.getDepartmentName()+"',";
				jsonStr += "data: ["+machineGraph.getY()+ "," +machineGraph.getE()+","+machineGraph.getS()+","
						  +machineGraph.getSi()+","+machineGraph.getW()+","+machineGraph.getL()+","+machineGraph.getQ()+","
						  +machineGraph.getB()+","+machineGraph.getJ()+","+machineGraph.getShi()+","+machineGraph.getSy()+","
						  +machineGraph.getSe()+"]";
				jsonStr += "}";
				temp[index -1] = jsonStr;
			}
		}
		Struts2Utils.renderJson(new Object[]{temp},
				EncodingHeaderUtil.HEADERENCODING,
				EncodingHeaderUtil.CACHEENCODING);
	}
    public MachineElectricSysTheme getMachineElectricSysTheme() {
		return machineElectricSysTheme;
	}

	public void setMachineElectricSysTheme(MachineElectricSysTheme machineElectricSysTheme) {
		this.machineElectricSysTheme = machineElectricSysTheme;
	}

	public MachineElectricSysThemeService getMachineElectricSysThemeService() {
		return machineElectricSysThemeService;
	}

	public void setMachineElectricSysThemeService(MachineElectricSysThemeService machineElectricSysThemeService) {
		this.machineElectricSysThemeService = machineElectricSysThemeService;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
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
