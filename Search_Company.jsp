
<%@page import="org.eclipse.jdt.internal.compiler.ast.ThrowStatement"%>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<%@page import="java.sql.Connection" %>

<%
	//To Store data of html form
	String company_name = request.getParameter("company");
	
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
	PreparedStatement p1 = connection.prepareStatement("select * from company where Name = ?");
	p1.setString(1, company_name);
	ResultSet rs1 =  p1.executeQuery();
	
	while(rs1.next()) {
		String email = rs1.getString("email");
		String type = rs1.getString("Type");
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
        <title>Search Company Result</title>
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
                <h1>Welcome to the Results Section</h1>
            </div>
            
        </header>

            <section class="section-form">
                <div class="row">
                    <h2>Search Company</h2>
                </div>

                <form method = "post" action="index.html" class="contact-form">
                    <!-------------------------------------------->
                    <div class="row">
                        <div class="col span-1-of-3">
                            <label for="name">Name</label>
                        </div>
                        <div class="col span-2-of-3">
                            <input type="text" name="company_name" id="name" value = "<%=company_name%>" disabled>
                        </div>
                    </div>
                    <!-------------------------------------------->
                    <div class="row">
                        <div class="col span-1-of-3">
                            <label for="email">Email</label>
                        </div>
                        <div class="col span-2-of-3">
                            <input type="email" name="email" id="email" value = "<%=email%>" disabled>
                        </div>
                    </div>

                    <!-------------------------------------------->
                    <div class="row">
                        <div class="col span-1-of-3">
                            <label for="type">Type</label>
                        </div>
                        <div class="col span-2-of-3">
                            <input type="text" name="type" id="type" value = "<%=type%>" disabled>
                        </div>
                    </div>
                    <!------FORM ENDS-------------------------->
                    <div class="row">
                        <div class="col span-1-of-3">
                            <label>&nbsp;</label>
                        </div>
                        <div class="col span-2-of-3">
                            <input type="submit" value="<Back to homepage">
                        </div>
                    </div>
                    <!-------------------------------------------->

                </form>
        </section>
        
        
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


<%
	}
%>
