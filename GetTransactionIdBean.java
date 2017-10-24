package block_chainning;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class GetTransactionIdBean {
	private String id,tid;
	private static GetTransactionIdBean gb;
	private static ArrayList al;
	private GetTransactionIdBean()
	{}
	public static GetTransactionIdBean getGetTransactionIdBean()
	{
		if (gb==null)
		{
			gb=new GetTransactionIdBean();
		}
		return gb;
	}
	/*public static ArrayList getArrayList()
	{
		if(al==null)
		{
			al=new ArrayList();
		}
		return al;
	}*/
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTId() {
		return tid;
	}
	public void setTId(String tid) {
		this.tid = tid;
	}
	public boolean gettransaction()
	{
		boolean b=false;
		PreparedStatement ps=null;
		Connection cn=null;
		try{
			cn=DBmanager.getConnection();
			ps=cn.prepareStatement("select TRANSACTION_ID from all_transaction");
			ResultSet rs=ps.executeQuery();
			String str="";
			/*al=GetTransactionIdBean.getArrayList();
			if(al!=null)
			{
				al.clear();
			}*/
			while(rs.next())
			{
				String tid=rs.getString(1);
				if(!(tid.equals(gb.getId()))){
					str=str+tid+"_";
				}
				else
					break;
			}
			
			str=str+gb.getId();
			gb.setTId(str);
			b=true;
		}catch(Exception ee)
		{
			ee.printStackTrace();
		}
		finally{
			try{
			ps.close();
			cn.close();
		}catch(Exception ee)
			{
			ee.printStackTrace();
			}
			}
		return b;
	}
}
