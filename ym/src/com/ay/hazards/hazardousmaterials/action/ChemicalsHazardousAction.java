package com.ay.hazards.hazardousmaterials.action;

import java.util.List;
import java.util.Map;

import com.ay.framework.bean.DataStore;
import com.ay.framework.core.action.BaseAction;
import com.ay.framework.core.dao.pagination.Page;
import com.ay.framework.core.utils.mapper.JsonMapper;
import com.ay.framework.core.utils.web.struts.Struts2Utils;
import com.ay.framework.util.BeanUtil;
import com.ay.hazards.hazardousmaterials.pojo.ChemicalsHazardous;
import com.ay.hazards.hazardousmaterials.pojo.Materials;
import com.ay.hazards.hazardousmaterials.service.ChemicalsHazardousService;
import com.ay.jfds.dev.pojo.Data;
/**
 * 危险化学品action表现层
 * @author zhangxiang
 * 2013-04-18
 */
@SuppressWarnings("all")
public class ChemicalsHazardousAction extends BaseAction {
	
	//危险化学品服务类
	private ChemicalsHazardousService chemicalsHazardousService;
	//危险化学品实体类
	private ChemicalsHazardous chemicalsHazardous;
	//当前页码
	private String page;
	//每页显示的行数
	private String rows;
	private String wxhxplb;
	/**
	 * 获取一级菜单数据
	 */
	public void findDataByTypeFirstLevel() {
	    try {
			List<ChemicalsHazardous> data = chemicalsHazardousService.findDataByTypeFirstLevel();
			String dataStr = new JsonMapper().toJson(data);
			Struts2Utils.renderText(dataStr);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 获取二级菜单数据
	 */
	public void findDataByTypeTwoLevel() {
	    try {
			List<ChemicalsHazardous> data = chemicalsHazardousService.findDataByTypeTwoLevel(wxhxplb);
			String dataStr = new JsonMapper().toJson(data);
			Struts2Utils.renderText(dataStr);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public ChemicalsHazardousService getChemicalsHazardousService() {
		return chemicalsHazardousService;
	}
	public void setChemicalsHazardousService(
			ChemicalsHazardousService chemicalsHazardousService) {
		this.chemicalsHazardousService = chemicalsHazardousService;
	}
	public ChemicalsHazardous getChemicalsHazardous() {
		return chemicalsHazardous;
	}
	public void setChemicalsHazardous(ChemicalsHazardous chemicalsHazardous) {
		this.chemicalsHazardous = chemicalsHazardous;
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
	public String getWxhxplb() {
		return wxhxplb;
	}
	public void setWxhxplb(String wxhxplb) {
		this.wxhxplb = wxhxplb;
	}
	
}
