package com.hunau.service;

import com.hunau.entity.Page;
import com.infopublic.util.PageData;

import java.util.List;

/**
 * 发送消息的接口
 * @ClassName InfoManager
 * @Description TODO
 * @author HTT
 * @date 2016年11月30日 下午1:32:56
 */
public interface InfoManager {
	/**
	 * 发送消息列表（分页）
	 * @param page
	 * @return List<PageData>
	 * @throws Exception
	 */
	public List<PageData> listSendIFs(Page page) throws Exception;
	/**
	 * 保存发送消息
	 * @param pd
	 * @throws Exception
	 */
	public void saveSendIF(PageData pd) throws Exception;
	/**
	 * 获取所有管理员用户（用户发送消息选择反馈人）
	 * @param userid
	 * @throws Exception
	 */
	public List<PageData> getAllManageUser(String para) throws Exception;
}