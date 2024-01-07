<%-- 
    Document   : registration.jsp
    Created on : 27 Mar, 2021, 4:20:27 PM
    Author     : hp
--%>
<%@page import="java.sql.*"%>
<%
String url = "jdbc:mysql://localhost:3306/bed_vacancy_in_hosp_and_qc";
String user = "root";
String rootPsw = "renu";
if (session.getAttribute("user_id") != null) {
	String user_id = session.getAttribute("user_id").toString();
	int role_id = 0;
	try {
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		Connection con = DriverManager.getConnection(url, user, rootPsw);
		String chkquery = "select * from user where user_id='" + user_id + "'";
		Statement pst = con.createStatement();
		ResultSet rs = pst.executeQuery(chkquery);
		if (rs.next()) {
	role_id = rs.getInt(2);
	if (role_id == 1) {
		response.sendRedirect("Admin/admin_home.jsp");
	} else if (role_id == 2) {
		response.sendRedirect("Users/user_home.jsp");
	}
		}
	} catch (Exception ex) {
		out.print(ex);
	}
}
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.6.0/dist/umd/popper.min.js"
	integrity="sha384-KsvD1yqQ1/1+IA7gi3P0tyJcT3vR+NdBTt13hSJ2lnve8agRGXTTyNaBYmCR/Nwi"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.min.js"
	integrity="sha384-nsg8ua9HAw1y0W1btsyWgBklPnCUAFLuTMS2G72MMONqmOymq585AcH49TLBQObG"
	crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/045e563b22.js"
	crossorigin="anonymous"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Agriculture Waste Management</title>
</head>
<body style="background-color: lavender;">
	<p></p>
	<div class="nav nav-pills nav-justified"
		style="background-color: ivory">
		<p></p>
		<h1 class="nav-item text-secondary">Vacancy of Bed in Hospital and Quarantine Center</h1>
	</div>
	<p></p>
	<div class="card"
		style="display: block; width: 50rpm; margin-left: auto; margin-right: auto; background-color: lavender;">
		<p></p>
		<div class="card"
			style="width: 900px;; margin-left: auto; margin-right: auto;">
			<div class="card-body">
				<div class="card-text bg-success text-white">
					<marquee>
						<h4>Welcome to Vacancy of Bed in Hospital and Quarantine Center!! Please Register
							here...</h4>
					</marquee>
				</div>
			</div>
		</div>
		<div class="card"
			style="width: 900px;; margin-left: auto; margin-right: auto;">
			<div class="card-body">
				<div class="card" style="height: auto;">
					<div class="card-body">
						<form action="registration.jsp" method="post">
							<div class="row" style="margin-bottom: 10px;">
								<div class="col-md-4">
									<label for="fname">First Name</label> <input name="fname"
										id="fname" type="text" class="form-control">
								</div>
								<div class="col-md-4">
									<label for="mname">Middle Name</label> <input name="mname"
										id="mname" type="text" class="form-control">
								</div>
								<div class="col-md-4">
									<label for="lname">Last/Surname Name</label> <input
										name="lname" id="lname" type="text" class="form-control">
								</div>
							</div>
							<div class="row" style="margin-bottom: 10px;">
								<div class="col-md-6">
									<label for="email">User ID / Email</label> <input name="email"
										id="email" type="email" class="form-control"
										autocomplete="false">
								</div>
								<div class="col-md-6">
									<label for="psw">Password</label> <input name="psw" id="psw"
										type="password" class="form-control" data-toggle="password">
								</div>
							</div>
							<div class="row" style="margin-bottom: 10px;">
								<div class="col-md-6">
									<label for="security_question">Security Question</label> <select
										name="question" class="form-select"
										aria-label="Default select example">
										<option selected>Select Security Question</option>
										<option value="1">What primary school did you attend?</option>
										<option value="2">What was your childhood nickname?</option>
										<option value="3">What was your dream job as a child?</option>
									</select>
								</div>
								<div class="col-md-6">
									<label for="answer">Answer</label> <input name="answer"
										id="answer" type="text" class="form-control">
								</div>
							</div>
							<p class="lh-sm text-wrap">
								<%
								if (request.getParameter("fname") != null) {
									String fname = request.getParameter("fname");
									if (request.getParameter("mname") != null) {
										String mname = request.getParameter("mname");
										if (request.getParameter("lname") != null) {
									String lname = request.getParameter("lname");
									if (request.getParameter("email") != null) {
										String email = request.getParameter("email");
										if (request.getParameter("psw") != null) {
											String password = request.getParameter("psw");
											if (request.getParameter("question") != null) {
												String question = request.getParameter("question");
												if (request.getParameter("answer") != null) {
													String answer = request.getParameter("answer");
													try {
														Class.forName("com.mysql.jdbc.Driver");
														Connection gcon = DriverManager.getConnection(url, user, rootPsw);
														String qry = "insert into user (role_id, fname, mname, lname, email, password, question, ans) values (?,?,?,?,?,?,?,?)";
														PreparedStatement ins = gcon.prepareStatement(qry);
														ins.setInt(1, 2);
														ins.setString(2, fname);
														ins.setString(3, mname);
														ins.setString(4, lname);
														ins.setString(5, email);
														ins.setString(6, password);
														ins.setString(7, question);
														ins.setString(8, answer);
														ins.executeUpdate();
														out.print("<h4 class=\"text-success\">Registered Successfully !<h4>");

													} catch (SQLIntegrityConstraintViolationException e) {
														out.print("<h4 class=\"text-danger\">User Already Registered with this Mail Id! </h4>");
														out.print("<br/>");
														fname = "";
														mname = "";
														lname = "";
														email = "";
														password = "";
														question = "";
														answer = "";
													} catch (SQLException ex) {
														out.print(ex);
														out.print("</br>");
														fname = "";
														mname = "";
														lname = "";
														email = "";
														password = "";
														question = "";
														answer = "";
													} catch (Exception ex) {
														out.print(ex);
													}
												}
											}
										}
									}
										}
									}
								}
								%>
							</p>
							<button class="btn btn-primary" type="submit">Sign Up</button>
							<a class="btn btn-primary" href="index.jsp">Back</a>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$("#password").password('toggle');
	</script>
</body>
</html>
