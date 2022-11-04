package kr.or.focu.frwk.common.service;

import java.util.List;
import java.util.Map;

public interface CommonService {

    List<Map<String, Object>> getBigCode(String classType) throws Exception;

    List<Map<String, Object>> getMidCode(String bigCode) throws Exception;

    List<Map<String, Object>> getSubCode(String midCode) throws Exception;

    List<Map<String, Object>> getCommonCode(String commonCode) throws Exception;
}
