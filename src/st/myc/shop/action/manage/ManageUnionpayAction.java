package st.myc.shop.action.manage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import st.myc.shop.entity.Deal;
import st.myc.shop.entity.vo.JsonVo;

@Controller
@RequestMapping(value="/manage/unionpay")
public class ManageUnionpayAction extends ManageBaseAction{
	
	/**
	 * 退款
	 * @param orderId
	 * @param request
	 * @param modelMap
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/refund.json" , method = RequestMethod.POST)
	public JsonVo<Deal> refund(int orderId,HttpServletRequest request, ModelMap modelMap){
		JsonVo<Deal> json = new JsonVo<Deal>();
		
		dealService.refund(orderId, json);
		
		return json;
	}
	
	
	/**
	 * 发起后台查询
	 */
	@RequestMapping(value = "/query", method = RequestMethod.GET)
    public void query(String orderId,HttpServletRequest request, HttpServletResponse response ,ModelMap modelMap){
		try{
			
				//unionpayService.query(Integer.valueOf(orderId));
		}catch(Exception e){
			return;
		}
	}
	
	
}
