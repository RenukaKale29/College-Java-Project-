<%@include file="header.jsp"%>
<%
try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection chcon = DriverManager.getConnection(url, user, rootPsw);
	Statement chst = chcon.createStatement();
	ResultSet chrs = chst.executeQuery("select * from qurantine_center");
	int count=0;
%>
<div class="card" style=" margin-left: auto; margin-right: auto; width: 90rem;">
	<div class="card-body">
	<div class="row" style=" margin-left: auto; margin-right: auto; ">
	<%while (chrs.next()) { count++; %>
	<div class="col">
		<div class="card" style=" width:450px;">
			<div class="card-body">
				<div class="card-header">Center Number : <%=count %></div>
				<div class="row" style=" margin-top: 5px;">
					<div class="col-md-5">
						<b>Center Name</b>
					</div>
					<div class="col-md-7">
						<label>:&nbsp;&nbsp;<%=chrs.getString("cen_name")%></label>
					</div>
				</div>
				<div class="row" style=" margin-top: 5px;">
					<div class="col-md-5">
						<b>Address</b>
					</div>
					<div class="col-md-7">
						<label>:&nbsp;&nbsp;<%=chrs.getString("cen_add")%></label>
					</div>
				</div>
				<div class="row" style=" margin-top: 5px;">
					<div class="col-md-5">
						<b>Contact Person</b>
					</div>
					<div class="col-md-7">
						<label>:&nbsp;&nbsp;<%=chrs.getString("cont_person")%></label>
					</div>
				</div>
				<div class="row" style=" margin-top: 5px;">
					<div class="col-md-5">
						<b>Contact Number</b>
					</div>
					<div class="col-md-7">
						<label>:&nbsp;&nbsp;<%=chrs.getString("cont_num")%></label>
					</div>
				</div>
				<div class="dropdown-divider"></div>
				<div class="row" style=" margin-top: 8px;">
					<div class="col-md-5">&nbsp;</div>
					<div class="col-md-7">
						<label class="text-success"><b>Total Bed Available - </b><%=chrs.getString("bed")%></label>
					</div>
				</div>
			</div>
		</div>
		</div>
		<%} %>
		</div>
	</div>
</div>
<%
} catch (Exception ex) {
	out.print(ex);
}
%>
<br />
<%@include file="footer.jsp"%>