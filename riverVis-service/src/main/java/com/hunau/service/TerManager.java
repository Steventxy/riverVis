package com.hunau.service;

import com.hunau.entity.Terminal;
import com.infopublic.util.PageData;

import java.util.List;


/** 日志接口类
 */
public interface TerManager {
	
	
	/**
	 * 根据区域id 获取机构列表列表
	 */
	public List<PageData> listAllTerByAid(String aid) throws Exception;
	/**
	 * 根据分组编号列表查询终端列表
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<Terminal> listTersByAids(PageData pd) throws Exception;
	/**
	 * 获得所有机构列表
	 */
	public List<PageData> listAllTer(String str) throws Exception;
	
	/**
	 * 根据编号获取机构
	 */
	public Terminal getTerByTid(String tid) throws Exception;
	
	/**
	 * 新增机构
	 */
	public void saveTer(Terminal ter) throws Exception;
	/**
	 * 取最大ID
	 */
	public PageData findMaxId(PageData pd) throws Exception;
	/**
	 * 删除机构
	 */
	public void deleteTerByTid(String tid) throws Exception ;
	/**
	 * 编辑机构
	 */
	public void editTer(PageData pd) throws Exception ;
	
}
