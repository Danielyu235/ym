package com.ay.emergency.rescue.planRescue.service;

import java.util.List;
import java.util.Map;

import com.ay.emergency.rescue.planRescue.dao.PlanRescueDao;
import com.ay.emergency.rescue.planRescue.pojo.PlanRescue;
import com.ay.framework.core.dao.pagination.Page;
import com.ay.framework.core.service.BaseService;

public class PlanRescueService extends BaseService<PlanRescue, PlanRescueDao> {
	/**
     * 分页查询.
     * 
     * @param map the map
     * @param page the page
     * @return the page
     */
    public Page pageQueryDis(Map map, Page page)
    {
        try {
			page.setCount(this.countDis(map));
			List<PlanRescue> list = dao.pageQueryDis(map, page.getFrom(), page.getRecPerPage());
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
    public int countDis(Map map)
    {
        return dao.countDis(map);
    }
    /**
     * 分页查询.
     * 
     * @param map the map
     * @param page the page
     * @return the page
     */
    public Page pageQuerySpe(Map map, Page page)
    {
        try {
			page.setCount(this.countSpe(map));
			List<PlanRescue> list = dao.pageQuerySpe(map, page.getFrom(), page.getRecPerPage());
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
    public int countSpe(Map map)
    {
        return dao.countSpe(map);
    }
    
}