package st.myc.shop.util;

import java.math.BigDecimal;


/**
 * 银联金额转换工具类
 * @author myc
 *
 */

public class MoneyUtils {
	
	/**
	 * 银联金额转换（单位为分的string转为单位为元的double）
	 * @param money
	 * @return
	 */
	public static final Double stringToDouble(String money){
		BigDecimal price = new BigDecimal(money);
		BigDecimal override = new BigDecimal(100);
		price = price.divide(override);		
		return price.doubleValue();
	}
	
	/**
	 * 银联金额转换（单位为分的string转为单位为元的double）
	 * @param money
	 * @return
	 */
	public static final String doubleToString(Double money){
		BigDecimal price = new BigDecimal(money);
		BigDecimal override = new BigDecimal(100);
		price = price.multiply(override);
		return price.toString();
	}
	
	/**
	 * 金额想加
	 * @param money1
	 * @param money2
	 * @return
	 */
	public static final Double add(Double money1,Double money2){
		
		return new BigDecimal(money1).add(new BigDecimal(money2)).doubleValue();
	}
	

}
