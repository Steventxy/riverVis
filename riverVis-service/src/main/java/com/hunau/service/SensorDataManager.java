package com.hunau.service;

import com.hunau.entity.Page;
import com.hunau.entity.SensorData;

import java.util.HashMap;
import java.util.List;

/**
 * @author 刘家玮
 * 程序名称：SensorDataManager.java
 * 程序描述：
 * 修改时间：2017-10-25
 * 开发单位：湖南农业大学信息科学技术学院物联网工程系
 */
public interface SensorDataManager {
	/**获取传感器采集的数据
	 * @param pd
	 * @throws Exception
	 */
	public List<SensorData> getSensorData(String str)throws Exception;
	//public List<SensorData> selectSensorData(HashMap<String,Object> params);
	public List<SensorData> selectSensorDataByAidLike(HashMap<String, Object> params)throws Exception;
	
	public List<SensorData> collectdatalistPage(Page page)throws Exception;
	
}
