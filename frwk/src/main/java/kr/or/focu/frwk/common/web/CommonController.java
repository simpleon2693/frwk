package kr.or.focu.frwk.common.web;

import kr.or.focu.frwk.common.service.CommonService;
import kr.or.focu.frwk.common.service.PopupParamVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Slf4j
@Controller
@RequestMapping("/common")
public class CommonController {

	@Resource(name="commonService")
	private CommonService commonService;

	@RequestMapping("/popup/sample.do")
	public String loadSamplePopup(@ModelAttribute("paramVO") PopupParamVO vo, Model model)
	  throws Exception {

		log.info("common popup loaded : {} ", vo);

		return "common/popup/commonPp";
	}

	@PostMapping("/popup/jobList.do")
	public String loadJobList(@ModelAttribute("paramVO") PopupParamVO vo, Model model) throws Exception {
		log.info("common popup loaded : {} ", vo);
		return "common/popup/jobList";
	}

	@PostMapping("/popup/jobPosition.do")
	public String loadJobPosition(@ModelAttribute("paramVO") PopupParamVO vo, Model model)
	  throws Exception {
		log.info("common popup loaded : {} ", vo);
		return "common/popup/jobPosition";
	}

	@PostMapping("/popup/conditionList.do")
	public String loadConditionList(@ModelAttribute("paramVO") PopupParamVO vo, Model model)
	  throws Exception {
		log.info("common popup loaded : {} ", vo);
		return "common/popup/conditionList";
	}

	@PostMapping("/popup/languageList.do")
	public String loadLanguageList(@ModelAttribute("paramVO") PopupParamVO vo, Model model)
	  throws Exception {
		log.info("common popup loaded : {} ", vo);
		return "common/popup/languageList";
	}

	@PostMapping("/popup/licenseList.do")
	public String loadLicenseList(@ModelAttribute("paramVO") PopupParamVO vo, Model model)
	  throws Exception {
		log.info("common popup loaded : {} ", vo);
		return "common/popup/licenseList";
	}

	@PostMapping("/popup/preferJobList.do")
	public String loadPreferJobList(@ModelAttribute("paramVO") PopupParamVO vo, Model model)
	  throws Exception {
		log.info("common popup loaded : {} ", vo);
		return "common/popup/preferJobList";
	}

	@PostMapping("/popup/businessCode.do")
	public String loadBusinessCodeList(@ModelAttribute("paramVO") PopupParamVO vo, Model model)
	  throws Exception {
		log.info("common popup loaded : {} ", vo);
		return "common/popup/businessCode";
	}

	/*
	 * window.open 팝업
	 */
	@GetMapping("/openpopup/kakaoMap.do")
	public String loadKakaoMap(@ModelAttribute("paramVO") PopupParamVO vo, Model model)
			throws Exception {
		log.info("common popup loaded : {} ", vo);
		return "common/popup/kakaoMap";
	}

	@RequestMapping("/popup/data/big.do")
	@ResponseBody
	public List<Map<String, Object>> getBigCode(String classType) throws Exception {
		return commonService.getBigCode(classType);
	}

	@RequestMapping("/popup/data/mid.do")
	@ResponseBody
	public List<Map<String, Object>> getMidCode(String bigCode) throws Exception {
		return commonService.getMidCode(bigCode);
	}

	@RequestMapping("/popup/data/sub.do")
	@ResponseBody
	public List<Map<String, Object>> getSubCode(String midCode) throws Exception {
		return commonService.getSubCode(midCode);
	}

	@RequestMapping("/popup/data/common.do")
	@ResponseBody
	public List<Map<String, Object>> getCommonCode(String commonCode) throws Exception {
		return commonService.getCommonCode(commonCode);
	}
}
