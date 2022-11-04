package kr.or.focu.frwk.personal.resume.service.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import kr.or.focu.frwk.personal.resume.service.ResumeRegistrationDTO;

@Mapper("resumeRegistrationMapper")
public interface ResumeRegistrationMapper {

	ResumeRegistrationDTO selectPsnInfo(String userId) throws SQLException;
	
	void insertRsuInfo(ResumeRegistrationDTO rrDTO) throws SQLException;
	
	void insertAcabkg(ResumeRegistrationDTO rrDTO) throws SQLException;
	
	void insertWkexp(ResumeRegistrationDTO rrDTO) throws SQLException;

	void insertLicense(ResumeRegistrationDTO rrDTO) throws SQLException;
	
	void insertAwaEdu(ResumeRegistrationDTO rrDTO) throws SQLException;

	void insertOvsExp(ResumeRegistrationDTO rrDTO) throws SQLException;

	void insertLanguage(ResumeRegistrationDTO rrDTO) throws SQLException;

	void insertPortfo(ResumeRegistrationDTO rrDTO) throws SQLException;
	
	List<Map<String, Object>> selectMyResumeList(ResumeRegistrationDTO rrDTO) throws SQLException;

	int selectMyResumeListCnt(ResumeRegistrationDTO rrDTO) throws SQLException;

	List<Map<String, Object>> selectWrittenPsnInfo(ResumeRegistrationDTO rrDTO) throws SQLException;
	
	List<Map<String, Object>> selectWrittenLicenseInfo(ResumeRegistrationDTO rrDTO) throws SQLException;
}
