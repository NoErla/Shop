package st.myc.shop.action.manage;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.httpclient.auth.AuthChallengeException;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import st.myc.shop.constant.SystemConstant;
import st.myc.shop.entity.vo.JsonVo;
import st.myc.shop.util.HttpUtils;


@Controller
@RequestMapping("/admin")
public class IndexAction extends ManageBaseAction {

	@RequestMapping(value = "/logout.htm", method = RequestMethod.GET)
	public String adminLogout(HttpServletRequest request, ModelMap modelMap) {
		sysUserService.logout(request);
		return "redirect:" + HttpUtils.getBasePath(request);
	}

	@RequestMapping(value = "", method = RequestMethod.GET)
	public String login(HttpServletRequest request, ModelMap modelMap) {
		if(request.getSession().getAttribute(SystemConstant.SESSION_ADMIN) != null){
			return "/manage/index/main";
		}
		return "/manage/login";
	}
	
	@RequestMapping(value = "/login.htm", method = RequestMethod.GET)
	public String login2(HttpServletRequest request, ModelMap modelMap) {
		if(request.getSession().getAttribute(SystemConstant.SESSION_ADMIN) != null){
			return "/manage/index/main";
		}
		return "/manage/login";
	}
	
	@ResponseBody
	@RequestMapping(value = "/login.json", method = RequestMethod.POST)
	public JsonVo<String> adminLogin(@RequestParam(value = "name") String name,
			@RequestParam(value = "password") String password,
			@RequestParam(value = "captcha") String captcha,
			HttpServletRequest request, ModelMap modelMap) {
		JsonVo<String> json = new JsonVo<String>();

		try {
			String kaptcha = (String) request.getSession().getAttribute(
					com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY);
			// 校验验证码
			if (StringUtils.isNotBlank(kaptcha)
					&& kaptcha.equalsIgnoreCase(captcha)) {
				
			} else {
				throw new AuthChallengeException("errorCode");
			}			

			json.check();

			sysUserService.login(name, password, request);

		} catch (Exception e) {
			// 异常，重置验证码
			request.getSession().removeAttribute(
					com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY);
			json.setResult(false);
			json.setMsg(e.getMessage());
		}
		return json;
	}
		
}
