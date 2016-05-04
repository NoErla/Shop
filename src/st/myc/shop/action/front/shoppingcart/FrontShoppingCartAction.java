package st.myc.shop.action.front.shoppingcart;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import st.myc.shop.action.front.BaseAction;
import st.myc.shop.constant.GoodsTypeConstant;
import st.myc.shop.entity.SysAppUser;
import st.myc.shop.entity.TbShoppingcart;
import st.myc.shop.entity.vo.JsonVo;
import st.myc.shop.entity.vo.TbShoppingcartVo;
import st.myc.shop.util.ShoppingCartUtil;

@Controller
@RequestMapping("/shoppingcart")
public class FrontShoppingCartAction extends BaseAction{
	
	@RequestMapping(value = "/add.json")
	@ResponseBody
	public JsonVo<TbShoppingcartVo> add(Integer count,Integer goodsId,
			HttpServletRequest request,ModelMap modelMap)throws Exception{		
		JsonVo<TbShoppingcartVo> json = new JsonVo<TbShoppingcartVo>();
		SysAppUser user = getUser(request);
		TbShoppingcart sc = new TbShoppingcart();
		sc.setGoodsId(goodsId);
		sc.setCount(count);
		sc.setUserId(user.getUserId());
		tbShoppingCartService.addGoodsToCart(sc);
		tbShoppingCartService.updateShoppingCartSession(request);
		json.setResult(true);
		json.setMsg(ShoppingCartUtil.getShoppingCartHTML(tbShoppingCartService.getShoppingCartList(user.getUserId())));	
		return json;		
	}
	
	@RequestMapping(value = "/delete.json")
	@ResponseBody
	public JsonVo<TbShoppingcartVo> delete(Integer id,
			HttpServletRequest request,ModelMap modelMap)throws Exception{		
		JsonVo<TbShoppingcartVo> json = new JsonVo<TbShoppingcartVo>();
		SysAppUser user = getUser(request);
		tbShoppingCartService.deleteGoodsToCart(id);
		tbShoppingCartService.updateShoppingCartSession(request);
		json.setResult(true);
		json.setMsg(ShoppingCartUtil.getShoppingCartHTML(tbShoppingCartService.getShoppingCartList(user.getUserId())));	
		return json;		
	}
	
	@RequestMapping(value = "/update.json")
	@ResponseBody
	public JsonVo<TbShoppingcartVo> update(HttpServletRequest request,ModelMap modelMap)throws Exception{		
		JsonVo<TbShoppingcartVo> json = new JsonVo<TbShoppingcartVo>();
		SysAppUser user = getUser(request);
		json.setResult(true);
		json.setMsg(ShoppingCartUtil.getShoppingCartHTML(tbShoppingCartService.getShoppingCartList(user.getUserId())));	
		return json;		
	}
	
	@RequestMapping(value = "/updateTr.json")
	@ResponseBody
	public JsonVo<TbShoppingcartVo> updateTr(Integer id,Integer count,
			HttpServletRequest request,ModelMap modelMap)throws Exception{		
		JsonVo<TbShoppingcartVo> json = new JsonVo<TbShoppingcartVo>();
		SysAppUser user = getUser(request);
		
		TbShoppingcartVo sc = tbShoppingCartService.getShoppingCart(id);
		sc.setCount(count);
		tbShoppingCartService.updateGoodsToCart(sc);
		tbShoppingCartService.updateShoppingCartSession(request);
		json.setResult(true);
		json.setMsg(ShoppingCartUtil.getShoppingCartTrHTML(tbShoppingCartService.getShoppingCartList(user.getUserId())));	
		return json;	
	}
	
	@RequestMapping(value = "/deleteTr.json")
	@ResponseBody
	public JsonVo<TbShoppingcartVo> deleteTr(Integer id,
			HttpServletRequest request,ModelMap modelMap)throws Exception{		
		JsonVo<TbShoppingcartVo> json = new JsonVo<TbShoppingcartVo>();
		SysAppUser user = getUser(request);

		tbShoppingCartService.deleteGoodsToCart(id);
		tbShoppingCartService.updateShoppingCartSession(request);
		json.setResult(true);
		json.setMsg(ShoppingCartUtil.getShoppingCartTrHTML(tbShoppingCartService.getShoppingCartList(user.getUserId())));	
		return json;	
	}
	
	@RequestMapping(value = "/show.htm")
	public String show(HttpServletRequest request,ModelMap modelMap){
		modelMap.addAttribute("goodsTypeList", tbGoodsTypeService.getAllType(GoodsTypeConstant.ROOT_TYPE_ID));
		return "template/shopping-cart";
	}

}
