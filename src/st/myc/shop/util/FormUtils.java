/*
 *	Copyright © 2013 Changsha Shishuo Network Technology Co., Ltd. All rights reserved.
 *	长沙市师说网络科技有限公司 版权所有
 *	http://www.shishuo.com
 */

package st.myc.shop.util;



/**
 * 表单工具类
 * 
 * @author Herbert
 * 
 */
public class FormUtils {

	public static boolean isRepeatSubmit(String token,String uuid){
		if(token == null){
			return true;
		}
		if(uuid == null){
			return true;
		}
		if(!token.equals(uuid)){
			return true;
		}
		return false;
	}
	
}
