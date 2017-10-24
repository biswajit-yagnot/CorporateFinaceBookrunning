package block_chainning;

import java.security.MessageDigest;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class UpdateBean {
	private String id,value;
	boolean updateB,updateC;
	private static ArrayList al,al1,al2;
	private static UpdateBean ub;
	private UpdateBean()
	{}
	public static UpdateBean getUpdateBean()
	{
	if(ub==null)
	{
		ub=new UpdateBean();
	}
	return ub;
	}
	public static ArrayList getArrayList()
	{
		if(al==null)
		{
			al=new ArrayList();
		}
		return al;
	}
	public static ArrayList getArrayList1()
	{
		if(al1==null)
		{
			al1=new ArrayList();
		}
		return al1;
	}
	public static ArrayList getArrayList2()
	{
		if(al2==null)
		{
			al2=new ArrayList();
		}
		return al2;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
	public boolean updateyesaccount()
	{
		PreparedStatement ps=null;
		Connection cn=null;
		try{
			int flag=0;
			int n=Integer.parseInt(ub.getValue());
			cn=DBmanager.getConnection();
			PreparedStatement ps6=cn.prepareStatement("select tid from block_chain where phno=(?)");
			ps6.setString(1, ub.getId());
			ResultSet rSet=ps6.executeQuery();
			String sid="";
			while(rSet.next()){
				sid=rSet.getString(1);
			}
			ps=cn.prepareStatement("select * from chain_"+ub.getId()+" where status is null");
			ResultSet rs=ps.executeQuery();
			al=UpdateBean.getArrayList();
			al1=UpdateBean.getArrayList1();
			al2=UpdateBean.getArrayList2();
			if(al!=null)
			{
				al.clear();
			}
			if(al1!=null)
			{
				al1.clear();
			}
			if(al2!=null)
			{
				al2.clear();
			}
			while(rs.next()){
				al.add(rs.getString(7));
				al1.add(rs.getString(1));
				al2.add(rs.getString(6));
			}
			String transac=(String)al.get(Integer.parseInt(ub.getValue()));
			String tid=(String)al1.get(Integer.parseInt(ub.getValue()));
			String product=(String)al2.get(Integer.parseInt(ub.getValue()));
			PreparedStatement ps1=cn.prepareStatement("select phno from block_chain where tid=(?)");
			ps1.setString(1, tid);
			ResultSet rS1=ps1.executeQuery();
			String str="";
			while(rS1.next()){
				str=rS1.getString(1);
			}
			PreparedStatement ps2=cn.prepareStatement("select sysdate from dual");
			ResultSet rs2=ps2.executeQuery();
			String date="";
			while(rs2.next()){
				date=rs2.getString(1);
			}
			PreparedStatement ps3=cn.prepareStatement("update chain_"+ub.getId()+" set status=(?) , TIMEOFTRANS=(?) where TRANSACTIONID=(?)");
			PreparedStatement ps4=cn.prepareStatement("update chain_"+str+" set status=(?) , TIMEOFTRANS=(?) where TRANSACTIONID=(?)");
			PreparedStatement ps5=cn.prepareStatement("insert into all_transaction values(?,?,?,?,?)");
			ps3.setString(1, "yes");
			ps3.setString(2, date);
			ps3.setString(3, transac);
			ps4.setString(1, "yes");
			ps4.setString(2, date);
			ps4.setString(3, transac);
			ps3.executeUpdate();
			ps4.executeUpdate();
			ps5.setString(1, tid);
			ps5.setString(2, sid);
			ps5.setString(3, date);
			ps5.setString(4, product);
			MessageDigest md = MessageDigest.getInstance("SHA-256");
			int store=Integer.parseInt(transac);
			byte bb=(byte)store;
			md.update(bb);
			 byte[] mdbytes = md.digest();
			StringBuffer hex = new StringBuffer();
			for (int i = 0; i < mdbytes.length; i++) {
			hex.append(Integer.toHexString(0xFF & bb));
			}
			String hexString=hex.substring(0, 4).toString();
			ps5.setString(5, hexString);
			ps5.executeUpdate();
			updateB=true;
		}catch(Exception ee){
			ee.printStackTrace();
		}
		finally{
			try{
			ps.close();
			cn.close();
		}catch(Exception ee)
		{}
		}
		return updateB;
	}
	public boolean updatenoaccount()
	{
		PreparedStatement ps=null;
		Connection cn=null;
		try{
			int flag=0;
			int n=Integer.parseInt(ub.getValue());
			cn=DBmanager.getConnection();
			PreparedStatement ps6=cn.prepareStatement("select tid from block_chain where phno=(?)");
			ps6.setString(1, ub.getId());
			ResultSet rSet=ps6.executeQuery();
			String sid="";
			while(rSet.next()){
				sid=rSet.getString(1);
			}
			ps=cn.prepareStatement("select * from chain_"+ub.getId()+" where status is null");
			ResultSet rs=ps.executeQuery();
			al=UpdateBean.getArrayList();
			al1=UpdateBean.getArrayList1();
			al2=UpdateBean.getArrayList2();
			if(al!=null)
			{
				al.clear();
			}
			if(al1!=null)
			{
				al1.clear();
			}
			if(al2!=null)
			{
				al2.clear();
			}
			while(rs.next()){
				al.add(rs.getString(7));
				al1.add(rs.getString(1));
				al2.add(rs.getString(6));
			}
			String transac=(String)al.get(Integer.parseInt(ub.getValue()));
			String tid=(String)al1.get(Integer.parseInt(ub.getValue()));
			String product=(String)al2.get(Integer.parseInt(ub.getValue()));
			PreparedStatement ps1=cn.prepareStatement("select phno from block_chain where tid=(?)");
			ps1.setString(1, tid);
			ResultSet rS1=ps1.executeQuery();
			String str="";
			while(rS1.next()){
				str=rS1.getString(1);
			}
			PreparedStatement ps2=cn.prepareStatement("select sysdate from dual");
			ResultSet rs2=ps2.executeQuery();
			String date="";
			while(rs2.next()){
				date=rs2.getString(1);
			}
			PreparedStatement ps3=cn.prepareStatement("update chain_"+ub.getId()+" set status=(?) , TIMEOFTRANS=(?) where TRANSACTIONID=(?)");
			PreparedStatement ps4=cn.prepareStatement("update chain_"+str+" set status=(?) , TIMEOFTRANS=(?) where TRANSACTIONID=(?)");
			ps3.setString(1, "yes");
			ps3.setString(2, date);
			ps3.setString(3, transac);
			ps4.setString(1, "yes");
			ps4.setString(2, date);
			ps4.setString(3, transac);
			ps3.executeUpdate();
			ps4.executeUpdate();
			updateC=true;
		}catch(Exception ee){
			ee.printStackTrace();
		}
		finally{
			try{
			ps.close();
			cn.close();
		}catch(Exception ee)
		{}
		}
		return updateC;
	}
	
}
