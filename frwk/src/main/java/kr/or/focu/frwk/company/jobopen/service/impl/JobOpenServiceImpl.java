package kr.or.focu.frwk.company.jobopen.service.impl;

import kr.or.focu.frwk.company.jobopen.service.JobOpenDTO;
import kr.or.focu.frwk.company.jobopen.service.JobOpenService;
import kr.or.focu.frwk.company.jobopen.service.SearchParamVO;
import kr.or.focu.frwk.company.jobopen.service.mapper.JobOpenMapper;
import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.transaction.Transactional;
import java.util.List;
import java.util.Map;

@Transactional
@Service("jobOpenService")
public class JobOpenServiceImpl extends EgovAbstractServiceImpl implements JobOpenService {


    @Resource(name="jobOpenMapper")
    private JobOpenMapper jobOpenMapper;


    @Override
    public void insertJobOpen(JobOpenDTO dto) throws Exception {

        // 공고등록
        jobOpenMapper.insertJobOpen(dto);

        // 채용분야
        if(dto.getJobArea()!=null)jobOpenMapper.insertJobArea(dto.getJobArea());

        // 지원자격
        if(dto.getQualification()!=null)jobOpenMapper.insertQualification(dto.getQualification());

        // 근무조건
        if(dto.getWorkCondition()!=null)jobOpenMapper.insertWorkCondition(dto.getWorkCondition());
    }

    @Override
    public Map<String, Object> getJobOpenData(int jobOpenSeq) throws Exception {

        return jobOpenMapper.getJobOpenData(jobOpenSeq);
    }

    @Override
    public List<Map<String, Object>> getJobopenList(SearchParamVO vo) throws Exception {

        List<Map<String, Object>> ret;
        if(vo.getPageNo() != null && vo.getPageSize() != null){
            ret = jobOpenMapper.getJobopenListPaging(vo);
        }else{
            ret = jobOpenMapper.getJobopenList(vo);
        }
        return ret;
    }
}

