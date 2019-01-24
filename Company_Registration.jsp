
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<%@page import="java.sql.Connection" %>

<%
	//To Store data of html form
	String name, email, password, type;

	//Variables used in current JSP
	String company_name_db;
	
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
	type = request.getParameter("type");
	
	//Storing the data in db
	PreparedStatement pcr = connection.prepareStatement("select name from company");
	ResultSet rscr = pcr.executeQuery();
	//For every piece of data
	while(rscr.next()) {
		
		company_name_db = rscr.getString("name");
		
		//New company
		if(company_name_db.equalsIgnoreCase(name) == false) {
			pcr = connection.prepareStatement("insert into company(name, email, password, type) values (?, ?, ?, ?)");
			pcr.setString(1, name);	//Name
			pcr.setString(2, email);	//Email
			pcr.setString(3, password);	//Password
			pcr.setString(4, type);	//Type
			if(pcr.execute()){
				response.sendRedirect("Company_Corner.html");
				return;
			}
			else
				response.sendRedirect("index.html");
		}
		//Already Exists Cannot store
		else {
%>
<jsp:forward page = "index.html" />
<%
		}
	}
	connection.close();
%>
	
