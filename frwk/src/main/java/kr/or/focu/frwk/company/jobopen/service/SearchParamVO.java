package kr.or.focu.frwk.company.jobopen.service;

import kr.or.focu.frwk.common.base.BaseDTO;
import lombok.Data;

@Data
public class SearchParamVO extends BaseDTO {
    private String comId;
    private String jobopenStatus;

}

