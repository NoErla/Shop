package st.myc.shop.action.manage.tbGoodsType;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import st.myc.shop.action.manage.ManageBaseAction;
import st.myc.shop.entity.TbGoodsType;


@Controller
@RequestMapping(value="/manage/tbGoodsType")
public class TbGoodsTypeAction extends ManageBaseAction{
	
	@RequestMapping(value = "/list.htm")
	public String list(@RequestParam(value = "typeId", defaultValue = "0") int typeId,
			ModelMap modelMap){
		
		modelMap.addAttribute("list", tbGoodsTypeService.getAllType(typeId));
		return "manage/tbGoodsType/goods_type_list";
		
	}
	
	@RequestMapping(value = "/toEdit.htm")
	public String toEdit(Integer tbGoodsTypeId,ModelMap modelMap){
		modelMap.addAttribute("types", tbGoodsTypeService.getAllList());
		modelMap.addAttribute("type", tbGoodsTypeService.getTbGoodsTypeById(tbGoodsTypeId));
		return "manage/tbGoodsType/goods_type_edit";
		
	}
	
	@RequestMapping(value = "/toAdd.htm")
	public String toAdd(ModelMap modelMap){	
		modelMap.addAttribute("types", tbGoodsTypeService.getAllList());
		return "manage/tbGoodsType/goods_type_add";
		
	}
	
	@RequestMapping(value = "/editT")
	public String editT(TbGoodsType type,ModelMap modelMap){
		try{
			if(type.getGoodsTypeId() == null){
				tbGoodsTypeService.addGoodsType(type);
				modelMap.addAttribute("msg", "success");				
			} else {
				if(tbGoodsTypeService.getTbGoodsTypeById(type.getGoodsTypeId()) != null){
					tbGoodsTypeService.updateGoodsType(type);
					modelMap.addAttribute("msg", "success");
				} else {
					modelMap.addAttribute("msg", "failed");
				}
			}
		} catch(Exception e){
			modelMap.addAttribute("msg", "failed");
		} finally {
			return "redirect:list.htm";			
		}		
	}
	
	@RequestMapping(value = "/deleteT")
	public String deleteT(Integer goodsTypeId,ModelMap modelMap){
		try{
			if(tbGoodsTypeService.getTbGoodsTypeById(goodsTypeId) != null){
				tbGoodsTypeService.deleteGoodsType(goodsTypeId);
				modelMap.addAttribute("msg", "success");
			} else {
				modelMap.addAttribute("msg", "failed");
			}
		} catch(Exception e){
			modelMap.addAttribute("msg", "failed");
		} finally {
			return "redirect:list.htm";			
		}		
	}

}
