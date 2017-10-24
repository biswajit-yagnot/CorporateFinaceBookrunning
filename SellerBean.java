package block_chainning;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Random;

public class SellerBean {
	private String id,cost,pname;
	boolean validB;
	private static SellerBean sb;
	private SellerBean()
	{}
	public static SellerBean getSellerBean()
	{
	if(sb==null)
	{
		sb=new SellerBean();
	}
	return sb;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCost() {
		return cost;
	}
	public void setCost(String cost) {
		this.cost = cost;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public boolean store()
	{
		Connection cn=null;
		PreparedStatement ps=null;
		try{
			cn=DBmanager.getConnection();
			ps=cn.prepareStatement("insert into market values(?,?,?,?)");
			ps.setString(2, sb.getPname());
			ps.setString(3, sb.getId());
			ps.setString(4, sb.getCost());
			Random rand=new Random();
			int n=rand.nextInt(9999)+1000;
			ps.setString(1, Integer.toString(n));
			int m=ps.executeUpdate();
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
