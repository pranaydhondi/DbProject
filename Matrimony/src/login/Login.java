package login;
import java.sql.Date;
import java.util.Vector;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collection;
import java.util.Collections;
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
 * Servlet implementation class Login
 */
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection conn1 =null;
	Statement st =null;
	String email="";
	public void init() throws ServletException {	
		String dbURL2 = "jdbc:postgresql://localhost/cs387";
	    String user = "user1";
	    String pass = "user123";

	    try {
				Class.forName("org.postgresql.Driver");
			
				conn1 = DriverManager.getConnection(dbURL2, user, pass);
				st = conn1.createStatement();
				st.setQueryTimeout(30*60);
				System.out.println("init"+conn1);
	    	} catch (Exception e) {
	    		e.printStackTrace();
	    	}
	   }

	    public void destroy() {
	    	try{
	    		conn1.close();
	    		System.out.println("close");
	    	}catch(Exception e)
	    	{
	    		System.out.println(e);
	    	}
	    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String f_name=request.getParameter("form_name");
		if(f_name !=null){
			if(f_name.equals("info")){
				String name=request.getParameter("name");
				String religion=request.getParameter("RELIGION");
				String zodiac=request.getParameter("zodiac");
				String d=request.getParameter("date");
				String m=request.getParameter("month");
				String y=request.getParameter("year");
				String btype=request.getParameter("body_type");
				String height=request.getParameter("height");
				String weight=request.getParameter("weight");
				String mstatus=request.getParameter("marrial_status");
				String complexion=request.getParameter("complexation");
				String pstatus=request.getParameter("pstatus");
				String shabit=request.getParameter("shabit");
				String ehabit=request.getParameter("ehabit");
				String dhabit=request.getParameter("dhabit");
				String state=request.getParameter("state");
				String city=request.getParameter("city");
				String s="UPDATE info SET name='"+name+"',religion='"+religion+"' WHERE emailid LIKE '"+email+"'";
				try{
				st.executeUpdate(s);
				 s="UPDATE advanced_info SET (dob,height,weight,zodiac,marital_status,body_type,complexion,location.state,location.city,"
						+ "physical_status,eating_habits,drinking_habits,smoking_habits)=('"
						 +y+"-"+m+"-"+d+"','"+height+"','"+weight+"','"+zodiac+"','"+mstatus+"','"+btype+"','"+complexion+"','"+state+"'"
						 		+ ",'"+city+"','"+pstatus+"','"+ehabit+"','"+dhabit+"','"+shabit+"')  WHERE emailid LIKE '"+email+"'";
						 		
				 System.out.print(s);
				st.executeUpdate(s);
				response.sendRedirect("/Matrimony/profile.jsp");
				}
				catch(SQLException e){
					e.printStackTrace();
				}
			}else if(f_name.equals("preferences")){
				Integer age_low = Integer.parseInt(request.getParameter("fromAge"));
				Integer age_high= Integer.parseInt(request.getParameter("toAge"));
				int marital=checkboxvalue(request.getParameterValues("MStatus"));
				int eating=checkboxvalue(request.getParameterValues("EatingHabits"));
				String physical=request.getParameter("Physic");
				int drink=checkboxvalue(request.getParameterValues("DrinkingHabits"));
				int smoke=checkboxvalue(request.getParameterValues("SmokingHabits"));
				String religion=request.getParameter("religion");
				String s="UPDATE preference SET Age_range='["+age_low+","+age_high+"]',marital_status='"+marital+"', physical_status='"+physical+"',eating_habits='"+eating+"',drinking_habits='"+drink+"',"
						+"smoking_habits='"+smoke+"',religion='"+religion
						+"' WHERE emailid LIKE '"+email+"'";
				try{
				System.out.println(s);
				st.executeUpdate(s);}
				catch(SQLException e){
					e.printStackTrace();
				}
				response.sendRedirect("/Matrimony/home.jsp");
				
			}
		}
		else{
			email = request.getParameter("username");
			String passwd = request.getParameter("password");
			try{ 
				HttpSession session = request.getSession();
				String s="SELECT * from info where emailid LIKE '"+email+"'",s1="";
				ResultSet rs=st.executeQuery(s);
				if (rs==null) { session.setAttribute("message", "not registered");
					response.sendRedirect("/Matrimony/index.jsp");
					
				}
				else {
					 while(rs.next()) {
						 s1=rs.getString(8);
					 }
					 if(passwd.equals(s1)) {
						 session.setAttribute("object", this);
						 response.sendRedirect("/Matrimony/home.jsp");
					 }
					 else {session.setAttribute("message", "wrong password");
						 response.sendRedirect("/Matrimony/index.jsp");
					 }
					 
				}
				
			}
			catch(SQLException e){
				e.printStackTrace();
			}
		}
	}
	private int checkboxvalue(String[] parameterValues) {
		if(parameterValues == null)return 0;
		int i=0;
		int answer=0;
		for(;i<parameterValues.length;i++){
			if(parameterValues[i].equals("1"))answer++;
			else if(parameterValues[i].equals("2"))answer = answer+2;
			else answer=answer+4;
		}
		return answer;
	}

	public void send_interest(String emailid){
		String s="INSERT INTO Interested_In(from_id,to_id,Accepted) values ('"
				+ email+"','"+emailid+"','pending')";
		System.out.println(s);
		try{
		st.executeUpdate(s);
		}
		catch(SQLException e){
			e.printStackTrace();
		}
	}
	public void accept_interest(String emailid){
		String s="UPDATE Interested_In set accepted='accepted' where from_id='"+emailid+"' and to_id='"+email+"'";
		System.out.println(s);
		try{
			st.executeUpdate(s);
			}
			catch(SQLException e){
				e.printStackTrace();
			}
	}
	public void cancel_interest(String emailid){
		String s="DELETE From Interested_In WHERE from_id='"
				+ email+"' and to_id ='"+emailid+"'";
		System.out.println(s);
		try{
		st.executeUpdate(s);
		}
		catch(SQLException e){
			e.printStackTrace();
		}
	}
	public int solveAge(String age){
		if (age.equals(0)){
			return 25;
		}
		else if (age.equals(1)){
			return 30;
		}
		else if (age.equals(2)){
			return 35;
		}
		else if (age.equals(3)){
			return 40;
		}
		else if (age.equals(4)){
			return 45;
		}
		else return 25;
		
	}
	
	public String solveMarital(String marital){
		if (marital.equals(0)){
			return "";}
		else if (marital.equals(1)){
			return " and marital_status='Unmarried'";
			}
		else if (marital.equals(2)){
			return " and marital_status='Divorced'";
			}
		else if (marital.equals(3)){
			return " and (marital_status='Unmarried' or marital_status='Divorced')";
			}
		else if (marital.equals(4)){
			return " and marital_status='Widowed'";
			}
		else if (marital.equals(5)){
			return " and (marital_status='Unmarried' or marital_status='Widowed') ";
			}
		else if (marital.equals(6)){
			return " and (marital_status='Divorced' or marital_status='Widowed')";
			}
		else if (marital.equals(7)){
			return " and (marital_status='Unmarried' or marital_status='Divorced' or marital_status='Widowed')";
			}
		else return "";
	}
	public String solveReligion(String religion){
		if (religion.equals(0)){
			return "";}
		else if (religion.equals(1)){
			return " and religion='Hindu'";
			}
		else if (religion.equals(2)){
			return " and religion='Muslim'";
			}
		else if (religion.equals(3)){
			return " and (religion='Hindu' or religion='Muslim')";
			}
		else if (religion.equals(4)){
			return " and religion='Christian'";
			}
		else if (religion.equals(5)){
			return " and (religion='Hindu' or religion='Christian') ";
			}
		else if (religion.equals(6)){
			return " and (religion='Muslim' or religion='Christian')";
			}
		else if (religion.equals(7)){
			return " and (religion='Hindu' or religion='Muslim' or religion='Christian')";
			}
		else return "";
		
	}
	public ArrayList<Data> getSearchResults(String name,String age,String marital,String religion){
		ArrayList<Data> result_data=new ArrayList<Data>();
		String s;
		try{
			ResultSet rs;
			System.out.println(name);
			if (!(name.equals(":::::::"))){
				s="SELECT name,dob,height,religion,zodiac,(location).city,(location).state,info.emailid "
					+"from info natural join advanced_info where name='"+name+"'";
				System.out.println(s);
			}
			else { 
				 s="SELECT name,dob,height,religion,zodiac,(location).city,(location).state,info.emailid "
						+"from info natural join advanced_info where advanced_info.dob+"+solveAge(age)+"*interval '1 year'>current_date"
						+ solveMarital(marital)+solveReligion(religion);
				 System.out.println(s);
				}
			
			rs=st.executeQuery(s);
			
			while (rs.next()){
				Data d=new Data();
				
			d.name=check(rs.getString(1));
			d.age=get_age((check(rs.getString(2))));
			d.height=check(height(rs.getString(3)));
			d.religion=religion(rs.getString(4));
			d.zodiac=zodiac(check(rs.getString(5)));
			d.location=check(rs.getString(6))+","+check(rs.getString(7));
			d.email=rs.getString(8);
			result_data.add(d);
		}
			
		}
		
		catch(SQLException e){
			e.printStackTrace();
		}
		return result_data;
		
	}
	public ArrayList<Data> getMsgsSent(){
		ArrayList<Data> result_data=new ArrayList<Data>();
		String s="SELECT name,dob,height,religion,zodiac,(location).city,(location).state,accepted,info.emailid"
				+ " from info natural join advanced_info,Interested_in where "
				+ "(Interested_in.from_id='"+email+"' and Interested_in.to_id=info.emailid) ";
			System.out.println(s);
		try{
			ResultSet rs=st.executeQuery(s);
			while (rs.next()){
				Data d=new Data();
			d.name=check(rs.getString(1));
			d.age=get_age((check(rs.getString(2))));
			d.height=check(height(rs.getString(3)));
			
			d.religion=religion(rs.getString(4));
			d.zodiac=zodiac(check(rs.getString(5)));
			d.location=check(rs.getString(6))+","+check(rs.getString(7));
			d.accept=check(rs.getString(8));
			d.email=rs.getString(9);
			result_data.add(d);
			System.out.println("reach");
		}
		}
		catch(SQLException e){
			e.printStackTrace();
		}
		return result_data;
		
	}
	public ArrayList<Data> getMsgsReceived(){
		ArrayList<Data> result_data=new ArrayList<Data>();
		String s="SELECT name,dob,height,religion,zodiac,(location).city,(location).state,accepted,info.emailid "
				+ "from info natural join advanced_info,Interested_in where "
				+ "(Interested_in.to_id = '"+email+"' and Interested_in.from_id = info.emailid)";
		
		try{
			ResultSet rs=st.executeQuery(s);
			while (rs.next()){
				Data d=new Data();
			d.name=check(rs.getString(1));
			d.age=get_age((check(rs.getString(2))));
			d.height=check(height(rs.getString(3)));
			d.religion=religion(rs.getString(4));
			d.zodiac=zodiac(check(rs.getString(5)));
			d.location=check(rs.getString(6))+","+check(rs.getString(7));
			d.accept=check(rs.getString(8));
			d.email=rs.getString(9);
			result_data.add(d);
		}
		}
		catch(SQLException e){
			e.printStackTrace();
		}
		return result_data;
		
	}
	/*public void addToPreference(){
		String s="UPDATE preference SET Age_range=["+age_low+","+age_high+"],marital_status='"+marital+"',height=ROW('"+height.low
				+",'"+height.high+"'), physical_status='"+physical+"',eating_habits='"+eating+"',drinking_habits='"+drink+"',"
				+"smoking_habits='"+smoke+"',religion='"+religion
				+"' WHERE emailid LIKE '"+email+"'";
		try{
		st.executeQuery(s);}
		catch(SQLException e){
			e.printStackTrace();
		}
	}
	*/
public String getOthersDetails(String othersemailid){
		
		String s="SELECT * from info where emailid LIKE '"+othersemailid+"'",s1="";
		try{
		ResultSet rs=st.executeQuery(s);
		while (rs.next()){
			s1=s1+createdfor(rs.getString(1))+":"+rs.getString(2)+":"+religion(rs.getString(4))+":"+mothertounge(rs.getString(5))+":"+country(rs.getString(6));
		}//createdfor+name+religion+tongue+country
		s="SELECT body_type,Physical_status,complexion,Height,weight,zodiac,Marital_Status,"
				+ "Eating_habits,Drinking_habits,Smoking_habits,dob,(location).city,(location).state from advanced_info where "
				+ "emailid LIKE '"+othersemailid+"'";
		rs=st.executeQuery(s);
		while (rs.next()){
			s1=s1+":"+check(rs.getString(1))+"/"+check(rs.getString(3))+":"+check(rs.getString(2))+":"+height(check(rs.getString(4)))
					+":"+check(rs.getString(5))+":"+check(rs.getString(6))+":"+check(rs.getString(7))+":"+check(rs.getString(8))+":"+
					check(rs.getString(9))+":"
					+check(rs.getString(10))+":"+get_age(check(rs.getString(11)))+":"+check(rs.getString(13))+"/"+check(rs.getString(12));
		}//body/complexion+physical+height+weight+zodiac+marital+eating+drink+smoke+age+city,state
		
		}
		catch(SQLException e){
			e.printStackTrace();
		}
		//System.out.println(s1);
		return s1;
	}
	public ArrayList<Data> getData(){
		ArrayList<Data> result_data=new ArrayList<Data>();
		Vector<String> v=new Vector<String>();
		String s="WITH somerange as (SELECT Age_range from preference where emailid LIKE '"+email+"')"
				+ "SELECT name,dob,Height,religion,zodiac,(location).city,(location).state,Marital_Status,Physical_status,Eating_habits,"
				+ "Drinking_habits,Smoking_habits,profilefor,emailid from info natural join advanced_info  where "
				+ "current_date BETWEEN advanced_info.dob +(select * from somerange).lower*interval '1 year' and"
				+ " advanced_info.dob +(select * from somerange).upper*interval '1 year' and info.emailid not in (" +
						"select to_id from interested_in where from_id='"+email+"') and info.emailid not in " +
								"(select from_id from interested_in where to_id='"+email+"')";
		String s2="SELECT Marital_Status,(Height).low,(Height).high,Physical_status,Eating_habits,Drinking_habits,Smoking_habits,Religion"
				+ " from preference where emailid LIKE '"+email+"'";
		try{
			ResultSet rs=st.executeQuery(s2);
			while (rs.next()){
				for (int i=1;i<9;i++){
					v.add(rs.getString(i));
				}
			}
			System.out.println(s);
			rs=st.executeQuery(s);
		
		
			while (rs.next()){
				Data d=new Data();
				d.name=check(rs.getString(1));
				d.age=get_age((check(rs.getString(2))));
				d.height=height(check(v.get(2)));
				
				d.religion=religion(rs.getString(4));
				d.zodiac=zodiac(check(rs.getString(5)));
				d.location=check(rs.getString(6))+","+check(rs.getString(7));
				d.profilefor=createdfor(rs.getString(13));
				d.email=rs.getString(14);
				if (v.get(7)!=null){
					if (v.get(7).equals(rs.getString(4))) d.percent+=10;} //religion
				if (v.get(0)!=null){
				if (comp(v.get(0),rs.getString(8))) d.percent+=10;} //marital status
				if (v.get(3)!=null){
				if (v.get(3).equals(rs.getString(9))) d.percent+=10;} //physical status
				if (v.get(4)!=null){
				if (comp(v.get(4),rs.getString(10))) d.percent+=10;} //eating habits
				if (v.get(5)!=null){
				if (comp(v.get(5),rs.getString(11))) d.percent+=10;}//drinking
				if (v.get(6)!=null){
				if (comp(v.get(6),rs.getString(12))) d.percent+=10;}//smoking
				if (v.get(1)!=null&&v.get(2)!=null){
				float temp1=Float.parseFloat(v.get(1));
				float temp2=Float.parseFloat(v.get(2));
				float comp=Float.parseFloat(rs.getString(3));
				if (comp>temp1&&comp<temp2) d.percent+=10;  
				}//height
				result_data.add(d);
				}
			
			
		}
		catch(SQLException e){
			e.printStackTrace();
		}
		Collections.sort(result_data);
		return result_data;
	}
	
	
	
	public String get_info(){
		//name+email_id+profile_for+religion+mothertongue+country+zodiac+dob+height+weight+ms+bt+comp+ps+eh+dh+sh+state+city
		String s="SELECT name,emailid,profilefor,religion,mothertongue,country FROM info WHERE emailid LIKE '"+email+"'",s1="";
		
		
	try{
		ResultSet rs=st.executeQuery(s);
	while (rs.next()){
		s1=s1+rs.getString(1)+":"+rs.getString(2)+":"+rs.getString(3)+":"+rs.getString(4)+":"+rs.getString(5)+":"+rs.getString(6);
	}
	s="SELECT zodiac,dob,Height,weight,Marital_Status,Body_type,complexion,physical_status,"
			+ "Eating_habits,Drinking_habits,Smoking_habits,(location).state,(location).city"
			+ " FROM advanced_info where emailid LIKE '"+email+"'";
	
	System.out.println(s);
	rs=st.executeQuery(s);
	while (rs.next()){
		if(rs.getString(2)== null){
			s1=s1+":"+rs.getString(1)+":"+null+":"+null+":"+null+":"+rs.getString(3)+":"+rs.getString(4)+":"+rs.getString(5)+":"+rs.getString(6)
					+":"+rs.getString(7)+":"+rs.getString(8)+":"+rs.getString(9)+":"+rs.getString(10)+":"+rs.getString(11)+":"+check(rs.getString(12))+
					":"+check(rs.getString(13));
		}
		else{
		String[] temp=rs.getString(2).split("-");
		s1=s1+":"+rs.getString(1)+":"+temp[0]+":"+temp[1]+":"+temp[2]+":"+rs.getString(3)+":"+rs.getString(4)+":"+rs.getString(5)+":"+rs.getString(6)
				+":"+rs.getString(7)+":"+rs.getString(8)+":"+rs.getString(9)+":"+rs.getString(10)+":"+rs.getString(11)+":"+check(rs.getString(12))+
				":"+check(rs.getString(13));}
	}
	}
	catch(SQLException e){
		e.printStackTrace();
	}
	System.out.println(s1);
	return s1;
	
	
}
	public String getDetails(){
	
		String s="SELECT * from info where emailid LIKE '"+email+"'",s1="";
		try{
		ResultSet rs=st.executeQuery(s);
		while (rs.next()){
			s1=s1+createdfor(rs.getString(1))+":"+rs.getString(2)+":"+religion(rs.getString(4))+":"+mothertounge(rs.getString(5))+":"+country(rs.getString(6));
		}//createdfor+name+religion+tongue+country
		s="SELECT body_type,Physical_status,complexion,Height,weight,zodiac,Marital_Status,"
				+ "Eating_habits,Drinking_habits,Smoking_habits,dob,(location).city,(location).state from advanced_info where "
				+ "emailid LIKE '"+email+"'";
		rs=st.executeQuery(s);
		while (rs.next()){
			s1=s1+":"+check(rs.getString(1))+"/"+check(rs.getString(3))+":"+check(rs.getString(2))+":"+height(check(rs.getString(4)))
					+":"+check(rs.getString(5))+":"+zodiac(check(rs.getString(6)))+":"+marital(check(rs.getString(7)))+":"+eating(check(rs.getString(8)))+":"+
					smoke(check(rs.getString(9)))+":"
					+smoke(check(rs.getString(10)))+":"+get_age(check(rs.getString(11)))+":"+check(rs.getString(13))+"/"+check(rs.getString(12));
		}//body/complexion+physical+height+weight+zodiac+marital+eating+drink+smoke+age+city,state
		
		}
		catch(SQLException e){
			e.printStackTrace();
		}
		//System.out.println(s1);
		return s1;
	}
	private String check(String s){
		if(s==null || s.equals(""))return "Not Specified";
		else return s;
	}
	private String marital(String s){
		if(s.equals("Not Specified"))return s;
		else if(s.equals("1"))return "Never marrried";
		else if(s.equals("2"))return "Widowed"; 
		else if(s.equals("4"))return "Divorced"; 
		else return "Awaiting Divorce";
}
	private String smoke(String s){
		if(s.equals("Not Specified"))return s;
		else if(s.equals("1"))return "No";
		else if(s.equals("2"))return " Ocassionally"; 
		else return "Yes";

	}
	private String eating(String s){
		if(s.equals("Not Specified"))return s;
		else if(s.equals("1"))return "Vegetarian";
		else if(s.equals("2"))return " Non Vegetarian"; 
		else return "Eggetarian";
}
	
	private String height(String s){
		if(s.equals("Not Specified"))return s;
		else if(s.equals("1"))return " 4ft 6in ";
		else if(s.equals("2"))return " 4ft 7in ";
		else if(s.equals("3"))return " 4ft 8in "; 
		else if(s.equals("4"))return " 4ft 9in ";
		else if(s.equals("5"))return " 4ft 10in ";
		else if(s.equals("6"))return " 4ft 11in ";
		else if(s.equals("7"))return " 5ft ";
		else if(s.equals("8"))return " 5ft 1in ";
		else if(s.equals("9"))return " 5ft 2in ";
		else if(s.equals("10"))return " 5ft 3in ";
		else if(s.equals("11"))return " 5ft 4in ";
		else if(s.equals("12"))return " 5ft 5in ";
		else if(s.equals("13"))return " 5ft 6in ";
		else if(s.equals("14"))return " 5ft 7in ";
		else if(s.equals("15"))return " 5ft 8in "; 
		else if(s.equals("16"))return " 5ft 9in ";
		else if(s.equals("17"))return " 5ft 10in ";
		else if(s.equals("18"))return " 5ft 11in ";
		else if(s.equals("19"))return " 6ft ";
		else if(s.equals("20"))return " 6ft 1in ";
		else if(s.equals("21"))return " 6ft 2in ";
		else if(s.equals("22"))return " 6ft 3in ";
		else if(s.equals("23"))return " 6ft 4in ";
		else if(s.equals("24"))return " 6ft 5in ";
		else if(s.equals("25"))return " 6ft 6in ";
		else if(s.equals("26"))return " 6ft 7in ";
		else if(s.equals("27"))return " 6ft 8in "; 
		else if(s.equals("28"))return " 6ft 9in ";
		else if(s.equals("29"))return " 6ft 10in ";
		else if(s.equals("30"))return " 6ft 11in ";
		else return " 7ft ";
	}
	private String createdfor(String s){
		if(s.equals("2"))return "MySelf";
		else if(s.equals("3"))return "Son";
		else if(s.equals("4"))return "Daughter";
		else if(s.equals("5"))return "Brother";
		else if(s.equals("6"))return "Sister";
		else if(s.equals("7"))return "Relative";
		else return "Friend";
	}
	private String religion(String s){
		if (s.equals("1"))return "Hindu";
		else if (s.equals("10"))return "Muslim - Shia";
		else if (s.equals("11"))return "Muslim - Sunni";
		else if (s.equals("2"))return "Muslim - Others";
		else if(s.equals("12"))return "Christian - Catholic";
		else if(s.equals("13"))return "Christian - Orthodox";
		else if(s.equals("14"))return "Christian - Protestant";
		else if(s.equals("3"))return "Christian - Others";
		else if(s.equals("4"))return "Sikh";
		else if(s.equals("15"))return "Jain - Digambar";
		else if(s.equals("16"))return "Jain - Shwetambar";
		else if(s.equals("5"))return "Jain - Others";
		else if(s.equals("6"))return "Parsi";
		else if(s.equals("7"))return "Buddhist";
		else if(s.equals("8"))return "Inter-Religion";
		else return "No Religious Belief";
	}
	private String mothertounge(String s)
	{
	if(s.equals("54"))return "Angika";
	else if(s.equals("1"))return "Arunachali";
	else if(s.equals("2"))return "Assamese";
	else if(s.equals("3"))return "Awadhi";
	else if(s.equals("4"))return "Bengali";
	else if(s.equals("5"))return "Bhojpuri";
	else if(s.equals("6"))return "Brij";
	else if(s.equals("7"))return "Bihari";
	else if(s.equals("53"))return "Badaga";
	else if(s.equals("8"))return "Chatisgarhi";
	else if(s.equals("9"))return "Dogri";
	else if(s.equals("10"))return "English";
	else if(s.equals("11"))return "French";
	else if(s.equals("12"))return "Garhwali";
	else if(s.equals("13"))return "Garo";
	else if(s.equals("14"))return "Gujarati";
	else if(s.equals("15"))return "Haryanvi";
	else if(s.equals("16"))return "Himachali/Pahari";
	else if(s.equals("17 "))return "Hindi";
	else if(s.equals("18"))return "Kanauji";
	else if(s.equals("19"))return "Kannada";
	else if(s.equals("20"))return "Kashmiri";
	else if(s.equals("21"))return "Khandesi";
	else if(s.equals("22"))return "Khasi";
	else if(s.equals("23"))return "Konkani";
	else if(s.equals("24"))return "Koshali";
	else if(s.equals("25"))return "Kumoani";
	else if(s.equals("26"))return "Kutchi";
	else if(s.equals("27"))return "Lepcha";
	else if(s.equals("28"))return "Ladacki";
	else if(s.equals("29"))return "Magahi";
	else if(s.equals("30"))return "Maithili";
	else if(s.equals("31"))return "Malayalam";
	else if(s.equals("32"))return "Manipuri";
	else if(s.equals("33"))return "Marathi";
	else if(s.equals("34"))return "Marwari";
	else if(s.equals("35"))return "Miji";
	else if(s.equals("36"))return "Mizo";
	else if(s.equals("37"))return "Monpa";
	else if(s.equals("38"))return "Nicobarese";
	else if(s.equals("39"))return "Nepali";
	else if(s.equals("40"))return "Oriya";
	else if(s.equals("41"))return "Punjabi";
	else if(s.equals("42"))return "Rajasthani";
	else if(s.equals("43"))return "Sanskrit";
	else if(s.equals("44"))return "Santhali";
	else if(s.equals("45"))return "Sindhi";
	else if(s.equals("46"))return "Sourashtra";
	else if(s.equals("47"))return "Tamil";
	else if(s.equals("48"))return "Telugu";
	else if(s.equals("49"))return "Tripuri";
	else if(s.equals("50"))return "Tulu";
	else return "Urdu";
	}
	private String zodiac(String s){
		if (s.equals("1")) return "Aries";
		else if (s.equals("2")) return "Taurus";
		else if (s.equals("3")) return "Gemini";
		else if (s.equals("4")) return "Cancer";
		else if (s.equals("5")) return "Leo";
		else if (s.equals("6")) return "Virgo";
		else if (s.equals("7")) return "Libra";
		else if (s.equals("8")) return "Scorpio";
		else if (s.equals("9")) return "Sagittarius";
		else if (s.equals("10")) return "Capricorn";
		else if (s.equals("11")) return "Aquarius";
		else if (s.equals("12")) return "Pisces";
		return s;
	}
	private String country(String s){
		if(s.equals("98"))return "India";
		else if(s.equals("222"))return "United States of America";
		else if(s.equals("220"))return "United Arab Emirates";
		else if(s.equals("221"))return "United Kingdom";
		else if(s.equals("13"))return "Australia";
		else if(s.equals("189"))return "Singapore";
		else if(s.equals("39"))return "Canada";
		else if(s.equals("173"))return "Qatar";
		else if(s.equals("114"))return "Kuwait";
		else if(s.equals("161"))return "Oman";
		else if(s.equals("17"))return "Bahrain";
		else if(s.equals("185"))return "Saudi Arabia";
		else if(s.equals("129"))return "Malaysia";
		else if(s.equals("80"))return "Germany";
		else if(s.equals("153"))return "New Zealand";
		else if(s.equals("73"))return "France";
		else if(s.equals("102"))return "Ireland";
		else if(s.equals("203"))return "Switzerland";
		else if(s.equals("193"))return "South Africa";
		else if(s.equals("195"))return "Sri Lanka";
		else if(s.equals("99"))return "Indonesia";
		else if(s.equals("149"))return "Nepal";
		else if(s.equals("162"))return "Pakistan";
		else if(s.equals("18"))return "Bangladesh";
		else if(s.equals("1"))return "Afghanistan";
		else return "Other";
		
	}
	private boolean comp(String s1,String s2){
		if ((Integer.parseInt(s1) & Integer.parseInt(s2))==0) {
			return false;
		}
		else return true;
	}
	private String get_age(String s){
		if (s==null) return s;
		if (s.equals("Not Specified")) return s;
		Date myBirthDate = java.sql.Date.valueOf(s);
		Calendar currenttime = Calendar.getInstance();
		Date sqldate = new Date((currenttime.getTime()).getTime());
		int diff = sqldate.getYear()-myBirthDate.getYear();
		if (myBirthDate.getMonth() > sqldate.getMonth() ||
		(myBirthDate.getMonth() == sqldate.getMonth() && myBirthDate.getDate() > sqldate.getDate())) {
		diff--;
		}
		return String.valueOf(diff);
		}

}