package com.hunau.service.impl;

import com.hunau.dao.DaoSupport;
import com.hunau.entity.Terminal;
import com.hunau.service.TerManager;
import com.infopublic.util.PageData;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;


@Service("terService")
public class TerService implements TerManager {
	@Resource(name = "daoSupport")
	private DaoSupport dao;
	/**
	 * 根据区域id 获取机构列表列表
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<PageData> listAllTerByAid(String aid) throws Exception {
		// TODO Auto-generated method stub
		return (List<PageData>) dao.findForList("TerMapper.listAllTerByAid",aid);
	}
	/**
	 * 根据分组编号列表获取终端列表
	 * htt
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<Terminal> listTersByAids(PageData pd) throws Exception {
		return (List<Terminal>) dao.findForList("TerMapper.listTersByAids",pd);
	}
	/**
	 * 获得所有机构列表
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<PageData> listAllTer(String str) throws Exception {
		// TODO Auto-generated method stub
		return (List<PageData>) dao.findForList("TerMapper.listAllTer",str);
	}
	
	/**
	 * 根据编号获取机构
	 */
	@Override
	public Terminal getTerByTid(String tid) throws Exception {
		// TODO Auto-generated method stub
		return (Terminal) dao.findForObject("TerMapper.getTerByTid",tid);
	}
	
	/**
	 * 新增机构
	 * @param orgnz
	 * @throws Exception
	 */
	@Override
	public void saveTer(Terminal ter) throws Exception {
		dao.save("TerMapper.insertTer", ter);
	}
	/**
	 * 取最大ID
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@Override
	public PageData findMaxId(PageData pd) throws Exception {
		return (PageData) dao.findForObject("TerMapper.findMaxId", pd);
	}
	/**
	 * 删除机构
	 * @param oid
	 * @throws Exception
	 */
	@Override
	public void deleteTerByTid(String tid) throws Exception {
		dao.save("TerMapper.deleteTerByTid", tid);
	}
	/**
	 * 编辑机构
	 * @return
	 * @throws Exception
	 */
	@Override
	public void editTer(PageData pd) throws Exception {
		 dao.update("TerMapper.updateTer", pd);
	}

}
