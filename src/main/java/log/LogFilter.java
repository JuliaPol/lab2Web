package log;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

/**
 * Created by Julia on 12.11.2016.
 */
public class LogFilter implements Filter {

    private ServletContext conteхt;
    public LogFilter() {}
    public void destroy() {}

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chаin) throws IOException, ServletException {
        HttpServletRequest httpReq = (HttpServletRequest) request;
        String ip = httpReq.getRemoteAddr();
        String uri = httpReq.getRequestURI();
        conteхt.log("ip: " + ip + ", uri: " + uri);
        chаin.doFilter(request, response);
    }

    public void init(FilterConfig config) throws ServletException {
        conteхt = config.getServletContext();
    }
}
