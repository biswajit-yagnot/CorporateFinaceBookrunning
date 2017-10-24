package block_chainning;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Random;

import block_chainning.DBmanager;
public class RegisterBean {
	private String id,pass,fname,lname,dob,gender,newpass,type;
	boolean insertB=false;
	private static RegisterBean rb;
	private RegisterBean()
	{}
	public static RegisterBean getRegisterBean()
	{
		if (rb==null)
		{
			rb=new RegisterBean();
		}
		return rb;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getLname() {
		return lname;
	}
	public void setLname(String lname) {
		this.lname = lname;
	}
	public String getDob()
	{
		return dob;
	}
	public void setDob(String dob)
	{
		this.dob=dob;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getNewpass()
	{
		return newpass;
	}
	public void setNewpass(String newpass)
	{
		this.newpass=newpass;
	}
	public String getType()
	{
		return type;
	}
	public void setType(String type)
	{
		this.type=type;
	}
	public boolean insert()
	{
		Connection cn=null;
		PreparedStatement ps=null;
		java.sql.Statement st=null;
		try{
			cn=DBmanager.getConnection();
			ps=cn.prepareStatement("insert into block_chain values(?,?,?,?,?,?,?,?)");
			Random random=new Random();
			int val=random.nextInt();
			String Hex=new String();
			Hex=Integer.toHexString(val);
			ps.setString(1, rb.getFname());
			ps.setString(2, rb.getLname());
			ps.setString(3, rb.getId());
			ps.setString(4, rb.getNewpass());
			ps.setString(5, rb.getDob());
			ps.setString(6, rb.getGender());
			ps.setString(7, rb.getType());
			ps.setString(8, Hex);
			String s=rb.getId();
			int m=ps.executeUpdate();
			if(m==1)
			{
				st=cn.createStatement();
				String sql="CREATE TABLE Chain_"+s+"(Sender_TID VARCHAR(30),Receiver_TID VARCHAR(30),Amount number(8),TIMEOFTRANS varchar(25),STATUS varchar(10),Product varchar(50),TransactionId varchar(300),PRIMARY KEY(TransactionId))";
				st.executeUpdate(sql);
				insertB=true;
			}
		}catch(Exception ee)
		{ee.printStackTrace();}
		finally{
			try{
			ps.close();
			cn.close();
		}catch(Exception ee)
			{
			ee.printStackTrace();
			}
			}
		return insertB;
	} 
}
