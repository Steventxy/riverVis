package com.hunau.service.impl;

import com.hunau.dao.DaoSupport;
import com.hunau.entity.Page;
import com.hunau.entity.WaterStatistics;
import com.hunau.service.WaterStatisticsManager;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("WaterStatisticsService")
public class WaterStatisticsService  implements WaterStatisticsManager{
	@Resource(name = "daoSupport")
	private DaoSupport dao;
	@SuppressWarnings("unchecked")
	/**获取雨量统计数据，并以直方图的形式显示出来。
	 * @param pd
	 * @throws Exception
	 */
	public List<WaterStatistics> getWaterStatistics(Page page)throws Exception{
		return (List<WaterStatistics>) dao.findForList("WaterStatisticsMapper.getWaterStatistics", page);
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<WaterStatistics> getWaters(Page page) throws Exception {
		// TODO Auto-generated method stub
		return (List<WaterStatistics>) dao.findForList("WaterStatisticsMapper.getWaters", page);
	}
}
