package kr.or.focu.frwk.main.web;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Slf4j
@Controller
public class MainController {

    @RequestMapping("/index.do")
    public String indexPage() throws Exception {

        return "index";
    }
}
