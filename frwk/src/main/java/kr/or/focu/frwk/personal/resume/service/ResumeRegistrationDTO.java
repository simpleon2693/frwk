package kr.or.focu.frwk.personal.resume.service;

import kr.or.focu.frwk.common.base.BaseDTO;
import lombok.Data;

@Data
// public class ResumeRegistrationDTO extends BaseDTO {
public class ResumeRegistrationDTO  extends BaseDTO {
	
	// TODO 세부항목 분류시키기..
	
	
	/* 이력서 기본 정보 */
	private String rsuPubiYn;
	private String phnPubiYn;
	
	private String psnId;
	private Integer rsuSeq;
	private String rsuSjt;
	private String nm;
	private String birthdd;
	private String sex;
	private String email;
	private String phn;
	private Integer zipcd;
	private String addr;
	private String detlAddr;
	private String hpageAddr;
	
	/*인증관련 및 사진*/
	private String certiYn;
	private String certiFnm;
	private String certiCrctFnm;
	private String certiDt;
	private String psnPicFpath;
	private String psnPicCrctFnm;
	private String picFnm;
	
	/* 학력사항  */
	private String acabkgCd;
	private String acabkgStaCd;
	private String schNm;
	//	private String 대학구분(2년제..3년제..)
	private String gradYr;
	private String enrolYr;
	private String major;
	
	/* 경력사항  */
	private String wkexpCd;
	private String cmpNm;
	private String jncmpDd;
	private String lvcmpDd;
	private String wkTpCd;
	private String job;
	private String jobList;
	private String sly;
	private String respJob;
	
	/* 자격증 및 수상교육활동  */
	private String licenNm;
	private String puco;
	private String acqYm;
	private String passCd;
	private String actiCd;
	//	private String 활동명; 
	private String startYm;
	private String endYm;
	private String eduLicenNm;
	private String actiConts;
	
	/* 희망근무조건 */
	private String empCdtCd;
	private String desly;
	private boolean itvDeclYn;
	private String deslyWkpl;
	private String desJobList;
	private String induList;

	/* 해외경험 및 어학  */
	private String couNm;
	private String ovsExpStartYm;
	private String ovsExpEndYm;
	private String ovsExpConts;
	
	private String langTpCd;
	private String langCd;
	private String cpacCd;
	
	/*포트폴리오*/
	private String classfiCd;
	private String portfoFnm;
	private String portfoCrctFnm;
	private String portfoFpath;
	
	
	/* 취업우대 및 자기소개서 */
	private String repaYn;
	private String fnempYn;
	private String fipinYn;
	private String disabGrdCd;
	private String misvcCd;
	private String jnarmyDd;
	private String exparmyDd;
	private String clsCd;
	private String slfintro;
	
	
	// todo..  파일명 , 파일관련 추가
}
