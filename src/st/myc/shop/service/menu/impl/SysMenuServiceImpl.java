package st.myc.shop.service.menu.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import st.myc.shop.dao.menu.SysMenuMapper;
import st.myc.shop.entity.SysMenu;
import st.myc.shop.entity.vo.SysMenuVo;
import st.myc.shop.service.menu.SysMenuService;

/** 
 * 类名称：MenuService 菜单处理
 */
@Service
public class SysMenuServiceImpl implements SysMenuService{

	@Autowired
	private SysMenuMapper sysMenuMapper;

	@Override
	public SysMenu selectMenuById(int MENU_ID) {
		return sysMenuMapper.selectByPrimaryKey(MENU_ID);
	}
	
	@Override
	public List<SysMenuVo> listSubMenuByParentId(int parentId)
			throws Exception {
		return sysMenuMapper.listSubMenuByParentId(parentId);
	}
	
	@Override
	public List<SysMenuVo> listAllMenu(int menuID) throws Exception {
		List<SysMenuVo> menuList = this.listSubMenuByParentId(menuID);
		for(SysMenuVo menu : menuList){
			//menu.setMenuUrl("menu/toEdit.do?MENU_ID="+menu.getMenuId());
			menu.setSubMenu(this.listAllMenu(menu.getMenuId()));
			if(menu.getSubMenu().size() != 0){
				menu.setHasMenu(true);
			}
			menu.setTarget("treeFrame");
		}
		return menuList;
	}

	@Override
	public void insertMenu(SysMenu sysmenu) throws Exception {
		sysMenuMapper.insertSelective(sysmenu);
	}

	@Override
	public void deleteMenuById(int MENU_ID) throws Exception {
		sysMenuMapper.deleteByPrimaryKey(MENU_ID);
	}

	@Override
	public void updateMenuById(SysMenu sysMenu) throws Exception {
		sysMenuMapper.updateByPrimaryKeySelective(sysMenu);
	}

	

	
	
	
}
