package st.myc.shop.action.manage;

import javax.naming.AuthenticationException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import st.myc.shop.constant.Constants;
import st.myc.shop.entity.Deal;
import st.myc.shop.entity.vo.DealVo;
import st.myc.shop.entity.vo.JsonVo;
import st.myc.shop.entity.vo.PageVo;

@Controller
@RequestMapping(value="/manage/deal")
public class ManageDealAction extends ManageBaseAction{

	/**
	 * 管理员查看订单
	 */
	@RequestMapping(value="/lookDeal.htm")
	public String lookDeal(@RequestParam(value = "p", defaultValue = "1") int pageNum,HttpServletRequest request, ModelMap modelMap){

		PageVo<DealVo> dealVoList = dealService.getManageDeal(pageNum);
		modelMap.addAttribute("dealList", dealVoList);
		modelMap.addAttribute("pageNum", pageNum);
		return "/manage/orderManage/orderManage";
	}
	
	/**
	 * 管理员删除订单
	 */
	@ResponseBody
	@RequestMapping(value="/delete.json")
	public JsonVo<Deal> delete(int orderId,HttpServletRequest request, ModelMap modelMap){
		JsonVo<Deal> json = new JsonVo<Deal>();

		try {
			dealService.cancelDeal(orderId);
			json.setResult(true);
			json.setMsg("已删除");
		} catch (AuthenticationException e) {
			json.setResult(false);
			json.setMsg(e.getMessage());
		}
		
		
		return json;
	}
	
	
	
	/**
	 * 按用户排
	 */
	@RequestMapping(value="/lookDealByUser.htm" , method = RequestMethod.GET)
	public String lookDealByUser(@RequestParam(value = "p", defaultValue = "1") int pageNum,HttpServletRequest request, ModelMap modelMap){
		PageVo<DealVo> pageVo = dealService.getManageDealByUser(pageNum);
		String orderDescript = Constants.ORDERNAME;
		modelMap.addAttribute("orderDescript", orderDescript);
		modelMap.addAttribute("dealList", pageVo);
		modelMap.addAttribute("pageNum", pageNum);
		return "/manage/orderManage/orderManage";
	}
	
	/**
	 * 按金额从大到小
	 */
	@RequestMapping(value="/lookDealByMoneyDesc.htm" , method = RequestMethod.GET)
	public String lookDealByMoneyDesc(@RequestParam(value = "p", defaultValue = "1") int pageNum,HttpServletRequest request, ModelMap modelMap){
		PageVo<DealVo> pageVo = dealService.getManageDealByMoneyDesc(pageNum);
		String orderDescript = Constants.ORDERNAME;
		modelMap.addAttribute("orderDescript", orderDescript);
		modelMap.addAttribute("dealList", pageVo);
		modelMap.addAttribute("pageNum", pageNum);
		return "/manage/orderManage/orderManage";
	}
	
	/**
	 * 按金额从小到大
	 */
	@RequestMapping(value="/lookDealByMoneyAsc.htm" , method = RequestMethod.GET)
	public String lookDealByMoneyAsc(@RequestParam(value = "p", defaultValue = "1") int pageNum,HttpServletRequest request, ModelMap modelMap){
		PageVo<DealVo> pageVo = dealService.getManageDealByMoneyAsc(pageNum);
		String orderDescript = Constants.ORDERNAME;
		modelMap.addAttribute("orderDescript", orderDescript);
		modelMap.addAttribute("dealList", pageVo);
		modelMap.addAttribute("pageNum", pageNum);
		return "/manage/orderManage/orderManage";
	}
	
	/**
	 * 按金额大于5000
	 */
	@RequestMapping(value="/lookDealByMoneyFive.htm" , method = RequestMethod.GET)
	public String lookDealByMoneyFive(@RequestParam(value = "p", defaultValue = "1") int pageNum,HttpServletRequest request, ModelMap modelMap){
		PageVo<DealVo> pageVo = dealService.getManageDealByMoneyFive(pageNum);
		String orderDescript = Constants.ORDERNAME;
		modelMap.addAttribute("orderDescript", orderDescript);
		modelMap.addAttribute("dealList", pageVo);
		modelMap.addAttribute("pageNum", pageNum);
		return "/manage/orderManage/orderManage";
	}
	
	/**
	 * 已支付订单
	 */
	@RequestMapping(value="/lookDealSuccess.htm" , method = RequestMethod.GET)
	public String lookDealSuccess(@RequestParam(value = "p", defaultValue = "1") int pageNum,HttpServletRequest request, ModelMap modelMap){
		PageVo<DealVo> pageVo = dealService.getManageDealSuccess(pageNum);
		String orderDescript = Constants.ORDERNAME;
		modelMap.addAttribute("orderDescript", orderDescript);
		modelMap.addAttribute("dealList", pageVo);
		modelMap.addAttribute("pageNum", pageNum);
		return "/manage/orderManage/orderManage";
	}
	
	/**
	 * 未支付订单
	 */
	@RequestMapping(value="/lookDealFail.htm" , method = RequestMethod.GET)
	public String lookDealFail(@RequestParam(value = "p", defaultValue = "1") int pageNum,HttpServletRequest request, ModelMap modelMap){
		PageVo<DealVo> pageVo = dealService.getManageDealFail(pageNum);
		String orderDescript = Constants.ORDERNAME;
		modelMap.addAttribute("orderDescript", orderDescript);
		modelMap.addAttribute("dealList", pageVo);
		modelMap.addAttribute("pageNum", pageNum);
		return "/manage/orderManage/orderManage";
	}
	
	/**
	 * 删除订单
	 */
	@RequestMapping(value="/lookDealDelete.htm" , method = RequestMethod.GET)
	public String lookDealDelete(@RequestParam(value = "p", defaultValue = "1") int pageNum,HttpServletRequest request, ModelMap modelMap){
		PageVo<DealVo> pageVo = dealService.getManageDealDelete(pageNum);
		String orderDescript = Constants.ORDERNAME;
		modelMap.addAttribute("orderDescript", orderDescript);
		modelMap.addAttribute("dealList", pageVo);
		modelMap.addAttribute("pageNum", pageNum);
		return "/manage/orderManage/orderManage";
	}
	
	
	/**
	 * 退款中订单
	 */
	@RequestMapping(value="/lookDealRefund.htm" , method = RequestMethod.GET)
	public String lookDealRefund(@RequestParam(value = "p", defaultValue = "1") int pageNum,HttpServletRequest request, ModelMap modelMap){
		PageVo<DealVo> pageVo = dealService.getManageDealRefund(pageNum);
		String orderDescript = Constants.ORDERNAME;
		modelMap.addAttribute("orderDescript", orderDescript);
		modelMap.addAttribute("dealList", pageVo);
		modelMap.addAttribute("pageNum", pageNum);
		return "/manage/orderManage/orderManage";
	}
	
	
	/**
	 * 已退款订单
	 */
	@RequestMapping(value="/lookDealRefundEd.htm" , method = RequestMethod.GET)
	public String lookDealRefundEd(@RequestParam(value = "p", defaultValue = "1") int pageNum,HttpServletRequest request, ModelMap modelMap){
		PageVo<DealVo> pageVo = dealService.getManageDealRefundEd(pageNum);
		String orderDescript = Constants.ORDERNAME;
		modelMap.addAttribute("orderDescript", orderDescript);
		modelMap.addAttribute("dealList", pageVo);
		modelMap.addAttribute("pageNum", pageNum);
		return "/manage/orderManage/orderManage";
	}
	/**
	 * 按订单id进行查询
	 */
	@RequestMapping(value="/lookDealByOrderId.htm",method =RequestMethod.POST)
	public String lookDealByPaymentId(HttpServletRequest request, ModelMap modelMap){
		int orderId = Integer.parseInt(request.getParameter("orderId"));
		int pageNum = 1;
		PageVo<DealVo> pageVo = dealService.getManageDealByOrderId(orderId,pageNum);
		String orderDescript = Constants.ORDERNAME;
		modelMap.addAttribute("orderDescript", orderDescript);
		modelMap.addAttribute("dealList", pageVo);
		modelMap.addAttribute("pageNum", pageNum);
		return "/manage/orderManage/orderManage";
	}
	

	
	
	
	
}
