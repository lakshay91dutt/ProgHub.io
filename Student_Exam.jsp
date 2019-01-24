<%@page import="org.eclipse.jdt.internal.compiler.ast.ThrowStatement"%>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<%@page import="java.sql.Connection" %>

<!-- EXAM SECTION -->
<%
	//To Store data of html form
	String name = request.getParameter("name");
	String subject = request.getParameter("subject");
	String email = request.getParameter("email");
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
        <title>Exam</title>
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
                <h1>Exam Section</h1>
            </div>
            
        </header>
    
        <!-- -----------------------------------------Student detail + Exam-------------------------------------------------------- -->
            <section class="section-form">
                <div class="row">
                    <h2>Welcome <%=name%> to your <%=subject%>Exam</h2>
                </div>

                <form method="post" action="Result.jsp" class="contact-form">
                    
                    <!-------------------------------------------->
                    <div class="row">
                        <div class="col span-1-of-3">
                            <label for="email">Email</label>
                        </div>
                        <div class="col span-2-of-3">
                            <input type="email" name="email_exam" value = "<%=email%>" readonly>
                        </div>
                    </div>

                    <!-------------------------------------------->
                    <div class="row">
                        <div class="col span-1-of-3">
                            <label for="subject">Subject</label>
                        </div>
                        <div class="col span-2-of-3">
                            <input type="text" name="subject" id="subject" value="<%=subject%>" readonly>
                        </div>
                    </div>

                    <!----------------------Java Code begins---------------------->
					<%
						//Variables used
						String question;	
						String option1, option2, option3, option4;
						String option_c;
						int count = 0;
						
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
						PreparedStatement p1 = connection.prepareStatement("select * from exam where subject = ?");
						p1.setString(1, subject);
						ResultSet rs1 = p1.executeQuery();
						//For every piece of data
						while(rs1.next()) {
							
							question = rs1.getString("QUESTION");
							option1 = rs1.getString("OPTION1");
							option2 = rs1.getString("OPTION2");
							option3 = rs1.getString("OPTION3");
							option4 = rs1.getString("OPTION4");
							count++;
%>
		                    <!----------------------HTML Code inside while loop---------------------->
		
		                    <div class="row">
		                        <div class="col span-1-of-3">
		                            <label for="question">Q. <%= question%></label>
		                        </div>
		                        <div class="col span-2-of-3">
		                            <select name="option_choosed<%=count%>">
		                                <option value="<%= option1%>">a). <%= option1%></option>
		                                <option value="<%= option2%>">b). <%= option2%></option>
		                                <option value="<%= option3%>">c). <%= option3%></option>
		                                <option value="<%= option4%>">d). <%= option4%></option>
		                            </select>
		                        </div>
		                    </div>
<%					
						}
%>
                    <!-------------------------------------------->
                    <div class="row">
                        <div class="col span-1-of-3">
                            <label for="total_ques">Total_Question</label>
                        </div>
                        <div class="col span-2-of-3">
                            <input type="number" name="total_ques" value ="<%=count%>" readonly>
                        </div>
                    </div>

                    <!------FORM ENDS-------------------------->
                    <div class="row">
                        <div class="col span-1-of-3">
                            <label>&nbsp;</label>
                        </div>
                        <div class="col span-2-of-3">
                            <input type="submit" value="Results">
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
     </body>
</html>
