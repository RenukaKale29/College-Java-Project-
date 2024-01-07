<%@page import="java.sql.*"%>
<%
    String url = "jdbc:mysql://localhost:3306/bed_vacancy_in_hosp_and_qc";
    String user = "root";
    String rootPsw = "renu";
    if (session.getAttribute("user_id") != null) {
        String user_id = session.getAttribute("user_id").toString();
        int role_id = 0;
        try {
        	Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(url, user, rootPsw);
            String chkquery = "select * from user where user_id='" + user_id + "'";
            Statement pst = con.createStatement();
            ResultSet rs = pst.executeQuery(chkquery);
            if (rs.next()) {
                role_id = rs.getInt(2);
                if (role_id == 1) {
                    response.sendRedirect("Admin/admin_home.jsp");
                } else if (role_id == 2) {
                    response.sendRedirect("User/user_home.jsp");
                }
            }
        } catch (Exception ex) {
            out.print(ex);
        }
    }
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<html>
<head>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.6.0/dist/umd/popper.min.js" integrity="sha384-KsvD1yqQ1/1+IA7gi3P0tyJcT3vR+NdBTt13hSJ2lnve8agRGXTTyNaBYmCR/Nwi" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.min.js" integrity="sha384-nsg8ua9HAw1y0W1btsyWgBklPnCUAFLuTMS2G72MMONqmOymq585AcH49TLBQObG" crossorigin="anonymous"></script>
        <script src="https://kit.fontawesome.com/045e563b22.js" crossorigin="anonymous"></script>
        <meta charset="ISO-8859-1">
		<title>Vacancy of Bed in Hospital and Quarantine Center</title>
</head>
<body style=" background-color: lavender;">
        <p>

        </p>
        <div class="nav nav-pills nav-justified" style=" background-color: ivory">
            <p>

            </p>
            <h1 class="nav-item text-secondary">Vacancy of Bed in Hospital and Quarantine Center</h1>
        </div>
        <p>

        </p>
        <div class="card" style=" display: block; width: 50rpm; margin-left: auto; margin-right: auto; background-color: lavender;">
            <p>

            </p>
            <div class="card" style=" width: 900px;;  margin-left: auto; margin-right: auto;">
                <div class="card-body">
                    <div class="card-text bg-success text-white">
                        <marquee><h4>Welcome to Vacancy of Bed in Hospital and Quarantine Center!! Please Log In to continue</h4></marquee>
                    </div>
                </div>
            </div>
            <div class="card" style=" width: 900px;;  margin-left: auto; margin-right: auto;">
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="card text-center rounded-rect lg-sm" style=" width: auto; height: auto; margin-left: auto; margin-right: auto;">
                                <div class="card-body">
                                    <img style=" width: 300px; height: 285px " class="rounded-rect lg-sm" src="Images\home.png" alt=""/>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="card" style="height: 320px; ">
                                <div class="card-body">
                                    <h4 class="text-secondary" style=" text-decoration: underline 4.5px; margin-bottom: 15px;">Log In Here</h4>
                                    <form action="index.jsp" method="post">
                                        <div class="form-floating mb-3">
                                            <input name="email" type="email" class="form-control" id="floatingInput" placeholder="name@example.com" autocomplete="false" value="">
                                            <label for="floatingInput">Email address</label>
                                        </div>
                                        <div class="form-floating">
                                            <input name="pas" type="password" class="form-control" id="floatingPassword" placeholder="Password" autocomplete="false" value="">
                                            <label for="floatingPassword">Password</label>
                                        </div>
                                        <p>
                                            <%
                                                if (request.getParameter("email") != null && request.getParameter("pas") != null) {
                                                    String email = request.getParameter("email");
                                                    String password = request.getParameter("pas");
                                                    int role_id;
                                                    try {
                                                        Class.forName("com.mysql.jdbc.Driver");
                                                        Connection con = DriverManager.getConnection(url, user, rootPsw);
                                                        String chkquery = "select * from user where email='" + email + "'";
                                                        Statement pst = con.createStatement();
                                                        ResultSet rs = pst.executeQuery(chkquery);
                                                        if (rs.next()) {
                                                            if (rs.getString(7).contentEquals(password)) {
                                                                role_id = rs.getInt(2);
                                                                session.setAttribute("user_id", rs.getInt(1));
                                                                if (role_id == 1) {
                                                                    response.sendRedirect("Admin/admin_home.jsp");
                                                                } else if (role_id == 2) {
                                                                    response.sendRedirect("User/user_home.jsp");
                                                                }
                                                            } else {
                                                                out.print("Password Mismatched!");
                                                            }
                                                        } else {
                                                            out.print("Email or Password Mismatched!");
                                                        }
                                                    } catch (Exception ex) {
                                                        out.print(ex);
                                                    }
                                                }
                                            %>
                                        </p>
                                        <p class="lh-sm text-wrap text-secondary">
                                            New around here? <a style=" text-decoration: inherit" href="registration.jsp">Register</a> to request for recycle your Vacancy of Bed in Hospital and Quarantine Center!!
                                        </p>
                                        <button class="btn btn-primary" type="submit" style=" margin-right: 5px;">LogIn</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>