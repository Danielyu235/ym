package com.ay.jfds.dev.pojo;

import java.util.ArrayList;
import java.util.List;

/** 
 * @Description 
 * @date 2012-12-3
 * @author WangXin
 */
public class MenuVO {
	/** 菜单编号 */
	private String menuId;
	/** 菜单名称 */
	private String menuName;
	/** 菜单链接地址 */
	private String menuUrl;
	private List<MenuVO> children = new ArrayList<MenuVO>();
	
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
	public String getMenuUrl() {
		return menuUrl;
	}
	public void setMenuUrl(String menuUrl) {
		this.menuUrl = menuUrl;
	}
	public List<MenuVO> getChildren() {
		return children;
	}
	public void setChildren(List<MenuVO> children) {
		this.children = children;
	}
	
}

