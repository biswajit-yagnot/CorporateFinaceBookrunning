package block_chainning;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class AllTransactionBean {
	private static ArrayList al;
	private static AllTransactionBean ub;
	private AllTransactionBean()
	{}
	public static AllTransactionBean getAllTransactionBean()
	{
	if(ub==null)
	{
		ub=new AllTransactionBean();
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
	public boolean transaction(){
		boolean bb=false;
		PreparedStatement ps=null;
		Connection cn=null;
		try{
			cn=DBmanager.getConnection();
			ps=cn.prepareStatement("select * from all_transaction");
			ResultSet rs=ps.executeQuery();
			al=UpdateBean.getArrayList();
			if(al!=null)
			{
				al.clear();
			}
			while(rs.next())
			{
				String s=rs.getString(1)+"_"+rs.getString(2)+"_"+rs.getString(3)+"_"+rs.getString(4)+"_"+rs.getString(5);
				al.add(s);
				bb=true;
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
		return bb;
}
}
