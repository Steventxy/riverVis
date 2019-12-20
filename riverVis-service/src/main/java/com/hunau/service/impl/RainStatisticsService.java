package com.hunau.service.impl;

import com.hunau.dao.DaoSupport;
import com.hunau.entity.Page;
import com.hunau.entity.RainStatistics;
import com.hunau.service.RainStatisticsManager;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("RainStatisticsService")
public class RainStatisticsService  implements RainStatisticsManager{
	@Resource(name = "daoSupport")
	private DaoSupport dao;
	@SuppressWarnings("unchecked")
	/**获取雨量统计数据，并以直方图的形式显示出来。
	 * @param pd
	 * @throws Exception
	 */
	public List<RainStatistics> getRainStatistics(Page page)throws Exception{
		return (List<RainStatistics>) dao.findForList("RainStatisticsMapper.getRainStatistics", page);
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<RainStatistics> getRains(Page page) throws Exception {
		// TODO Auto-generated method stub
		return (List<RainStatistics>) dao.findForList("RainStatisticsMapper.getRains", page);
	}
}
