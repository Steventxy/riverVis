package com.hunau.service.impl;

import com.hunau.dao.DaoSupport;
import com.hunau.entity.SanweiData;
import com.hunau.service.SanweiDataManager;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author 刘家玮
 * 程序名称：
 * 时间：
 * 修改时间：
 * 开发单位：湖南农业大学信息科学技术学院物联网工程系
 */
@Service("SanweiDataService")
public class SanweiDataService implements SanweiDataManager{
	@Resource(name = "daoSupport")
	private DaoSupport dao;
	@SuppressWarnings("unchecked")
	/**获取导入三维场景的数据
	 * @param pd
	 * @throws Exception
	 */
	public List<SanweiData> getSanweiData(String str)throws Exception{
		return (List<SanweiData>) dao.findForList("SanweiDataMapper.getSanweiData", str);
	}
}
