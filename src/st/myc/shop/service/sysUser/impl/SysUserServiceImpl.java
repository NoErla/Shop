package st.myc.shop.service.sysUser.impl;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.stereotype.Service;

import st.myc.shop.constant.SystemConstant;
import st.myc.shop.dao.sysUser.SysUserMapper;
import st.myc.shop.entity.SysUser;
import st.myc.shop.entity.vo.PageVo;
import st.myc.shop.exception.AuthException;
import st.myc.shop.service.sysUser.SysUserService;
import st.myc.shop.util.AuthUtils;
import st.myc.shop.util.DateUtil;
import st.myc.shop.util.SSUtils;

/**
 * 管理员
 */
@Service
public class SysUserServiceImpl implements SysUserService{

	@Autowired
	private SysUserMapper sysUserMapper;

	// ///////////////////////////////
	// ///// 增加 ////////
	// ///////////////////////////////

	/**
	 * 添加管理员
	 */
	public boolean addSysUser(SysUser sysUser) throws Exception {
		sysUser.setSalt(AuthUtils.getSalt(6));
		sysUser.setPassword(AuthUtils.MD5(sysUser.getPassword(), sysUser.getSalt()));
		sysUser.setEmail(SSUtils.toText(sysUser.getEmail()));
		sysUserMapper.insertSelective(sysUser);
		return true;
	}

	// ///////////////////////////////
	// ///// 刪除 ////////
	// ///////////////////////////////

	/**
	 * 删除管理员
	 */
	public int deleteSysUser(int userId) {
		return sysUserMapper.deleteByPrimaryKey(userId);
	}

	// ///////////////////////////////
	// ///// 修改 ////////
	// ///////////////////////////////

	/**
	 * 修改管理员资料
	 */
	public void updateSysUserById(SysUser sysUser){
		if(!sysUser.getPassword().isEmpty()){
			sysUser.setPassword(AuthUtils.MD5(sysUser.getPassword(), sysUser.getSalt()));
		}
		if(!sysUser.getEmail().isEmpty()){
			sysUser.setEmail(SSUtils.toText(sysUser.getEmail()));
		}
		sysUserMapper.updateByPrimaryKeySelective(sysUser);
	}

	// ///////////////////////////////
	// ///// 查詢 ////////
	// ///////////////////////////////

	/**
	 * 管理员登陆
	 */
	public void login(String userName, String password,HttpServletRequest request) throws AuthException{
		
		SysUser sysUser = null;
		try{
			sysUser = sysUserMapper.selectByUserName(userName);
			
		}catch(Exception e){
			e.printStackTrace();
		}
		if (sysUser == null) {
			throw new AuthException("用户名或密码错误");
		}
		
		String loginPassword = AuthUtils.MD5(password,sysUser.getSalt());
		if (loginPassword.equals(sysUser.getPassword())) {
			HttpSession session = request.getSession();
			sysUser.setPassword(""); 
			sysUser.setSalt(""); 
			session.setAttribute(SystemConstant.SESSION_ADMIN, sysUser);
		} else {
			throw new AuthException("用户名或密码错误");
		}
	}
	
	/**
	 * 登出
	 */
	public void logout(HttpServletRequest request) {
		SysUser sysUser = new SysUser();
		sysUser.setUserId(((SysUser)request.getSession().getAttribute(SystemConstant.SESSION_ADMIN)).getUserId());
		sysUser.setIp(request.getRemoteAddr());
		sysUser.setLastLogin(DateUtil.getTime());
		this.updateSysUserById(sysUser);
		request.getSession().removeAttribute(SystemConstant.SESSION_ADMIN);
		
	}
	/**
	 * 通过Id获得指定管理员资料
	 */
	public SysUser getSysUserById(int userId) {
		return sysUserMapper.selectByPrimaryKey(userId);
	}
	
	/**
	 * 查找是否有重复的用户名
	 */
	public SysUser getByUsername(String username) {
		return sysUserMapper.selectByUserName(username);
	}

	/**
	 * 获得所有管理员的数量
	 * 
	 * @return Integer
	 */
	public int getAllListCount() {
		return sysUserMapper.countAll();
	}
	
	/**
	 * 获得管理员某页列表
	 * 
	 * @return Integer
	 */
	public List<SysUser> getAllList(int offset,int rows) {
		return sysUserMapper.getAllList(offset,rows);
	}

	/**
	 * 获得所有管理员的分页
	 */
	public PageVo<SysUser> getAllListPage(int pageNum) throws Exception{
		PageVo<SysUser> pageVo = new PageVo<SysUser>(pageNum);
		pageVo.setRows(20);
		List<SysUser> list = this
				.getAllList(pageVo.getOffset(), pageVo.getRows());
		pageVo.setList(list);
		pageVo.setCount(this.getAllListCount());
		return pageVo;
	}
	
	/**
	 * 获得所有管理员的分页
	 */
	public PageVo<SysUser> search(String keywords,String lastLoginStart,String lastLoginEnd,int pageNum) throws Exception{
		PageVo<SysUser> pageVo = new PageVo<SysUser>(pageNum);
		pageVo.setRows(20);
		List<SysUser> list = this
				.getSearchList(keywords, lastLoginStart, lastLoginEnd, 
						pageVo.getOffset(), pageVo.getRows());
		pageVo.setList(list);
		pageVo.setCount(this.getAllListCount());
		return pageVo;
	}

	@Override
	public List<SysUser> getSearchList(String keywords, String lastLoginStart,
			String lastLoginEnd, int offset, int rows) {
		return sysUserMapper.getSearchList(keywords, lastLoginStart, lastLoginEnd, offset, rows);
	}
	
	
}
