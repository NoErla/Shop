/*
 *	Copyright © 2013 Changsha Shishuo Network Technology Co., Ltd. All rights reserved.
 *	长沙市师说网络科技有限公司 版权所有
 *	http://www.shishuo.com
 */

package st.myc.shop.action.manage;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import st.myc.shop.constant.SystemConstant;
import st.myc.shop.entity.SysUser;
import st.myc.shop.entity.vo.JsonVo;
import st.myc.shop.exception.ValidateException;
import st.myc.shop.service.DealService;
import st.myc.shop.service.PaymentService;
import st.myc.shop.service.UnionpayService;
import st.myc.shop.service.menu.impl.SysMenuServiceImpl;
import st.myc.shop.service.sysAppUser.impl.SysAppUserServiceImpl;
import st.myc.shop.service.sysUser.impl.SysUserServiceImpl;
import st.myc.shop.service.tbGoods.impl.TbGoodsServiceImpl;
import st.myc.shop.service.tbGoodsType.impl.TbGoodsTypeServiceImpl;
import st.myc.shop.service.tbOrder.TbOrderService;

/**
 * @author 所有action的父类
 *
 */
@Controller
public class ManageBaseAction {

	protected final Logger logger = Logger.getLogger(this.getClass());
	
	@Autowired
	protected DealService dealService;
	
	@Autowired
	protected PaymentService paymentService;
	
	@Autowired
	protected UnionpayService unionpayService;
	
	@Autowired
	protected SysMenuServiceImpl sysMenuService;
	
	@Autowired
	protected SysUserServiceImpl sysUserService;
	
	@Autowired
	protected TbGoodsServiceImpl tbGoodsService;
	
	@Autowired
	protected TbGoodsTypeServiceImpl tbGoodsTypeService;
	
	@Autowired
	protected SysAppUserServiceImpl sysAppUserService;
	
	@Autowired
	protected TbOrderService tbOrderService;
	

	/**
	 * 参数校验
	 *
	 * @param json
	 *            json数据Bean
	 * @throws ValidateException
	 */
	protected <T> void validate(JsonVo<T> json) throws ValidateException {
		if (json.getErrors().size() > 0) {
			json.setResult(false);
			throw new ValidateException("有错误发生");
		} else {
			json.setResult(true);
		}
	}

	/**
	 * 从session中获得管理员的信息
	 *
	 * @param request
	 * @return
	 */
	protected SysUser getSysUser(HttpServletRequest request) {
		SysUser sysUser = (SysUser) request.getSession().getAttribute(
				SystemConstant.SESSION_ADMIN);
		return sysUser;
	}

	
}
