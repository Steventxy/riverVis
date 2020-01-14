package com.hunau.service.impl;

import com.hunau.dao.DaoSupport;
import com.hunau.entity.Organization;
import com.hunau.entity.Page;
import com.hunau.service.OrganizationManager;
import com.infopublic.util.PageData;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;


@Service("organizationService")
public class OrganizationService implements OrganizationManager {
	@Resource(name = "daoSupport")
	private DaoSupport dao;

	/**
	 * 根据区域id 获取机构列表列表
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<PageData> listAllOrgnzByAid(String aid) throws Exception {
		// TODO Auto-generated method stub
		return (List<PageData>) dao.findForList("OrganizationMapper.listAllOrgnzByAid",aid);
	}
	
	/**
	 * 获得所有机构列表
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<Organization> listAllOrgnz(Page page) throws Exception {
		// TODO Auto-generated method stub
		return (List<Organization>) dao.findForList("OrganizationMapper.listAllOrgnz",page);
	}
	
	/**
	 * 根据编号获取机构
	 */
	@Override
	public Organization getOrgnzByOid(String tid) throws Exception {
		// TODO Auto-generated method stub
		return (Organization) dao.findForObject("OrganizationMapper.getOrgnzByOid",tid);
	}
	

	@SuppressWarnings("unchecked")
	@Override
	public List<PageData> getTelByTid(Page page) throws Exception {
		return (List<PageData>) dao.findForList("OrganizationMapper.getTelByTidlistPage",page);
	}
	/**
	 * 新增机构
	 * @param orgnz
	 * @throws Exception
	 */
	@Override
	public void saveOrgnz(Organization orgnz) throws Exception {
		dao.save("OrganizationMapper.insertOrgnz", orgnz);
	}
	/**
	 * 取父区域下最大机构编号
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@Override
	public PageData findCurLevelMaxId(PageData pd) throws Exception {
		return (PageData) dao.findForObject("OrganizationMapper.findCurLevelMaxId", pd);
	}
	/**
	 * 删除机构
	 * @param oid
	 * @throws Exception
	 */
	@Override
	public void deleteOrgnzByOid(String tid) throws Exception {
		dao.save("OrganizationMapper.deleteOrgnzByOid", tid);
	}
	
	/**批量删除终端
	 * @param tids
	 * @throws Exception
	 */
	public void deleteAllO(String[] tids)throws Exception{
		dao.delete("OrganizationMapper.deleteAllOS", tids);
	}

	/**
	 * 编辑机构
	 * @return
	 * @throws Exception
	 */
	@Override
	public void editOrgnz(PageData pd) throws Exception {
		 dao.update("OrganizationMapper.updateOrgnz", pd);
	}
	
	/**
	 * 根据终端id获取区域id
	 * @return
	 * @throws Exception
	 */
	@Override
	public String getAidByTid(String tid) throws Exception {
		// TODO Auto-generated method stub
		return (String) dao.findForObject("OrganizationMapper.getAidByTid", tid);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Organization> getOrgnz(Page page) throws Exception {
		// TODO Auto-generated method stub
		return (List<Organization>)dao.findForList("OrganizationMapper.getOrgnzlistPage", page);
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<PageData> getOrgnzByTname(Page page) throws Exception {
		return (List<PageData>)dao.findForList("OrganizationMapper.getOrgnzByTnamePage", page);
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<Organization> getorgnzByAid(Page page) throws Exception {
		// TODO Auto-generated method stub
		return (List<Organization>)dao.findForList("OrganizationMapper.getorgnzlistPage", page);
	}

	@Override
	public void deleteTerTelByTelid(String telid) throws Exception {
		dao.delete("OrganizationMapper.deleteTerTel", telid);
	}

	@Override
	public void addTerTel(PageData pd) throws Exception {
		dao.save("OrganizationMapper.addTerTel", pd);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<PageData> listAll(String str) throws Exception {
		// TODO 自动生成的方法存根
		return (List<PageData>) dao.findForList("OrganizationMapper.listAll",str);
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<PageData> getTerInfoBytids(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("OrganizationMapper.getTerInfoBytids",pd);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Organization> listTersByAids(PageData pd) throws Exception {
		return (List<Organization>) dao.findForList("OrganizationMapper.listTersByAids",pd);
	}
	
	@Override
	public void setTerIsuseOn(List<String> pdlist) throws Exception {
		dao.batchUpdate("OrganizationMapper.setTerIsuseOn", pdlist);
	}

	@Override
	public void setTerIsuseOff(List<String> pdlist) throws Exception {
		dao.batchUpdate("OrganizationMapper.setTerIsuseOff", pdlist);
	}
}
