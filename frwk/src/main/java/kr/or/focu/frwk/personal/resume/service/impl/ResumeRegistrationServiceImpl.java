package kr.or.focu.frwk.personal.resume.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.transaction.Transactional;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;

import kr.or.focu.frwk.auth.service.LoginVO;
import kr.or.focu.frwk.personal.resume.service.ResumeRegistrationDTO;
import kr.or.focu.frwk.personal.resume.service.ResumeRegistrationService;
import kr.or.focu.frwk.personal.resume.service.mapper.ResumeRegistrationMapper;

@Transactional
@Service("resumeRegistrationService")
public class ResumeRegistrationServiceImpl extends EgovAbstractServiceImpl implements ResumeRegistrationService {

	@Resource(name="resumeRegistrationMapper")
	private ResumeRegistrationMapper resumeRegistrationMapper;

	// 이력서리스트 가져오기
	@Override
	public List<Map<String, Object>> selectMyResumeList(ResumeRegistrationDTO rrDTO) throws Exception {
		return resumeRegistrationMapper.selectMyResumeList(rrDTO);
	}
	
	// 이력서리스트 카운트
	@Override
	public int selectMyResumeListCnt(ResumeRegistrationDTO rrDTO) throws Exception {
		return resumeRegistrationMapper.selectMyResumeListCnt(rrDTO);
	}
	
	
	// 사용자 정보 가져오기
	@Override
	public ResumeRegistrationDTO selectPsnInfo(LoginVO loginVO) throws Exception {
		return resumeRegistrationMapper.selectPsnInfo(loginVO.getUserId());
	}
	
	@Override
	public List<Map<String, Object>> selectWrittenPsnInfo(ResumeRegistrationDTO rrDTO) throws Exception {
		return resumeRegistrationMapper.selectWrittenPsnInfo(rrDTO);
	}
	
	@Override
	public List<Map<String, Object>> selectWrittenLicenseInfo(ResumeRegistrationDTO rrDTO) throws Exception {
		return resumeRegistrationMapper.selectWrittenLicenseInfo(rrDTO);
	}

	// 이력서저장
	@Override
	public void insertResumeRegistration(ResumeRegistrationDTO rrDTO, LoginVO loginVO) throws Exception {
		
		// TODO 회원기본정보
		rrDTO.setPsnId(loginVO.getUserId());
		
		//이력서기본정보
		if(rrDTO.getRsuPubiYn() == null ) rrDTO.setRsuPubiYn("1"); 
		if(rrDTO.getPhnPubiYn() == null ) rrDTO.setPhnPubiYn("1"); 
		if(rrDTO.getRepaYn() == null) rrDTO.setRepaYn("1");
		if(rrDTO.getFnempYn() == null) rrDTO.setFnempYn("1");
		if(rrDTO.getFipinYn() == null) rrDTO.setFipinYn("1");
		
		resumeRegistrationMapper.insertRsuInfo(rrDTO);
		/*
		// 학력정보 TODO ',' 제거  - 임시처리 (깔끔하게 처리 必)
		rrDTO.setSchNm(rrDTO.getSchNm().replace(",", ""));
		rrDTO.setEnrolYr(rrDTO.getEnrolYr().replace(",", ""));
		rrDTO.setGradYr(rrDTO.getGradYr().replace(",", ""));
		resumeRegistrationMapper.insertAcabkg(rrDTO);
		
		// 경력사항 
		// TODO ',' 구분 -> 깔끔하게 처리 必
		String[] wkexpCDArray = rrDTO.getWkexpCd().split(",");
		String[] cmpNmArray = rrDTO.getCmpNm().split(",");
		String[] jncmpDdArray = rrDTO.getJncmpDd().split(",");
		String[] lvcmpDdArray = rrDTO.getLvcmpDd().split(",");
		String[] wkTpCdArray = rrDTO.getWkTpCd().split(",");
		String[] jobArray = rrDTO.getJob().split(",");
		String[] jobListArray = rrDTO.getJobList().split(",");
		String[] slyArray = rrDTO.getSly().split(",");
		String[] respJobArray = rrDTO.getRespJob().split(",");
		
		// i만큼 돌리기(추가한경력만큼)
		for(int i = 0; i < wkexpCDArray.length; i++) {
			rrDTO.setWkexpCd(wkexpCDArray[i]);
			rrDTO.setCmpNm(cmpNmArray[i]);
			rrDTO.setJncmpDd(jncmpDdArray[i]);
			rrDTO.setLvcmpDd(lvcmpDdArray[i]);
			rrDTO.setWkTpCd(wkTpCdArray[i]);
			rrDTO.setJob(jobArray[i]);
			rrDTO.setJobList(jobListArray[i]);
			rrDTO.setSly(slyArray[i]);
			rrDTO.setRespJob(respJobArray[i]);
			
			resumeRegistrationMapper.insertWkexp(rrDTO);
		}
		
		// 자격증
		// TODO ',' 구분 -> 깔끔하게 처리 必
		String[] licenNmArray = rrDTO.getLicenNm().split(",");
		String[] pucoArray = rrDTO.getPuco().split(",");
		String[] acqYmArray = rrDTO.getAcqYm().split(",");
		String[] passCdArray = rrDTO.getPassCd().split(",");

		for(int i = 0; i < licenNmArray.length; i++) {
			rrDTO.setLicenNm(licenNmArray[i]);
			rrDTO.setPuco(pucoArray[i]);
			rrDTO.setAcqYm(acqYmArray[i]);
			rrDTO.setPassCd(passCdArray[i]);
			
			resumeRegistrationMapper.insertLicense(rrDTO);
		}
		
		// 수상대외활동
		// TODO ',' 구분 -> 깔끔하게 처리 必
		String[] actiCdArray = rrDTO.getActiCd().split(",");
		String[] startYmArray = rrDTO.getStartYm().split(",");
		String[] endYmArray = rrDTO.getEndYm().split(",");
		String[] eduLicenNmArray = rrDTO.getEduLicenNm().split(",");
		String[] actiContsArray = rrDTO.getActiConts().split(",");
		
		for(int i = 0; i < actiCdArray.length; i++) {
			rrDTO.setActiCd(actiCdArray[i]);
			rrDTO.setStartYm(startYmArray[i]);
			rrDTO.setEndYm(endYmArray[i]);
			rrDTO.setEduLicenNm(eduLicenNmArray[i]);
			rrDTO.setActiConts(actiContsArray[i]);
			
			resumeRegistrationMapper.insertAwaEdu(rrDTO);
		}

		// TODO 희망근무조건
		
		// 해외경험
		// TODO ',' 구분 -> 깔끔하게 처리 必
		String[] couNmArray = rrDTO.getCouNm().split(",");
		String[] ovsExpStartYmArray = rrDTO.getOvsExpStartYm().split(",");
		String[] ovsExpEndYmArray = rrDTO.getOvsExpEndYm().split(",");
		String[] ovsExpContsArray = rrDTO.getOvsExpConts().split(",");
		
		for(int i = 0; i < couNmArray.length; i++) {
			rrDTO.setCouNm(couNmArray[i]);
			rrDTO.setOvsExpStartYm(ovsExpStartYmArray[i]);
			rrDTO.setOvsExpEndYm(ovsExpEndYmArray[i]);
			rrDTO.setOvsExpConts(ovsExpContsArray[i]);
			
			resumeRegistrationMapper.insertOvsExp(rrDTO);
		}

		// 어학
		// TODO ',' 구분 -> 깔끔하게 처리 必
		String[] langTpCdArray = rrDTO.getLangTpCd().split(","); 
		String[] langCdArray = rrDTO.getLangCd().split(",");
		String[] cpacCdArray = rrDTO.getCpacCd().split(",");
		
		for(int i = 0 ; i < langTpCdArray.length; i++) {
			rrDTO.setLangTpCd(langTpCdArray[i]);
			rrDTO.setLangCd(langCdArray[i]);
			rrDTO.setCpacCd(cpacCdArray[i]);
			
			resumeRegistrationMapper.insertLanguage(rrDTO);
		}
		
		 포트폴리오
		// TODO ',' 구분 -> 깔끔하게 처리 必
		String[] classfiCdArray = rrDTO.getClassfiCd().split(",");
		String[] portfoFnmArray = rrDTO.getPortfoFnm().split(",");
		String[] portfoCrctFnmArray = rrDTO.getPortfoCrctFnm().split(",");
		String[] portfoFpathArray = rrDTO.getPortfoFpath().split(",");
		
		for(int i = 0; i < classfiCdArray.length; i++) {
			rrDTO.setClassfiCd(classfiCdArray[i]);
			rrDTO.setPortfoFnm(portfoFnmArray[i]);
			rrDTO.setPortfoCrctFnm(portfoCrctFnmArray[i]);
			rrDTO.setPortfoFpath(portfoFpathArray[i]);
			
			resumeRegistrationMapper.insertPortfo(rrDTO);
		}
		*/
	}
	
}
