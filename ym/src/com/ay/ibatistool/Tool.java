package com.ay.ibatistool;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

import com.ay.ibatistool.db.DBUtil;
import com.ay.ibatistool.tool.BeanTool;
import com.ay.ibatistool.tool.DaoTool;
import com.ay.ibatistool.tool.SQLMapTool;
import com.ay.ibatistool.tool.XMLTool;



public class Tool {
	static {
		XMLTool.load("../ibatis-tool-config.xml");
	}

	public static void main(String[] args) {
		Tool.create();
	}

	

	@SuppressWarnings("unchecked")
	public static void create() {

		String driverClassName = XMLTool.getElementAttribute("/config/jdbc",
				"jdbc.driverClassName");
		String url = XMLTool.getElementAttribute("/config/jdbc", "jdbc.url");
		String username = XMLTool.getElementAttribute("/config/jdbc",
				"jdbc.username");
		String password = XMLTool.getElementAttribute("/config/jdbc",
				"jdbc.password");
		DBUtil.getConnection(driverClassName, url, username, password);

		// String tableName="T_RES_ALBUMINFO";
		List<String> tableList = XMLTool
				.getElementTexts("/config/tables/table");
		if (tableList.size() == 0) {
			tableList = DBUtil.getAllTable();
		}
		String javabackage = XMLTool.getElementText("/config/set/modelpackage");
		String src = XMLTool.getElementText("/config/set/src");
		String replace = XMLTool.getElementText("/config/set/replace");
		String createSequence = XMLTool.getElementText("/config/set/createSequence");
		//@SuppressWarnings("unused")
		//String daoPkg = XMLTool.getElementText("/config/set/daopackage");
		//@SuppressWarnings("unused")
		//String implPkg = XMLTool.getElementText("/config/set/implpackage");
		String xmlbackage = XMLTool.getElementText("/config/set/xmlpackage");
		for (Iterator iterator = tableList.iterator(); iterator.hasNext();) {
			String tableName = (String) iterator.next();
			//String desc = DBUtil.getTableDesc(username, tableName);
			LinkedList<String[]> linkedList = DBUtil.getFeild(tableName);
			String sequenceName="S_"+tableName;
			String name = getName(tableName);
			String beanName = name
					+ XMLTool.getElementText("/config/set/modelName");
			String xmlName = name;
			String className = javabackage + "." + beanName;
			String daoName = name + "Dao";
			String implName = name + "Impl";
			String xmlPath = "./" + src + xmlbackage.replace(".", "/") + "/"
					+ xmlName + ".xml";
			HashSet<String> set = new HashSet<String>();

			ArrayList<String[]> list = new ArrayList<String[]>();
			for (Iterator<String[]> it = linkedList.iterator(); it.hasNext();) {
				String[] strings = (String[]) it.next();
				set.add(strings[0]);
				strings[0] = strings[0]
						.substring(strings[0].lastIndexOf(".") + 1);
				list.add(strings);
			}
			
			
			try {
				if(createSequence.equals("true")){
					DBUtil.createSequence(sequenceName);
				}
				//生成bean文件
				Tool.createBean(replace, src, beanName, javabackage, "", list, set);
				//生成XML文件
				Tool.createXml(replace, src, xmlName, tableName, className, xmlbackage, list);
				//生成dao文件
				//Tool.createDao(replace, src, daoName, implName, daoPkg, implPkg, xmlPath);
			} catch (Exception e) {
				System.err.println(e.getMessage());
			}
		}

		DBUtil.closeConnection();
	}

	public static void createBean(String replace, String src, String beanname,
			String javapack, String desc, ArrayList<String[]> list,
			HashSet<String> set) {
		BeanTool tool = new BeanTool();
		tool.setReplace(replace);
		tool.setBeanName(beanname);
		tool.setBeanPkg(javapack);
		tool.setImportClaess(set);
		tool.setDesc(desc);
		tool.setFields(list);
		tool.setSrc(src);
		tool.save();
		// System.out.println(name);
	}

	private static String getName(String name) {
		String[] names = name.toLowerCase().split("_");
		name = "";

		for (int i = 0; i < names.length; i++) {
			name = name + names[i].substring(0, 1).toUpperCase()
					+ names[i].substring(1);
		}
		return name;
	}
	public static void createSequence(String sequenceName){
		System.out.println("create begin: "+sequenceName);
		DBUtil.createSequence(sequenceName);
	}
	public static void createXml(String replace, String src, String xmlName,
			String tableName, String className, String xmlpack,
			ArrayList<String[]> list) {
		SQLMapTool tool = new SQLMapTool();
		tool.setPackge(xmlpack);
		tool.setXmlName(xmlName);
		tool.setTableName(tableName);
		tool.setFields(list);
		tool.setClassName(className);
		tool.setSrc(src);
		tool.setReplace(replace);
		tool.save();
	}

	public static void createDao(String replace, String src, String daoName,
			String implName, String daoPkg, String implPkg, String xmlPath) {

		DaoTool tool = new DaoTool();
		tool.setDaoName(daoName);
		tool.setSrc(src);
		tool.setImplName(implName);
		tool.setDaoPkg(daoPkg);
		tool.setImplPkg(implPkg);
		tool.setXmlPath(xmlPath);
		tool.setReplace(replace);
		tool.save();
	}
}
