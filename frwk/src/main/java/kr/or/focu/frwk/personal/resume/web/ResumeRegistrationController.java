package kr.or.focu.frwk.personal.resume.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.focu.frwk.auth.service.LoginVO;
import kr.or.focu.frwk.common.service.CommonService;
import kr.or.focu.frwk.personal.resume.service.ResumeRegistrationDTO;
import kr.or.focu.frwk.personal.resume.service.ResumeRegistrationService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/psn/resume")
@Controller
public class ResumeRegistrationController {
	
	@Resource(name="resumeRegistrationService")
	private ResumeRegistrationService resumeRegistrationService;
	
	@Resource(name="commonService")
	private CommonService commonService;
	
	@RequestMapping("/registration.do")
    public String viewResumeRegistration(Model model) throws Exception {
		model.addAttribute("lnmList", commonService.getCommonCode("LNM"));
        return "personal/resume/resumeRegistration";
    }
	
	@RequestMapping("/resumeView.do")
    public String resumeView() throws Exception {
		
        return "personal/resume/resumeView";
    }
	
	@RequestMapping("/modifyRegistration.do")
    public String viewModifyResumeRegistration(@RequestParam (defaultValue="0") int rsuSeq, ResumeRegistrationDTO rrDTO, Model model) throws Exception {
		
		if(rsuSeq != 0) model.addAttribute("rsuSeq",rsuSeq);

		return "personal/resume/modifyResumeRegistration";
    }
	
	@ResponseBody
	@RequestMapping("/selectPsnInfo.do")
	public ResumeRegistrationDTO selectPsnInfo(LoginVO loginVO, Model model) throws Exception {
		ResumeRegistrationDTO dto = new ResumeRegistrationDTO();
		
		dto = resumeRegistrationService.selectPsnInfo(loginVO);
		
		return dto;
	}
	
	@ResponseBody
	@RequestMapping("/actionRegistration.do")
    public Map<String,Object> actionRegistration(ResumeRegistrationDTO rrDTO, LoginVO loginVO) throws Exception {
		Map<String,Object> result = new HashMap<String, Object>();
		try {
			resumeRegistrationService.insertResumeRegistration(rrDTO,loginVO);
			
			result.put("result",true);
		} catch (Exception e) {
			result.put("result",false);
			e.printStackTrace();
		}
		
		return result;
    }
	
	@ResponseBody
	@RequestMapping("/selectMyResumeList.do")
	public Map<String,Object> selectMyResumeList(ResumeRegistrationDTO rrDTO, LoginVO loginVO) throws Exception {
		Map<String,Object> result = new HashMap<String, Object>();
		
		rrDTO.setPsnId(loginVO.getUserId());
		
		List<Map<String,Object>> resumeList = resumeRegistrationService.selectMyResumeList(rrDTO);
		int resumeListCnt = resumeRegistrationService.selectMyResumeListCnt(rrDTO);
		
		result.put("data",resumeList);
		result.put("totalCnt", resumeListCnt);
		
		return result;
	}
	
	
	@ResponseBody
	@RequestMapping("/selectWrittenPsnInfo.do")
	public List<Map<String, Object>> selectWrittenPsnInfo(@RequestBody ResumeRegistrationDTO rrDTO) throws Exception {
		return resumeRegistrationService.selectWrittenPsnInfo(rrDTO);
	}
	
	@ResponseBody
	@RequestMapping("/selectWrittenLicenseInfo.do")
	public List<Map<String, Object>> selectWrittenLicenseInfo(@RequestBody ResumeRegistrationDTO rrDTO) throws Exception {
		return resumeRegistrationService.selectWrittenLicenseInfo(rrDTO);
	}
}
