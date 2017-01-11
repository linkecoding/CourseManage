package com.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.Teacher;

public class CheckSessionFilter implements Filter{
	private String notPermitUrls[]=null;
	private boolean ignore=false;
	private String gotoUrl=null;
	

	@Override
	public void destroy() {
		notPermitUrls=null;
        ignore=false;
        gotoUrl=null;
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest res=(HttpServletRequest) request;
        HttpServletResponse resp=(HttpServletResponse)response;
        
        String path = res.getContextPath();
    	String basePath = res.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
        if(!ignore){
                if(isNotPermitUrl(request)){
                    if(filterCurrUrl(request)){
                        resp.sendRedirect(basePath+gotoUrl);
                        return ;
                    }
                }
        }
        chain.doFilter(request, response);
	}
	
	public boolean isNotPermitUrl(ServletRequest request){
        boolean isNotPermit=false;
        
        if(notPermitUrls!=null&&notPermitUrls.length>0){
            for (int i = 0; i < notPermitUrls.length; i++) {
                if(notPermitUrls[i].equals(currentUrl(request))){
                    isNotPermit=true;
                    break;
                }
                System.out.println("p " + notPermitUrls[i]);
            }
        }
        return isNotPermit;
    }
    
    public boolean filterCurrUrl(ServletRequest request){
        
        boolean filter=false;
        HttpServletRequest res=(HttpServletRequest) request;
        Teacher teacher =(Teacher) res.getSession().getAttribute("teacher_info");
        if(null==teacher)
            filter=true;
        
        return filter;
    }
    
    public String currentUrl(ServletRequest request){
        
        HttpServletRequest res=(HttpServletRequest) request;
        String task=request.getParameter("task");
        String path=res.getContextPath();
        String uri=res.getRequestURI();
        if(task!=null){//uri格式 xx/ser
            uri=uri.substring(path.length(), uri.length())+"?"+"task="+task;
        }else{
            uri=uri.substring(path.length(), uri.length());
        }
        System.out.println("当前请求地址:"+uri);
        return uri;
    }
    
    
        

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		String ignore =filterConfig.getInitParameter("ignore");
        String notPermitUrls =filterConfig.getInitParameter("notPermitUrls");
        String gotoUrl =filterConfig.getInitParameter("gotoUrl");
        
         if ("1".equals(ignore) || "yes".equals(ignore)||"true".equals(ignore)) {
                this.ignore = true;
            }
         if(notPermitUrls!=null&&notPermitUrls.length()>0);
             this.notPermitUrls = notPermitUrls.split(",");
             
         this.gotoUrl=gotoUrl;
	}

}
