package com.hunau.controller;


import com.infopublic.util.PageData;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping(value="/camera")
public class CameraController  extends BaseController{

	/**
	 * 视频监控
	 * @return
	 * @throws Exception 
	 */
   @RequestMapping(value="/list")
   public ModelAndView list() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
	    pd = this.getPageData();	
		mv.addObject("pd", pd);
		mv.setViewName("camera/camera");
		return mv;
	}


}
