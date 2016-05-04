package st.myc.shop.service.sysAppUser.impl;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import st.myc.shop.constant.SystemConstant;
import st.myc.shop.dao.sysAppUser.SysAppUserMapper;
import st.myc.shop.entity.SysAppUser;
import st.myc.shop.entity.vo.PageVo;
import st.myc.shop.exception.AuthException;
import st.myc.shop.service.sysAppUser.SysAppUserService;
import st.myc.shop.service.tbShoppingCart.impl.TbShoppingCartServiceImpl;
import st.myc.shop.util.AuthUtils;
import st.myc.shop.util.DateUtil;
import st.myc.shop.util.SSUtils;

/**
 * 管理员
 */
@Service
public class SysAppUserServiceImpl implements SysAppUserService{

	@Autowired
	private SysAppUserMapper sysAppUserMapper;
	
	@Autowired
	private TbShoppingCartServiceImpl tbShoppingCartService;

	// ///////////////////////////////
	// ///// 增加 ////////
	// ///////////////////////////////

	/**
	 * 添加用户
	 * @throws UnsupportedEncodingException 
	 */
	public boolean addUser(SysAppUser sysAppUser) throws Exception{
		sysAppUser.setSalt(AuthUtils.getSalt(6));
		sysAppUser.setPassword(AuthUtils.MD5(sysAppUser.getPassword(), sysAppUser.getSalt()));
		sysAppUser.setEmail(SSUtils.toText(sysAppUser.getEmail()));
		sysAppUserMapper.insertSelective(sysAppUser);
		return true;
	}

	// ///////////////////////////////
	// ///// 刪除 ////////
	// ///////////////////////////////

	/**
	 * 删除用户
	 */
	public int deleteSysAppUser(int userId) {
		return sysAppUserMapper.deleteByPrimaryKey(userId);
	}

	// ///////////////////////////////
	// ///// 修改 ////////
	// ///////////////////////////////

	/**
	 * 修改
	 */
	public void updateSysAppUserById(SysAppUser sysAppUser){
		sysAppUser.setPassword(AuthUtils.MD5(sysAppUser.getPassword(), sysAppUser.getSalt()));
		sysAppUserMapper.updateByPrimaryKeySelective(sysAppUser);
	}

	// ///////////////////////////////
	// ///// 查詢 ////////
	// ///////////////////////////////

	/**
	 * 登陆
	 */
	public void login(String userName, String password,HttpServletRequest request) throws AuthException{
		
		SysAppUser sysAppUser = null;
		try{
			sysAppUser = sysAppUserMapper.selectByUserName(userName);
			
		}catch(Exception e){
			e.printStackTrace();
		}
		if (sysAppUser == null) {
			throw new AuthException("用户名或密码错误");
		}
		password = AuthUtils.MD5(password, sysAppUser.getSalt());
		//String loginPassword = AuthUtils.getPassword(password);
		if (password.equals(sysAppUser.getPassword())) {
			HttpSession session = request.getSession();
			sysAppUser.setPassword(""); 
			sysAppUser.setSalt(""); 
			session.setAttribute(SystemConstant.SESSION_USER, sysAppUser);
			session.setAttribute("shoppingcart", tbShoppingCartService.getShoppingCartList(sysAppUser.getUserId()));
		} else {
			throw new AuthException("用户名或密码错误");
		}
	}
	
	/**
	 * 登出
	 */
	public void logout(HttpServletRequest request) {
		SysAppUser sysAppUser = new SysAppUser();
		sysAppUser.setUserId(((SysAppUser)request.getSession().getAttribute(SystemConstant.SESSION_USER)).getUserId());
		sysAppUser.setIp(request.getRemoteAddr());
		sysAppUser.setLastLogin(DateUtil.getTime());
		this.updateSysAppUserById(sysAppUser);
		request.getSession().removeAttribute(SystemConstant.SESSION_USER);
		request.getSession().removeAttribute("shoppingcart");
		
	}
	/**
	 * 通过Id获得指定用户资料
	 */
	public SysAppUser getSysAppUserById(int userId) {
		return sysAppUserMapper.selectByPrimaryKey(userId);
	}
	
	/**
	 * 查找是否有重复的用户名
	 */
	public SysAppUser getByUsername(String username) {
		return sysAppUserMapper.selectByUserName(username);
	}

	/**
	 * 获得所有的数量
	 * 
	 * @return Integer
	 */
	public int getAllListCount() {
		return sysAppUserMapper.countAll();
	}
	
	/**
	 * 获得某页列表
	 * 
	 * @return Integer
	 */
	public List<SysAppUser> getAllList(int offset,int rows) {
		return sysAppUserMapper.getAllList(offset,rows);
	}

	/**
	 * 获得所有分页
	 */
	public PageVo<SysAppUser> getAllListPage(int pageNum) throws Exception{
		PageVo<SysAppUser> pageVo = new PageVo<SysAppUser>(pageNum);
		pageVo.setRows(20);
		List<SysAppUser> list = this
				.getAllList(pageVo.getOffset(), pageVo.getRows());
		pageVo.setList(list);
		pageVo.setCount(this.getAllListCount());
		return pageVo;
	}
	
	/**
	 * 获得所有管理员的分页
	 */
	public PageVo<SysAppUser> search(String keywords,String lastLoginStart,String lastLoginEnd,int pageNum) throws Exception{
		PageVo<SysAppUser> pageVo = new PageVo<SysAppUser>(pageNum);
		pageVo.setRows(20);
		List<SysAppUser> list = this
				.getSearchList(keywords, lastLoginStart, lastLoginEnd, 
						pageVo.getOffset(), pageVo.getRows());
		pageVo.setList(list);
		pageVo.setCount(this.getAllListCount());
		return pageVo;
	}

	@Override
	public List<SysAppUser> getSearchList(String keywords, String lastLoginStart,
			String lastLoginEnd, int offset, int rows) {
		return sysAppUserMapper.getSearchList(keywords, lastLoginStart, lastLoginEnd, offset, rows);
	}
	
	
	
//
//	/**
//	 * 通过email获得管理员资料
//	 * 
//	 * @param name
//	 * @return Admin
//	 */
//	@Cacheable(value = "admin")
//	public Admin getAdminByName(String name) {
//		return adminDao.getAdminByName(name);
//	}
//
//	@Cacheable(value = "admin")
//	public int getSuperAdminId() {
//		Admin admin = getAdminByName(PropertyUtils.getValue("shop.admin"));
//		return admin.getAdminId();
//	}

	

	
}
