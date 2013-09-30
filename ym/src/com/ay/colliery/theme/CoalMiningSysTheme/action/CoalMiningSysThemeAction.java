package com.ay.colliery.theme.CoalMiningSysTheme.action;

import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.ResponseBody;

import net.sf.json.JSONArray;

import com.ay.colliery.theme.CoalMiningSysTheme.pojo.CoalMiningGraph;
import com.ay.colliery.theme.CoalMiningSysTheme.pojo.CoalMiningSysTheme;
import com.ay.colliery.theme.CoalMiningSysTheme.service.CoalMiningSysThemeService;
import com.ay.framework.bean.DataStore;
import com.ay.framework.bean.OperateInfo;
import com.ay.framework.core.action.BaseAction;
import com.ay.framework.core.dao.pagination.Page;
import com.ay.framework.core.utils.mapper.JsonMapper;
import com.ay.framework.core.utils.web.struts.Struts2Utils;
import com.ay.framework.util.BeanUtil;
import com.ay.framework.util.EncodingHeaderUtil;
/***
 * 采煤系统主题表现层
 * @author zhangxiang
 * 2013-05-21
 */
@SuppressWarnings("all")
public class CoalMiningSysThemeAction extends BaseAction {
	private CoalMiningSysThemeService coalMiningSysThemeService;
	private CoalMiningSysTheme coalMiningSysTheme;
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
			coalMiningSysThemeService.insert(coalMiningSysTheme);
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
		boolean flag = coalMiningSysThemeService.update(coalMiningSysTheme);
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
			flag = coalMiningSysThemeService.delete(idsParam);
		} else {
			flag = coalMiningSysThemeService.delete(ids);
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
		DataStore<CoalMiningSysTheme> dataStore = new DataStore<CoalMiningSysTheme>();
		Page pageTemp = new Page();
		//当前页 
		int intPage = Integer.parseInt((page == null || page == "0") ? "1" : page);
		//每页显示条数  
		int number = Integer.parseInt((rows == null || rows == "0") ? "10" : rows);
		int start = (intPage -1) * number;
		pageTemp.setCurrentPage(intPage);
		pageTemp.setRecPerPage(number);
		pageTemp.setFrom(start);
		Map paramMap = BeanUtil.Bean2Map(coalMiningSysTheme);
		Page resultPage = coalMiningSysThemeService.pageQuery(paramMap, pageTemp);
		List<CoalMiningSysTheme> resultList = (List<CoalMiningSysTheme>) resultPage.getCollection();
		dataStore.setTotal(new Long(resultPage.getCount()));
		dataStore.setRows(resultList);
		String json = new JsonMapper().toJson(dataStore);
		Struts2Utils.renderText(json);
	}
	
	public void getById() {
		Struts2Utils.renderJson(coalMiningSysThemeService.getById(id),
				EncodingHeaderUtil.HEADERENCODING,
				EncodingHeaderUtil.CACHEENCODING);		
	}

	public void getMine(){
		List<CoalMiningGraph> list = null;
		try {
			list = coalMiningSysThemeService.getMineSums(date);
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
			for (CoalMiningGraph coal : list) {
				String jsonStr = "";
				index +=1;
				jsonStr += "{";
				jsonStr += "type: 'column',";
				jsonStr += "name:'"+coal.getWorkingFaceName()+"',";
				jsonStr += "data: ["+coal.getY()+ "," +coal.getE()+","+coal.getS()+","
						  +coal.getSi()+","+coal.getW()+","+coal.getL()+","+coal.getQ()+","
						  +coal.getB()+","+coal.getJ()+","+coal.getShi()+","+coal.getSy()+","
						  +coal.getSe()+"]";
				jsonStr += "}";
				temp[index -1] = jsonStr;
			}
		}
		//获取折线图数据
		String jsonAvg = getAvg();
		//获取饼图数据
		String[] listPie = getPieList();
		Struts2Utils.renderJson(new Object[]{temp,jsonAvg,listPie},
				EncodingHeaderUtil.HEADERENCODING,
				EncodingHeaderUtil.CACHEENCODING);
	}
	/**
	 * 获取折线数据
	 * @return
	 */
	public String getAvg() {
		//拼接字符串
		String jsonStr ="{ type: 'spline',  name: '平均', ";
		Double listAvg[] ={0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0};//平均数
		List<CoalMiningSysTheme> listCoal = null;
		try {
			listCoal = coalMiningSysThemeService.getAvg(date);
			if( listCoal !=null){
				for (CoalMiningSysTheme coalMiningSysTheme : listCoal) {
					 int i =Integer.parseInt(coalMiningSysTheme.getMine_date())-1;
					 listAvg[i]=Double.parseDouble(coalMiningSysTheme.getRealityOutput());
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		jsonStr += "data:["+listAvg[0]+","+listAvg[1]+","+listAvg[2]+","+listAvg[3]+","+listAvg[4]+","
				+listAvg[5]+","+listAvg[6]+","+listAvg[7]+","+listAvg[8]+","+listAvg[9]+","+listAvg[10]+","
				+listAvg[11]+"],";
		jsonStr += "marker: {lineWidth: 3,lineColor: 'red',fillColor: 'white'}}";
		return jsonStr;
	}
	/**
	 * 获取饼图数据
	 */
	public String[] getPieList() {
		List<CoalMiningSysTheme> list = null;
		//色系
		String[] color = new String[]{"green","black","blue","red","yellow","gray"};
		//字符数组
		String[] temp = null;
		try {
			//计数器
			int index =0;
			list = coalMiningSysThemeService.getSumPie(date);
			temp = new String[list.size()];
			for (CoalMiningSysTheme coal: list) {
				String jsonStr = "";
				index +=1;
				jsonStr += "{name: '" +coal.getWorkingFaceName()+ "',";
				jsonStr += "y:" + coal.getRealityOutput()+",";
				jsonStr += "color:'" + color[index-1]+"'}";
				temp[index -1] = jsonStr;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return temp;
	}
		
    public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public CoalMiningSysTheme getCoalMiningSysTheme() {
		return coalMiningSysTheme;
	}

	public void setCoalMiningSysTheme(CoalMiningSysTheme coalMiningSysTheme) {
		this.coalMiningSysTheme = coalMiningSysTheme;
	}

	public CoalMiningSysThemeService getCoalMiningSysThemeService() {
		return coalMiningSysThemeService;
	}

	public void setCoalMiningSysThemeService(CoalMiningSysThemeService coalMiningSysThemeService) {
		this.coalMiningSysThemeService = coalMiningSysThemeService;
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
