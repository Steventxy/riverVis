package com.hunau.service.impl;

import com.hunau.dao.DaoSupport;
import com.hunau.entity.Page;
import com.hunau.service.TrafficManager;
import com.infopublic.util.PageData;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("trafficService")
public class TrafficService implements TrafficManager{
	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	@SuppressWarnings("unchecked")
	@Override
	public List<PageData> listTerTraffic(Page page) throws Exception {
		return  (List<PageData>) dao.findForList("TrafficMapper.getTrafficlistPage",page);
	}
	@Override
	public void updateTerTrafficLimit(List<PageData> pdlist) throws Exception {
		dao.batchUpdate("TrafficMapper.updateTerTrafficLimit", pdlist);
	}
	public void updateTerTrafficToZero(String str) throws Exception{
		dao.update("TrafficMapper.updateTerTrafficToZero", str);
	}

}
