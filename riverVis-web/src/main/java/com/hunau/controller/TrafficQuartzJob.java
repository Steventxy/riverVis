package com.hunau.controller;

import com.hunau.service.impl.TrafficService;

import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.WebApplicationContext;


/** quartz 定时任务调度 数据库自动插入统计数据
 */
public class TrafficQuartzJob extends BaseController implements Job {

	@Override
	public void execute(JobExecutionContext context) throws JobExecutionException {
		//普通类从spring容器中拿出service
		WebApplicationContext webctx= ContextLoader.getCurrentWebApplicationContext();
		TrafficService trafficService = (TrafficService)webctx.getBean("trafficService");
		try {
			trafficService.updateTerTrafficToZero(null);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	

}
