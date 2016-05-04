/*
 *	Copyright © 2013 Changsha Shishuo Network Technology Co., Ltd. All rights reserved.
 *	长沙市师说网络科技有限公司 版权所有
 *	http://www.shishuo.com
 */
package st.myc.shop.action.front;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import st.myc.shop.constant.SystemConstant;
import st.myc.shop.entity.SysAppUser;
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
import st.myc.shop.service.tbOrderDetail.impl.TbOrderDetailServiceImpl;
import st.myc.shop.service.tbOrderNotice.impl.TbOrderNoticeServiceImpl;
import st.myc.shop.service.tbShoppingCart.impl.TbShoppingCartServiceImpl;
import st.myc.shop.service.tbUserAddress.impl.TbUserAddressServiceImpl;

/**
 * 
 * @author Herbert
 * 
 */
public class BaseAction {
	
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
	protected TbShoppingCartServiceImpl tbShoppingCartService;
	
	@Autowired
	protected SysAppUserServiceImpl sysAppUserService;
	
	@Autowired
	protected TbUserAddressServiceImpl tbUserAddressService;
	
	@Autowired
	protected TbOrderService tbOrderService;
	
	@Autowired
	protected TbOrderDetailServiceImpl tbOrderDetailService;
	
	@Autowired
	protected TbOrderNoticeServiceImpl tbOrderNoticeService;
	
	
	

	protected final Logger logger = Logger.getLogger(this.getClass());
	
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
	 * 从session中获得用户的信息
	 *
	 * @param request
	 * @return
	 */
	protected SysAppUser getUser(HttpServletRequest request) {
		SysAppUser user = (SysAppUser) request.getSession().getAttribute(SystemConstant.SESSION_USER);
		return user;
	}
}
