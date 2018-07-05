
<%@page import="org.eclipse.jdt.internal.compiler.ast.ThrowStatement"%>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<%@page import="java.sql.Connection" %>

<%
	//To Store data of html form
	String email, password, name, gender, subject, qualification;

	//Variables used in current JSP
	String student_email_db, student_password_db;
	
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
	PreparedStatement p1 = connection.prepareStatement("select * from students");
	ResultSet rs1 = p1.executeQuery();
	//For every piece of data
	while(rs1.next()) {
		
		student_email_db = rs1.getString("email");
		student_password_db = rs1.getString("password");
		name = rs1.getString("name");
		gender = rs1.getString("gender");
		subject = rs1.getString("subject");
		qualification = rs1.getString("qualification");
		//Student Exists
		if(email.equals(student_email_db) && password.equals(student_password_db)) {
%>
			<jsp:forward page="Student_Exam.jsp">
			<jsp:param value="<%=name%>" name="name"/>
			<jsp:param value="<%=email%>" name="email"/>
			<jsp:param value="<%=password%>" name="password"/>
			<jsp:param value="<%=subject%>" name="subject"/>
			</jsp:forward>
<%
			break;
		}
	}
%>