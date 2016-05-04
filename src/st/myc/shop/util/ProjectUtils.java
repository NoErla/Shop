package st.myc.shop.util;

import javax.naming.AuthenticationException;

/**
 * 验证相关的工具类
 * @author myc
 *
 */

public class ProjectUtils {
	
	/**
	 * 校验发起人Id是否合法
	 */
	public static boolean validateOriginatorId(Integer originatorId) throws AuthenticationException{
		if(originatorId == null){
			throw new AuthenticationException("发起人id不能为空");
		}
		return true;	
	}
	
	/**
	 * 校验项目名是否合法
	 */
	public static boolean validateName(String name) throws AuthenticationException{
		if(name == null){
			throw new AuthenticationException("项目名不能为空");
		}
		if(name.length()>100){
			throw new AuthenticationException("项目名不能超过100个字符！");
		}		
		return true;
	}
	
	
	

}
