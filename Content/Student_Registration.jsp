
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<%@page import="java.sql.Connection" %>

<%
	//To Store data of html form
	String name, email, password;
	
	String gender, age, city;
	
	String mobile, qualification, passout;
	
	String subject, grade = "0"; 
	
	
	//Variables used in current JSP
	String user_email_db;

	/* Create string of connection url within specified format with machine name, 
	port number and database name. Here machine name id localhost and 
	database name is usermaster. */ 
	String connectionURL = "jdbc:mysql://localhost:3306/project"; 
	
	// declare a connection by using Connection interface 
	Connection connection = null; 
	
	// Load JBBC driver "com.mysql.jdbc.Driver" 
	Class.forName("com.mysql.jdbc.Driver").newInstance(); 
	
	/* Create a connection by using getConnection() method that takes parameters of 
	string type connection url, user name and password to connect to database. */ 
	connection = DriverManager.getConnection(connectionURL, "root", "qwerty");
	
	
	name = (request.getParameter("name"));
	email = request.getParameter("email");
	password = request.getParameter("password");
	
	gender = request.getParameter("gender");
	age = request.getParameter("age");
	city = request.getParameter("city");
	
	mobile = request.getParameter("mobile");
	qualification = request.getParameter("qualification");
	passout = request.getParameter("passout");
	
	subject = request.getParameter("subject");
	//grade
		

	//Storing the data in db
	PreparedStatement p1 = connection.prepareStatement("select email from students");
	ResultSet rs1 = p1.executeQuery();
	//For every piece of data
	while(rs1.next()) {
		
		user_email_db = rs1.getString("email");
		
		//New User -> Store Data in DB
		if( !email.equalsIgnoreCase(user_email_db)) {
			p1 = connection.prepareStatement("insert into students values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
			
			p1.setString(1, name);	//Name
			p1.setString(2, email);	//Email
			p1.setString(3, password);	//Password
			
			p1.setString(4, gender);	//Gender
			p1.setString(5, age);	//Age
			p1.setString(6, city);	//City
			
			p1.setString(7, mobile);	//Mobile
			p1.setString(8, qualification);	//Qualification
			p1.setString(9, passout);	//Passout
			
			p1.setString(10, subject);	//Exam Subject
			p1.setString(11, grade);	//Grade
	
			p1.executeUpdate();
%>
			<jsp:forward page="Student_Corner.html" />;
<%
		}
	}

	connection.close();

%>