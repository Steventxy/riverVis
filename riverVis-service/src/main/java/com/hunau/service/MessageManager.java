package com.infopublic.service;

import java.util.List;

import com.infopublic.entity.Page;
import com.infopublic.util.PageData;


/**
 * 短信箱
 *
 */
public interface MessageManager {
	/**
	 * 获取发件箱短信
	 * @param page
	 * @return
	 * @throws Exception
	 */

	public List<PageData> listSendMessage(Page page) throws Exception;

	/**
	 * 删除短信
	 * @param smid
	 * @throws Exception
	 */
	public void deleteMsg(String smid) throws Exception;

	/**
	 * 获取收件箱短信
	 * @param page
	 * @return
	 * @throws Exception
	 */

	public List<PageData> listReceiveMessage(Page page) throws Exception;
	/**
	 * 添加发送短信记录
	 * @param pd
	 * @throws Exception
	 */
	public void addSendMessage(PageData pd) throws Exception;
	public void addSendMessage1(List<PageData> pdlist) throws Exception; 
	
}
