
<%@page import="org.eclipse.jdt.internal.compiler.ast.ThrowStatement"%>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<%@page import="java.sql.Connection" %>

<%
	//To Store data of html form
	String email, password;

	//Variables used in current JSP
	String admin_email_db, admin_password_db;
	
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
	
	email = request.getParameter("email");
	password = request.getParameter("password");

	//Storing the data in db
	PreparedStatement p1 = connection.prepareStatement("select Username, Password from admin");
	ResultSet rs1 = p1.executeQuery();
	//For every piece of data
	while(rs1.next()) {
		
		admin_email_db = rs1.getString("Username");
		admin_password_db = rs1.getString("Password");
		//Company Exists
		if(email.equals(admin_email_db) && password.equals(admin_password_db)) {
%>
			<jsp:forward page="Admin_Dashboard.html" />
<%
		}
		else{
%>
			<jsp:forward page="Admin_Login.html" />
<%			
		}
	}
%>