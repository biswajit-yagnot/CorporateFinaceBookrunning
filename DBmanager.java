package block_chainning;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBmanager {

	static Connection cn;
	public static Connection getConnection()
	{
			try{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				cn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","biswajit#4097");
				
			}catch(Exception ee)
			{
				ee.printStackTrace();
			}
			return cn;
	}
}

