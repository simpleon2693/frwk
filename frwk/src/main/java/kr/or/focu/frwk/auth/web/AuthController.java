package kr.or.focu.frwk.auth.web;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.service.EgovProperties;
import kr.or.focu.frwk.auth.service.AuthService;
import kr.or.focu.frwk.auth.service.LoginVO;
import kr.or.focu.frwk.auth.service.ProviderType;
import kr.or.focu.frwk.auth.service.UserType;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.math.BigInteger;
import java.security.SecureRandom;

@Slf4j
@RequestMapping("/")
@Controller
public class AuthController {

    /** EgovMessageSource */
    @Resource(name = "egovMessageSource")
    EgovMessageSource egovMessageSource;

    @Resource(name = "authService")
    private AuthService authService;

    public static final String naverCallbackUrl = EgovProperties.getProperty("oauth.naver.auth.callback");
    public static final String naverBaseUrl = EgovProperties.getProperty("oauth.naver.auth.baseurl");
    public static final String naverClientId = EgovProperties.getProperty("oauth.naver.client.id");


    public static final String kakaoCallbackUrl = EgovProperties.getProperty("oauth.kakao.auth.callback");
    public static final String kakaoBaseUrl = EgovProperties.getProperty("oauth.kakao.auth.baseurl");
    public static final String kakaoClientId = EgovProperties.getProperty("oauth.kakao.client.id");

    public static final String googleCallbackUrl = EgovProperties.getProperty("oauth.google.auth.callback");

    public static final String googleBaseUrl = EgovProperties.getProperty("oauth.google.auth.baseurl");
    public static final String googleClientId = EgovProperties.getProperty("oauth.google.client.id");


    @RequestMapping("/login.do")
    public String viewLogin() throws Exception {



        return "login";
    }

    @PostMapping("/doLogin.do")
    public String processLogin(@ModelAttribute("loginVO")LoginVO loginVO, HttpSession session, ModelMap model) throws Exception {

        // 2. 로그인 처리
        LoginVO resultVO = authService.actionLogin(loginVO);

        // 3. 일반 로그인 처리
        if (resultVO != null) {
            // 3-1. 로그인 정보를 세션에 저장
            session.setAttribute("loginVO", resultVO);
            // 2019.10.01 로그인 인증세션 추가
//            request.getSession().setAttribute("accessUser", resultVO.getUserSe().concat(resultVO.getId()));
            return "redirect:/index.do";

        } else {


            //model.addAttribute("loginMessage", egovMessageSource.getMessage("fail.common.login",request.getLocale()));
            return "redirect:/login.do";
        }
    }


    @GetMapping("/auth/naver.do")
    public String handleNaverLogin(){
        SecureRandom random = new SecureRandom();
        String state = new BigInteger(130, random).toString(32);

        StringBuffer url = new StringBuffer();
        url.append(naverBaseUrl);
        url.append("/authorize?");
        url.append("client_id=").append(naverClientId);
        url.append("&response_type=code");
        url.append("&redirect_uri=").append(naverCallbackUrl);
        url.append("&state="+state);

        return "redirect:"+url;
    }

    @GetMapping("/auth/naver/callback.do")
    public void handleNaverCallback(String code, String state, HttpSession session, HttpServletResponse response) throws Exception {
        // get profile after get token
        String snsId = authService.handleNaverCallback(state, code);
        if(snsId != null){
            LoginVO user = authService.findSnsUser(snsId, ProviderType.NAVER);
            if(user==null){
                //signup
                user = LoginVO.builder()
                        .userId(snsId)
                        .userType(UserType.PERSONAL)
                        .providerType(ProviderType.NAVER)
                        .build();

                authService.insertUser(user);
                user = authService.findSnsUser(snsId, ProviderType.NAVER);

            }
            // make session
            session.setAttribute("loginVO", user);
            log.info("successfully signed in : {}.", user);
            PrintWriter out = response.getWriter();
            out.println("<script>window.opener.location.href='/';self.close()</script>");
            out.flush();

        }else{
            throw new Exception();
        }
    }


    @GetMapping("/auth/kakao.do")
    public String handleKakaoLogin(){

        StringBuffer url = new StringBuffer();
        url.append(kakaoBaseUrl);
        url.append("/authorize?");
        url.append("client_id=").append(kakaoClientId);
        url.append("&response_type=code");
        url.append("&redirect_uri=").append(kakaoCallbackUrl);

        return "redirect:"+url;
    }

    @GetMapping("/auth/kakao/callback.do")
    public void handlekakaoCallback(String code, HttpSession session, HttpServletResponse response) throws Exception {
        // get profile after get token
        String snsId = authService.handleKakaoCallback(code);
        if(snsId != null){
            LoginVO user = authService.findSnsUser(snsId, ProviderType.KAKAO);
            if(user==null){
                //signup
                user = LoginVO.builder()
                        .userId(snsId)
                        .userType(UserType.PERSONAL)
                        .providerType(ProviderType.KAKAO)
                        .build();

                authService.insertUser(user);
                user = authService.findSnsUser(snsId, ProviderType.KAKAO);

            }
            // make session
            session.setAttribute("loginVO", user);
            log.info("successfully signed in.");
            PrintWriter out = response.getWriter();
            out.println("<script>window.opener.location.href='/';self.close()</script>");
            out.flush();

        }else{
            throw new Exception();
        }

    }


    @GetMapping("/auth/google.do")
    public String handleGoogleLogin(){

        StringBuffer url = new StringBuffer();
        url.append(googleBaseUrl);
        url.append("/auth?");
        url.append("client_id=").append(googleClientId);
        url.append("&response_type=code");
        url.append("&redirect_uri=").append(googleCallbackUrl);
        url.append("&scope=").append("https://www.googleapis.com/auth/userinfo.profile");

        return "redirect:"+url;
    }

    @GetMapping("/auth/google/callback.do")
    public void handleGoogleCallback(String code, HttpSession session, HttpServletResponse response) throws Exception {
        // get profile after get token
        String snsId = authService.handleGoogleCallback(code);
        if(snsId != null){
            LoginVO user = authService.findSnsUser(snsId, ProviderType.GOOGLE);
            if(user==null){
                //signup
                user = LoginVO.builder()
                        .userId(snsId)
                        .userType(UserType.PERSONAL)
                        .providerType(ProviderType.GOOGLE)
                        .build();

                authService.insertUser(user);
                user = authService.findSnsUser(snsId, ProviderType.GOOGLE);

            }
            // make session
            session.setAttribute("loginVO", user);
            log.info("successfully signed in.");
            PrintWriter out = response.getWriter();
            out.println("<script>window.opener.location.href='/';self.close()</script>");
            out.flush();

        }else{
            throw new Exception();
        }
    }

    @RequestMapping("/logout.do")
    public String handleLogout(HttpSession session) throws Exception {
        log.info("logged out");
        session.removeAttribute("loginVO");
        session.invalidate();
        return "redirect:/index.do";
    }
    
    
    @RequestMapping("/signup.do")
    public String viewSignup() throws Exception {
        return "signup/signup";
    }
    /*
    @RequestMapping("/doSignup.do")
    
    public String viewsignupSuccess() throws Exception {
        return "signup/signupSuccess";
    }
    */
    @RequestMapping("/doSignup.do")
    public String processSignup(@ModelAttribute("loginVO")LoginVO loginVO, HttpSession session, ModelMap model) throws Exception {
    	model.addAttribute("userType", loginVO.getUserType());
    	return "signup/signupSuccess";
    }
}
