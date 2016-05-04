package st.myc.shop.action.front.goods;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import st.myc.shop.action.front.BaseAction;
import st.myc.shop.constant.GoodsTypeConstant;
import st.myc.shop.entity.TbGoodsType;

@Controller
@RequestMapping("/goods")
public class FrontGoodsAction extends BaseAction{
	
	@RequestMapping(value = "/{ename}/{goodsId}.htm")
	public String list(@PathVariable String ename, @PathVariable Integer goodsId,
			ModelMap modelMap)throws Exception{
		TbGoodsType type = tbGoodsTypeService.getTbGoodsTypeByEname(ename);
		modelMap.addAttribute("goodsTypeList", tbGoodsTypeService.getAllType(GoodsTypeConstant.ROOT_TYPE_ID));
		modelMap.addAttribute("type", type);
		modelMap.addAttribute("goods", tbGoodsService.getGoodsById(goodsId));
		return "template/item";		
	}

}
