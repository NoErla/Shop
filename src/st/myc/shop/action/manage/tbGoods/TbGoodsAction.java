package st.myc.shop.action.manage.tbGoods;

import java.io.IOException;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import st.myc.shop.action.manage.ManageBaseAction;
import st.myc.shop.entity.TbGoods;

/** 
 * 商品action
 */
@Controller
@RequestMapping(value="/manage/tbGoods")
public class TbGoodsAction extends ManageBaseAction{
	
	/**
	 * 显示商品
	 */
	@RequestMapping(value = "/list.htm")
	public String list(@RequestParam(value = "p", defaultValue = "1") int pageNum,
			Integer goodsTypeId,
			ModelMap modelMap)throws Exception{
		try{
			modelMap.addAttribute("types", tbGoodsTypeService.getAllList());
			modelMap.addAttribute("pageVo", tbGoodsService.getPageByType(goodsTypeId, pageNum));
		} catch(Exception e){
			e.printStackTrace();
		}
		return "manage/tbGoods/goods_list";
	}
	
	@RequestMapping(value = "/toAdd.htm")
	public String toAdd(ModelMap modelMap) {
		modelMap.addAttribute("types", tbGoodsTypeService.getAllList());
		return "manage/tbGoods/goods_add";		
	}
	
	@RequestMapping(value = "/toEdit.htm")
	public String toEdit(int goodsId,ModelMap modelMap) {
		modelMap.addAttribute("types", tbGoodsTypeService.getAllList());
		modelMap.addAttribute("goods", tbGoodsService.getGoodsById(goodsId));
		return "manage/tbGoods/goods_edit";		
	}
	
	@RequestMapping(value = "/editG", method = RequestMethod.POST)
	public String editG(TbGoods goods,
			@RequestParam(value = "file", required = false) MultipartFile file) throws IOException {
		if(goods.getGoodsId() == null){
			tbGoodsService.addGoods(goods,file);
		} else {
			tbGoodsService.updateGoods(goods);
		}
		return "redirect:list.htm";		
	}
	
	@RequestMapping(value = "/deleteG")
	public String deleteG(int goodsId, ModelMap modelMap) {
		try{
			if(tbGoodsService.getGoodsById(goodsId) != null){
				tbGoodsService.deleteGoods(goodsId);
				modelMap.addAttribute("msg", "success");
			} else {
				modelMap.addAttribute("msg", "failed");
			}			
		} catch(Exception e){
			e.printStackTrace();
			modelMap.addAttribute("msg", "failed");
		} finally {
			return "redirect:list.htm";					
		}

	}
	

}
