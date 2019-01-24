
<%@page import="org.eclipse.jdt.internal.compiler.ast.ThrowStatement"%>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<%@page import="java.sql.Connection" %>

<%
	//Data to be used
	String gender = request.getParameter("gender");
	String qualifiation = request.getParameter("qualification");
	String passout = request.getParameter("passout");
	String subject = request.getParameter("subject");
%>

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
        <title>Find An Employee</title>
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
                <h1>Employees</h1>
            </div>
            
        </header>
        <section class="section-form">
            <div class="row">
                <h2>Results</h2>
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
	if(gender.equals("any")) {
		PreparedStatement p1 = connection.prepareStatement("select * from students where qualification = ? and passout = ? and subject = ?");
		p1.setString(1, qualifiation);
		p1.setString(2, passout);
		p1.setString(3, subject);
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
	}
	//Gender Does not matter
	else {
		PreparedStatement p2 = connection.prepareStatement("select * from students where qualification = ? and passout = ? and subject = ? and gender = ?");
		p2.setString(1, qualifiation);
		p2.setString(2, passout);
		p2.setString(3, subject);
		p2.setString(4, gender);
		ResultSet rs2 = p2.executeQuery();
		while(rs2.next()) {
		      String Ename1 = rs2.getString("name");
		      String Eemail1 = rs2.getString("email");
		      String Egender1 = rs2.getString("gender");
		      String Eage1 = rs2.getString("age");
		      String Ecity1 = rs2.getString("city");
		      String Emobile1 = rs2.getString("mobile");
		      String Equalification1 = rs2.getString("qualification");
		      String Epassout1 = rs2.getString("passout");
		      String Esubject1 = rs2.getString("subject");
		      int Egrade1 = rs2.getInt("grade");
%>
		    <tr>
		      <td><%=Ename1%></td>
		      <td><%=Eemail1%></td>
		      <td><%=Egender1%></td>
		      <td><%=Eage1%></td>
		      <td><%=Ecity1%></td>
		      <td><%=Emobile1%></td>
		      <td><%=Equalification1%></td>
		      <td><%=Epassout1%></td>
		      <td><%=Esubject1%></td>
		      <td><%=Egrade1%></td>
		    </tr>

<%
		}
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
