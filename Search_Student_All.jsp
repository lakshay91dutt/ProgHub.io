
<%@page import="org.eclipse.jdt.internal.compiler.ast.ThrowStatement"%>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<%@page import="java.sql.Connection" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
        <link rel="stylesheet" type="text/css" href="vendors/css/normalize.css">
        <link rel="stylesheet" type="text/css" href="vendors/css/grid.css">
        <link rel="stylesheet" type="text/css" href="vendors/css/ionicons.min.css">
        <link rel="stylesheet" type="text/css" href="resources/css/style.css">
        <link rel="stylesheet" type="text/css" href="resources/css/queries.css">
        <link href='http://fonts.googleapis.com/css?family=Lato:100,300,400,300italic' rel='stylesheet' type='text/css'>
        <title>All Students</title>
        <link rel="icon" type="image/png" href="media/code.png">
    </head>
    <body>
        <header>
            <nav>
                <div class="row">
                    <a href="index.html"><img src="media/code.org.png" alt="CODE" class="logo"></a>
                </div>
            </nav>
            <div class="hero-text-box">
                <h1>All Students</h1>
            </div>
            
        </header>
        <section class="section-form">
            <div class="row">
                <h2>Students</h2>
            </div>
        
			<div style="overflow-x:auto;">
			  <table>
			    <tr>
			      <th>Name</th>
			      <th>Email</th>
			      <th>Gender</th>
			      <th>Age</th>
			      <th>City</th>
			      <th>Mobile</th>
			      <th>Qualification</th>
			      <th>Passout</th>
			      <th>Mastered Subject</th>
			      <th>Grade</th>
			    </tr>
<%
	//Database
	
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
	
	//Gender Matters
		PreparedStatement p1 = connection.prepareStatement("select * from students");
		ResultSet rs1 = p1.executeQuery();

		while(rs1.next()) {
		      String Ename = rs1.getString("name");
		      String Eemail = rs1.getString("email");
		      String Egender = rs1.getString("gender");
		      String Eage = rs1.getString("age");
		      String Ecity = rs1.getString("city");
		      String Emobile = rs1.getString("mobile");
		      String Equalification = rs1.getString("qualification");
		      String Epassout = rs1.getString("passout");
		      String Esubject = rs1.getString("subject");
		      int Egrade = rs1.getInt("grade");

%>
		    <tr>
		      <td><%=Ename%></td>
		      <td><%=Eemail%></td>
		      <td><%=Egender%></td>
		      <td><%=Eage%></td>
		      <td><%=Ecity%></td>
		      <td><%=Emobile%></td>
		      <td><%=Equalification%></td>
		      <td><%=Epassout%></td>
		      <td><%=Esubject%></td>
		      <td><%=Egrade%></td>
		    </tr>

<%	
		}
%>
		  </table>
		</div>
        </section>
        <!-- --------------------------------------------------------------------------------------------------------------------->

        <!-- ---------------COPIED----------------- -->        
        <footer>
            <div class="row">
                <div class="col span-1-of-2">
                    <ul class="footer-nav">
                        <li><a href="#">About us</a></li>
                        <li><a href="#">Blog</a></li>
                        <li><a href="#">Press</a></li>
                        <li><a href="#">iOS App</a></li>
                        <li><a href="#">Android App</a></li>
                    </ul>
                </div>
                <div class="col span-1-of-2">
                    <ul class="social-links">
                        <li><a href="#"><i class="ion-social-facebook"></i></a></li>
                        <li><a href="#"><i class="ion-social-twitter"></i></a></li>
                        <li><a href="#"><i class="ion-social-googleplus"></i></a></li>
                        <li><a href="#"><i class="ion-social-instagram"></i></a></li>
                    </ul>
                </div>
            </div>
            <div class="row">
                <p>
                    Copyright &copy; 2017 by Programmers Hub. All rights reserved.
                </p>
            </div>
        </footer>
        <!-- --------------------------------------------------------------------------------------------------------------------->

    </body>
</html>
