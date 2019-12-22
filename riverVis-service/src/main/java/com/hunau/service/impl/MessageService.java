package com.hunau.service.impl;

import com.hunau.dao.DaoSupport;
import com.hunau.entity.Page;
import com.hunau.service.MessageManager;
import com.infopublic.util.PageData;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("messageService")
public class MessageService implements MessageManager {
	@Resource(name = "daoSupport")
	private DaoSupport dao;



	@SuppressWarnings("unchecked")
	public List<PageData> listSendMessage(Page page) throws Exception {
		// TODO Auto-generated method stub
		return (List<PageData>)dao.findForList("MessageMapper.getSendMessagePage", page);
	}
	
	@SuppressWarnings("unchecked")
	public List<PageData> listReceiveMessage(Page page) throws Exception {
		// TODO Auto-generated method stub
		return (List<PageData>)dao.findForList("MessageMapper.getReceiveMessagePage", page);
	}

	@Override
	public void addSendMessage(PageData pd) throws Exception {
		dao.save("MessageMapper.addSendMessage", pd);
	}
	@Override
	public void addSendMessage1(List<PageData> pdlist) throws Exception {
		dao.batchSave("MessageMapper.addSendMessage", pdlist);
	}
}
