package st.myc.shop.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.multipart.MaxUploadSizeExceededException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.SimpleMappingExceptionResolver;

/**
 * 总错误处理
 * @author wuyb
 *
 */
public class MySimpleMappingExceptionResolver extends
SimpleMappingExceptionResolver {

/**
* 日志
*/
private static Log log = LogFactory.getLog(MySimpleMappingExceptionResolver.class);

	@Override
	protected ModelAndView doResolveException(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex) {
		// Expose ModelAndView for chosen error view.
		String viewName = determineViewName(ex, request);
		if (viewName != null) {// JSP格式返回
			if (!(request.getHeader("accept").indexOf("application/json") > -1 || (request
					.getHeader("X-Requested-With") != null && request
					.getHeader("X-Requested-With").indexOf("XMLHttpRequest") > -1))) {
				// 如果不是异步请求
				if (ex instanceof MaxUploadSizeExceededException) {
					return super.doResolveException(request, response, handler,
							ex);
				}
				log.error("系统内部错误", ex);
				return super.doResolveException(request, response, handler,
						new Exception("系统内部错误，请联系管理员。"));
			} else {// JSON格式返回
				try {
					PrintWriter writer = response.getWriter();
					writer.write(ex.getMessage());
					writer.flush();
				} catch (IOException e) {
					log.error("总错误处理出错：" + e.getMessage(), e);
				}
				return null;

			}
		} else {
			return null;
		}

	}
}
