package kr.or.focu.frwk.company.jobopen.service;


import kr.or.focu.frwk.common.base.BaseDTO;
import lombok.Data;


@Data
public class JobOpenDTO extends BaseDTO {
    private int jobOpenSeq;

    private String title;
    private String comId;

    /* 인사담당 */
    private String mngerNm;
    private String dept;
    private String phone;
    private String email;
    private String addr;
    private String detlAddr;

    private String bsttCd;
    private String bsttCdNm;
    private String ovsYn;
    private String wkhomeYn; // 재택? TODO

    /* 접수시간 */
    private String openStartDt;
    private String openEndDt;
    private String openEndTm;

    // 채용시 마감은? TODO
    private String whenFullClose;

//    private String openYn; // 노출여부? TODO

    private JobArea jobArea;
    private Qualification qualification;
    private WorkCondition workCondition;

    // 채용분야
    @Data
    public static class JobArea {

        private int jobOpenSeq;

        // 직무코드 (리스트)
        private String jobList;
        private String jobListNm;
        // 퇴직소방관 근무경력 요구 YN
        private String retFrmanCd;
        // 모집분야
        private String reciArea;
        // 경력 유형
        private String wkexpCd;
        // 고용 형태 (리스트)
        private String empTpList;
        // 모집인원유형
        private String recNumCd;
        // 모집인원(직접입력)
        private Integer recNum;
        // 직급(위)코드
        private String jobCd;
        private String jobCdNm;

    }

    // 지원자격
    @Data
    public static class Qualification {

        private int jobOpenSeq;
        // 지원자학력코드
        private String acabkgCd;
        // 졸업예정자 지원가능
//        private String gradExpectYn;
        // 성별
        private String sexCd;
        // 연령코드
        private String ageCd;
        // 연령이상
        private Integer overAge;
        // 연령이하
        private Integer underAge;
        // 우대조건(리스트)
        private String condiList; // TODO
        // 외국어(리스트)
        private String langList; // TODO
        // 자격증(리스트)
        private String licenList; // TODO
        // 우대직무(리스트)
        private String prefJobList;  // TODO
    }

    // 근무조건
    @Data
    public static class WorkCondition {

        private int jobOpenSeq;

        // 급여코드
        private String salCd;
        // 최소급여
        private Integer minSal;
        // 최대급여
        private Integer maxSal;
        // 면접후 결정
        private String salDecideAfterInterview;
        // 근무지역
        private String workPlace;
        // 근무지주소
        private String workAddr;
        // 지하철노선코드
        private String subwLineCd;
        // 지하철역코드
        private String subwNmCd;
        // 출구번호
        private Integer gateNum;
        // 거리코드
        private String distCd;
        // 복리후생
        private String walfare;

    }

}
