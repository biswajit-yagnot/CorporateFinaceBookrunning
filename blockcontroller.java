package block_chainning;
import java.io.IOException;
import javax.servlet.http.HttpServlet;
public class blockcontroller extends HttpServlet {
	public blockcontroller() {
        super();
    }
	public static boolean Register()
	{
		boolean b=false;
		RegisterBean rb=RegisterBean.getRegisterBean();
		b=rb.insert();
		return b;
	}
	public static int Login()
	{
		int b;
		LoginBean lb=LoginBean.getLoginBean();
		b=lb.validate();
		return b;
	}
	public static boolean Search()
	{
		boolean b=false;
		ViewBean vb=ViewBean.getViewBean();
		b=vb.search();
		return b;
	}
	public static boolean Transaction()
	{
		boolean b=false;
		TransactionBean vb=TransactionBean.getTransactionBean();
		b=vb.transaction();
		return b;
	}
}
