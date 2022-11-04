package kr.or.focu.frwk.company.jobopen.service;


import java.util.List;
import java.util.Map;

public interface JobOpenService {

    void insertJobOpen(JobOpenDTO dto) throws Exception;

    Map<String, Object> getJobOpenData(int jobOpenSeq) throws Exception;

    List<Map<String, Object>> getJobopenList(SearchParamVO vo) throws Exception;
}
