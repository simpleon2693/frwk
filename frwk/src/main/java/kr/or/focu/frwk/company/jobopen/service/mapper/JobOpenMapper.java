package kr.or.focu.frwk.company.jobopen.service.mapper;

import kr.or.focu.frwk.company.jobopen.service.JobOpenDTO;
import kr.or.focu.frwk.company.jobopen.service.SearchParamVO;
import org.apache.ibatis.annotations.Param;
import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

@Mapper("jobOpenMapper")
public interface JobOpenMapper {

    void insertJobOpen(JobOpenDTO dto) throws SQLException;

    void insertJobArea(JobOpenDTO.JobArea dto) throws SQLException;

    void insertQualification(JobOpenDTO.Qualification dto) throws SQLException;

    void insertWorkCondition(JobOpenDTO.WorkCondition dto) throws SQLException;

    Map<String, Object> getJobOpenData(@Param("jobOpenSeq") int jobOpenSeq) throws SQLException;

    List<Map<String, Object>> getJobopenList(SearchParamVO vo)  throws SQLException;

    List<Map<String, Object>> getJobopenListPaging(SearchParamVO vo)  throws SQLException;
}
