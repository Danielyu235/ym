package com.ay.hazards.identification;


import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.shiro.SecurityUtils;
import org.springframework.stereotype.Component;

import com.ay.hazards.identification.log.pojo.IdentificationLog;
import com.ay.hazards.identification.log.service.IdentificationLogService;
import com.ay.hazards.identification.tool.ClassUtil;
import com.ay.hazards.identification.tool.PropertiesTool;

/** 
 * @Description 辨识工厂类
 * @date 2013-4-11
 * @author WangXin
 */
@Component
public class IdentificationFactory {
    private static Log log = LogFactory.getLog(IdentificationFactory.class);
    private static Map<String, IHazardsIdentification> factory = new HashMap<String, IHazardsIdentification>();
    //重大危险源辨识服务类
	private static IdentificationLogService identificationLogService;
	
	
    /**
     * 辨识方法
     * @param hazards 传入危险源实体对象
     * @return
     * @return IdentificationResult 返回危险源辨识结果
     */
    public static IdentificationResult identification(IHazards hazards) {
	HazardsType type = hazards.getHazardsType();
	IHazardsIdentification identification = newInstance(type);
	IdentificationResult result = identification.isMajorHazards(hazards);
	saveLog(result);
	return result;
    }
    
    /**
     * 新增辨识日志
     * @param result 返回危险源辨识结果
     */
    private static void saveLog(IdentificationResult result) {
		HazardsInfo hi= result.getHazardsInfo();
		//将当前时间转换成字符串
		Date date=new Date();  
		SimpleDateFormat formatter=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
		String time=formatter.format(date);  
		IdentificationLog identificationLog = new IdentificationLog((String) SecurityUtils.getSubject().getSession().getAttribute("user_id"),new Date(),
							hi.getDwdm(),hi.getCorpName(),hi.getHazardsId(),
							hi.getHazardsName(),hi.getType(),result.getInfo(),result.getReason(),time);
		identificationLogService.insert(identificationLog);
    }
    
    /**
     * 通过工厂方法得到危险源辨识处理类的实例
     * @param type 危险源类型
     * @return
     * @return IHazardsIdentification
     */
    public static IHazardsIdentification newInstance(HazardsType type) {
	IHazardsIdentification ident = factory.get(type.toString());
	if(ident == null) {
	    ident = loadClass(type);
	    factory.put(type.toString(), ident);
	}
	return ident;
    }
    /**
     * web容器中的初始化方法
     * @return void
     */
    @PostConstruct
    public static void init() {
	HazardsType[] types = HazardsType.values();
	for(HazardsType type: types) {
	    IHazardsIdentification ident = loadClass(type);
	    factory.put(type.toString(), ident);
	}
	log.info("identification init compelete");
    }
    /**
     * 初始化加载
     * @param type
     * @return
     * @return IHazardsIdentification
     */
    private static IHazardsIdentification loadClass(HazardsType type) {
	InputStream in = IdentificationFactory.class.getResourceAsStream("identification.properties");
	PropertiesTool pt = PropertiesTool.newInstance(in);
	String classFullName = pt.readValue(type.toString());
	log.debug(classFullName);
        Class<?> c = null;
        try
        {
            c = Thread.currentThread().getContextClassLoader().loadClass(classFullName);
        }
        catch (ClassNotFoundException e)
        {
            e.printStackTrace();
        }
        if(!ClassUtil.isInterface(c, IHazardsIdentification.class))
            throw new ClassCastException("指定的辨识类不是标准的辨识类！");
        IHazardsIdentification identification = null;
        try {
            identification = (IHazardsIdentification) c.newInstance();
	} catch (InstantiationException e) {
	    e.printStackTrace();
	} catch (IllegalAccessException e) {
	    e.printStackTrace();
	}
        return identification;
    }
    @Resource
	public void setIdentificationLogService(
			IdentificationLogService identificationLogService) {
		this.identificationLogService = identificationLogService;
	}
    
}

