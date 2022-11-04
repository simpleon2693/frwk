package kr.or.focu.frwk.auth.service;

import java.sql.SQLException;

public interface AuthService {
    LoginVO actionLogin(LoginVO vo) throws Exception;

    LoginVO findSnsUser(String snsId, ProviderType providerType) throws SQLException;

    String handleNaverCallback(String state, String code) throws Exception;

    String handleKakaoCallback(String code) throws Exception;

    String handleGoogleCallback(String code) throws Exception;

    void insertUser(LoginVO user) throws Exception;
}
