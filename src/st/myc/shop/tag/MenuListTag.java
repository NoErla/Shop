/*
 *	Copyright © 2013 Changsha Shishuo Network Technology Co., Ltd. All rights reserved.
 *	长沙市师说网络科技有限公司 版权所有
 *	http://www.shishuo.com
 */

package st.myc.shop.tag;

import static freemarker.template.ObjectWrapper.DEFAULT_WRAPPER;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import st.myc.shop.entity.SysMenu;
import st.myc.shop.entity.vo.SysMenuVo;
import st.myc.shop.plugin.TagPlugin;
import st.myc.shop.service.menu.impl.SysMenuServiceImpl;
import freemarker.core.Environment;
import freemarker.template.TemplateDirectiveBody;
import freemarker.template.TemplateException;
import freemarker.template.TemplateModel;

/**
 * folder标签
 * 
 * @author lqq
 * 
 */
@Service
public class MenuListTag extends TagPlugin {
	
	@Autowired
	private SysMenuServiceImpl sysMenuService;

	public void execute(Environment env, Map params, TemplateModel[] loopVars,
			TemplateDirectiveBody body) throws TemplateException, IOException {

		int menuId = 0;
		List<SysMenuVo> list = new ArrayList<SysMenuVo>();
		// 获取页面的参数
		try {
			menuId = Integer.valueOf(params.get("menuId").toString());
			list = sysMenuService.listAllMenu(menuId);
		} catch (Exception e) {
			// 丢弃
		}
		env.setVariable("tag_menu_list", DEFAULT_WRAPPER.wrap(list));
		body.render(env.getOut());
	}

}
