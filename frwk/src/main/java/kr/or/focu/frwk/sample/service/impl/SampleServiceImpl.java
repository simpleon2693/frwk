package kr.or.focu.frwk.sample.service.impl;

import kr.or.focu.frwk.sample.service.mapper.SampleMapper;
import kr.or.focu.frwk.sample.service.SampleService;
import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service("sampleService")
public class SampleServiceImpl extends EgovAbstractServiceImpl implements SampleService {

    @Resource(name="sampleMapper")
    private SampleMapper sampleMapper;

    @Override
    public String greeting() throws Exception {

        return sampleMapper.greeting();
    }
}
