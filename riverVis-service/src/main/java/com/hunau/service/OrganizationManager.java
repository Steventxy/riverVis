package com.hunau.service;

import com.hunau.entity.Organization;
import com.hunau.entity.Page;
import com.infopublic.util.PageData;

import java.util.List;

public interface OrganizationManager {
	/**
	 * 根据区域id 获取机构列表列表
	 */
	public List<PageData> listAllOrgnzByAid(String aid) throws Exception; //
	/**
	 * 获得所有机构列表
	 */
	public List<Organization> listAllOrgnz(Page page) throws Exception;
	
	public List<PageData> listAll(String str) throws Exception;
	
	/**
	 * 根据编号获取机构
	 */
	public Organization getOrgnzByOid(String tid) throws Exception; //
	
	/**
	 * 新增机构
	 */
	public void saveOrgnz(Organization orgnz) throws Exception; //
	/**
	 * 取父区域下最大机构编号
	 */
	public PageData findCurLevelMaxId(PageData pd) throws Exception; //
	/**
	 * 删除机构
	 */
	public void deleteOrgnzByOid(String tid) throws Exception ;//
	/**
	 * 批量删除终端
	 */
	public void deleteAllO(String[] tids)throws Exception; //
	/**
	 * 编辑机构
	 */
	public void editOrgnz(PageData pd) throws Exception ;
	public String getAidByTid(String tid)throws Exception;
	/**
	 * 获取所有终端信息(分页)
	 * @param @param page
	 * @return List<MapInfo>
	 */
	public List<Organization> getOrgnz(Page page) throws Exception; //
	public List<PageData> getOrgnzByTname(Page page)throws Exception ;
	public List<Organization> getorgnzByAid(Page page)throws Exception ;
	

	/**
	 * 获取授权电话
	 */
	public List<PageData> getTelByTid(Page page) throws Exception;
	/**
	 * 删除授权号码
	 * @param telid
	 * @throws Exception
	 */
	public void deleteTerTelByTelid(String telid) throws Exception;
	/**
	 * 添加授权号码
	 * @param pd
	 * @throws Exception
	 */
	public void addTerTel(PageData pd) throws Exception;


	/**
	 * 根据终端imei列表获取终端部分信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getTerInfoBytids(PageData pd) throws Exception; //
	/**
	 * 根据分组编号列表查询终端列表
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<Organization> listTersByAids(PageData pd) throws Exception; //
	/**
	 * 批量设置终端启用
	 * @param pdlist
	 * @throws Exception
	 */
	public void setTerIsuse(List<String> pdlist) throws Exception;

	
	

}
