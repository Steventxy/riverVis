package com.hunau.service;

import com.hunau.entity.Area;
import com.hunau.entity.Page;
import com.infopublic.util.PageData;

import java.util.List;

public interface AreaManager {
	public List<Area> listSubAreaByParentAid(String parentaid) throws Exception;
	public List<Area> listAllArea(String str) throws Exception;
	public List<Area> listAllSubByPAid(String aid) throws Exception;
	public Area getAreaByAid(String aid) throws Exception;
	
	/**
	 * @param area
	 * @throws Exception
	 */
	public void saveArea(Area area) throws Exception;
	
	/**
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findCurLevelMaxId(PageData pd) throws Exception;
	
	/**
	 * @param aid
	 * @throws Exception
	 */
	public void deleteAreaByAid(String aid) throws Exception;
	
	/**
	 * @param area
	 * @throws Exception
	 */
	public void editArea(PageData pd) throws Exception;
	/**根据区域编号查询该区域下所有用户（分页)
	 * @param area
	 * @throws Exception
	 */
	public List<PageData> listUserByAid(Page page) throws Exception;
	/**批量修改用户所属区域
	 * @param area
	 * @throws Exception
	 */
	public void changUserArea(String[] arrayuserids, String aid) throws Exception;
	public List<PageData> listAreaByAid(PageData pd) throws Exception;

	/**
	 * 根据用户编号获取分组列表
	 *  htt
	 * @param pd
	 * @return
	 */
	public List<Area> getAreasByUserid(PageData pd) throws Exception;
	/**
	 * 通过区域名模糊查询id列表
	 * @param aname
	 * @return
	 * @throws Exception
	 */
	public List<String> getAidByAname(String aname) throws Exception;
	
	
}
