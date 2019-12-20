package com.hunau.service.impl;

import com.hunau.dao.DaoSupport;
import com.hunau.entity.Page;
import com.hunau.entity.Warn;
import com.hunau.service.WarnManager;
import com.infopublic.util.PageData;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("warnService")
public class WarnService implements WarnManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;

	@SuppressWarnings("unchecked")
	@Override
	public List<Warn> getAllWarnList(Page page) throws Exception {
		// TODO Auto-generated method stub
		return (List<Warn>) dao.findForList("WarnMapper.getWarnlistPage", page);
	}

	@Override
	public Warn findByWid(PageData pd) throws Exception {
		// TODO Auto-generated method stub
		return (Warn)dao.findForObject("WarnMapper.findByWid", pd);
	}

	@Override
	public void editW(PageData pd) throws Exception {
		// TODO Auto-generated method stub
		dao.update("WarnMapper.editWarnInfo", pd);
	}

	@Override
	public void deleteW(String wid) throws Exception {
		// TODO Auto-generated method stub
		dao.delete("WarnMapper.deleteWI", wid);
	}

	@Override
	public void insertWarn(PageData pd) throws Exception {
		// TODO Auto-generated method stub
		dao.save("WarnMapper.insertWarnInfo", pd);
	}

	@Override
	public Warn findWid(int wid) throws Exception {
		// TODO 自动生成的方法存根
		return (Warn)dao.findForObject("WarnMapper.findwid", wid);
	}
	

}
