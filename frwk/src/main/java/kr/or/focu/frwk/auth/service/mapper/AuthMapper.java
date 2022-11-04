package kr.or.focu.frwk.auth.service.mapper;

import kr.or.focu.frwk.auth.service.LoginVO;
import kr.or.focu.frwk.auth.service.ProviderType;
import org.apache.ibatis.annotations.Param;
import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import java.sql.SQLException;
import java.util.Map;

@Mapper("authMapper")
public interface AuthMapper {

    Map<String, Object> getPersonalUser(LoginVO vo) throws SQLException;

    Map<String, Object> getCompanyUser(LoginVO vo) throws SQLException;

    Map<String, Object> getAdminUser(LoginVO vo) throws SQLException;

    Map<String, Object> getSnsUser(@Param("userId") String snsId, @Param("providerType") ProviderType providerType) throws SQLException;

    void insertSnsUser(LoginVO user) throws SQLException;
}
