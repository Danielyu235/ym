package com.ay.employee.action;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.fileupload.FileItemIterator;
import org.apache.commons.fileupload.FileItemStream;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.util.Streams;
import org.apache.shiro.SecurityUtils;

import com.ay.framework.bean.DataStore;
import com.ay.framework.bean.OperateInfo;
import com.ay.framework.core.dao.pagination.Page;
import com.ay.framework.core.utils.mapper.JsonMapper;
import com.ay.framework.core.utils.web.struts.Struts2Utils;
import com.ay.framework.util.BeanUtil;
import com.ay.framework.util.EncodingHeaderUtil;
import com.ay.employee.pojo.Employee;
import com.ay.employee.pojo.Employees;
import com.ay.employee.service.EmployeesService;
import com.ay.framework.core.action.BaseAction;

@SuppressWarnings("all")
public class EmployeesAction extends BaseAction {
	private EmployeesService employeesService;
	private Employees employees;
	private String page;
	private String rows;
	private String sort;
	private String order;
	private String id;
	private String ids;
	
	public void add() {
		OperateInfo operateInfo = new OperateInfo();
		try {
			employeesService.insert(employees);
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
		boolean flag = employeesService.update(employees);
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
	public void getAllName(){
	    Map paramMap = BeanUtil.Bean2Map(employees);
	    List<Employees> resultList =  employeesService.queryName(paramMap);
	    String json = new JsonMapper().toJson(resultList);
	    Struts2Utils.renderText(json);
	}
	public void delete() {
		OperateInfo operateInfo = new OperateInfo();
		boolean flag = false;
		if (ids.contains(",")) {
			String idsParam[] = ids.split(",");
			flag = employeesService.delete(idsParam);
		} else {
			flag = employeesService.delete(ids);
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
		DataStore<Employees> dataStore = new DataStore<Employees>();
		Page pageTemp = new Page();
		//当前页 
		int intPage = Integer.parseInt((page == null || page == "0") ? "1" : page);
		//每页显示条数  
		int number = Integer.parseInt((rows == null || rows == "0") ? "10" : rows);
		int start = (intPage -1) * number;
		pageTemp.setCurrentPage(intPage);
		pageTemp.setRecPerPage(number);
		pageTemp.setFrom(start);
		Map paramMap = BeanUtil.Bean2Map(employees);
		Page resultPage = employeesService.pageQuery(paramMap, pageTemp);
		List<Employees> resultList = (List<Employees>) resultPage.getCollection();
		dataStore.setTotal(new Long(resultPage.getCount()));
		dataStore.setRows(resultList);
		String json = new JsonMapper().toJson(dataStore);
		Struts2Utils.renderText(json);
	}
	
	public void getById() {
		Struts2Utils.renderJson(employeesService.getById(id),
				EncodingHeaderUtil.HEADERENCODING,
				EncodingHeaderUtil.CACHEENCODING);		
	}
	public void fileUpload(){
	        System.out.println("--------------进入上传方法---------------");
	        //response.setContentType("text/html");   
	        response.setCharacterEncoding("UTF-8");
	        String realDir = request.getSession().getServletContext().getRealPath("");
	        String contextpath = request.getContextPath();
	        String basePath = request.getScheme() + "://"
	        + request.getServerName() + ":" + request.getServerPort()
	        + contextpath + "/";

	        try {
	        String filePath = "upload";
	        String realPath = realDir+"\\"+filePath;
	        System.out.println("realPath=============="+realPath);
	        //判断路径是否存在，不存在则创建
	        File dir = new File(realPath);
	        if(!dir.isDirectory())
	            dir.mkdir();

	        if(ServletFileUpload.isMultipartContent(request)){
	            System.out.println("==============================");
	            DiskFileItemFactory dff = new DiskFileItemFactory();
	            dff.setRepository(dir);
	            dff.setSizeThreshold(1024000);
	            ServletFileUpload sfu = new ServletFileUpload(dff);
	            FileItemIterator fii = null;
	            fii = sfu.getItemIterator(request);
	            String title = "";   //图片标题
	            String url = "";    //图片地址
	            String fileName = "";
	            String state="SUCCESS";
	            String realFileName="";
	            while(fii.hasNext()){
	                FileItemStream fis = fii.next();

	                try{
	                    if(!fis.isFormField() && fis.getName().length()>0){
	                        fileName = fis.getName();
	                        Pattern reg=Pattern.compile("[.]jpg|png|jpeg|gif|bmp$");
	                        Matcher matcher=reg.matcher(fileName);
	                        if(!matcher.find()) {
	                            state = "文件类型不允许！";
	                            break;
	                        }
	                        realFileName = new Date().getTime()+fileName.substring(fileName.lastIndexOf("."),fileName.length());
	                        url = realPath+"\\"+realFileName;
	                        System.out.println("url=============="+url);
	                        BufferedInputStream in = new BufferedInputStream(fis.openStream());//获得文件输入流
	                        FileOutputStream a = new FileOutputStream(new File(url));
	                        BufferedOutputStream output = new BufferedOutputStream(a);
	                        Streams.copy(in, output, true);//开始把文件写到你指定的上传文件夹
	                    }else{
	                        String fname = fis.getFieldName();

	                        if(fname.indexOf("pictitle")!=-1){
	                            BufferedInputStream in = new BufferedInputStream(fis.openStream());
	                            byte c [] = new byte[10];
	                            int n = 0;
	                            while((n=in.read(c))!=-1){
	                                title = new String(c,0,n);
	                                break;
	                            }
	                        }
	                    }

	                }catch(Exception e){
	                    e.printStackTrace();
	                }
	            }
	            
	            response.setStatus(200);
	            //String retxt ="{src:'"+basePath+filePath+"/"+realFileName+"',status:success}";
	            String retxt =filePath+"/"+realFileName;
	            request.getSession().setAttribute("aqscImageUrl",retxt );
	            System.out.println("realFileName========="+filePath+realFileName);
	            request.setAttribute("showImage", retxt);
	            //response.getWriter().print(retxt);
	            request.getRequestDispatcher("preImage.jsp").forward(request, response);
	        }
	        }catch(Exception ee) {
	            ee.printStackTrace();
	        }       
	    }
    public Employees getEmployees() {
		return employees;
	}

	public void setEmployees(Employees employees) {
		this.employees = employees;
	}

	public EmployeesService getEmployeesService() {
		return employeesService;
	}

	public void setEmployeesService(EmployeesService employeesService) {
		this.employeesService = employeesService;
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
