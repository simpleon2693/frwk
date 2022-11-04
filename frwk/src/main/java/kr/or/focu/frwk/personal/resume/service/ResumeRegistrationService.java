package kr.or.focu.frwk.personal.resume.service;

import java.util.List;
import java.util.Map;

import kr.or.focu.frwk.auth.service.LoginVO;

public interface ResumeRegistrationService {

	public ResumeRegistrationDTO selectPsnInfo(LoginVO loginVO) throws Exception;

	public void insertResumeRegistration(ResumeRegistrationDTO rrDTO,LoginVO loginVO) throws Exception;

	public List<Map<String, Object>> selectMyResumeList(ResumeRegistrationDTO rrDTO) throws Exception;

	public int selectMyResumeListCnt(ResumeRegistrationDTO rrDTO) throws Exception;

	public List<Map<String, Object>> selectWrittenPsnInfo(ResumeRegistrationDTO rrDTO) throws Exception;

	public List<Map<String, Object>> selectWrittenLicenseInfo(ResumeRegistrationDTO rrDTO) throws Exception;

}
