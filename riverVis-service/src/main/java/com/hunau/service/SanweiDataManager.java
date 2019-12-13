package com.hunau.service;

import com.hunau.entity.SanweiData;

import java.util.List;

/**
 * @author 刘家玮
 * 程序名称：统计表接口类
 * 时间：
 * 修改时间：
 * 开发单位：湖南农业大学信息科学技术学院物联网工程系
 */
public interface SanweiDataManager {
	/**获取导入三维场景的水文数据
	 * @param pd
	 * @throws Exception
	 */
	public List<SanweiData> getSanweiData(String str)throws Exception;
}
