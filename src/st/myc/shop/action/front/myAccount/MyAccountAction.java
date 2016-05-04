package st.myc.shop.action.front.myAccount;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import st.myc.shop.action.front.BaseAction;
import st.myc.shop.constant.GoodsTypeConstant;
import st.myc.shop.entity.SysAppUser;
import st.myc.shop.entity.TbUserAddress;
import st.myc.shop.entity.vo.JsonVo;
import st.myc.shop.util.AuthUtils;

@Controller
@RequestMapping("/myaccount")
public class MyAccountAction extends BaseAction{
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String defalut(Integer addressId,HttpServletRequest request, ModelMap modelMap) {
		modelMap.addAttribute("goodsTypeList", tbGoodsTypeService.getAllType(GoodsTypeConstant.ROOT_TYPE_ID));
		modelMap.addAttribute("addressList", tbUserAddressService.getAddressList(getUser(request).getUserId()));
		modelMap.addAttribute("orderList", tbOrderService.getVoByUserId(getUser(request).getUserId()));
		if(addressId != null){
			modelMap.addAttribute("addressInfo", tbUserAddressService.getAddressById(addressId));
		} else {
			modelMap.addAttribute("addressInfo", new TbUserAddress());
		}
		return "template/my-account";
	}
	
	@RequestMapping(value = "/addAddress.json", method = RequestMethod.POST)
	@ResponseBody
	public JsonVo<TbUserAddress> addAddress(TbUserAddress address,
			HttpServletRequest request, ModelMap modelMap) {
		JsonVo<TbUserAddress> json = new JsonVo<TbUserAddress>();
		address.setUserId(getUser(request).getUserId());
		if(address.getAddressId() == null ){
			tbUserAddressService.addAddress(address);
		} else {
			tbUserAddressService.updateAddress(address);
		}
		
		json.setResult(true);
		return json;
	}
	
	@RequestMapping(value = "/deleteAddress.json", method = RequestMethod.POST)
	@ResponseBody
	public JsonVo<TbUserAddress> deleteAddress(Integer addressId,
			HttpServletRequest request, ModelMap modelMap) {
		JsonVo<TbUserAddress> json = new JsonVo<TbUserAddress>();		
		tbUserAddressService.deleteAddress(addressId);		
		json.setResult(true);
		return json;
	}
	
	@RequestMapping(value = "/updatePwd.json", method = RequestMethod.POST)
	@ResponseBody
	public JsonVo<TbUserAddress> updatePwd(String oldPassword,String newPassword,String rePassword,
			HttpServletRequest request, ModelMap modelMap) {
		JsonVo<TbUserAddress> json = new JsonVo<TbUserAddress>();
		SysAppUser user = sysAppUserService.getSysAppUserById(getUser(request).getUserId());
		if(!newPassword.equals(rePassword)){
			json.setResult(false);
			json.setMsg("新密码与确认密码不一致");
		} else {
			if(user.getPassword().equals(AuthUtils.MD5(oldPassword, user.getSalt()))){
				user.setPassword(newPassword);
				sysAppUserService.updateSysAppUserById(user);
				json.setResult(true);
			} else {
				json.setResult(false);
				json.setMsg("原密码错误");
			}			
		}
		return json;
	}
	
	

}
