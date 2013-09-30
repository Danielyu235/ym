package com.ay.jfds.dev.pojo;

import com.ay.framework.core.pojo.BasePojo;

/**
 * 菜单的pojo
 * 
 * @author lushigai
 * 
 */
public class Menu extends BasePojo {
	/** 菜单编号 */
	private String menuId;
	/** 菜单名称 */
	private String menuName;
	/** 菜单级别 */
	private String menuJb;
	/** 菜单上级编号 */
	private String menuSjbh;
	/** 菜单路径 */
	private String menuPath;
	/** 菜单链接地址 */
	private String menuUrl;
	/** 菜单顺序 */
	private String menuOrder;
	/** 菜单图标 */
	private String menuIcon;
	/** 菜单启用开关量 */
	private String menuSwitch;
	/** 菜单说明信息 */
	private String menuInfo;
	/** 菜单类型(新窗口,右侧打开) */
	private String menuType;

	// 菜单节点编号

	public String getMenuId() {
		return menuId;
	}

	public void setMenuId(String menuId) {
		this.menuId = menuId;
	}

	public String getMenuName() {
		return menuName;
	}

	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}

	public String getMenuJb() {
		return menuJb;
	}

	public void setMenuJb(String menuJb) {
		this.menuJb = menuJb;
	}

	public String getMenuSjbh() {
		return menuSjbh;
	}

	public void setMenuSjbh(String menuSjbh) {
		this.menuSjbh = menuSjbh;
	}

	public String getMenuUrl() {
		return menuUrl;
	}

	public void setMenuUrl(String menuUrl) {
		this.menuUrl = menuUrl;
	}

	public String getMenuOrder() {
		return menuOrder;
	}

	public void setMenuOrder(String menuOrder) {
		this.menuOrder = menuOrder;
	}

	public String getMenuIcon() {
		return menuIcon;
	}

	public void setMenuIcon(String menuIcon) {
		this.menuIcon = menuIcon;
	}

	public String getMenuSwitch() {
		return menuSwitch;
	}

	public void setMenuSwitch(String menuSwitch) {
		this.menuSwitch = menuSwitch;
	}

	public String getMenuInfo() {
		return menuInfo;
	}

	public void setMenuInfo(String menuInfo) {
		this.menuInfo = menuInfo;
	}

	public String getMenuType() {
		return menuType;
	}

	public void setMenuType(String menuType) {
		this.menuType = menuType;
	}

	public String getMenuPath() {
		return menuPath;
	}

	public void setMenuPath(String menuPath) {
		this.menuPath = menuPath;
	}

}
