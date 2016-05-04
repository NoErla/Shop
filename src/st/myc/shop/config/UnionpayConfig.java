/*
 *	Copyright © 2013 Changsha Shishuo Network Technology Co., Ltd. All rights reserved.
 *	长沙市师说网络科技有限公司 版权所有
 *	http://www.shishuo.com
 */

package st.myc.shop.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import st.myc.shop.util.PropertyUtils;

/**
 * 系统常量
 * 
 * @author Herbert
 * 
 */
@Component("unionpayConfig")
public class UnionpayConfig {

	/**
	 * 银联商户号
	 */
	@Value("${unionpay.merId}")
	private String merid;
	
	/**
	 * 前台响应页面
	 */
	@Value("${unionpay.frontUrl}")
	private String frontUrl;
	/**
	 * 后台响应页面
	 */
	@Value("${unionpay.backUrl}")
	private String backUrl;
	
	public String getMerid() {
		return merid;
	}

	public String getFrontUrl() {
		return frontUrl;
	}

	public String getBackUrl() {
		return backUrl;
	}

	
	

}
