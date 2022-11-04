package kr.or.focu.frwk.company.jobopen.web;

import kr.or.focu.frwk.auth.service.LoginVO;
import kr.or.focu.frwk.common.service.PopupParamVO;
import kr.or.focu.frwk.company.jobopen.service.JobOpenDTO;
import kr.or.focu.frwk.company.jobopen.service.JobOpenService;
import kr.or.focu.frwk.company.jobopen.service.SearchParamVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

@Slf4j
@RequestMapping("/com/jobopen")
@Controller
public class JobOpenController {

    @Resource(name="jobOpenService")
    private JobOpenService jobOpenService;

    @RequestMapping("/registration.do")
    public String viewRegistration(LoginVO loginVO, String jobOpenSeq, Model model) throws Exception {
        model.addAttribute("seq", jobOpenSeq);
        return "company/jobopen/registration";
    }

    @ResponseBody
    @RequestMapping("/actionRegistration.do")
    public Map<String, Object> insertJobOpen(LoginVO loginVO, JobOpenDTO dto) throws Exception {
        dto.setComId(loginVO.getUserId());
        log.info("dto:{}",dto);

        jobOpenService.insertJobOpen(dto);

        Map<String, Object> ret = new HashMap<>();
        ret.put("ret", true);

        return ret;
    }

    @ResponseBody
    @RequestMapping("/getJobOpenData.do")
    public Map<String, Object> getJobOpenData(LoginVO loginVO, int jobOpenSeq) throws Exception {
        log.info("dto:{}", jobOpenSeq);
        Map<String, Object> ret = new HashMap<>();
        ret.put("ret", true);
        ret.put("data", jobOpenService.getJobOpenData(jobOpenSeq));
        return ret;

    }

    @RequestMapping("/status.do")
    public String viewStatus(Model model) throws Exception {
        return "company/jobopen/status";
    }

    @RequestMapping("/popup/prevJobopen.do")
    public String loadPrevJobopen(@ModelAttribute("paramVO") PopupParamVO vo, Model model) throws Exception {

        return "company/jobopen/popup/prevJobopen";
    }

    @RequestMapping("/getJobopenList.do")
    @ResponseBody
    public Map<String, Object> getJobopenList(LoginVO loginVO, SearchParamVO vo) throws Exception {
        vo.setComId(loginVO.getUserId());

        Map<String, Object> ret = new HashMap<>();
        ret.put("ret", true);
        ret.put("data", jobOpenService.getJobopenList(vo));
        return ret;
    }


}
