package st.myc.shop.service.sysUser;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import st.myc.shop.entity.SysUser;
import st.myc.shop.entity.vo.PageVo;
import st.myc.shop.exception.AuthException;

public interface SysUserService {
	// ///////////////////////////////
	// ///// 增加 ////////
	// ///////////////////////////////

	/**
	 * 添加管理员
	 * @throws Exception 
	 */
	public boolean addSysUser(SysUser sysUser) throws Exception;

	// ///////////////////////////////
	// ///// 刪除 ////////
	// ///////////////////////////////

	/**
	 * 删除管理员
	 */
	public int deleteSysUser(int userId);

	// ///////////////////////////////
	// ///// 修改 ////////
	// ///////////////////////////////

	/**
	 * 修改管理员资料

	 */
	public void updateSysUserById(SysUser sysUser);

	// ///////////////////////////////
	// ///// 查詢 ////////
	// ///////////////////////////////

	/**
	 * 管理员登陆
	 */
	public void login(String userName, String password,HttpServletRequest request) throws AuthException;
	
	/**
	 * 登出
	 */
	public void logout(HttpServletRequest request);
	/**
	 * 通过Id获得指定管理员资料
	 */
	public SysUser getSysUserById(int userId);
	
	/**
	 * 查找是否有重复的用户名
	 */
	public SysUser getByUsername(String username);

	/**
	 * 获得所有管理员的数量
	 * 
	 * @return Integer
	 */
	public int getAllListCount();
	
	/**
	 * 获得管理员某页列表
	 * 
	 * @return Integer
	 */
	public List<SysUser> getAllList(int offset,int rows);

	/**
	 * 获得所有管理员的分页
	 */
	public PageVo<SysUser> getAllListPage(int pageNum) throws Exception;
	
	/**
	 * 获得所有管理员的分页
	 */
	public PageVo<SysUser> search(String keywords,String lastLoginStart,String lastLoginEnd,int pageNum) throws Exception;
	
	public List<SysUser> getSearchList(String keywords,String lastLoginStart,String lastLoginEnd,
			int offset, int rows);
}
