package kr.or.focu.frwk.sample.service.mapper;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import java.sql.SQLException;

@Mapper("sampleMapper")
public interface SampleMapper {
    String greeting() throws SQLException;
}
