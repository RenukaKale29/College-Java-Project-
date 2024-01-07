<%-- 
    Document   : logout
    Created on : 20 Mar, 2021, 11:21:43 PM
    Author     : hp
--%>

<%
    session.removeAttribute("user_id");
    response.sendRedirect("../index.jsp");
%>