package com.ay.hiddenPerils.service;

import java.util.List;
import java.util.Map;

import com.ay.elect.pojo.ElectMonth;
import com.ay.framework.core.dao.pagination.Page;
import com.ay.framework.core.service.BaseService;
import com.ay.hiddenPerils.dao.HiddenPerilsDao;
import com.ay.hiddenPerils.pojo.HiddenPerils;
import com.ay.hiddenPerils.pojo.PerilsData;

public class HiddenPerilsService extends BaseService<HiddenPerils, HiddenPerilsDao> {

    /**
     * 分页查询.
     * 
     * @param map the map
     * @param page the page
     * @return the page
     */
    public Page pageQueryPerils(Map map, Page page)
    {
        try {
			page.setCount(this.countPerils(map));
			List<HiddenPerils> list = dao.pageQueryPerils(map, page.getFrom(), page.getRecPerPage());
			page.setCollection(list);
		} catch (Exception e) {
			e.printStackTrace();
		}
        return page;
    }
    public Page pageQueryPerils2(Map map, Page page)
    {
        try {
			page.setCount(this.countPerils(map));
			List<HiddenPerils> list = dao.pageQueryPerils2(map, page.getFrom(), page.getRecPerPage());
			page.setCollection(list);
		} catch (Exception e) {
			e.printStackTrace();
		}
        return page;
    }
    
    /**
     * Count.
     * 
     * @param map the map
     * @return the int
     */
    public int countPerils(Map map)
    {
        return dao.countPerils(map);
    }
    /**
     * 审核隐患状态
     * @param entity
     * @return
     */
    public boolean updatePerils(PerilsData entity){
    	
    	return dao.updatePerils(entity);
    }
    /**
     * 根据隐患类型饼图统计
     */
    public List<HiddenPerils> getPie(Map paramMap){
        return this.dao.getPie(paramMap);
    }
}