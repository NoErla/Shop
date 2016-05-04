package st.myc.shop.action.front.unionpay;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import st.myc.shop.action.front.BaseAction;
import st.myc.shop.constant.GoodsTypeConstant;
import st.myc.shop.service.UnionpayService;
import st.unionpay.acp.sdk.AcpService;
import st.unionpay.acp.sdk.LogUtil;
import st.unionpay.acp.sdk.SDKConstants;

@Controller
@RequestMapping("/unionpay")
public class FrontUnionPayAction extends BaseAction{
	
	@Autowired
	private UnionpayService unionpayService;
	
	@RequestMapping(value = "/frontReceived")
	public String frontReceived(ModelMap modelMap, HttpServletRequest req, HttpServletResponse resp) throws Exception{
		

		LogUtil.writeLog("FrontRcvResponse前台接收报文返回开始");

		String encoding = req.getParameter(SDKConstants.param_encoding);
		LogUtil.writeLog("返回报文中encoding=[" + encoding + "]");
		
		Map<String, String> respParam = getAllRequestParam(req);

		// 打印请求报文
		LogUtil.printRequestLog(respParam);

		Map<String, String> valideData = null;
		
		if (null != respParam && !respParam.isEmpty()) {
			Iterator<Entry<String, String>> it = respParam.entrySet()
					.iterator();
			valideData = new HashMap<String, String>(respParam.size());
			while (it.hasNext()) {
				Entry<String, String> e = it.next();
				String key = (String) e.getKey();
				String value = (String) e.getValue();
				value = new String(value.getBytes(encoding), encoding);
				valideData.put(key, value);
			}
		}
		
		if (!AcpService.validate(valideData, encoding)) {
			LogUtil.writeLog("验证签名结果[失败].");
		} else {
			LogUtil.writeLog("验证签名结果[成功].");
			//支付成功
			if(valideData.get("respCode").equals("00")){
				unionpayService.frontReceived(valideData);
			}
		}
		//跳转

		LogUtil.writeLog("FrontRcvResponse前台接收报文返回结束");
		modelMap.addAttribute("goodsTypeList", tbGoodsTypeService.getAllType(GoodsTypeConstant.ROOT_TYPE_ID));
		modelMap.addAttribute("newGoodsList", tbGoodsService.getNewestList());
		return "template/index";
		
	}
	
	/**
	 * 获取请求参数中所有的信息
	 * 
	 * @param request
	 * @return
	 */
	public static Map<String, String> getAllRequestParam(
			final HttpServletRequest request) {
		Map<String, String> res = new HashMap<String, String>();
		Enumeration<?> temp = request.getParameterNames();
		if (null != temp) {
			while (temp.hasMoreElements()) {
				String en = (String) temp.nextElement();
				String value = request.getParameter(en);
				res.put(en, value);
				// 在报文上送时，如果字段的值为空，则不上送<下面的处理为在获取所有参数数据时，判断若值为空，则删除这个字段>
				if (res.get(en) == null || "".equals(res.get(en))) {
					// System.out.println("======为空的字段名===="+en);
					res.remove(en);
				}
			}
		}
		return res;
	}

}
