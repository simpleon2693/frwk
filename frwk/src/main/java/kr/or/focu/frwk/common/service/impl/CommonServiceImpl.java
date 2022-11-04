package kr.or.focu.frwk.common.service.impl;

import kr.or.focu.frwk.common.service.CommonService;
import kr.or.focu.frwk.common.service.mapper.CommonMapper;
import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service("commonService")
public class CommonServiceImpl extends EgovAbstractServiceImpl implements CommonService {

	@Resource(name = "commonMapper")
	private CommonMapper commonMapper;

	@Override
	public List<Map<String, Object>> getBigCode(String classType) throws Exception {
		return commonMapper.getBigCode(classType);
	}

	@Override
	public List<Map<String, Object>> getMidCode(String bigCode) throws Exception {
		return commonMapper.getMidCode(bigCode);
	}

	@Override
	public List<Map<String, Object>> getSubCode(String midCode) throws Exception {
		return commonMapper.getSubCode(midCode);
	}

	@Override
	public List<Map<String, Object>> getCommonCode(String commonCode) throws Exception {
		return commonMapper.getCommonCode(commonCode);
	}
}
