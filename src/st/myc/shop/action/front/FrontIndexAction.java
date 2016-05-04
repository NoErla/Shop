package st.myc.shop.action.front;

import java.awt.image.BufferedImage;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.httpclient.auth.AuthChallengeException;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import st.myc.shop.constant.GoodsTypeConstant;
import st.myc.shop.constant.SystemConstant;
import st.myc.shop.entity.SysAppUser;
import st.myc.shop.entity.vo.JsonVo;
import st.myc.shop.util.HttpUtils;

import com.google.code.kaptcha.impl.DefaultKaptcha;

@Controller
public class FrontIndexAction extends BaseAction{
	
	/**
	 * Kaptcha 验证码
	 */
	@Autowired
	private DefaultKaptcha captchaProducer;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String defalut(HttpServletRequest request, ModelMap modelMap) {
		modelMap.addAttribute("goodsTypeList", tbGoodsTypeService.getAllType(GoodsTypeConstant.ROOT_TYPE_ID));
		modelMap.addAttribute("newGoodsList", tbGoodsService.getNewestList());
		return "template/index";
	}
	
	/**
	 * 生成验证码
	 *
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping(value = "/captcha.htm", method = RequestMethod.GET)
	public void captcha(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		response.setDateHeader("Expires", 0);
		response.setHeader("Cache-Control",
				"no-store, no-cache, must-revalidate");
		response.addHeader("Cache-Control", "post-check=0, pre-check=0");
		response.setHeader("Pragma", "no-cache");
		response.setContentType("image/jpeg");

		String capText = captchaProducer.createText();
		request.getSession().setAttribute(
				com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY, capText);
		BufferedImage bi = captchaProducer.createImage(capText);
		ServletOutputStream out = response.getOutputStream();
		ImageIO.write(bi, "jpg", out);
		try {
			out.flush();
		} finally {
			out.close();
		}
	}
	
	@RequestMapping(value = "/login.htm", method = RequestMethod.GET)
	public String login2(HttpServletRequest request, ModelMap modelMap) {
		modelMap.addAttribute("goodsTypeList", tbGoodsTypeService.getAllType(GoodsTypeConstant.ROOT_TYPE_ID));
		modelMap.addAttribute("newGoodsList", tbGoodsService.getNewestList());
		if(getUser(request) != null){
			return "template/index";
		} else {
			return "/template/login";		
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "/login.json", method = RequestMethod.POST)
	public JsonVo<String> adminLogin(@RequestParam(value = "username") String username,
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

			sysAppUserService.login(username, password, request);

		} catch (Exception e) {
			// 异常，重置验证码
			request.getSession().removeAttribute(
					com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY);
			json.setResult(false);
			json.setMsg(e.getMessage());
		}
		return json;
	}

	
	@RequestMapping(value = "/logout.htm", method = RequestMethod.GET)
	public String adminLogout(HttpServletRequest request, ModelMap modelMap) {
		sysAppUserService.logout(request);
		return "redirect:" + HttpUtils.getBasePath(request);
	}
	
	@RequestMapping(value = "/register.htm", method = RequestMethod.GET)
	public String register(HttpServletRequest request, ModelMap modelMap) {
		modelMap.addAttribute("goodsTypeList", tbGoodsTypeService.getAllType(GoodsTypeConstant.ROOT_TYPE_ID));
		if(request.getSession().getAttribute(SystemConstant.SESSION_USER) != null){
			return "/template/index";
		}
		return "/template/register";
	}
	
	@ResponseBody
	@RequestMapping(value = "/register.json", method = RequestMethod.POST)
	public JsonVo<String> register(SysAppUser sysAppUser,
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

			sysAppUserService.addUser(sysAppUser);
			json.setResult(true);

		} catch (Exception e) {
			// 异常，重置验证码
			request.getSession().removeAttribute(
					com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY);
			json.setResult(false);
			json.setMsg(e.getMessage());
		}
		return json;
	}
	
	@RequestMapping(value = "/error/{statusCode}.htm", method = RequestMethod.GET)
	public String pageNotFound(@PathVariable String statusCode,ModelMap modelMap) {
		modelMap.addAttribute("goodsTypeList", tbGoodsTypeService.getAllType(GoodsTypeConstant.ROOT_TYPE_ID));
		if(statusCode.equals("404")){
			return "template/404";
		} else if(statusCode.equals("500")){
			return "template/500";
		} else if(statusCode.equals("400")){
			return "template/400";
		} else {
			return "template/404";
		}
	}
}
