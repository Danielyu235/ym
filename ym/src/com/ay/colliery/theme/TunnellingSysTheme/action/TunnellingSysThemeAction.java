package com.ay.colliery.theme.TunnellingSysTheme.action;

import java.util.List;
import java.util.Map;

import com.ay.colliery.theme.TunnellingSysTheme.pojo.TunnellingGraph;
import com.ay.colliery.theme.TunnellingSysTheme.pojo.TunnellingSysTheme;
import com.ay.colliery.theme.TunnellingSysTheme.service.TunnellingSysThemeService;
import com.ay.framework.bean.DataStore;
import com.ay.framework.bean.OperateInfo;
import com.ay.framework.core.action.BaseAction;
import com.ay.framework.core.dao.pagination.Page;
import com.ay.framework.core.utils.mapper.JsonMapper;
import com.ay.framework.core.utils.web.struts.Struts2Utils;
import com.ay.framework.util.BeanUtil;
import com.ay.framework.util.EncodingHeaderUtil;

@SuppressWarnings("all")
public class TunnellingSysThemeAction extends BaseAction {
	private TunnellingSysThemeService tunnellingSysThemeService;
	private TunnellingSysTheme tunnellingSysTheme;
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
			tunnellingSysThemeService.insert(tunnellingSysTheme);
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
		boolean flag = tunnellingSysThemeService.update(tunnellingSysTheme);
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
			flag = tunnellingSysThemeService.delete(idsParam);
		} else {
			flag = tunnellingSysThemeService.delete(ids);
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
		DataStore<TunnellingSysTheme> dataStore = new DataStore<TunnellingSysTheme>();
		Page pageTemp = new Page();
		//当前页 
		int intPage = Integer.parseInt((page == null || page == "0") ? "1" : page);
		//每页显示条数  
		int number = Integer.parseInt((rows == null || rows == "0") ? "10" : rows);
		int start = (intPage -1) * number;
		pageTemp.setCurrentPage(intPage);
		pageTemp.setRecPerPage(number);
		pageTemp.setFrom(start);
		Map paramMap = BeanUtil.Bean2Map(tunnellingSysTheme);
		Page resultPage = tunnellingSysThemeService.pageQuery(paramMap, pageTemp);
		List<TunnellingSysTheme> resultList = (List<TunnellingSysTheme>) resultPage.getCollection();
		dataStore.setTotal(new Long(resultPage.getCount()));
		dataStore.setRows(resultList);
		String json = new JsonMapper().toJson(dataStore);
		Struts2Utils.renderText(json);
	}
	
	public void getById() {
		Struts2Utils.renderJson(tunnellingSysThemeService.getById(id),
				EncodingHeaderUtil.HEADERENCODING,
				EncodingHeaderUtil.CACHEENCODING);		
	}
	
	public void getMine(){
		List<TunnellingGraph> list = null;
		try {
			list = tunnellingSysThemeService.getMineSums(date);
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
			for (TunnellingGraph coal : list) {
				String jsonStr = "";
				index +=1;
				jsonStr += "{";
				jsonStr += "type: 'column',";
				jsonStr += "name:'"+coal.getTunnllingGroupName()+"',";
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
		List<TunnellingSysTheme> listCoal = null;
		try {
			listCoal = tunnellingSysThemeService.getAvg(date);
			if( listCoal !=null){
				for (TunnellingSysTheme coalMiningSysTheme : listCoal) {
					 int i =Integer.parseInt(coalMiningSysTheme.getTunnllingDate())-1;
					 listAvg[i]=Double.parseDouble(coalMiningSysTheme.getRealityTunnlling());
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
		List<TunnellingSysTheme> list = null;
		//色系
		String[] color = new String[]{"green","black","blue","red","yellow","gray"};
		//字符数组
		String[] temp = null;
		try {
			//计数器
			int index =0;
			list = tunnellingSysThemeService.getSumPie(date);
			temp = new String[list.size()];
			for (TunnellingSysTheme coal: list) {
				String jsonStr = "";
				index +=1;
				jsonStr += "{name: '" +coal.getTunnllingGroupName()+ "',";
				jsonStr += "y:" + coal.getRealityTunnlling()+",";
				jsonStr += "color:'" + color[index-1]+"'}";
				temp[index -1] = jsonStr;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return temp;
	}
		
    public TunnellingSysTheme getTunnellingSysTheme() {
		return tunnellingSysTheme;
	}

	public void setTunnellingSysTheme(TunnellingSysTheme tunnellingSysTheme) {
		this.tunnellingSysTheme = tunnellingSysTheme;
	}

	public TunnellingSysThemeService getTunnellingSysThemeService() {
		return tunnellingSysThemeService;
	}

	public void setTunnellingSysThemeService(TunnellingSysThemeService tunnellingSysThemeService) {
		this.tunnellingSysThemeService = tunnellingSysThemeService;
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

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}
	
}
