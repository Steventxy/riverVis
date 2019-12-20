package com.hunau.controller;

import com.hunau.entity.Page;
import com.hunau.entity.RainStatistics;
import com.hunau.entity.WaterStatistics;
import com.hunau.service.RainStatisticsManager;
import com.hunau.service.WaterStatisticsManager;
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
@RequestMapping(value="/chart5")
public class RainStatisticsController extends BaseController{
	@Resource(name="RainStatisticsService")
	private RainStatisticsManager RainStatisticsService;
	@Resource(name="WaterStatisticsService")
	private WaterStatisticsManager WaterStatisticsService;
	/*
	@Resource(name="RiverMapService")
	private RiverMapManager RiverMapService;*/
	/**
	 * 实际雨量统计
	 * @return
	 * @throws Exception 
	 */
   @RequestMapping(value="/rainstatistics")
   public ModelAndView rainstatistics(Page page) throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
	    pd = this.getPageData();
	    page.setPd(pd);
	    
//	    String str1;
//	    str1="开慧镇";
		//HashMap<String, String> map = new HashMap<String, String>();
		List<RainStatistics> rainstatistics=new ArrayList<RainStatistics>();  //对雨量对象进行操作
		//String str="";
		rainstatistics =RainStatisticsService.getRainStatistics(page);	
		
		List<RainStatistics> rains=new ArrayList<RainStatistics>();  //对雨量对象进行操作
		//String str="";
		rains =RainStatisticsService.getRains(page);	
		
		pd.put("chartData5", JSONArray.fromObject(rainstatistics).toString());
		pd.put("chartData6", JSONArray.fromObject(rains).toString());
		
		mv.addObject("pd", pd);
		mv.setViewName("datavis/tercondition_list");
		return mv;
	}
	/**
	 * 水库水位统计
	 * @return
	 * @throws Exception 
	 */
  @RequestMapping(value="/waterstatistics")
  public ModelAndView waterstatistics(Page page) throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
	    pd = this.getPageData();
	    page.setPd(pd);
	    
//	    String str1;
//	    str1="开慧镇";
		//HashMap<String, String> map = new HashMap<String, String>();
		List<WaterStatistics> waterstatistics=new ArrayList<WaterStatistics>();  //对雨量对象进行操作
		//String str="";
		waterstatistics = WaterStatisticsService.getWaterStatistics(page);	
		
		List<WaterStatistics> water=new ArrayList<WaterStatistics>();  //对雨量对象进行操作
		//String str="";
		water = WaterStatisticsService.getWaters(page);	
		
		pd.put("chartData0", JSONArray.fromObject(waterstatistics).toString());
		pd.put("chartData1", JSONArray.fromObject(water).toString());
		
		mv.addObject("pd", pd);
		mv.setViewName("datavis/water_statistics");
		return mv;
	}
  
 
  /*
  @RequestMapping(value="/sanwei")
  public ModelAndView SaiWei(Page page) throws Exception{	   
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
	    pd = this.getPageData();	
		HashMap<String, String> map = new HashMap<String, String>();
		List<RiverMap> rivermap=new ArrayList<RiverMap>();  //对雨量对象进行操作
		String str="";
		rivermap =RiverMapService.getRiverMap(str);	
		pd.put("chartData4", JSONArray.fromObject(rivermap).toString());
			
		  final Runtime runtime = Runtime.getRuntime();  
		    Process process = null;  
		    try {  
		    	
		            ClassLoader classLoader = Thread.currentThread().getContextClassLoader();
		            if (classLoader == null) {
		                classLoader = ClassLoader.getSystemClassLoader();
		            }
		    	  URI url2 = classLoader.getResource("").toURI();
		            String ROOT_CLASS_PATH = url2.getPath() + "\\";
		            
		            System.out.println(ROOT_CLASS_PATH); 
		            File rootFile = new File(ROOT_CLASS_PATH);
		            String WEB_INFO_DIRECTORY_PATH = rootFile.getParent() + "\\";
		            
		            System.out.println(WEB_INFO_DIRECTORY_PATH); 
		            File webInfoDir = new File(WEB_INFO_DIRECTORY_PATH);
		            String SERVLET_CONTEXT_PATH = webInfoDir.getParent();
		            
		            System.out.println(SERVLET_CONTEXT_PATH); 
		            // 这里 SERVLET_CONTEXT_PATH 就是WebRoot的路径
		            String path = SERVLET_CONTEXT_PATH+"\\"+"test.exe";
		          //String s="H:\\Tomcat 8.0\\webapps\\WarningSystem\\test.exe";
		    	  System.out.println(path);  
		        //process = runtime.exec("\"C:/Users/ljw/Desktop/k/test.exe\"");
		    	  process = runtime.exec(path);
		    } catch (final Exception e) {  
		        System.out.println("Error exec!");  
		    }  
		    mv.addObject("pd", pd);
		mv.setViewName("chart/map_river");
		return mv;
	}
  
  @RequestMapping(value="/sanwei1")
  public ModelAndView SaiWei1(Page page) throws Exception{	   
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
	    pd = this.getPageData();	
		HashMap<String, String> map = new HashMap<String, String>();
		List<RiverMap> rivermap=new ArrayList<RiverMap>();  //对雨量对象进行操作
		String str="";
		rivermap =RiverMapService.getRiverMap(str);	
		pd.put("chartData4", JSONArray.fromObject(rivermap).toString());
			
		  final Runtime runtime = Runtime.getRuntime();  
		    Process process = null;  
		    try {  
		    	
		            ClassLoader classLoader = Thread.currentThread().getContextClassLoader();
		            if (classLoader == null) {
		                classLoader = ClassLoader.getSystemClassLoader();
		            }
		    	  URI url2 = classLoader.getResource("").toURI();
		            String ROOT_CLASS_PATH = url2.getPath() + "\\";
		            
		            System.out.println(ROOT_CLASS_PATH); 
		            File rootFile = new File(ROOT_CLASS_PATH);
		            String WEB_INFO_DIRECTORY_PATH = rootFile.getParent() + "\\";
		            
		            System.out.println(WEB_INFO_DIRECTORY_PATH); 
		            File webInfoDir = new File(WEB_INFO_DIRECTORY_PATH);
		            String SERVLET_CONTEXT_PATH = webInfoDir.getParent();
		            
		            System.out.println(SERVLET_CONTEXT_PATH); 
		            // 这里 SERVLET_CONTEXT_PATH 就是WebRoot的路径
		            String path = SERVLET_CONTEXT_PATH+"\\"+"csxdx.exe";
		          //String s="H:\\Tomcat 8.0\\webapps\\WarningSystem\\test.exe";
		    	  System.out.println(path);  
		        //process = runtime.exec("\"C:/Users/ljw/Desktop/k/test.exe\"");
		    	  process = runtime.exec(path);
		    } catch (final Exception e) {  
		        System.out.println("Error exec!");  
		    }  
		    mv.addObject("pd", pd);
		mv.setViewName("chart/map_river1");
		return mv;
	}
  
 */
}
