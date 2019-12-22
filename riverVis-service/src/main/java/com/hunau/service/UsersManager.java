package com.hunau.service;

import com.hunau.entity.Page;
import com.hunau.entity.Users;
import com.infopublic.util.PageData;

import java.util.List;


/** 用户接口类
 */
public interface UsersManager {
	
	/**登录判断
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public Users getUserByNameAndPwd(PageData pd)throws Exception;
	/**登陆名是否存在判断
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public String checkLoginid(String username)throws Exception;
	/**
	 * 用户信息列表
	 * @param  page
	 * @param @throws Exception 
	 * @return List<User>
	 */
	public List<Users> getAllUserList(Page page) throws Exception;
	/**
	 * 根据用户编号获取其区域下的用户信息(excel导出)
	 * @param  page
	 * @param @throws Exception 
	 * @return List<User>
	 */
	public List<Users> getUserListByIds(PageData pd) throws Exception;
	/**通过useid获取数据
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public Users findByUserid(PageData pd)throws Exception;
	/**修改用户
	 * @param pd
	 * @throws Exception
	 */
	public void editU(PageData pd)throws Exception;
	/**修改用户密码
	 * @param pd
	 * @throws Exception
	 */
	public void editPwd(PageData pd)throws Exception;
	/**
	 * 删除用户
	 * @param userid
	 */
	public void deleteU(String userid)throws Exception;
	/**修改用户账号可用状态
	 * @param pd
	 * @throws Exception
	 */
	public void editIsenabled(PageData pd)throws Exception;
	/**添加用户
	 * @param pd
	 * @throws Exception
	 */
	public void insertUser(PageData pd)throws Exception;
	/**通过用户ID获取区域编号
	 * @param integer
	 * @return
	 * @throws Exception
	 */
	public String getAidByUserid(String userid) throws Exception;
	public List<Users> listUsersByAids(PageData pd) throws Exception;
	/**通过区域编号列表获取用户
	 * @param integer
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getUserByAidlist(PageData pd) throws Exception;
}
