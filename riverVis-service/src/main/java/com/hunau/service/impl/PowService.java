package com.hunau.service.impl;

import com.hunau.dao.PowDaoSupport;
import com.hunau.entity.Page;
import com.hunau.entity.Pow;
import com.hunau.service.PowManager;
import com.infopublic.util.PageData;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("powService")
public class PowService implements PowManager {

	@Resource(name = "powdaoSupport")
	private PowDaoSupport dao;
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Pow> getPowlist(PageData pd) throws Exception {
		// TODO 自动生成的方法存根
		return (List<Pow>)dao.findForList("PowMapper.getPowlist", pd);
	}

	@Override
	public Pow getnowPow(PageData pd) throws Exception {
		// TODO 自动生成的方法存根
		return (Pow) dao.findForObject("PowMapper.getnowPow",pd);
	}

	


	@SuppressWarnings("unchecked")
	@Override
	public List<Pow> getOrgnzdata(Page page) throws Exception {
		// TODO 自动生成的方法存根
		return (List<Pow>)dao.findForList("PowMapper.getOrgnzlistPage", page);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Pow> getdataview(PageData pd) throws Exception {
		// TODO 自动生成的方法存根
		return (List<Pow>)dao.findForList("PowMapper.getdataview", pd);
	}
}
