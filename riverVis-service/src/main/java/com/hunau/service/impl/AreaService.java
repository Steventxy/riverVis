package com.hunau.service.impl;

import com.hunau.dao.DaoSupport;
import com.hunau.entity.Area;
import com.hunau.entity.Page;
import com.hunau.service.AreaManager;
import com.infopublic.util.PageData;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;


@Service("areaService")
public class AreaService implements AreaManager {
	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**
	 * 通过id获取下级子区域
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<Area> listSubAreaByParentAid(String parentaid) throws Exception {
		return (List<Area>) dao.findForList("AreaMapper.listSubAreaByParentAid", parentaid);
	}
	/**
	 * 根据父区域编号获取所有子区域（级联）
	 */
	@Override
	public List<Area> listAllSubByPAid(String aid) throws Exception {
		List<Area> arealist = this.listSubAreaByParentAid(aid);
		List<Area> sublist = new ArrayList<Area>();
		for(Area area : arealist){
			sublist.addAll(this.listAllSubByPAid(area.getAid()));
		}
		if(sublist!=null){
			arealist.addAll(sublist );
		}
		return arealist;
	}
	/**
	 * 获得所有区域列表
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<Area> listAllArea(String str) throws Exception {
		return (List<Area>) dao.findForList("AreaMapper.listAllArea",str);
	}
	/**
	 * 根据编号获取区域
	 */
	@Override
	public Area getAreaByAid(String aid) throws Exception {
		return (Area) dao.findForObject("AreaMapper.getAreaByAid",aid);
	}
	/**
	 * 新增区域
	 * @param area
	 * @throws Exception
	 */
	@Override
	public void saveArea(Area area) throws Exception {
		dao.save("AreaMapper.insertArea", area);
	}
	/**
	 * 获得当前父区域下子区域的最大个数
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@Override
	public PageData findCurLevelMaxId(PageData pd) throws Exception {
		return (PageData) dao.findForObject("AreaMapper.findCurLevelMaxId", pd);
	}
	/**
	 * 删除区域
	 * @param aid
	 * @throws Exception
	 */
	@Override
	public void deleteAreaByAid(String aid) throws Exception {
		dao.save("AreaMapper.deleteAreaByAid", aid);
	}
	/**
	 * 编辑区域
	 * @param area
	 * @return
	 * @throws Exception
	 */
	@Override
	public void editArea(PageData pd) throws Exception {
		 dao.update("AreaMapper.updateArea", pd);
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<PageData> listUserByAid(Page page) throws Exception {
		return (List<PageData>) dao.findForList("AreaMapper.getUserlistPage",page);
	}
	@Override
	public void changUserArea(String[] arrayuserids, String aid)
			throws Exception {
		PageData pd = new PageData();
		pd.put("userids", arrayuserids);
		pd.put("aid", aid);
		 dao.update("AreaMapper.updateUserArea", pd);
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<PageData> listAreaByAid(PageData pd) throws Exception {
		return (List<PageData>)dao.findForList("AreaMapper.listAreaByAid", pd);
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<Area> getAreasByUserid(PageData pd) throws Exception {
		return (List<Area>) dao.findForList("AreaMapper.getAreasByUserid",pd);
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<String> getAidByAname(String aname) throws Exception {
		return (List<String>) dao.findForList("AreaMapper.getAidByAname",aname);
	}
}
