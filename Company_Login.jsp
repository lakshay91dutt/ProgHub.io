
<%@page import="org.eclipse.jdt.internal.compiler.ast.ThrowStatement"%>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<%@page import="java.sql.Connection" %>

<%
	//To Store data of html form
	String name, password;

	//Variables used in current JSP
	String company_name_db, company_password_db;
	
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
	
	name = request.getParameter("name");
	password = request.getParameter("password");

	//Storing the data in db
	PreparedStatement p1 = connection.prepareStatement("select * from company");
	ResultSet rs1 = p1.executeQuery();
	//For every piece of data
	while(rs1.next()) {
		
		company_name_db = rs1.getString("name");
		company_password_db = rs1.getString("password");
		//Company Exists
		if(name.equals(company_name_db) && password.equals(company_password_db)) {
%>
		<jsp:forward page="Company_find_employee.html" />
<%
		}
	}
%>