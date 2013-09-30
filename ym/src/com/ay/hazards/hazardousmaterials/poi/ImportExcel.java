package com.ay.hazards.hazardousmaterials.poi;

import java.io.InputStream;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.config.IniSecurityManagerFactory;
import org.apache.shiro.util.Factory;
import org.apache.shiro.util.ThreadContext;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.ay.framework.exception.POIException;
import com.ay.framework.poi.POIHandler;
import com.ay.jfds.dev.dao.DataHandlerDao;

/** 
 * @Description 导入sql
 * @date 2013-4-15
 * @author WangXin
 */
public class ImportExcel {
    private static final Log log = LogFactory.getLog(ImportExcel.class);
    private DataHandlerDao dataHandlerDao;
    //@Test
    public void imp() throws SQLException, POIException {
	InputStream is = ImportExcel.class.getResourceAsStream("materials.xls");
	List<String[]> list = POIHandler.read(is);
	dataHandlerDao.insertExcelDate("insert into TB_MATERIALS(id,status,created,create_time,updated,update_time,TYPE,NAME,THRESHOLD_QUANTITY) " +
			"values(?,?,?,?,?,?,?,?,?)", list);
    }
    @Test
    public void getType() throws SQLException, POIException {
	InputStream is = ImportExcel.class.getResourceAsStream("materials.xls");
	List<String[]> list = POIHandler.read(is);
	log.info("types:");
	List<String> temp = new ArrayList<String>();
	for(String[] strs : list) {
	    if(strs == null) continue;
	    if(temp.contains(strs[0])) continue;
	    temp.add(strs[0]);
	    log.info(strs[0]);
	}
    }
    @Before
    public void init() {
	ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml", "spring/applicationContext-*.xml");
	dataHandlerDao = context.getBean(DataHandlerDao.class);
        Factory<org.apache.shiro.mgt.SecurityManager> factory = 
            new IniSecurityManagerFactory("src/com/ay/hazards/hazardousmaterials/poi/test.ini");
        org.apache.shiro.mgt.SecurityManager securityManager 
            = factory.getInstance();
        SecurityUtils.setSecurityManager(securityManager);
    }
    @Resource
    org.apache.shiro.mgt.SecurityManager securityManager;

    @Before
    public void setUp() throws Exception {
        ThreadContext.bind(securityManager);
    }
}

