package kr.or.focu.frwk.company.custominfo.web;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Slf4j
@RequestMapping("/com/custominfo")
@Controller
public class CompanyCustomInfoController {

    @RequestMapping("/index.do")
    public String getMyInfo() throws Exception {

        log.info("my info called.");
        return "company/index";
    }
}
