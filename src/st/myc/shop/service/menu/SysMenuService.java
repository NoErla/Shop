package st.myc.shop.service.menu;

import java.util.List;

import st.myc.shop.entity.SysMenu;
import st.myc.shop.entity.vo.SysMenuVo;



/**说明：MenuService 菜单处理接口
 */
public interface SysMenuService {
	
	public SysMenu selectMenuById(int MENU_ID);

	public List<SysMenuVo> listSubMenuByParentId(int parentId)throws Exception;
	
	public void insertMenu(SysMenu sysmenu) throws Exception;
	
	public void deleteMenuById(int MENU_ID) throws Exception;
	
	public void updateMenuById(SysMenu sysMenu) throws Exception;
	
	public List<SysMenuVo> listAllMenu(int menuID) throws Exception;
	
}
