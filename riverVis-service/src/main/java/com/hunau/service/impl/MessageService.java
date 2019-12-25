package com.infopublic.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.infopublic.dao.DaoSupport;
import com.infopublic.entity.Page;
import com.infopublic.service.MessageManager;
import com.infopublic.util.PageData;

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
	public void deleteMsg(String smid) throws Exception {
		dao.delete("MessageMapper.deleteMsg", smid);
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
