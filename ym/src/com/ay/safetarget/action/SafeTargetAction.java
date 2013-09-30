package com.ay.safetarget.action;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.jdbc.core.*;

import com.ay.attend.pojo.AttendReward;
import com.ay.calendar.pojo.Zbpb;
import com.ay.framework.bean.DataStore;
import com.ay.framework.bean.OperateInfo;
import com.ay.framework.core.action.BaseAction;
import com.ay.framework.core.dao.pagination.Page;
import com.ay.framework.core.utils.mapper.JsonMapper;
import com.ay.framework.core.utils.web.struts.Struts2Utils;
import com.ay.framework.util.BeanUtil;
import com.ay.framework.util.EncodingHeaderUtil;
import com.ay.framework.util.collenction.ListUtil;
import com.ay.safetarget.pojo.SafeTarget;
import com.ay.safetarget.service.SafeTargetService;
@SuppressWarnings("all")
public class SafeTargetAction extends BaseAction{
	private SafeTargetService safeTargetService;
	private SafeTarget safeTarget;
	private String page;
	private String rows;
	private String sort;
	private String order;
	private String id;
	private String ids;
    private String values;
    private   String gl;
	private String[] value = new String[52];
	private String[] fireValue=new String[95];
	public SafeTargetService getSafeTargetService() {
		return safeTargetService;
	}

	public void setSafeTargetService(SafeTargetService safeTargetService) {
		this.safeTargetService = safeTargetService;
	}

	public SafeTarget getSafeTarget() {
		return safeTarget;
	}

	public void setSafeTarget(SafeTarget safeTarget) {
		this.safeTarget = safeTarget;
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

	public String getValues() {
		return values;
	}

	public void setValues(String values) {
		this.values = values;
	}

	public String getGl() {
		return gl;
	}

	public void setGl(String gl) {
		this.gl = gl;
	}

	public String[] getValue() {
		return value;
	}

	public void setValue(String[] value) {
		this.value = value;
	}
	public String[] getFireValue() {
		return fireValue;
	}

	public void setFireValue(String[] fireValue) {
		this.fireValue = fireValue;
	}

	//瓦斯事故模拟
	public String test(){
	for (int i = 0; i < value.length; i++) {
		value[i]=request.getParameter("select"+i);
		}
		 float c1=Float.parseFloat(value[51]);
		 System.out.println("c1::::::"+c1);
		 float x1=Float.parseFloat(value[50]);
		 
		 float x2=(Float.parseFloat(value[47])+Float.parseFloat(value[48])+Float.parseFloat(value[49]))/3;
		 float x3=(Float.parseFloat(value[46])+Float.parseFloat(value[45]))/2;
		 float x4=(Float.parseFloat(value[44])+Float.parseFloat(value[43]))/2;
		 float x5=Float.parseFloat(value[42]);
		 float x6=(Float.parseFloat(value[41])+Float.parseFloat(value[40])+Float.parseFloat(value[39]))/3;
		 float x7=(Float.parseFloat(value[38])+Float.parseFloat(value[37]))/2;
		 float x8=(Float.parseFloat(value[36])+Float.parseFloat(value[35]))/2;
		 float x9=Float.parseFloat(value[34]);
		 float x10=(Float.parseFloat(value[33])+Float.parseFloat(value[32]))/2;
		 float x11=(Float.parseFloat(value[31])+Float.parseFloat(value[30])+Float.parseFloat(value[29]))/3;
		 
		 float x12=(Float.parseFloat(value[28])+Float.parseFloat(value[27])+Float.parseFloat(value[26])+Float.parseFloat(value[25])+Float.parseFloat(value[24]))/5;
		 float x13=Float.parseFloat(value[23]);
		 float x14=Float.parseFloat(value[22]);
		 float x15=(Float.parseFloat(value[21])+Float.parseFloat(value[20]))/2;
		 float x16=(Float.parseFloat(value[19])+Float.parseFloat(value[18]))/2;
		 float x17=(Float.parseFloat(value[17])+Float.parseFloat(value[16]))/2;
		 float x18=(Float.parseFloat(value[15])+Float.parseFloat(value[14]))/2;
		 float x19=(Float.parseFloat(value[13])+Float.parseFloat(value[12]))/2;
		 float x20=(Float.parseFloat(value[11])+Float.parseFloat(value[10]))/2;
		 float x21=(Float.parseFloat(value[9])+Float.parseFloat(value[8]))/2;
		 float x22=(Float.parseFloat(value[7])+Float.parseFloat(value[6]))/2;
		 float x23=Float.parseFloat(value[5]);
		 float x24=(Float.parseFloat(value[4])+Float.parseFloat(value[3]))/2;
		 float x25=(Float.parseFloat(value[2])+Float.parseFloat(value[1])+Float.parseFloat(value[0]))/3;
		 
	float p1=(1-x2)*(1-x3)*(1-x4)*(1-x5)*(1-x6)*(1-x7)*(1-x8)*(1-x9)*(1-x10)*(1-x11);
	System.out.println("p1::::::"+p1);
	float p2=1-c1;
	System.out.println("p2:::::::"+p2);
	float p3=(1-x12)*(1-x13)*(1-x14)*(1-x15)*(1-x16)*(1-x17)*(1-x18)*(1-x19)*(1-x20)*(1-x21)*(1-x22)*(1-x23)*(1-x24)*(1-x25);
	System.out.println("p3::::::::"+p3);
	float p4=1-x1;
	System.out.println("p4::::::::"+p4);
	float g=1-(p1+p2+p3+p4)+(p1*p2+p1*p3+p1*p4+p2*p3+p2*p4+p3*p4)-(p1*p2*p3+p1*p2*p4+p1*p3*p4+p2*p3*p4)+p1*p2*p3*p4;
    gl=Float.toString(g);
    values = Arrays.toString(value);
    System.out.println(values);
    values=values.replace("[","");
    values=values.replace("]","");
    values=values.replace(" ","");
    values = values.trim();
    SafeTarget safeTargets =new SafeTarget();
    safeTargets.setValue(values);
    safeTargets.setGl(gl);
    SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
    String testTime = df.format(new Date());// new Date()为获取当前系统时间
    safeTargets.setTestTime(testTime);
    safeTargets.setTestType("瓦斯爆炸事故模拟");
    safeTargetService.insert(safeTargets);
    return "safetarget";
	}
	
	//火灾事故模拟
    public String fireTest(){
    	for (int i = 0; i < fireValue.length; i++) {
    		fireValue[i]=request.getParameter("select"+i);
    		}
    		 float c1=(Float.parseFloat(fireValue[0])+Float.parseFloat(fireValue[1]))/2;
    		 float x1=Float.parseFloat(fireValue[2]);
    		 
    		 float x2=Float.parseFloat(fireValue[3]);
    		 float x3=Float.parseFloat(fireValue[4]);
    		 float x4=Float.parseFloat(fireValue[5]);
    		 float x5=(Float.parseFloat(fireValue[6])+Float.parseFloat(fireValue[7]))/2;
    		 float x6=(Float.parseFloat(fireValue[8])+Float.parseFloat(fireValue[9])+Float.parseFloat(fireValue[10])+Float.parseFloat(fireValue[11]))/4;
    		 float x7=(Float.parseFloat(fireValue[12])+Float.parseFloat(fireValue[13]))/2;
    		 float x8=(Float.parseFloat(fireValue[14])+Float.parseFloat(fireValue[15]))/2;
    		 float x9=Float.parseFloat(fireValue[16]);
    		 float x10=(Float.parseFloat(fireValue[17])+Float.parseFloat(fireValue[18]))/2;
    		 float x11=(Float.parseFloat(fireValue[19])+Float.parseFloat(fireValue[20])+Float.parseFloat(fireValue[21])+Float.parseFloat(fireValue[22]))/4;
    		 
    		 float x12=(Float.parseFloat(fireValue[23])+Float.parseFloat(fireValue[24]))/2;
    		 float x13=Float.parseFloat(fireValue[25]);
    		 float x14=(Float.parseFloat(fireValue[26])+Float.parseFloat(fireValue[27]))/2;
    		 float x15=(Float.parseFloat(fireValue[28])+Float.parseFloat(fireValue[29]))/2;
    		 float x16=(Float.parseFloat(fireValue[30])+Float.parseFloat(fireValue[31]))/2;
    		 float x17=(Float.parseFloat(fireValue[32])+Float.parseFloat(fireValue[33]))/2;
    		 float x18=(Float.parseFloat(fireValue[34])+Float.parseFloat(fireValue[35]))/2;
    		 float x19=(Float.parseFloat(fireValue[36])+Float.parseFloat(fireValue[37]))/2;
    		 float x20=(Float.parseFloat(fireValue[38])+Float.parseFloat(fireValue[39]))/2;
    		 float x21=(Float.parseFloat(fireValue[40])+Float.parseFloat(fireValue[41]))/2;
    		 float x22=(Float.parseFloat(fireValue[42])+Float.parseFloat(fireValue[43]))/2;
    		 float x23=(Float.parseFloat(fireValue[44])+Float.parseFloat(fireValue[45])+Float.parseFloat(fireValue[46])+Float.parseFloat(fireValue[47]))/4;
    		 float x24=(Float.parseFloat(fireValue[48])+Float.parseFloat(fireValue[49]))/2;
    		 float x25=(Float.parseFloat(fireValue[50])+Float.parseFloat(fireValue[51]))/2;
    		 
    		 
    		 float x26=(Float.parseFloat(fireValue[52])+Float.parseFloat(fireValue[53])+Float.parseFloat(fireValue[54]))/3;
    		 float x27=(Float.parseFloat(fireValue[55])+Float.parseFloat(fireValue[56]))/2;
    		 float x28=(Float.parseFloat(fireValue[57])+Float.parseFloat(fireValue[58])+Float.parseFloat(fireValue[59]))/3;
    		 float x29=(Float.parseFloat(fireValue[60])+Float.parseFloat(fireValue[61]))/2;
    		 float x30=(Float.parseFloat(fireValue[62])+Float.parseFloat(fireValue[63]))/2;
    		 float x31=(Float.parseFloat(fireValue[64])+Float.parseFloat(fireValue[65]))/2;
    		 float x32=(Float.parseFloat(fireValue[66])+Float.parseFloat(fireValue[67]))/2;
    		 float x33=(Float.parseFloat(fireValue[68])+Float.parseFloat(fireValue[69])+Float.parseFloat(fireValue[70]))/3;
    		 float x34=(Float.parseFloat(fireValue[71])+Float.parseFloat(fireValue[72]))/2;
    		 float x35=(Float.parseFloat(fireValue[73])+Float.parseFloat(fireValue[74])+Float.parseFloat(fireValue[75]))/3;
    		 float x36=(Float.parseFloat(fireValue[76])+Float.parseFloat(fireValue[77]))/2;
    		 float x37=(Float.parseFloat(fireValue[78])+Float.parseFloat(fireValue[79]))/2;
    		 float x38=(Float.parseFloat(fireValue[80])+Float.parseFloat(fireValue[81]))/2;
    		 float x39=(Float.parseFloat(fireValue[82])+Float.parseFloat(fireValue[83]))/2;
    		 float x40=(Float.parseFloat(fireValue[84])+Float.parseFloat(fireValue[85]))/2;
    		 float x41=(Float.parseFloat(fireValue[86])+Float.parseFloat(fireValue[87]))/2;
    		 float x42=Float.parseFloat(fireValue[88]);
    		 float x43=Float.parseFloat(fireValue[89]);
    		 float x44=(Float.parseFloat(fireValue[90])+Float.parseFloat(fireValue[91]))/2;
    		 float x45=(Float.parseFloat(fireValue[92])+Float.parseFloat(fireValue[93])+Float.parseFloat(fireValue[94]))/3;
    	
    		 
    	float p1=(1-x1)*(1-x2)*(1-x3)*(1-x25)*(1-x26)*(1-x27)*(1-x28)*(1-x29)*(1-x30)*(1-x31)*(1-x32)*(1-x33)*(1-x34)*(1-x35)*(1-x36)*(1-x37)*(1-x38)*(1-x39)*(1-x40)*(1-x41)*(1-x42)*(1-x43)*(1-x44)*(1-x45);
    	System.out.println("p1::::::"+p1);
    	float p2=1-c1;
    	System.out.println("p2:::::::"+p2);
    	float p3=(1-x4)*(1-x5)*(1-x6)*(1-x7)*(1-x8)*(1-x9)*(1-x10)*(1-x11)*(1-x12)*(1-x13)*(1-x14)*(1-x15)*(1-x16)*(1-x17)*(1-x18)*(1-x19)*(1-x20)*(1-x21)*(1-x22)*(1-x23)*(1-x24);
    	System.out.println("p3::::::::"+p3);
    	float g=1-(p1+p2+p3)+(p1*p2+p1*p3+p2*p3)-p1*p2*p3;
        gl=Float.toString(g);
        values = Arrays.toString(fireValue);
        System.out.println(values);
        values=values.replace("[","");
        values=values.replace("]","");
        values=values.replace(" ","");
        values = values.trim();
        SafeTarget safeTargets =new SafeTarget();
        safeTargets.setValue(values);
        safeTargets.setGl(gl);
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
        String testTime = df.format(new Date());// new Date()为获取当前系统时间
        safeTargets.setTestTime(testTime);
        safeTargets.setTestType("火灾事故模拟");
        safeTargetService.insert(safeTargets);
        return "firetarget";
    }
	public void list() throws UnsupportedEncodingException {
		DataStore<SafeTarget> dataStore = new DataStore<SafeTarget>();
		Page pageTemp = new Page();
		//当前页 
		int intPage = Integer.parseInt((page == null || page == "0") ? "1" : page);
		//每页显示条数  
		int number = Integer.parseInt((rows == null || rows == "0") ? "10" : rows);
		int start = (intPage -1) * number;
		pageTemp.setCurrentPage(intPage);
		pageTemp.setRecPerPage(number);
		pageTemp.setFrom(start);
        String testType = new String(safeTarget.getTestType().getBytes("ISO8859-1"),"UTF-8");

		System.out.println("dddddddddd"+testType);
		safeTarget.setTestType(testType);
		Map paramMap = BeanUtil.Bean2Map(safeTarget);
		Page resultPage = safeTargetService.pageQuery(paramMap, pageTemp);
		List<SafeTarget> resultList = (List<SafeTarget>) resultPage.getCollection();
		dataStore.setTotal(new Long(resultPage.getCount()));
		dataStore.setRows(resultList);
		String json = new JsonMapper().toJson(dataStore);
		Struts2Utils.renderText(json);
	}
	public void getById() {
		Struts2Utils.renderJson(safeTargetService.getById(id),
				EncodingHeaderUtil.HEADERENCODING,
				EncodingHeaderUtil.CACHEENCODING);	
		
	}
	public void delete() {
		OperateInfo operateInfo = new OperateInfo();
		boolean flag = false;
		if (ids.contains(",")) {
			String idsParam[] = ids.split(",");
			flag = safeTargetService.delete(idsParam);
		} else {
			flag = safeTargetService.delete(ids);
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
}
