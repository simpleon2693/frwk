package kr.or.focu.frwk.common.service.mapper;

import org.apache.ibatis.annotations.Param;
import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

@Mapper("commonMapper")
public interface CommonMapper {

    List<Map<String, Object>> getBigCode(@Param("classType") String classType) throws SQLException;

    List<Map<String, Object>> getMidCode(@Param("bigCode") String bigCode) throws SQLException;

    List<Map<String, Object>> getSubCode(@Param("midCode") String midCode) throws SQLException;

    List<Map<String, Object>> getCommonCode(@Param("commonCode") String commonCode) throws SQLException;
}
