package block_chainning;
import java.security.MessageDigest;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.IdentityHashMap;
import java.util.Iterator;
import java.util.Random;
import java.util.Set;

import javax.naming.spi.DirStateFactory.Result;
public class TransactionBean {
	private String id,rid,price,product;
	boolean validB;
	private static ArrayList al;
	private static TransactionBean tb;
	private TransactionBean()
	{}
	public static TransactionBean getTransactionBean()
	{
	if(tb==null)
	{
		tb=new TransactionBean();
	}
	return tb;
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
	public String getRid() {
		return rid;
	}
	public void setRid(String rid) {
		this.rid = rid;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getProduct() {
		return product;
	}
	public void setProduct(String product) {
		this.product = product;
	}
	public boolean transaction()
	{
		PreparedStatement ps=null,ps1=null;
		Connection cn=null;
		String s3="";
		try{
			cn=DBmanager.getConnection();
			ps=cn.prepareStatement("select tid from block_chain where phno=(?)");
			String s1=tb.getId();
			ps.setString(1, s1);
			ResultSet rSet=ps.executeQuery();
			while(rSet.next())
			{
				s3=rSet.getString(1);
			}
			String s4=s3+"_"+tb.getPrice()+"_"+tb.getProduct();
			al=TransactionBean.getArrayList();
			if(al!=null)
			{
				al.clear();
			}
			al.add(s4);
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
	public boolean check(IdentityHashMap hm)
	{
		PreparedStatement ps=null;
		Connection cn=null;
		boolean b=false;
		try{
			cn=DBmanager.getConnection();
			ps=cn.prepareStatement("insert into chain_"+tb.getRid()+" values(?,?,?,?,?,?,?)");
			PreparedStatement ps2=cn.prepareStatement("insert into chain_"+tb.getId()+" values(?,?,?,?,?,?,?)");
			Set ss=hm.keySet();
			Iterator ii=ss.iterator();
			String s3="";
			String stat="";
			while(ii.hasNext()){
				s3=(String)ii.next();
				stat=(String)hm.get(s3);
			}
			String s5="";
			String s4[]=s3.split("_");
			ps.setString(1, s4[0]);
			PreparedStatement ps1=cn.prepareStatement("select tid from block_chain where phno=(?)");
			ps1.setString(1, tb.getRid());
			ResultSet rs=ps1.executeQuery();
			String t="";
			while(rs.next())
			{
				t=rs.getString(1);
			}
			MessageDigest md = MessageDigest.getInstance("SHA-256");
			Random rand=new Random();
			int k=rand.nextInt(9999)+1000;
			/*byte bb=(byte)k;
			md.update(bb);
			 byte[] mdbytes = md.digest();
			StringBuffer hex = new StringBuffer();
			for (int i = 0; i < mdbytes.length; i++) {
			hex.append(Integer.toHexString(0xFF & bb));
			}
			String hexString=hex.substring(0, 4).toString();*/
			ps.setString(2, t);
			ps.setString(3, s4[1]);
			ps.setString(4, s5);
			ps.setString(5, stat);
			ps.setString(6, s4[2]);
			ps.setString(7, Integer.toString(k));
			ps2.setString(1, s4[0]);
			ps2.setString(2, t);
			ps2.setString(3, s4[1]);
			ps2.setString(4, s5);
			ps2.setString(5, stat);
			ps2.setString(6, s4[2]);
			ps2.setString(7, Integer.toString(k));
			int m=ps.executeUpdate();
			int n=ps2.executeUpdate();
			b=true;
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
		return b;
	}
}
