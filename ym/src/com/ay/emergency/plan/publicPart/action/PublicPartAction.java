package com.ay.emergency.plan.publicPart.action;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.CellRangeAddress;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.struts2.ServletActionContext;

import com.ay.emergency.plan.publicPart.pojo.PublicPart;
import com.ay.emergency.plan.publicPart.service.PublicPartService;
import com.ay.framework.bean.DataStore;
import com.ay.framework.bean.OperateInfo;
import com.ay.framework.core.action.BaseAction;
import com.ay.framework.core.dao.pagination.Page;
import com.ay.framework.core.utils.mapper.JsonMapper;
import com.ay.framework.core.utils.web.struts.Struts2Utils;
import com.ay.framework.util.BeanUtil;
import com.ay.framework.util.EncodingHeaderUtil;
import com.opensymphony.xwork2.ActionContext;

@SuppressWarnings("all")
public class PublicPartAction extends BaseAction {
	private PublicPartService publicPartService;
	private PublicPart publicPart;
	private String page;
	private String rows;
	private String sort;
	private String order;
	private String id;
	private String ids;
	
	public void add() {
		OperateInfo operateInfo = new OperateInfo();
		try {
			publicPartService.insert(publicPart);
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
		boolean flag = publicPartService.update(publicPart);
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
			flag = publicPartService.delete(idsParam);
		} else {
			flag = publicPartService.delete(ids);
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
		DataStore<PublicPart> dataStore = new DataStore<PublicPart>();
		Page pageTemp = new Page();
		//当前页 
		int intPage = Integer.parseInt((page == null || page == "0") ? "1" : page);
		//每页显示条数  
		int number = Integer.parseInt((rows == null || rows == "0") ? "10" : rows);
		int start = (intPage -1) * number;
		pageTemp.setCurrentPage(intPage);
		pageTemp.setRecPerPage(number);
		pageTemp.setFrom(start);
		Map paramMap = BeanUtil.Bean2Map(publicPart);
		Page resultPage = publicPartService.pageQuery(paramMap, pageTemp);
		List<PublicPart> resultList = (List<PublicPart>) resultPage.getCollection();
		dataStore.setTotal(new Long(resultPage.getCount()));
		dataStore.setRows(resultList);
		String json = new JsonMapper().toJson(dataStore);
		Struts2Utils.renderText(json);
	}
	
//     public void exp(){
//        String where = " where 1=1 and [STATUS]='1' ";
//        Map map = BeanUtil.Bean2Map(publicPart);
//        String id = request.getParameter("id");
//        String repace_id = id.replace("''","");
//        if(repace_id.length()>0){
//            where += " and id in ("+id+")";
//        }
//        if (map != null)
//        {
//            for (Object o : map.keySet())
//            {
//                where += " and " + o.toString() + " like '%" + map.get(o) + "%' ";
//            }
//        }
//        excelQuerySql = " select DANGEROUS,LOSS,STEP,STATION from TB_PUBLIC_PART " + where;
//        System.out.println(excelQuerySql);
//        excelSheetName = "煤矿危险源库";
//        excelHeads = new String[]
//        { "危险源", "可能造成的伤害和损失", "当事人应该采取的措施", "适用岗位" };
//        return "exp";
//    }
    
	/**
     * 导出方法
     * @return exp
     */
	public void exp(){
		try {
			String[] ids = null;
			if(id != null && id.trim().length() > 0){
				ids = id.split(",");		
			}
			List<PublicPart> list = publicPartService.getListById(ids);
			
			//这一步需要改成动态
			String[] titles = {"危险源","可能造成的伤害和损失","当事人应该采取的措施","签字确认"};
			HSSFWorkbook wb = cerateExcelFile(titles,list);
			ActionContext context = ActionContext.getContext();
	        HttpServletResponse response = (HttpServletResponse) context.get(ServletActionContext.HTTP_RESPONSE);  
			response.setContentType("application/ms-excel") ;
			
			//名称这一步需要改动
			response.setHeader("Content-Disposition", "attachment;filename=" + new String("公共部分.xls".getBytes(),"iso-8859-1")) ;
			wb.write(response.getOutputStream());
		} catch (Exception e) {
			e.printStackTrace();
		}
    }
    
	/**
	 * 新的导出excel方法，加入格式
	 * @param titles 标题数组
	 * @param list 数据
	 */
    private HSSFWorkbook cerateExcelFile(String[] titles, List<PublicPart> list){
    	HSSFWorkbook wb = new HSSFWorkbook();//创建一个excel文档
		int tLength = titles.length;
    	
    	Sheet sheet = wb.createSheet("公共危险源库");//创建一个工作簿   
    	
    	//这一步需要改成动态
    	sheet.setColumnWidth(0, 10000);//设置行宽度
    	sheet.setColumnWidth(1, 10000);
    	sheet.setColumnWidth(2, 18000);
    	sheet.setColumnWidth(3, 5000);
    	
    	Row row = sheet.createRow((short)0);//创建行对象
    	Cell cell = row.createCell(0);//创建单元格对象
    	//总标题行
    	row = sheet.createRow((short)1);
    	HSSFCellStyle titleStyle = setTableStyle(wb);//获取样式   
    	for (int i = 0; i < tLength; i++) {
    		cell = row.createCell(i);
    		cell.setCellValue("危险源检查表");
    		cell.setCellStyle(titleStyle);
		}
    	
    	//合并列（这一步需要改动）
    	sheet.addMergedRegion(new CellRangeAddress(
                1, //起始行 (0-based)
                1, //结束行 (0-based)
                0, //起始列 (0-based)
                3  //结束列 (0-based)
        ));
    	//副标题行
    	row = sheet.createRow((short)2);
    	for (int i = 0; i < tLength; i++) {
    		cell = row.createCell(i);
        	cell.setCellValue(titles[i]);
        	cell.setCellStyle(titleStyle);
		}
    	//数据
    	HSSFCellStyle dataStyle = setTableStyle(wb);//获取样式
    	dataStyle.setAlignment(HSSFCellStyle.ALIGN_LEFT);
    	//这一步需要改动
    	for (int i = 0; i < list.size(); i++) {
    		row = sheet.createRow((short)i + 3);//从第四行开始
    		cell = row.createCell(0);//第一列
        	cell.setCellValue(list.get(i).getDangerous());
        	cell.setCellStyle(dataStyle);
        	cell = row.createCell(1);//第二列
        	cell.setCellValue(list.get(i).getLoss());
        	cell.setCellStyle(dataStyle);
        	cell = row.createCell(2);//第三列
        	cell.setCellValue(list.get(i).getStep());
        	cell.setCellStyle(dataStyle);
        	cell = row.createCell(3);//第四列
        	cell.setCellValue("");
        	cell.setCellStyle(dataStyle);
    	}
    	
    	return wb;    	
 	}
    
    /**
     * 设置Excel表格的单元格样式
     * @param wb
     * @return
     */
    private HSSFCellStyle setTableStyle(HSSFWorkbook wb){
    	HSSFCellStyle style = wb.createCellStyle();
    	
    	//设置边框样式
    	style.setBorderBottom(HSSFCellStyle.BORDER_THIN);
    	style.setBorderLeft(HSSFCellStyle.BORDER_THIN);
    	style.setBorderTop(HSSFCellStyle.BORDER_THIN);
    	style.setBorderRight(HSSFCellStyle.BORDER_THIN);
    	
    	//设置边框颜色
    	style.setRightBorderColor(HSSFColor.BLACK.index);
    	style.setLeftBorderColor(HSSFColor.BLACK.index);
    	style.setTopBorderColor(HSSFColor.BLACK.index);
    	style.setBottomBorderColor(HSSFColor.BLACK.index);
    	
    	//居中对齐
    	style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
    	
    	//自动换行
    	style.setWrapText(true);
    	
    	return style;
    }
    
	
	public void getById() {
		Struts2Utils.renderJson(publicPartService.getById(id),
				EncodingHeaderUtil.HEADERENCODING,
				EncodingHeaderUtil.CACHEENCODING);		
	}
	
    public PublicPart getPublicPart() {
		return publicPart;
	}

	public void setPublicPart(PublicPart publicPart) {
		this.publicPart = publicPart;
	}

	public PublicPartService getPublicPartService() {
		return publicPartService;
	}

	public void setPublicPartService(PublicPartService publicPartService) {
		this.publicPartService = publicPartService;
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
