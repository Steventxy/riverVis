package com.hunau.service.impl;

import com.hunau.dao.DaoSupport;
import com.hunau.service.SystemManager;
import com.infopublic.util.PageData;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;


/** 系统
 */
@Service("systemService")
public class SystemService implements SystemManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	

	@Override
	public String initDataBase(String str) throws Exception {
		return (String) dao.findForObject("SystemMapper.initDataBase", str);
	}


	@SuppressWarnings("unchecked")
	@Override
	public List<PageData> listBaseAttributes(String str) throws Exception {
		return (List<PageData>) dao.findForList("SystemMapper.listBaseAttributes", str);
	}


	@Override
	public void saveAttri(PageData pd) throws Exception {
		dao.update("SystemMapper.saveAttri", pd);
	}


	@Override
	public String getBaseAttri(String valueid) throws Exception {
		return (String) dao.findForObject("SystemMapper.getBaseAttri", valueid);
	}

	
}
