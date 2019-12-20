package com.hunau.service;

import com.hunau.entity.Page;
import com.hunau.entity.Role;
import com.infopublic.util.PageData;

import java.util.List;


/**	角色接口类
 */
public interface RoleManager {
	
	/**列出所有角色
	 * @param str
	 * @return
	 * @throws Exception
	 */
	public List<Role> listAllRoles(String str) throws Exception;
	/**
	 * 列出角色（分页）
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<Role> listRoles(Page page) throws Exception;
	/**
	 * 删除角色
	 * @param rid
	 * @throws Exception
	 */
	public void deleteRole(String rid) throws Exception;
	/**
	 * 修改角色
	 * @param pd
	 * @throws Exception
	 */
	public void editRole(PageData pd) throws Exception;
	/**
	 * 角色授权
	 * @param pd
	 * @throws Exception
	 */
	public void editRoleRights(PageData pd) throws Exception;
	/**
	 * 添加角色
	 * @param pd
	 * @throws Exception
	 */
	public void addRole(PageData pd) throws Exception;

}
