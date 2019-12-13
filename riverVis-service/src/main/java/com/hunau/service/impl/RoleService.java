package com.hunau.service.impl;

import com.hunau.dao.DaoSupport;
import com.hunau.entity.Page;
import com.hunau.entity.Role;
import com.hunau.service.RoleManager;
import com.infopublic.util.PageData;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;


/**	角色
 */
@Service("roleService")
public class RoleService implements RoleManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**列出此组下级角色
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<Role> listAllRoles(String str) throws Exception {
		return (List<Role>) dao.findForList("RoleMapper.listAllRoles", str);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Role> listRoles(Page page) throws Exception {
		return (List<Role>) dao.findForList("RoleMapper.listAllRoleslistPage", page);
	}

	@Override
	public void deleteRole(String rid) throws Exception {
		dao.delete("RoleMapper.deleteRole", rid);
	}

	@Override
	public void editRole(PageData pd) throws Exception {
		dao.update("RoleMapper.editRole", pd);
	}

	@Override
	public void addRole(PageData pd) throws Exception {
		dao.save("RoleMapper.addRole", pd);
	}

	@Override
	public void editRoleRights(PageData pd) throws Exception {
		dao.update("RoleMapper.editRoleRights", pd);
	}

}
