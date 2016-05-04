package st.myc.shop.service.sysAppUser;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import st.myc.shop.entity.SysAppUser;
import st.myc.shop.entity.vo.PageVo;
import st.myc.shop.exception.AuthException;

public interface SysAppUserService {
	
	// ///////////////////////////////
	// ///// 增加 ////////
	// ///////////////////////////////

	/**
	 * 添加用户
	 * @throws Exception 
	 */
	public boolean addUser(SysAppUser sysAppUser) throws Exception;

	// ///////////////////////////////
	// ///// 刪除 ////////
	// ///////////////////////////////

	/**
	 * 删除用户
	 */
	public int deleteSysAppUser(int userId);

	// ///////////////////////////////
	// ///// 修改 ////////
	// ///////////////////////////////

	/**
	 * 修改资料

	 */
	public void updateSysAppUserById(SysAppUser sysAppUser);

	// ///////////////////////////////
	// ///// 查詢 ////////
	// ///////////////////////////////

	/**
	 * 登陆
	 */
	public void login(String userName, String password,HttpServletRequest request) throws AuthException;
	
	/**
	 * 登出
	 */
	public void logout(HttpServletRequest request);
	/**
	 * 通过Id获得指定用户资料
	 */
	public SysAppUser getSysAppUserById(int userId);
	
	/**
	 * 查找是否有重复的用户名
	 */
	public SysAppUser getByUsername(String username);

	/**
	 * 获得所有用户的数量
	 */
	public int getAllListCount();
	
	/**
	 * 获得用户某页列表
	 * 
	 * @return Integer
	 */
	public List<SysAppUser> getAllList(int offset,int rows);

	/**
	 * 获得所有用户的分页
	 */
	public PageVo<SysAppUser> getAllListPage(int pageNum) throws Exception;
	
	
	public PageVo<SysAppUser> search(String keywords,String lastLoginStart,String lastLoginEnd,int pageNum) throws Exception;
	
	public List<SysAppUser> getSearchList(String keywords,String lastLoginStart,String lastLoginEnd,
			int offset, int rows);
}
