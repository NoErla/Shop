package st.myc.shop.action;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import st.myc.shop.entity.vo.JsonVo;
import st.myc.shop.exception.ValidateException;
import st.myc.shop.service.DealService;
import st.myc.shop.service.PaymentService;
import st.myc.shop.service.sysUser.impl.SysUserServiceImpl;


public class BaseAction {

	@Autowired
	protected SysUserServiceImpl sysUserService;
	
	@Autowired
	protected DealService dealService;
	
	@Autowired
	protected PaymentService paymentService;

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
}
