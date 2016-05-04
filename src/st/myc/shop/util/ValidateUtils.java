package st.myc.shop.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.naming.AuthenticationException;

import org.apache.commons.lang.StringUtils;

/**
 * 验证相关的工具类
 * @author myc
 *
 */

public class ValidateUtils {
	
	/**
	 * 验证密码只由字母和数字构成，长度为6到18位
	 * @param password
	 * @return
	 * @throws AuthenticationException 
	 */
	public static boolean validatePassword(String password) throws AuthenticationException{
		if(StringUtils.isBlank(password)){
			throw new AuthenticationException("密码不能为空");
		}
		if(RegexUtils.isAlpha(password)){
            if (password.length() < 6) {
            	throw new AuthenticationException("密码不能小于6位数");
            }
            if (password.length() > 16) {
            	throw new AuthenticationException("密码不能大于16位数");
            }
    	}else{
    		throw new AuthenticationException("密码只能是英文字母和数字的组合！");
    	}
		return true;	
	}
	
	/**
	 * 校验昵称
	 * @param nickname
	 * @return
	 * @throws AuthenticationException 
	 */
	public static boolean validateNickname(String nickname) throws AuthenticationException{
		if(StringUtils.isBlank(nickname)){
			throw new AuthenticationException("请输入昵称");
		}
		if(!RegexUtils.isAlphaAndChinese(nickname)){
			throw new AuthenticationException("昵称只能由汉字和英文及数字组成");
		}
		return true;
	}
	
	/**
	 * 校验用户名
	 * @param username
	 * @return
	 * @throws AuthenticationException
	 */
	public static boolean validateUsername(String username) throws AuthenticationException{
		if(StringUtils.isBlank(username)){
			throw new AuthenticationException("请输入用户名");
		}
		if (username.length() > 18) {
        	throw new AuthenticationException("用户名最大18位");
        }
		if(!StringUtils.isAlphanumeric(username)){
			throw new AuthenticationException("用户名只能由英文和数字组成");
		}
		return true;
	}
	
	/**
	 * 校验手机号码
	 * @return
	 * @throws AuthenticationException
	 */
	public static boolean validatePhone(String phone) throws AuthenticationException{
		if(!RegexUtils.isPhone(phone)){
			throw new AuthenticationException("请输入正确的手机号码！");
		}
		return true;
	}
	
	/**
	 * 校验身份证
	 * @param idcard
	 * @return
	 * @throws AuthenticationException
	 */
	public static boolean validateIdCard(String idcard) throws AuthenticationException{
		if(!RegexUtils.isIdCard(idcard)){
			throw new AuthenticationException("请输入正确的身份证！");
		}
		return true;
	}
	
	/**
	 * 校验邮箱
	 * @param email
	 * @return
	 * @throws AuthenticationException
	 */
	public static boolean validateEmail(String email) throws AuthenticationException{
		if(!RegexUtils.isEmail(email)){
			throw new AuthenticationException("请输入正确的邮箱！");
		}
		return true;
	}
	
	/**
	 * 校验姓名
	 * @param email
	 * @return
	 * @throws AuthenticationException
	 */
	public static boolean validateName(String name) throws AuthenticationException{
		if(StringUtils.isBlank(name)){
			throw new AuthenticationException("请输入姓名！");
		}
		return true;
	}
	
	/**
	 * 校验所在单位
	 * @param company
	 * @return
	 * @throws AuthenticationException
	 */
	public static boolean validateCompany(String company) throws AuthenticationException{
		if(company.length()>40){
			throw new AuthenticationException("不能超过40个字符");
		}
		return true;
	}
	
	/**
	 * 校验联系地址
	 * @param address
	 * @return
	 * @throws AuthenticationException
	 */
	public static boolean validateAddress(String address) throws AuthenticationException{
		if(address.length()>40){
			throw new AuthenticationException("不能超过40个字符");
		}
		return true;
	}
	
	/**
	 * 校验评论
	 * @param content
	 * @return
	 * @throws AuthenticationException
	 */
	public static boolean validateComment(String content) throws AuthenticationException{
		if(StringUtils.isBlank(content)){
			throw new AuthenticationException("请输入评论");
		}
		if(content.length()>200){
			throw new AuthenticationException("评论最大字符限制200字");
		}
		return true;
		
	}
	
	/**
	 * 校验标题
	 * @param title
	 * @return
	 * @throws AuthenticationException
	 */
	public static boolean validateTitle(String title) throws AuthenticationException{
		if(StringUtils.isBlank(title)){
			throw new AuthenticationException("请输入标题");
		}
		return true;		
	}
	
	/**
	 * 校验文章内容
	 * @param content
	 * @return
	 * @throws AuthenticationException
	 */
	public static boolean validateArticleContent(String content) throws AuthenticationException{
		if(StringUtils.isBlank(content)){
			throw new AuthenticationException("请输入内容");
		}
		if(content.length()>10000){
			throw new AuthenticationException("最大字符限制10000字");
		}
		return true;
		
	}
	
	/**
	 * 校验文章发布时间
	 * @param title
	 * @return
	 * @throws AuthenticationException
	 */
	public static boolean validateArticleCreateTime(String time) throws AuthenticationException{
		if(StringUtils.isBlank(time)){
			throw new AuthenticationException("请输入时间");
		}
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		try {
			Date date = sdf.parse(time);
		} catch (ParseException e) {
			throw new AuthenticationException("日期格式不对");
		}
		return true;		
	}
	
	

}
