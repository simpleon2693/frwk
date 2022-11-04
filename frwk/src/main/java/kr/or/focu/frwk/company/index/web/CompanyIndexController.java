package kr.or.focu.frwk.company.index.web;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Slf4j
@RequestMapping("/com")
@Controller
public class CompanyIndexController {

    @RequestMapping("/index.do")
    public String getMyInfo(Model model) throws Exception {
        log.info("my info called.");
        return "company/index";
    }
}
