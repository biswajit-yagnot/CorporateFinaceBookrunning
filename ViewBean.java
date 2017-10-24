package block_chainning;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.ListIterator;

import block_chainning.DBmanager;
public class ViewBean {
	private String fname,lname,id,status,rid,name,ind,name1;
	private static ViewBean sb;
	boolean searchB=false,insertB=false;
	private static ArrayList al;
	private static ArrayList al1;
	private static ArrayList al2;
	private static ArrayList al3;
	private ViewBean()
	{}
	public static ViewBean getViewBean()
	{
	if(sb==null)
	{
		sb=new ViewBean();
	}
	return sb;
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
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getRName() {
		return name1;
	}
	public void setRName(String name1) {
		this.name1 = name1;
	}
	public String getLname() {
		return lname;
	}
	public void setLname(String lname) {
		this.lname = lname;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getRid() {
		return rid;
	}
	public void setRid(String rid) {
		this.rid = rid;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getIndex() {
		return ind;
	}
	public void setIndex(String ind) {
		this.ind = ind;
	}
	public boolean search()
	{
		Connection cn=null;
		PreparedStatement st;
			try{
			cn=DBmanager.getConnection();
			st=cn.prepareStatement("select * from Market");
			al=ViewBean.getArrayList();
			al1=ViewBean.getArrayList1();
			al2=ViewBean.getArrayList2();
			al3=ViewBean.getArrayList3();
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
			ResultSet rs= st.executeQuery();
			while(rs.next())
			{
				al.add(rs.getString(1));
				al1.add(rs.getString(2));
				al2.add(rs.getString(3));
				al3.add(rs.getString(4));
				searchB=true;
			}
				
		}catch(Exception ee)
		{ee.printStackTrace();}
		finally{
			try{
			cn.close();
		}catch(Exception ee)
		{}
		}
		return searchB;
	}
}
