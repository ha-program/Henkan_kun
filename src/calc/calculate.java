package calc;

import java.io.IOException;
import java.math.BigDecimal;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class calculate
 */
@WebServlet("/calculate")
public class calculate extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public calculate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		long bunshi=1,bunbo=1;
		int error=0;
		String shousuu=request.getParameter("shosu");

		try{
			BigDecimal shosu = new BigDecimal(shousuu);
			BigDecimal ten = BigDecimal.valueOf(10);

			//小数（分子）と初期値1の分母を、分子が整数になるまで10倍
			while(true){
				double b = shosu.doubleValue();

				if(b%1 == 0)break;

				bunbo*=10;
				shosu=shosu.multiply(ten);
			}
			bunshi = shosu.intValue();

			//循環小数の場合の処理
			if(request.getParameter("junkan")!=null){
				int i;
				String j_shousuu=request.getParameter("junkansetsu");
				int j_keta=j_shousuu.length();
				String a="";

				for(i=0;i<j_keta;i++) a=a+"9";
				long j_bunbo=Integer.parseInt(a);

				if(shousuu.indexOf(".")>0){
					int keta=shousuu.length()-shousuu.indexOf(".")-1;
					for(i=0;i<keta;i++)j_bunbo*=10;
				}
				else shousuu=shousuu+".";//小数点を表示

				long j_bunshi=Long.parseLong(j_shousuu);

				//通分して足し算
				bunshi=(bunshi*j_bunbo)+(j_bunshi*bunbo);
				bunbo*=j_bunbo;


				//循環節の表示のためのやつ
				if(j_shousuu.length()!=1){
					char first=j_shousuu.charAt(0);
					char last=j_shousuu.charAt(j_shousuu.length()-1);
					j_shousuu=j_shousuu.substring(1,j_shousuu.length()-1);
					request.setAttribute("first",first);
					request.setAttribute("last",last);
				}
				request.setAttribute("junkansetsu",j_shousuu);
			}

			//約分
			long g=gcd(bunshi,bunbo);
			bunshi/=g;
			bunbo/=g;
		}catch(NumberFormatException ex){
			error=1;
		}
		request.setAttribute("error",error);
		request.setAttribute("bunshi",bunshi);
		request.setAttribute("bunbo",bunbo);
		request.setAttribute("shosu",shousuu);

	    RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/Henkan_kun_result.jsp");
	    rd.forward(request, response);
	}

	//ユークリッドの互除法
	long gcd(long a, long b){
		long t;
		t=a%b;
		if(t==0)return b;
		else return gcd(b,t);
	}
}
