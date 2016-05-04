package st.myc.shop.action.manage.sysUser;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import st.myc.shop.action.manage.ManageBaseAction;
import st.myc.shop.entity.SysUser;
import st.myc.shop.entity.vo.JsonVo;

/** 
 * 系统用户处理
 */
@Controller
@RequestMapping(value="/manage/sysUser")
public class SysUserAction extends ManageBaseAction{
	
	/**
	 * 显示用户列表
	 */
	@RequestMapping(value = "/list.htm")
	public String list(@RequestParam(value = "p", defaultValue = "1") int pageNum,
			String keywords,
			String lastLoginStart,
			String lastLoginEnd,
			ModelMap modelMap)throws Exception{
		try{
			if(keywords == null && lastLoginStart == null && lastLoginEnd == null){
				modelMap.addAttribute("pageVo", sysUserService.getAllListPage(pageNum));				
			} else {
				if(!keywords.isEmpty()){
					keywords = keywords.trim();
				}
				if(!lastLoginStart.isEmpty()){
					lastLoginStart = lastLoginStart+" 00:00:00";
				}
				if(!lastLoginEnd.isEmpty()){
					lastLoginEnd = lastLoginEnd+" 00:00:00";
				}
				modelMap.addAttribute("pageVo", sysUserService.search(keywords, lastLoginStart, lastLoginEnd, pageNum));
			}
		} catch(Exception e){
			e.printStackTrace();
		}
		return "manage/sysUser/user_list";
	}
	
	/**
	 * 进入编辑用户界面
	 */
	@RequestMapping(value = "/goEditU.htm")
	public String goEditU(int userId,ModelMap modelMap)throws Exception{
		try{
			modelMap.addAttribute("user", sysUserService.getSysUserById(userId));
		} catch(Exception e){
		}
		return "manage/sysUser/user_edit";
	}
	
	/**保存用户
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/saveU")
	public String saveU(SysUser sysUser,ModelMap modelMap) throws Exception{
		if(sysUser.getUserId() == null){
			sysUserService.addSysUser(sysUser);		
			modelMap.addAttribute("msg", "success");	
		} else {
			if(sysUserService.getSysUserById(sysUser.getUserId()) != null){
				sysUserService.updateSysUserById(sysUser);
				modelMap.addAttribute("msg", "success");	
			} else {
				modelMap.addAttribute("msg", "failed");
			}	
		}
		return "manage/save_result";
	}
	
	/**判断用户名是否存在
	 */
	@RequestMapping(value="/hasU")
	@ResponseBody
	public JsonVo<SysUser> hasU(String username){
		JsonVo<SysUser> jsonVo = new JsonVo<SysUser>();
		jsonVo.setResult(true);	
		try{
			if(sysUserService.getByUsername(username) != null){
				jsonVo.setResult(false);	
			}
		} catch(Exception e){
			e.printStackTrace();
		}
		return jsonVo;
	}
	
	/**
	 * 进入新增用户界面
	 */
	@RequestMapping(value = "/goAddU.htm")
	public String goAddU(ModelMap modelMap)throws Exception{
		modelMap.addAttribute("user", new SysUser());
		return "manage/sysUser/user_edit";
	}
	
	/**
	 * 删除
	 */
	@SuppressWarnings("finally")
	@RequestMapping(value = "/deleteU")
	public String deleteU(Integer userId,ModelMap modelMap){
		try{
			sysUserService.deleteSysUser(userId);
			modelMap.addAttribute("msg","success");
		} catch (Exception e){
			modelMap.addAttribute("msg","failed");
		} finally {
			return "manage/save_result";		
		}
	}
	
}
