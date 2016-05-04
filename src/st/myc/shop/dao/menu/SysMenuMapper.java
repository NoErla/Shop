package st.myc.shop.dao.menu;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import st.myc.shop.entity.SysMenu;
import st.myc.shop.entity.SysMenuExample;
import st.myc.shop.entity.vo.SysMenuVo;

@Repository
public interface SysMenuMapper {
    int countByExample(SysMenuExample example);

    int deleteByExample(SysMenuExample example);

    int deleteByPrimaryKey(Integer menuId);

    int insert(SysMenu record);

    int insertSelective(SysMenu record);

    List<SysMenu> selectByExample(SysMenuExample example);

    SysMenu selectByPrimaryKey(Integer menuId);

    int updateByExampleSelective(@Param("record") SysMenu record, @Param("example") SysMenuExample example);

    int updateByExample(@Param("record") SysMenu record, @Param("example") SysMenuExample example);

    int updateByPrimaryKeySelective(SysMenu record);

    int updateByPrimaryKey(SysMenu record);
    
    /**
	 * 查询
	 */
	
	// 获取所有菜单并填充每个菜单的子菜单列表(系统菜单列表)(递归处理)
	public List<SysMenuVo> listAllMenu(int menuId);
	
	//通过ID获取其子一级菜单
	public List<SysMenuVo> listSubMenuByParentId(int parentId);
}