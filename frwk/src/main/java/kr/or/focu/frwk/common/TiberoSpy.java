package kr.or.focu.frwk.common;

import java.sql.DriverManager;
import java.sql.SQLException;
import net.sf.log4jdbc.Properties;
import net.sf.log4jdbc.log.SpyLogDelegator;
import net.sf.log4jdbc.log.SpyLogFactory;
import net.sf.log4jdbc.sql.jdbcapi.DriverSpy;

public class TiberoSpy extends DriverSpy{
	static final SpyLogDelegator log = SpyLogFactory.getSpyLogDelegator();
	static {
		if(Properties.isAutoLoadPopularDrivers()){
			try{
				Class.forName("com.tmax.tibero.jdbc.TbDriver");
				DriverManager.registerDriver(new TiberoSpy());
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
		}
	}

}
