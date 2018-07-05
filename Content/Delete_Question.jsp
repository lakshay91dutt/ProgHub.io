
<%@page import="org.eclipse.jdt.internal.compiler.ast.ThrowStatement"%>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<%@page import="java.sql.Connection" %>

<%
	//To Store data of html form
	String question = request.getParameter("question");
	String subject = request.getParameter("subject");
	
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
	
	//Storing the data in db
	PreparedStatement p1 = connection.prepareStatement("delete from exam where QUESTION = ? and subject = ?");
	p1.setString(1, question);
	p1.setString(2, subject);
	p1.executeUpdate();
%>
<jsp:forward page="index.html" />