package com.hunau.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * @author 施景程
 * 程序名称：WorldWindController.java
 * 程序描述：数字地球及全景图展示
 * 修改时间：2018-5-6
 * 开发单位：湖南农业大学信息科学技术学院物联网工程系
 */
@Controller
@RequestMapping(value="/earth")
public class WorldWindController extends BaseController{
	@RequestMapping(value="/earth1")
	public ModelAndView earth() throws Exception{
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("earth/worldwind");
		return mv;
	}
	
	@RequestMapping(value="/quanjing")
	public ModelAndView quanjing() throws Exception{
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("earth/quanjing");
		return mv;
	}
}
