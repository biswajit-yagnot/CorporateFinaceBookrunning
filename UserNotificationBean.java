package block_chainning;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.zip.Adler32;

public class UserNotificationBean {
	private String id,rid,price;
	boolean validB;
	private static ArrayList al,al1,al2,al3;
	private static UserNotificationBean unb;
	private UserNotificationBean()
	{}
	public static UserNotificationBean getUserNotificationBean()
	{
	if(unb==null)
	{
		unb=new UserNotificationBean();
	}
	return unb;
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
	public static ArrayList getArrayList3()
	{
		if(al3==null)
		{
			al3=new ArrayList();
		}
		return al3;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public boolean usernotification()
	{
		boolean bb=false;
		PreparedStatement ps=null;
		Connection cn=null;
		try{
			cn=DBmanager.getConnection();
			ps=cn.prepareStatement("select * from chain_"+unb.getId()+" where status is null");
			PreparedStatement ps1=cn.prepareStatement("select * from chain_"+unb.getId()+" where status=(?)");
			ps1.setString(1, "yes");
			ResultSet rs=ps.executeQuery();
			al=UserNotificationBean.getArrayList();
			al1=UserNotificationBean.getArrayList1();
			al2=UserNotificationBean.getArrayList2();
			al3=UserNotificationBean.getArrayList3();
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
			if(al3!=null)
			{
				al3.clear();
			}
			while(rs.next()){
				al1.add(rs.getString(2));
				al.add(rs.getString(3));
				al3.add(rs.getString(6));
				bb=true;
			}
			
			ResultSet rs1=ps1.executeQuery();
			while(rs1.next()){
				String send=rs1.getString(1);
				String receive=rs1.getString(2);
				String amount=rs1.getString(3);
				String time=rs1.getString(4);
				String product=rs1.getString(6);
				String s=send+"_"+receive+"_"+amount+"_"+time+"_"+product;
				al2.add(s);
				
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
		return bb;
	}
}
