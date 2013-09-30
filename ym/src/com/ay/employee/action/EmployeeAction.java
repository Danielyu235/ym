package com.ay.employee.action;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItemIterator;
import org.apache.commons.fileupload.FileItemStream;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.util.Streams;
import org.apache.shiro.SecurityUtils;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ay.framework.bean.DataStore;
import com.ay.framework.bean.OperateInfo;
import com.ay.framework.core.dao.pagination.Page;
import com.ay.framework.core.utils.mapper.JsonMapper;
import com.ay.framework.core.utils.web.struts.Struts2Utils;
import com.ay.framework.util.BeanUtil;
import com.ay.framework.util.Digests;
import com.ay.framework.util.Encodes;
import com.ay.framework.util.EncodingHeaderUtil;
import com.ay.framework.util.MD5Util;
import com.ay.employee.pojo.Employee;
import com.ay.employee.service.EmployeeService;
import com.ay.framework.core.action.BaseAction;

@SuppressWarnings("all")
public class EmployeeAction extends BaseAction {
	private EmployeeService employeeService;
	private Employee employee;
	private String page;
	private String rows;
	private String sort;
	private String order;
	private String id;
	private String ids;
	
	public void add() {
		OperateInfo operateInfo = new OperateInfo();
		try {
			employee.setSalt(Encodes.encodeHex(Digests.generateSalt(8)));
			System.out.println(employee);
			employeeService.insert(employee);
			operateInfo.setOperateMessage("添加成功");
			operateInfo.setOperateSuccess(true);
		} catch (Exception e) {
			operateInfo.setOperateMessage("添加失败");
			operateInfo.setOperateSuccess(false);
			e.printStackTrace();
		}
		
		String json = new JsonMapper().toJson(operateInfo);
		Struts2Utils.renderText(json);
	}
	
	public void update() {
		OperateInfo operateInfo = new OperateInfo();
		boolean flag = employeeService.update(employee);
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
			flag = employeeService.delete(idsParam);
		} else {
			flag = employeeService.delete(ids);
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
		DataStore<Employee> dataStore = new DataStore<Employee>();
		Page pageTemp = new Page();
		//当前页 
		int intPage = Integer.parseInt((page == null || page == "0") ? "1" : page);
		//每页显示条数  
		int number = Integer.parseInt((rows == null || rows == "0") ? "10" : rows);
		int start = (intPage -1) * number;
		pageTemp.setCurrentPage(intPage);
		pageTemp.setRecPerPage(number);
		pageTemp.setFrom(start);
		Map paramMap = BeanUtil.Bean2Map(employee);
		Page resultPage = employeeService.pageQuery(paramMap, pageTemp);
		List<Employee> resultList = (List<Employee>) resultPage.getCollection();
		dataStore.setTotal(new Long(resultPage.getCount()));
		dataStore.setRows(resultList);
		String json = new JsonMapper().toJson(dataStore);
		Struts2Utils.renderText(json);
	}
	public void getAllName(){
	    Map paramMap = BeanUtil.Bean2Map(employee);
	    List<Employee> resultList =  employeeService.queryName(paramMap);
	    String json = new JsonMapper().toJson(resultList);
	    Struts2Utils.renderText(json);
	}
	public void getById() {
		Employee employee = employeeService.getById(id);
		System.out.println(employee);
		Struts2Utils.renderJson(employee,
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
            
//          Object obj=request.getSession().getAttribute("zbhjImageUrl");
//          String imgUrl=null;
//          if(obj==null){
//              imgUrl=new String();
//          }else{
//              imgUrl=obj.toString();
//          }
            //StringBuffer sbUrl=new StringBuffer(imgUrl);
            
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
	
    public Employee getEmployee() {
		return employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

	public EmployeeService getEmployeeService() {
		return employeeService;
	}

	public void setEmployeeService(EmployeeService employeeService) {
		this.employeeService = employeeService;
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
