/*
 *	Copyright © 2013 Changsha Shishuo Network Technology Co., Ltd. All rights reserved.
 *	长沙市师说网络科技有限公司 版权所有
 *	http://www.shishuo.com
 */

package st.myc.shop.util;

import java.io.UnsupportedEncodingException;
import java.util.Random;

import org.apache.commons.codec.digest.DigestUtils;

import st.myc.shop.constant.SystemConstant;
import st.myc.shop.exception.AuthException;

/**
 * 授权相关的工具类
 * 
 * @author Herbert
 * 
 */
public class AuthUtils {


	/**
	 * @param str
	 * @return
	 */
	public static String MD5(String pwd,String salt) {
		String str = pwd + salt;
		return DigestUtils.md5Hex(str).toLowerCase();
	}
	
	
	/**
	 * 生成盐
	 * @param len
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	public static String getSalt(int len) throws UnsupportedEncodingException{  
        byte[] salt = new byte[len];  
        Random rand = new Random();  
                  
        for(int i=0; i<len; i++){  
            salt[i] = (byte) ((rand.nextInt('~'-'!')+'!') & 0x007f);  
        }  
        return new String(salt, "UTF-8");  
    }
	
	public static void main(String[] args) throws UnsupportedEncodingException {
		MD5("123456",getSalt(6));
	}

}
