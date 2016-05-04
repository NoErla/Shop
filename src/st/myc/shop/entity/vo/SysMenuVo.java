package st.myc.shop.entity.vo;

import java.util.List;

import st.myc.shop.entity.SysMenu;

/**
 * 菜单VO
 * 
 */
public class SysMenuVo extends SysMenu{
	private String target;
	private SysMenu parentMenu;
	private List<SysMenuVo> subMenu;
	private boolean hasMenu = true;
	
	public SysMenu getParentMenu() {
		return parentMenu;
	}
	public void setParentMenu(SysMenu parentMenu) {
		this.parentMenu = parentMenu;
	}
	public List<SysMenuVo> getSubMenu() {
		return subMenu;
	}
	public void setSubMenu(List<SysMenuVo> subMenu) {
		this.subMenu = subMenu;
	}
	public boolean isHasMenu() {
		return hasMenu;
	}
	public void setHasMenu(boolean hasMenu) {
		this.hasMenu = hasMenu;
	}
	public String getTarget() {
		return target;
	}
	public void setTarget(String target) {
		this.target = target;
	}

}
