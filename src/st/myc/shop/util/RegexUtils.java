/*
 *	Copyright © 2013 Changsha Shishuo Network Technology Co., Ltd. All rights reserved.
 *	长沙市师说网络科技有限公司 版权所有
 *	http://www.shishuo.com
 */

package st.myc.shop.util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class RegexUtils {

	/**
	 * 是否是英文和数字
	 * @param msg
	 * @return
	 */
	public static boolean isAlpha(String msg) {
		Pattern pattern = Pattern.compile("^[a-zA-Z0-9]+$");
		Matcher matcher = pattern.matcher(msg);
		return matcher.matches();
	}
	
	/**
	 * 是否是英文和中文和数字
	 * @param msg
	 * @return
	 */
	public static boolean isAlphaAndChinese(String msg) {
		Pattern pattern = Pattern.compile("^([A-Za-z0-9]|[\u4E00-\u9FA5])+$");
		Matcher matcher = pattern.matcher(msg);
		return matcher.matches();
	}
	
	/**
	 * 是否是英文和中文
	 * @param msg
	 * @return
	 */
	public static boolean isChinese(String msg) {
		Pattern pattern = Pattern.compile("^([A-Za-z]|[\u4E00-\u9FA5])+$");
		Matcher matcher = pattern.matcher(msg);
		return matcher.matches();
	}
	
	/**
	 * 是否是身份证
	 * @param msg
	 * @return
	 */
	public static boolean isIdCard(String msg) {
		Pattern pattern = Pattern.compile("^\\d{17}([0-9]|X|x)$");
		Matcher matcher = pattern.matcher(msg);
		return matcher.matches();
	}
	
	/**
	 * 是否是手机号
	 * @param msg
	 * @return
	 */
	public static boolean isPhone(String msg) {
		Pattern pattern = Pattern.compile("^1\\d{10}$");
		Matcher matcher = pattern.matcher(msg);
		return matcher.matches();
	}
	
	/**
	 * 是否是电子邮箱
	 * @param msg
	 * @return
	 */
	public static boolean isEmail(String msg) {
		Pattern pattern = Pattern.compile("^([a-z0-9A-Z]+[-|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}$");
		Matcher matcher = pattern.matcher(msg);
		return matcher.matches();
	}
	
    /** 
     * 判断是否为合法IP 
     * @return the ip 
     */  
    public static boolean isIp(String ip)  {  
           Pattern pattern = Pattern.compile("^([1-9]|[1-9]\\d|1\\d{2}|2[0-4]\\d|25[0-5])(\\.(\\d|[1-9]\\d|1\\d{2}|2[0-4]\\d|25[0-5])){3}$");   
           Matcher matcher = pattern.matcher(ip);   
           return matcher.matches();   
    }
    
    /** 
     * 判断是否为金钱
     * @return the money 
     */  
    public static boolean isMoney(String money)  {  
    	   Pattern pattern = Pattern
				.compile("^[1-9][0-9]{0,17}(\\.(\\d){1,2})?$");
    	   Matcher matcher = pattern.matcher(money);   
           return matcher.matches();   
    }
    
    public static void main(String[] args) {
		System.out.println(isMoney("111111111111111111.111"));
	}
    
}
