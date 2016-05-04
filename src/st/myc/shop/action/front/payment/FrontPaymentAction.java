package st.myc.shop.action.front.payment;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import st.myc.shop.action.front.BaseAction;
import st.myc.shop.constant.GoodsTypeConstant;
import st.myc.shop.entity.TbOrder;
import st.myc.shop.entity.TbOrderNotice;
import st.myc.shop.entity.vo.TbShoppingcartVo;
import st.unionpay.acp.sdk.DemoBase;
import st.unionpay.acp.sdk.LogUtil;
import st.unionpay.acp.sdk.SDKUtil;

@Controller
@RequestMapping("/payment")
public class FrontPaymentAction extends BaseAction{
	
	@RequestMapping(value = "/toCheckout.htm")
	public String toCheckout(@RequestParam(value = "wantToBuy",defaultValue="0") String wantToBuy,
			HttpServletRequest request,ModelMap modelMap)throws Exception{
		String[] goods = wantToBuy.split(",");
		List<TbShoppingcartVo> list = new ArrayList<TbShoppingcartVo>();
		for(int i=0;i<goods.length;i++){
			list.add(tbShoppingCartService.getShoppingCart(Integer.valueOf(goods[i])));
		}
		modelMap.addAttribute("goodsTypeList", tbGoodsTypeService.getAllType(GoodsTypeConstant.ROOT_TYPE_ID));
		modelMap.addAttribute("addressList", tbUserAddressService.getAddressList(getUser(request).getUserId()));
		modelMap.addAttribute("wantToBuyList", list);
		return "template/checkout";		
	}
	
	@RequestMapping(value = "/createOrder", method = RequestMethod.POST)
	public String createOrder(Integer addressRadios,Integer[] cartId,
			HttpServletRequest request,ModelMap modelMap)throws Exception{
		Integer orderId = tbOrderService.addOrder(getUser(request).getUserId(), addressRadios, cartId);
		
		
		modelMap.addAttribute("goodsTypeList", tbGoodsTypeService.getAllType(GoodsTypeConstant.ROOT_TYPE_ID));
		modelMap.addAttribute("newGoodsList", tbGoodsService.getNewestList());
		modelMap.addAttribute("orderId", orderId);
		return "template/choosePayWay";		
	}
	
	@RequestMapping(value = "/unionpay", method = RequestMethod.POST)
	public String choosePayWay(Integer orderId,
			HttpServletRequest request,HttpServletResponse response,ModelMap modelMap)throws Exception{
		List<TbOrderNotice> noticeList = tbOrderNoticeService.getListByOrderId(orderId);
		TbOrder order = tbOrderService.getById(orderId);
		if(noticeList.size() == 0){
			String html = unionpayService.unionpayLogin(getUser(request).getUserId(),order);
			LogUtil.writeLog("打印请求HTML，此为请求报文，为联调排查问题的依据："+html);
			//将生成的html写到浏览器中完成自动跳转打开银联支付页面；这里调用signData之后，将html写到浏览器跳转到银联页面之前均不能对html中的表单项的名称和值进行修改，如果修改会导致验签不通过
			response.reset();
			response.setCharacterEncoding(DemoBase.encoding_UTF8);
			response.getWriter().write(html);
			return null;
		} else {
			modelMap.addAttribute("goodsTypeList", tbGoodsTypeService.getAllType(GoodsTypeConstant.ROOT_TYPE_ID));
			modelMap.addAttribute("newGoodsList", tbGoodsService.getNewestList());
			return "template/index";					
		}
		
	}

}
