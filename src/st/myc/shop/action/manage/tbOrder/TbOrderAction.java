package st.myc.shop.action.manage.tbOrder;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import st.myc.shop.action.manage.ManageBaseAction;
import st.myc.shop.entity.TbOrder;


@Controller
@RequestMapping(value="/manage/tbOrder")
public class TbOrderAction extends ManageBaseAction{
	
	@RequestMapping(value = "/list.htm")
	public String list(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
			@RequestParam(value = "isPaid", defaultValue = "0") int isPaid,
			@RequestParam(value = "isSend", defaultValue = "0") int isSend,
			ModelMap modelMap){
		TbOrder order = new TbOrder();
		order.setIsPaid(isPaid);
		order.setIsSend(isSend);
		modelMap.addAttribute("pageVo", tbOrderService.getDynamicPage(order, pageNum));		
		return "manage/tbOrder/order_list";
		
	}
	
	@RequestMapping(value = "/cancelSendO")
	public String cancelSendO(Integer orderId,
			ModelMap modelMap){
		try{
			TbOrder order = new TbOrder();
			order.setOrderId(orderId);
			order.setIsSend(0);
			tbOrderService.updateOrder(order);
			modelMap.addAttribute("msg","success");
		} catch (Exception e){
			modelMap.addAttribute("msg","failed");
		} finally {
			return "manage/save_result";		
		}
		
	}
	
	@RequestMapping(value = "/sendO")
	public String SendO(Integer orderId,
			ModelMap modelMap){
		try{
			TbOrder order = new TbOrder();
			order.setOrderId(orderId);
			order.setIsSend(1);
			tbOrderService.updateOrder(order);
			modelMap.addAttribute("msg","success");
		} catch (Exception e){
			modelMap.addAttribute("msg","failed");
		} finally {
			return "manage/save_result";		
		}
		
	}
	
	

}
