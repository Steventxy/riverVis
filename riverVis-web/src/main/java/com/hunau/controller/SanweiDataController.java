package com.hunau.controller;

import com.hunau.entity.SanweiData;
import com.hunau.service.SanweiDataManager;
import com.infopublic.util.PageData;
import net.sf.json.JSONArray;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;


/**
 * @author 施景程
 * 程序名称：WarnController.java
 * 程序描述：预警设置
 * 修改时间：2018-5-6
 * 开发单位：湖南农业大学信息科学技术学院物联网工程系
 */
@Controller
@RequestMapping(value="/SanweiData")
public class SanweiDataController extends BaseController{
	@Resource(name="SanweiDataService")
	private SanweiDataManager SanweiDataService;
	/**
	 * 三维场景导入数据
	 * @return
	 * @throws Exception 
	 */
  
  // 果园镇河段页面分屏后台处理
   @RequestMapping(value="/rivermap1")
   public ModelAndView rivermap1() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		mv.addObject("pd", pd);	
		mv.setViewName("sanwei/screen");
		return mv;
}
  
   //金井镇河段页面分屏后台处理
   @RequestMapping(value="/rivermap2")
   public ModelAndView rivermap5() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
	
		mv.addObject("pd", pd);
		
		mv.setViewName("sanwei/screen1");
	
		return mv;
   }
   
   @RequestMapping(value="/sanwei1")
   public ModelAndView sanwei1() throws Exception{
	   /*ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();	
	    pd = this.getPageData();	
		HashMap<String, String> map = new HashMap<String, String>();
		List<RainData> raindata=new ArrayList<RainData>();  //对雨量对象进行操作
		String str="";
		raindata =RainDataService.getRainData(str);	
		pd.put("chartData", JSONArray.fromObject(raindata).toString());
		//System.out.println("chartData:"+JSONArray.fromObject(raindata).toString());
		mv.addObject("pd", pd);
		mv.setViewName("sanwei/rain_chart");
		return mv;*/
	    ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
	    pd = this.getPageData();	
		List<SanweiData> sanweidata=new ArrayList<SanweiData>();  
		String str="";
		sanweidata =SanweiDataService.getSanweiData(str);
		pd.put("sanweidata", JSONArray.fromObject(sanweidata).toString());
		mv.addObject("pd", pd);
		mv.setViewName("sanwei/sanwei_chart");
		return mv;
}
   @RequestMapping(value="/sanwei2")
   public ModelAndView sanwei2() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		

		List<SanweiData> sanweidata=new ArrayList<SanweiData>();  
		String str="";
		sanweidata =SanweiDataService.getSanweiData(str);	
		pd.put("sanweidata", JSONArray.fromObject(sanweidata).toString());
		mv.addObject("pd", pd);

		
		mv.setViewName("sanwei/sanwei_chart1");
		return mv;
}
   //金井河段unity页面后台处理
   @RequestMapping(value="/sanwei3")
   public ModelAndView sanwei3() throws Exception{
		ModelAndView mv = this.getModelAndView();
		
		

		
		mv.setViewName("sanwei/scene");
		return mv;
}
   
   //水位数据页面后台处理
   @RequestMapping(value="/sanwei4")
   public ModelAndView sanwei4() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		

		List<SanweiData> sanweidata=new ArrayList<SanweiData>();  
		String str="";
		sanweidata =SanweiDataService.getSanweiData(str);	
		pd.put("sanweidata", JSONArray.fromObject(sanweidata).toString());
		mv.addObject("pd", pd);

		
		mv.setViewName("sanwei/sanwei_chart2");
		return mv;
}
 //流量数据页面后台处理
   @RequestMapping(value="/sanwei5")
   public ModelAndView sanwei5() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		

		List<SanweiData> sanweidata=new ArrayList<SanweiData>();  
		String str="";
		sanweidata =SanweiDataService.getSanweiData(str);	
		pd.put("sanweidata", JSONArray.fromObject(sanweidata).toString());
		mv.addObject("pd", pd);

		
		mv.setViewName("sanwei/sanwei_chart3");
		return mv;
}
   //果园镇河段unity后台处理
   @RequestMapping(value="/sanwei6")
   public ModelAndView sanwei11() throws Exception{
		ModelAndView mv = this.getModelAndView();
		
		

		
		mv.setViewName("sanwei/web");
		return mv;
}
   
 
  
}
