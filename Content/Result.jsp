<%@page import="org.eclipse.jdt.internal.compiler.ast.ThrowStatement"%>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<%@page import="java.sql.Connection" %>

<%
	int grade;
	String name = null, gender = null, age = null, mobile = null, city = null, qualification = null;
%>

<% 
	int count = Integer.parseInt(request.getParameter("total_ques"));
	String subject = request.getParameter("subject");
	String email = request.getParameter("email_exam");
	int total = count * 10;
	int score = 0;

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
	PreparedStatement p1 = connection.prepareStatement("select OPTION_C from exam where subject = ?");
	p1.setString(1, subject);
	ResultSet rs1 = p1.executeQuery();
	//For every piece of data
	String[] user_selected = new String[count];
	String[] option_c = new String[count];
	int j = 0;
	while(rs1.next()) {
		String c, ans;
		option_c[j] = rs1.getString("OPTION_C");
		j++;
		for(int i = 1; i <= count; i++) {
			//No need to think about this
			c = Integer.toString(i);
			ans = ("option_choosed" + c);
			//carry on
			user_selected[i-1] = request.getParameter(ans);
		}
	}
	for(int i = 0; i< count; i++){
		//out.println("user: "+ user_selected[i]+ "\t||\t" + "DB:" + option_c[i] );
		
		if(user_selected[i].equals(option_c[i])){
			//out.println("Correct");
			score = score + 10;
		}
		else{
			//out.println("Incorrect");
		}
	}
	p1 = connection.prepareStatement("update students set grade = ?, out_of = ? where email = ?");
	p1.setInt(1, score);
	p1.setInt(2, total);
	p1.setString(3, email);
	p1.executeUpdate();
	
	p1 = connection.prepareStatement("select * from students where email = ?");
	p1.setString(1, email);
	rs1 = p1.executeQuery();
	
	while(rs1.next()) {
		name = rs1.getString("name");
		//email hai
		gender = rs1.getString("gender");
		age = rs1.getString("age");
		city = rs1.getString("city");
		//subject hai
		qualification = rs1.getString("qualification");
		grade = rs1.getInt("grade");
		
	}
	connection.close();
%>
<!-- ------------------------Print Student details along with marks--------------------------- -->
<!-- STUDENT'S SECTION -->
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
        <title>Exam Result</title>
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
                    <h2>STUDENT REPORT</h2>
                </div>

                <form method = "post" action="index.html" class="contact-form">
                    <!-------------------------------------------->
                    <div class="row">
                        <div class="col span-1-of-3">
                            <label for="name">Name</label>
                        </div>
                        <div class="col span-2-of-3">
                            <input type="text" name="name" id="name" value = "<%=name%>" readonly>
                        </div>
                    </div>
                    <!-------------------------------------------->
                    <div class="row">
                        <div class="col span-1-of-3">
                            <label for="email">Email</label>
                        </div>
                        <div class="col span-2-of-3">
                            <input type="email" name="email" id="email" value = "<%=email%>" readonly>
                        </div>
                    </div>
                    <!-------------------------------------------->
                    <div class="row">
                        <div class="col span-1-of-3">
                            <label for="gender">Gender</label>
                        </div>
                        <div class="col span-2-of-3">
                            <input type="text" name="gender" id="gender" value = "<%=gender%>" readonly>
                        </div>
                    </div>

                    <!-------------------------------------------->
                    <div class="row">
                        <div class="col span-1-of-3">
                            <label for="age">Age</label>
                        </div>
                        <div class="col span-2-of-3">
                            <input type="text" name="age" id="age" value = "<%=age%>" readonly>
                        </div>
                    </div>
                    
                    <!-------------------------------------------->
                    <div class="row">
                        <div class="col span-1-of-3">
                            <label for="city">City</label>
                        </div>
                        <div class="col span-2-of-3">
                            <input type="text" name="city" id="city" value = "<%=city%>" readonly>
                        </div>
                    </div>

                     <!-------------------------------------------->
                    <div class="row">
                        <div class="col span-1-of-3">
                            <label for="qualification">Qualification</label>
                        </div>
                        <div class="col span-2-of-3">
                            <input type="text" name="qualification" id="qualification" value = "<%=qualification%>" readonly>
                        </div>
                    </div>

                    <!-------------------------------------------->
                    <div class="row">
                        <div class="col span-1-of-3">
                            <label for="subject">Exam Subject</label>
                        </div>
                        <div class="col span-2-of-3">
                            <input type="text" name="subject" id="subject" value = "<%=subject%>" readonly>
                        </div>
                    </div>
                    <!-------------------------------------------->
                    <div class="row">
                        <div class="col span-1-of-3">
                            <label for="gender">Score(Out of <%=total%>)</label>
                        </div>
                        <div class="col span-2-of-3">
                            <input type="text" name="score" id="score" value = "<%=score%>" readonly>
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
