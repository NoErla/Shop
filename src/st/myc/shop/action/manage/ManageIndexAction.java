package st.myc.shop.action.manage;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import st.myc.shop.constant.SystemConstant;

@Controller
@RequestMapping(value="/manage/index")
public class ManageIndexAction {
	
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String login(HttpServletRequest request, ModelMap modelMap) {
		if(request.getSession().getAttribute(SystemConstant.SESSION_ADMIN) != null){
			return "/manage/index/main";
		}
		return "/manage/login";
	}
	
	/**
	 * 进入tab标签
	 * @return
	 */
	@RequestMapping(value="/tab.htm")
	public String tab(){
		return "/manage/index/tab";
	}

}
