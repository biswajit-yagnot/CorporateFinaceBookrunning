package block_chainning;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
public class ProfileBean {
	private String id;
	boolean validB=false;
	private static ArrayList al;
	private static ProfileBean pb;
	private ProfileBean()
	{}
	public static ProfileBean getProfileBean()
	{
	if(pb==null)
	{
		pb=new ProfileBean();
	}
	return pb;
	}
	public static ArrayList getArrayList()
	{
		if(al==null)
		{
			al=new ArrayList();
		}
		return al;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public boolean profile()
	{
		PreparedStatement ps=null;
		Connection cn=null;
		try{
			cn=DBmanager.getConnection();
			ps=cn.prepareStatement("select * from block_chain where PHNO=(?)");
			ps.setString(1, pb.getId());
			al=ProfileBean.getArrayList();
			if(al!=null)
			{
				al.clear();
			}
			ResultSet rs=ps.executeQuery();
			String ph="",name="",dob="",gender="",type="",tid="";
			while(rs.next())
			{
				ph=rs.getString(3);
				name=rs.getString(1)+" "+rs.getString(2);
				dob=rs.getString(5);
				gender=rs.getString(6);
				type=rs.getString(7);
				tid=rs.getString(8);
			}
			String s=ph+"_"+name+"_"+dob+"_"+gender+"_"+type+"_"+tid;
			al.add(s);
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
}
