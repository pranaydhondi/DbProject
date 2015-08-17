package register;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletInputStream;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.PrintWriter;
import java.security.Principal;

/**
 * Servlet implementation class Register
 */
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection conn1 =null;
	Statement st =null;  
    /**
     * @see HttpServlet#HttpServlet()
     */
	public void init() throws ServletException {
	      //Open the connection here
		
	   String dbURL2 = "jdbc:postgresql://localhost/cs387";
      String user = "user1";
      String pass = "user123";

      try {
			Class.forName("org.postgresql.Driver");
		
			conn1 = DriverManager.getConnection(dbURL2, user, pass);
			st = conn1.createStatement();
			System.out.println("init"+conn1);
      	} catch (Exception e) {
			// TODO Auto-generated catch block
      		e.printStackTrace();
      	}
	    }

	    public void destroy() {
	     //Close the connection here
	    	try{
	    		conn1.close();
	    		System.out.println("close");
	    	}catch(Exception e)
	    	{
	    		System.out.println(e);
	    	}
	    }
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String c_for = request.getParameter("register_by");
		String name = request.getParameter("name");
		String sex = request.getParameter("sex");
		String religion = request.getParameter("RELIGION");
		String mt = request.getParameter("MOTHERTONGUE");
		String country = request.getParameter("COUNTRY");
		String email = request.getParameter("mail_id");
		String passwd = request.getParameter("passwd");
		try{
			HttpSession session = request.getSession();
			String s = "INSERT INTO info VALUES('"+c_for+"','"+name+"','"+
						sex+"','"+religion+"','"+mt+"','"+country+"','"+email+"','"+passwd+"')";
			
			String s1 = "SELECT count(*) FROM info WHERE emailid LIKE '" +email+"'";
			ResultSet r = null;
			int check = 1;
			r =st.executeQuery(s1);
			while(r.next()) {
				 check=r.getInt(1);
			 }
			if(check == 0){
			//System.out.println(s);
				s1="INSERT into advanced_info(emailid) VALUES('"+email+"')";
				st.executeUpdate(s);
				st.executeUpdate(s1);
				s1="INSERT into preference(emailid) VALUES('"+email+"')";
				st.executeUpdate(s1);
				
				session.setAttribute("message", "You have registered sucessfully");
				session.setMaxInactiveInterval(30);
				}
			else{
				session.setAttribute("message", "Email id already registered");
			}
			
			response.sendRedirect("/Matrimony/index.jsp");
		}catch(SQLException e){
			e.printStackTrace();
		}
		
	}

}
