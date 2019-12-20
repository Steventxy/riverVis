package com.hunau.service.impl;

import com.hunau.dao.DaoSupport;
import com.hunau.entity.Page;
import com.hunau.service.InfoManager;
import com.infopublic.util.PageData;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("infoService")
public class InfoService implements InfoManager {
	@Resource(name = "daoSupport")
	private DaoSupport dao;

	@Override
	public List<PageData> listSendIFs(Page page) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void saveSendIF(PageData pd) throws Exception {
		// TODO oAuto-generated method stub
		
	}

	@Override
	public List<PageData> getAllManageUser(String para) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
}