<%@page import="java.sql.*"%>
<%
    String url = "jdbc:mysql://localhost:3306/bed_vacancy_in_hosp_and_qc";
    String user = "root";
    String rootPsw = "renu";
    String user_id="";
    int role = 0;
    String name = "";
    session = request.getSession();
    if (session.getAttribute("user_id") == null) {
        response.sendRedirect("../index.jsp");
    } else {
        user_id = session.getAttribute("user_id").toString();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection chk = DriverManager.getConnection(url, user, rootPsw);
            Statement chkst = chk.createStatement();
            ResultSet chkrs = chkst.executeQuery("SELECT role_id, fname, lname from user where user_id = '" + user_id + "'");
            if (chkrs.next()) {
                role = chkrs.getInt("role_id");
                if(role == 2){
                    response.sendRedirect("../User/user_home.jsp");
                }else if(role == 1){
                    name = chkrs.getString("fname") + " " + chkrs.getString("lname");
                }
            }
            chkrs.close();
            chk.close();
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
<title>Vacancy of Bed in Hospital and Quarantine Center</title>
</head>
<body style="background-color: lavender;">
	<p></p>
	<div class="nav nav-pills"
		style="background-color: ivory; height: fit-content;">
		<p></p>
		<div class="row" style="width: 100rem;">
			<div class="col-md-8">
				<h1 class="nav-item text-secondary" style="margin-left: 20px;">Vacancy
					of Bed in Hospital and Quarantine Center</h1>
			</div>
			<div class="col-md-4">
				<div style="float: right;">
					<div class="row nav-justified"
						style="width: 300px; margin-top: 5px;">
						<div class="col">
							<div class="col"><%=name%><br />[ADMIN]
							</div>
						</div>
						<div class="col">
							<a class="btn btn-primary rounded-rect" href="logout.jsp"><i
								class="fas fa-sign-out-alt"></i> Sign Out </a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<p></p>
	</div>
	<p></p>
	<div class="card" style="display: block; margin-left: auto; margin-right: auto; background-color: lavender;">
		<div class="card" style="background: none;">
			<div class="card-body">
				<ul class="nav justify-content-center">
					<li class="nav-item"><a class="nav-link" href="admin_home.jsp">Home
							</a></li>
					<li class="nav-item"><a class="nav-link" href="add_hosp.jsp">Add
							Hospital</a></li>
					<li class="nav-item"><a class="nav-link" href="addqc.jsp">Add
							Quarantine Center</a></li>
					<li class="nav-item"><a class="nav-link" href="view_hosp.jsp">View
							Hospitals</a></li>
					<li class="nav-item"><a class="nav-link" href="view_qc.jsp">View
							Quarantine Center</a></li>
				</ul>
			</div>
		</div>