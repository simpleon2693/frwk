package kr.or.focu.frwk.company.memberinfo.web;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Slf4j
@RequestMapping("/com/memberinfo")
@Controller
public class MemberInfoController {

    @RequestMapping("/index.do")
    public String getMyInfo() throws Exception {

        log.info("my info called.");
        return "company/index";
    }
}
