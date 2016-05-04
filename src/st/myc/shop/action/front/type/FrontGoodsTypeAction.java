package st.myc.shop.action.front.type;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import st.myc.shop.action.front.BaseAction;
import st.myc.shop.constant.GoodsTypeConstant;
import st.myc.shop.entity.TbGoodsType;

@Controller
@RequestMapping("/type")
public class FrontGoodsTypeAction extends BaseAction{
	
	@RequestMapping(value = "/{ename}.htm")
	public String list(@RequestParam(value = "p", defaultValue = "1") int pageNum,
			@PathVariable String ename, ModelMap modelMap)throws Exception{
		TbGoodsType type = tbGoodsTypeService.getTbGoodsTypeByEname(ename);
		modelMap.addAttribute("pageVo", tbGoodsService.getPageByType(type.getGoodsTypeId(), pageNum));
		modelMap.addAttribute("goodsTypeList", tbGoodsTypeService.getAllType(GoodsTypeConstant.ROOT_TYPE_ID));
		modelMap.addAttribute("type", type);
		return "template/productList";		
	}

}
