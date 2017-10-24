package block_chainning;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class NotificationBean {
	private String id,rid,price;
	boolean validB;
	private static ArrayList al,al1,al2;
	private static NotificationBean nb;
	private NotificationBean()
	{}
	public static NotificationBean getNotificationBean()
	{
	if(nb==null)
	{
		nb=new NotificationBean();
	}
	return nb;
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
	public boolean notification()
	{
		PreparedStatement ps=null;
		Connection cn=null;
		try{
			cn=DBmanager.getConnection();
			ps=cn.prepareStatement("select * from chain_"+nb.getId()+" where status is null");
			ResultSet rSet=ps.executeQuery();
			al=NotificationBean.getArrayList();
			al1=NotificationBean.getArrayList1();
			al2=NotificationBean.getArrayList2();
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
			while(rSet.next())
			{
				al.add(rSet.getString(1));
				al1.add(rSet.getString(6));
				al2.add(rSet.getString(3));
			}
			validB=true;
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
		return validB;
	}
	public int count()
	{
		int flag=0;
		PreparedStatement ps=null;
		Connection cn=null;
		try{
			cn=DBmanager.getConnection();
			ps=cn.prepareStatement("select count(*) from chain_"+nb.getId()+" where status is null");
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				flag=rs.getInt(1);
			}
			
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
		return flag;
	}
}
