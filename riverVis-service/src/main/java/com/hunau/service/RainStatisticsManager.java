package com.hunau.service;

import com.hunau.entity.Page;
import com.hunau.entity.RainStatistics;

import java.util.List;


public interface RainStatisticsManager {
	/**获取雨量统计信息
	 * @param pd
	 * @throws Exception
	 */
//	public List<RainStatistics> getRainStatistics(String str)throws Exception;
//
//	public List<RainStatistics> getRains(String str)throws Exception;

	public List<RainStatistics> getRainStatistics(Page page)throws Exception;

	public List<RainStatistics> getRains(Page page)throws Exception;
	
}
