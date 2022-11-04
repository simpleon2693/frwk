package kr.or.focu.frwk.auth.service.impl;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import egovframework.com.cmm.service.EgovProperties;
import kr.or.focu.frwk.auth.service.ProviderType;
import kr.or.focu.frwk.auth.service.UserType;
import kr.or.focu.frwk.auth.service.AuthService;
import kr.or.focu.frwk.auth.service.LoginVO;
import kr.or.focu.frwk.auth.service.mapper.AuthMapper;
import kr.or.focu.frwk.common.util.AuthUtil;
import lombok.extern.slf4j.Slf4j;
import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.http.*;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import javax.annotation.Resource;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URI;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

@Slf4j
@Service("authService")
public class AuthServiceImpl extends EgovAbstractServiceImpl implements AuthService {

    @Resource(name = "gson")
    private Gson gson;

    @Resource(name = "restTemplate")
    private RestTemplate restTemplate;

    @Resource(name = "authMapper")
    private AuthMapper authMapper;


    public static final String naverCallbackUrl = EgovProperties.getProperty("oauth.naver.auth.callback");
    public static final String naverBaseUrl = EgovProperties.getProperty("oauth.naver.auth.baseurl");
    public static final String naverClientId = EgovProperties.getProperty("oauth.naver.client.id");
    public static final String naverClienSecret = EgovProperties.getProperty("oauth.naver.client.secret");
    public static final String naverProfileUrl = EgovProperties.getProperty("oauth.naver.auth.profileurl");

    public static final String kakaoCallbackUrl = EgovProperties.getProperty("oauth.kakao.auth.callback");
    public static final String kakaoBaseUrl = EgovProperties.getProperty("oauth.kakao.auth.baseurl");
    public static final String kakaoClientId = EgovProperties.getProperty("oauth.kakao.client.id");
    public static final String kakaoProfileUrl = EgovProperties.getProperty("oauth.kakao.auth.profileurl");

    public static final String googleCallbackUrl = EgovProperties.getProperty("oauth.google.auth.callback");
    public static final String googleBaseUrl = EgovProperties.getProperty("oauth.google.auth.baseurl");
    public static final String googleClientId = EgovProperties.getProperty("oauth.google.client.id");
    public static final String googleClientSecret = EgovProperties.getProperty("oauth.google.client.secret");
    public static final String googleProfileUrl = EgovProperties.getProperty("oauth.google.auth.profileurl");
    public static final String googleTokenUrl = EgovProperties.getProperty("oauth.google.auth.tokenurl");

    @Override
    public LoginVO actionLogin(LoginVO vo) throws Exception {

        LoginVO loginVO = null;
        Map<String, Object> retMap = new HashMap<>();
        String enPassword = AuthUtil.encryptPassword(vo.getUserPw(), vo.getUserId());
        vo.setUserPw(enPassword);
        log.info("enc password : {} ", enPassword);
        if(vo.getUserType() == UserType.PERSONAL){
            retMap = authMapper.getPersonalUser(vo);
            if(retMap == null){
                loginVO = null;
            }else {
                loginVO = LoginVO.builder()
                        .userId((String) retMap.get("PSN_ID"))
                        .userPw((String) retMap.get("PWD"))
                        .userType(UserType.PERSONAL)
                        .build();
            }
        } else if (vo.getUserType() == UserType.COMPANY){
            retMap = authMapper.getCompanyUser(vo);
            if(retMap == null){
                loginVO = null;
            }else{
                loginVO = LoginVO.builder()
                        .userId((String) retMap.get("COM_ID"))
                        .userPw((String) retMap.get("PWD"))
                        .userType(UserType.COMPANY)
                        .build();
            }
        } else if (vo.getUserType() == UserType.ADMIN){

            // todo : 관리자 로그인

        }

        // 3. 결과를 리턴한다.
        return loginVO;
    }

    @Override
    public LoginVO findSnsUser(String snsId, ProviderType providerType) throws SQLException {
        Map<String, Object> retMap = authMapper.getSnsUser(snsId, providerType);
        if(retMap!=null){
            return LoginVO.builder()
                    .userId((String) retMap.get("PSN_ID"))
                    .userPw((String) retMap.get("SNS_PRVD"))
                    .userType(UserType.PERSONAL)
                    .providerType(ProviderType.valueOf((String)retMap.get("SNS_PRVD")))
                    .build();
        }else{
            return null;
        }

    }

    @Override
    public String handleNaverCallback(String state, String code) throws Exception {

        UriComponents url = UriComponentsBuilder.fromHttpUrl(naverBaseUrl+"/token")
                .queryParam("grant_type", "authorization_code")
                .queryParam("client_id", naverClientId)
                .queryParam("client_secret", naverClienSecret)
                .queryParam("redirect_uri", URLEncoder.encode(naverCallbackUrl, "UTF-8"))
                .queryParam("code", code)
                .queryParam("state", state)
                .build();

        HttpEntity<?> entity = new HttpEntity<>(new HttpHeaders());
        HttpEntity<String> response = restTemplate.exchange(url.toString(), HttpMethod.GET, entity, String.class);
        String ret = response.getBody();
        log.info("token...{}", ret);
        Map<String, Object> resultMap = gson.fromJson(ret, new TypeToken<Map<String, Object>>() {}.getType());
        String jsonString = null;
        if(resultMap.get("error")==null) {
            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
            headers.set("Authorization", "Bearer " + resultMap.get("access_token"));
            ResponseEntity<Map> responseEntity = restTemplate.exchange(naverProfileUrl, HttpMethod.GET, new HttpEntity<>(headers), Map.class);
            Map responseMap = responseEntity.getBody();
            LinkedHashMap innerResponse = (LinkedHashMap) responseMap.get("response");
            return (String)innerResponse.get("id");
        }else{
            return null;
        }
    }

    @Override
    public String handleKakaoCallback(String code) throws Exception {
//
        UriComponents strUrl = UriComponentsBuilder.fromHttpUrl(kakaoBaseUrl+"/token")
                .queryParam("grant_type", "authorization_code")
                .queryParam("client_id", kakaoClientId)
                .queryParam("redirect_uri", URLEncoder.encode(kakaoCallbackUrl, "UTF-8"))
                .queryParam("code", code)
                .build();

        // old way
        URL url = new URL(strUrl.toString());
        HttpURLConnection con = (HttpURLConnection)url.openConnection();
        con.setRequestMethod("GET");
        int responseCode = con.getResponseCode();
        String strResponse = null;
        if(responseCode==200){
            try(BufferedReader br = new BufferedReader(
                    new InputStreamReader(con.getInputStream(), StandardCharsets.UTF_8))) {
                StringBuilder response = new StringBuilder();
                String responseLine = null;
                while ((responseLine = br.readLine()) != null) {
                    response.append(responseLine.trim());
                }
                strResponse = response.toString();
            }
        }
        //new way
//        HttpEntity<?> entity = new HttpEntity<>(new HttpHeaders());
//        HttpEntity<String> response = restTemplate.exchange(strUrl.toString(), HttpMethod.GET, entity, String.class);
//        String ret = response.getBody();

        log.info("token...{}", strResponse);
        Map<String, Object> resultMap = gson.fromJson(strResponse, new TypeToken<Map<String, Object>>() {}.getType());
        String jsonString = getProfile(kakaoProfileUrl, (String)resultMap.get("access_token"), "id");
        return jsonString;
    }

    @Override
    public String handleGoogleCallback(String code) throws Exception {

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);

        MultiValueMap<String, String> parameters = new LinkedMultiValueMap<>();
        parameters.add("code", code);
        parameters.add("client_id", googleClientId);
        parameters.add("client_secret", googleClientSecret);
        parameters.add("grant_type", "authorization_code");
        parameters.add("redirect_uri", googleCallbackUrl);

        HttpEntity<MultiValueMap<String,String>> restRequest = new HttpEntity<>(parameters,headers);

        URI uri = URI.create(googleTokenUrl);

        ResponseEntity<String> restResponse;
        restResponse = restTemplate.postForEntity(uri, restRequest, String.class);
        String bodys = restResponse.getBody();
        log.info("token...{}", bodys);
        Map<String, Object> resultMap = gson.fromJson(bodys, new TypeToken<Map<String, Object>>() {}.getType());
        String jsonString = getProfile(googleProfileUrl, (String)resultMap.get("access_token"), "sub");
        return jsonString;
    }


    private String getProfile(String profileUrl, String accessToken, String retrievalKey) throws Exception {
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
        headers.set("Authorization", "Bearer " + accessToken);
        ResponseEntity<Map> responseEntity = restTemplate.exchange(profileUrl, HttpMethod.GET, new HttpEntity<>(headers), Map.class);
        Map responseMap = responseEntity.getBody();
        return String.valueOf(responseMap.get(retrievalKey));
    }


    @Override
    public void insertUser(LoginVO user) throws Exception {
        authMapper.insertSnsUser(user);
    }
}
