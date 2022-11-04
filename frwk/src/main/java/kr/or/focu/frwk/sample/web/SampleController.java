package kr.or.focu.frwk.sample.web;


import egovframework.com.cmm.EgovMessageSource;
import kr.or.focu.frwk.sample.service.BothDTO;
import kr.or.focu.frwk.sample.service.OuterDTO;
import kr.or.focu.frwk.sample.service.SampleService;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

@Slf4j
@RequestMapping("/sample")
@Controller
public class SampleController {


    /** EgovMessageSource */
    @Resource(name = "egovMessageSource")
    EgovMessageSource egovMessageSource;

    @Resource(name = "sampleService")
    private SampleService sampleService;


    @GetMapping("/hello.do")
    public String samplePage(Model model) throws Exception {
        log.info("sample page 한글 called {} :", egovMessageSource.getMessage("title.sample.name"));
        log.info("현재시각:{}", sampleService.greeting());
        log.info("종료");
        model.addAttribute("hello", "hello");
        return "hello";
    }

    @GetMapping("/dataBinding.do")
    public String testData(@RequestBody OuterDTO dto, Model model) throws Exception {
        log.info("dto : {}", dto);
        log.info("innerDto : {}", dto.getInnerDTO());
        model.addAttribute("hello", dto);
        return "hello";
    }

    @GetMapping("/dataBinding2.do")
    public String testData(@RequestBody BothDTO dto, Model model) throws Exception {
        log.info("dto : {}", dto);
        model.addAttribute("hello", dto);
        return "hello";
    }
}

