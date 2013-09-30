package com.ay.jfds.dev.action;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.apache.struts2.ServletActionContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.ay.framework.common.ITreeService;
import com.ay.framework.core.action.BaseAction;
import com.ay.framework.core.utils.mapper.JsonMapper;
import com.ay.framework.core.utils.spring.SpringContextHolder;
import com.ay.framework.core.utils.web.struts.Struts2Utils;
import com.ay.framework.shiro.SystemMenu;
import com.ay.framework.util.StringUtil;
import com.ay.jfds.dev.pojo.Menu;
import com.ay.jfds.dev.pojo.MenuOpt;
import com.ay.jfds.dev.pojo.MenuVO;
import com.ay.jfds.dev.service.FormService;
import com.ay.jfds.dev.service.MenuService;
import com.ay.jfds.dev.service.MenuTreeService;

/**
 * 菜单管理
 * 
 * 对MenuAction进行改造，使用Shiro进行相应的权限控制
 * 
 * @DateTime: 2012-9-10
 * @author lushigai
 * @author zxy
 * @version 1.0
 * @since 1.0
 */
public class MenuAction extends BaseAction {
	private static Logger logger = LoggerFactory.getLogger(MenuAction.class);
	private MenuService menuService;// 菜单接口
	private String menuId;// 菜单id
	private ITreeService treeService;

	public String getMenuId() {
		return menuId;
	}

	public void setMenuId(String menuId) {
		this.menuId = menuId;
	}

	public MenuService getMenuService() {
		return menuService;
	}

	public void setMenuService(MenuService menuService) {
		this.menuService = menuService;
	}

	private HttpServletRequest request = ServletActionContext.getRequest();
	private HttpServletResponse response = ServletActionContext.getResponse();

	/**
	 * 增加Shiro的权限控制
	 * 
	 * @throws IOException
	 */
	public void initMenu() throws IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/xml");
		PrintWriter out = response.getWriter();
		// 获取所有的可用菜单信息
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("menu_switch", "1");
		List<Menu> menuList = menuService.query(map);

		if (menuList != null) {
			// 设置当前用户
			// getUser(request);
			StringBuffer menuXML = new StringBuffer();
			menuXML.append("<?xml version=\"1.0\" encoding=\"uft-8\"?>");
			menuXML.append("<root>");

			int menu_jb = 1;
			List<Menu> top_menuList = menuService.getMenu("0",
					String.valueOf(menu_jb), menuList);
			
			for (Menu menu : top_menuList) {
				
				if (menu.getMenuName() != null
						&& menu.getMenuName().trim().length() > 0) {
					Subject currentUser = SecurityUtils.getSubject();
					if (currentUser.isPermitted("admin")) {
						menuXML.append("<item remark = ");
						menuXML.append("\"" + menu.getMenuName() + "\"");
						menuXML.append(">");

						menuXML.append(menuService.getNextAllMenu(menu.getMenuId(),
								String.valueOf(menu_jb + 1), menuList));
						menuXML.append("</item>");
						continue;
					}
					// 没有url连接下的menu也是没有url以及optcode的
					StringBuilder permissionStr = new StringBuilder();
					if (menu.getMenuUrl() == null || menu.getMenuUrl().equals("")) {
						permissionStr.append(menu.getMenuId()).append(":null");
					} else {
						permissionStr.append(menu.getMenuId()).append(":").append(menu.getMenuUrl());
					}
					if (currentUser.isPermitted(permissionStr.toString())) {
						menuXML.append("<item remark = ");
						menuXML.append("\"" + menu.getMenuName() + "\"");
						menuXML.append(">");
						
						menuXML.append(menuService.getNextAllMenu(menu.getMenuId(),
								String.valueOf(menu_jb + 1), menuList));
						menuXML.append("</item>");
					}
				}

			}
			menuXML.append("</root>");
			// log.debug("菜单xml：："+menuXML);
			out.println(menuXML.toString());
		}
	}
	
	
	public void initMenu2() throws IOException {
		//logger.info("start");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/xml");
		PrintWriter out = response.getWriter();
		Subject currentUser = SecurityUtils.getSubject();
		// 获取所有的可用菜单信息
		List<MenuVO> memery_menuVOList = SystemMenu.getTop_menuVOList();
		List<MenuVO> top_menuVOList = new ArrayList<MenuVO>();
		for (MenuVO menu : memery_menuVOList) {
			String permissionStr = null;
			if(menu.getMenuUrl()==null || menu.getMenuUrl().isEmpty())
				permissionStr = menu.getMenuId() + ":null";
			else
				permissionStr = menu.getMenuId() + ":" + menu.getMenuUrl();
			if(currentUser.isPermitted(permissionStr)){
				MenuVO m = new MenuVO();
				m.setMenuId(menu.getMenuId());
				m.setMenuName(menu.getMenuName());
				m.setMenuUrl(menu.getMenuUrl());
				getAllPermissionChildren(m,menu,currentUser);
				top_menuVOList.add(m);
			}
		}
		String json = new JsonMapper().toJson(top_menuVOList);
		//logger.info("end");
		Struts2Utils.renderText(json);		
	}
	private void getAllPermissionChildren(MenuVO parent, MenuVO menuVO, Subject currentUser){
		List<MenuVO> menuVOList = menuVO.getChildren();
		for (MenuVO menu : menuVOList) {
			String permissionStr = null;
			if(menu.getMenuUrl()==null || menu.getMenuUrl().isEmpty())
				permissionStr = menu.getMenuId() + ":null";
			else
				permissionStr = menu.getMenuId() + ":" + menu.getMenuUrl();
			if(currentUser.isPermitted(permissionStr)){
				MenuVO m = new MenuVO();
				m.setMenuId(menu.getMenuId());
				m.setMenuName(menu.getMenuName());
				m.setMenuUrl(menu.getMenuUrl());
				getAllPermissionChildren(m,menu,currentUser);
				parent.getChildren().add(m);
			}
		}
	}

	// 初始化菜单信息树 ,后台调用
	public void initTree() throws IOException {

		// 获取菜单作为缓存
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("menu_switch", "0");
		List<Menu> menuList = menuService.query(map);
		int menu_jb = 1;

		response.setCharacterEncoding("utf-8");
		response.setContentType("text/xml");
		PrintWriter out = response.getWriter();
		StringBuffer menuXML = new StringBuffer();
		menuXML.append("<?xml version=\"1.0\" encoding=\"gb2312\"?>");
		menuXML.append("<tree id=\"MenuTree\">");

		if (menuList != null && menuList.size() > 0) {
			// 获取所有一级菜单
			List<Menu> top_menuList = menuService.getMenu("0",
					String.valueOf(menu_jb), menuList);

			if (top_menuList != null && top_menuList.size() > 0) {
				for (int i = 0; i < top_menuList.size(); i++) {
					Menu menu = (Menu) top_menuList.get(i);
					if (menu.getMenuName() != null
							&& menu.getMenuName().trim().length() > 0) {
						if (i == 0) {
							menuXML.append("<item text=");
							menuXML.append("\""
									+ menu.getMenuName()
									+ "\" id=\""
									+ menu.getMenuId()
									+ "\" open=\"1\" im0=\"leaf.gif\" im1=\"folderOpen.gif\" im2=\"folderClosed.gif\" select=\"1\">");
						} else {
							menuXML.append("<item text=");
							menuXML.append("\""
									+ menu.getMenuName()
									+ "\" id=\""
									+ menu.getMenuId()
									+ "\" im0=\"leaf.gif\" im1=\"folderOpen.gif\" im2=\"folderClosed.gif\">");
						}

						// 增加节点上的其他字段信息
						menuXML.append("<userdata name=\"menu_name\">"
								+ menu.getMenuName() + "</userdata>");
						menuXML.append("<userdata name=\"menu_jb\">"
								+ menu.getMenuJb() + "</userdata>");
						menuXML.append("<userdata name=\"menu_sjbh\">"
								+ menu.getMenuSjbh() + "</userdata>");
						menuXML.append("<userdata name=\"menu_path\">"
								+ menu.getMenuPath() + "</userdata>");
						menuXML.append("<userdata name=\"menu_url\">"
								+ menu.getMenuUrl() + "</userdata>");
						menuXML.append("<userdata name=\"menu_order\">"
								+ menu.getMenuOrder() + "</userdata>");
						menuXML.append("<userdata name=\"menu_icon\">"
								+ menu.getMenuIcon() + "</userdata>");
						menuXML.append("<userdata name=\"menu_switch\">"
								+ menu.getMenuSwitch() + "</userdata>");
						menuXML.append("<userdata name=\"menu_info\">"
								+ menu.getMenuInfo() + "</userdata>");
						menuXML.append("<userdata name=\"menu_type\">"
								+ menu.getMenuType() + "</userdata>");
						menuXML.append(menuService.getNextAllMenuConfig(
								menu.getMenuId(), String.valueOf(menu_jb + 1),
								menuList));
						menuXML.append("</item>");
					}
				}

			}
		} else {
			menuXML.append("<item  text=\"暂无菜单列表,请添加！\" id=\"noMenu\" open=\"1\" im0=\"folderClosed.gif\" im1=\"folderOpen.gif\" im2=\"folderClosed.gif\" select=\"1\"></item>");
		}
		menuXML.append("</tree>");
		out.println(menuXML.toString());// 菜单树 输出到前台
	}

	// 添加菜单
	public void addMenu() throws IOException {

		request.setCharacterEncoding("utf-8");// 设置取参编码格式
		response.setContentType("text/xml;charset=utf-8");// 设置输出编码格式

		String menuStr = readJSONString(request);
		// 转换成jsonobject
		JSONObject jsonObj = JSONObject.fromObject(menuStr);

		String menu_id = jsonObj.getString("menu_id");// 菜单编号
		String menu_sjbh = jsonObj.getString("menu_sjbh");// 上级编号
		String menu_name = jsonObj.getString("menu_name");// 菜单名称
		String menu_url = jsonObj.getString("menu_url");// 菜单链接地址
		String menu_type = jsonObj.getString("menu_type"); // 菜单打开方式 ，main窗口 还是
															// 新窗口打开
		String menu_iconNew = jsonObj.getString("menu_icon");// 菜单图标
		String menu_icon = menu_iconNew.replace("..", "");
		String menu_info = jsonObj.getString("menu_info");// 菜单描述 信息
		String menu_order = jsonObj.getString("menu_order");// 菜单显示顺序
		String menu_path = jsonObj.getString("menu_path");// 菜单路径
		String menu_jb = jsonObj.getString("menu_jb");// 菜单级别
		String menu_switch = jsonObj.getString("menu_switch");// 菜单启用状态

		String operateFlag = jsonObj.getString("operateFlag");// 菜单操作动作，新增 或者 修改

		PrintWriter out = response.getWriter();

		if (menu_id.equals("noMenu") || menu_id.equals("")) {
			operateFlag = "additem";
			menu_id = "1000000000";
			menu_order = "1";
			menu_sjbh = "0";
			menu_jb = "1";
			menu_path = "0";
		}

		if (operateFlag.equals("additem")) {// 新增 菜单
			Menu menu = new Menu();
			menu.setMenuId(String.valueOf((menuService.getMaxMenuId() + 1)));
			menu.setMenuName(menu_name);
			menu.setMenuUrl(menu_url);
			menu.setMenuType(menu_type);
			menu.setMenuSwitch(menu_switch);
			menu.setMenuIcon(menu_icon);
			menu.setMenuInfo(menu_info);
			menu.setMenuOrder(menu_order);
			menu.setMenuSjbh(menu_sjbh);
			menu.setMenuPath(menu_path);
			menu.setMenuJb(menu_jb);

			Menu menuStampe = menuService.insert(menu);
			if (null != menuStampe) {
				out.println("添加菜单信息成功！");
			} else {
				out.println("添加菜单信息失败！");
			}
		} else if (operateFlag.equals("update")) {//
			// 修改 菜单信息

			Menu menu = new Menu();
			menu.setMenuId(menu_id);
			menu.setMenuName(StringUtil.returnNotNull(menu_name));
			menu.setMenuUrl(StringUtil.returnNotNull(menu_url));
			menu.setMenuType(StringUtil.returnNotNull(menu_type));
			menu.setMenuSwitch(StringUtil.returnNotNull(menu_switch));
			menu.setMenuIcon(StringUtil.returnNotNull(menu_icon));
			menu.setMenuInfo(StringUtil.returnNotNull(menu_info));

			boolean flag = menuService.update(menu);
			if (flag == true) {
				out.println("修改菜单信息成功！");
			} else {
				out.println("修改菜单信息失败！");
			}
		}
	}

	// 根据菜单ID删除菜单信息
	public void delMenu() throws IOException {
		response.setContentType("text/xml;charset=utf-8");// 设置输出编码格式
		PrintWriter out = response.getWriter();
		boolean flag = menuService.deleteMenuAndOpt(menuId);
		FormService fs = SpringContextHolder.getBean(FormService.class);
		fs.removeMenuId(menuId);
		if (flag == true) {
			out.println("删除菜单信息成功！");
		} else {
			out.println("删除菜单信息失败！");
		}

	}

	public void saveTreeMenuByIDs() throws IOException {
		response.setContentType("text/xml;charset=utf-8");// 设置输出编码格式
		PrintWriter out = response.getWriter();
		String menuIds = menuId;
		String[] MenuTrees = menuIds.split("&aykj&");
		for (int i = 0; i < MenuTrees.length; i++) {
			String[] menuTemps = MenuTrees[i].split("\\*aykj\\*");
			for (int j = 0; j < menuTemps.length; j++) {
				Menu tempMenuInfo = new Menu();
				tempMenuInfo.setMenuId(menuTemps[0]);// 菜单ID
				tempMenuInfo.setMenuJb(menuTemps[1]);// 菜单级别
				tempMenuInfo.setMenuSjbh(menuTemps[2]);// 菜单上级编号
				tempMenuInfo.setMenuPath(menuTemps[3]);// 菜单路径
				tempMenuInfo.setMenuOrder(menuTemps[4]);// 菜单顺序
				menuService.updateOrder(tempMenuInfo);
			}
		}
		out.println("保存顺序成功！");

	}

	// 转换JSON数据的方法
	public String readJSONString(HttpServletRequest request) {
		StringBuffer json = new StringBuffer();
		String line = null;
		try {
			BufferedReader reader = request.getReader();
			while ((line = reader.readLine()) != null) {
				json.append(line);
			}
		} catch (Exception e) {
			// log.error(e.getMessage());
		}
		return json.toString();
	}

	public void setControlByUser() {
		// String
		// username=UserManager.getUser(request.getSession()).getUsername();
		String username = "lulu";
		HttpSession session = request.getSession();
		if (session.getAttribute(username) != null) {
			session.removeValue(username);
		}
		session.setAttribute(username, menuId);
		// log.debug("当前操作模块："+username+"**************"+menuId);
	}

	/**
	 * Menu Tree的封装
	 */
	public void menuTreeLoad() {
		MenuTreeService menuTreeService = MenuTreeService.getInstance();
		menuTreeService.reloadMenuTree();
		String treeJson = treeService.generateJsonCheckboxTree(menuTreeService,
				false);
		Struts2Utils.renderJson(treeJson);
	}

	/**
	 * 根据 id获得一个Menu下面的操作按钮的Checkbox divString对象
	 */
	public void getMenuOptByMenuId() {
		List<MenuOpt> menuOptList = menuService.getMenuOptByMenuId(menuId);
		StringBuilder divStringBuilder = new StringBuilder();
		if (menuOptList.size() != 0) {
			divStringBuilder
					.append("<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
		}
		for (Iterator<MenuOpt> iterator = menuOptList.iterator(); iterator
				.hasNext();) {
			MenuOpt menuOpt = iterator.next();
			divStringBuilder.append("<input type=\"checkbox\" " + "value=\""
					+ menuOpt.getId() + "\" optId=\"" + menuOpt.getId() + "\" checkboxtype=\"" + "optcheckbox"
					+ "\" title=\"" + menuOpt.getOptName() + "\">" + ""
					+ menuOpt.getOptName() + "&nbsp;");
		}

		Struts2Utils.renderText(divStringBuilder.toString());
	}

	public ITreeService getTreeService() {
		return treeService;
	}

	public void setTreeService(ITreeService treeService) {
		this.treeService = treeService;
	}
}
