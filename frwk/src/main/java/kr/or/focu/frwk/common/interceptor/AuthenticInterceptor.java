package kr.or.focu.frwk.common.interceptor;
import lombok.extern.slf4j.Slf4j;
import org.egovframe.rte.fdl.access.service.EgovUserDetailsHelper;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndViewDefiningException;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Slf4j
public class AuthenticInterceptor extends HandlerInterceptorAdapter {

    /**
     * 인증된 사용자 여부로 인증 여부를 체크한다.
     * 관리자 권한에 따라 접근 페이지 권한을 체크한다.
     */
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        log.info("authcheck:{}", request.getRequestURL());
        log.info("session:{}", request.getSession().getAttribute("loginVO"));
        //인증된사용자 여부
        boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
        //미민증사용자 체크
        if(!isAuthenticated) {
            log.info("not valid session.");
            ModelAndView modelAndView = new ModelAndView("redirect:/login.do");
            throw new ModelAndViewDefiningException(modelAndView);
        }
        return true;
    }


}

