package com.hunau.service;

import com.hunau.entity.Page;
import com.infopublic.util.PageData;

import java.util.List;

public interface TrafficManager {
	/**
	 * 查询终端流量使用
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> listTerTraffic(Page page) throws Exception;
	/**
	 * 批量设置终端流量限制
	 * @param pdlist
	 * @throws Exception
	 */
	public void updateTerTrafficLimit(List<PageData> pdlist) throws Exception;
	/**
	 * 将所有使用流量设置为0
	 * @param pdlist
	 * @throws Exception
	 */
	public void updateTerTrafficToZero(String str) throws Exception;

}
