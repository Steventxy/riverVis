package com.hunau.service;

import com.hunau.entity.Page;
import com.hunau.entity.WaterStatistics;

import java.util.List;


public interface WaterStatisticsManager {
	/**获取水库统计信息
	 * @param pd
	 * @throws Exception
	 */
//	public List<WaterStatistics> getWaterStatistics(String str)throws Exception;
//
//	public List<WaterStatistics> getWaters(String str)throws Exception;

	public List<WaterStatistics> getWaterStatistics(Page page)throws Exception;

	public List<WaterStatistics> getWaters(Page page)throws Exception;
	
}
