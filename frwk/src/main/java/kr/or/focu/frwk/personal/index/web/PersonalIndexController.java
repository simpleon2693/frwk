package kr.or.focu.frwk.personal.index.web;

import lombok.extern.slf4j.Slf4j;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.focu.frwk.auth.service.LoginVO;
import kr.or.focu.frwk.personal.resume.service.ResumeRegistrationService;

@Slf4j
@RequestMapping("/psn")
@Controller
public class PersonalIndexController {
	@Resource(name="resumeRegistrationService")
	private ResumeRegistrationService resumeRegistrationService;
	
    @RequestMapping("/index.do")
    public String getMyInfo(Model model, LoginVO loginVO) throws Exception {
    	
        return "personal/index";
    }
}
