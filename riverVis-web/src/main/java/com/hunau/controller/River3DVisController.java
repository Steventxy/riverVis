package com.hunau.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * @author 施景程
 * 程序名称：WarnController.java
 * 程序描述：预警设置
 * 修改时间：2018-5-6
 * 开发单位：湖南农业大学信息科学技术学院物联网工程系
 */
@Controller
@RequestMapping(value="/River3DVis")
public class River3DVisController {
	/*
	 * 页面分屏后台处理
	 */
	@RequestMapping(value="/screen2")
	public ModelAndView screen2(ModelAndView mv){
		mv.setViewName("datavis/screen2");
		return mv;
	}
	/*
	 * 河流监控点卫星地图标注页面后台处理
	 */
	@RequestMapping(value="/map_river")
	public ModelAndView River3Dvis(ModelAndView mv){
		mv.setViewName("datavis/map_river");
		return mv;
	}
	/*
	 * 水库页面后台处理
	 */
	@RequestMapping(value="/shuiku")
	public ModelAndView rain_pm25(ModelAndView mv){
		mv.setViewName("datavis/up");
		return mv;
	}
	/*
	 * 视频监控页面后台处理
	 */
	@RequestMapping(value="/camera")
	public ModelAndView camera(ModelAndView mv){
		mv.setViewName("datavis/camera");
		return mv;
	}
}







