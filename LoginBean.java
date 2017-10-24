package block_chainning;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.*;
import block_chainning.DBmanager;
public class LoginBean {
	private String id,pass;
	boolean validB;
	private static LoginBean lb;
	private LoginBean()
	{}
	public static LoginBean getLoginBean()
	{
		if (lb==null)
		{
			lb=new LoginBean();
		}
		return lb;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public int validate()
	{
		String s3="";
		Connection cn=null;
		PreparedStatement ps=null;
		try{
			cn=DBmanager.getConnection();
			ps=cn.prepareStatement("select type from block_chain where phno=(?) and password=(?)");
			String s1=lb.getId();
			String s2=lb.getPass();
			ps.setString(1, s1);
			ps.setString(2, s2);
			ResultSet rSet=ps.executeQuery();
			while(rSet.next())
			{
				s3=rSet.getString(1);
			}
			if(s3.equals("user"))
			{
				return 1;
			}
			else if(s3.equals("shop"))
			{
				return 2;
			}
		}
		catch(Exception ee)
		{ee.printStackTrace();}
		finally{
			try{
			ps.close();
			cn.close();
		}catch(Exception ee)
		{}
		}
		return 0;
	}
}