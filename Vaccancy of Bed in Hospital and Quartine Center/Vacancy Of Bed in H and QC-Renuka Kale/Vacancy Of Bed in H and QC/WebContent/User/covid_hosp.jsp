<%@include file="header.jsp"%>
<%
try {
	int count = 0;
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection chcon = DriverManager.getConnection(url, user, rootPsw);
	Statement chst = chcon.createStatement();
	ResultSet chrs = chst.executeQuery("select * from hosp");
%>
<div class="card"
	style="margin-left: auto; margin-right: auto; width: 90rem;">
	<div class="card-body">
		<div class="row">
			<%
			while (chrs.next()) {
				count++;
				int tbed = 0;
				tbed = chrs.getInt("icunum") + chrs.getInt("numspcl") + chrs.getInt("numgen");
			%>
			<div class="col">
				<div class="card" style="width: 450px;">
					<div class="card-body">
						<label class="text-secondary">Hospital Type - <%=chrs.getString("hosptype")%></label>
						<div class="dropdown-divider"></div>
						<div class="row">
							<div class="col">
								<b>Hospital Name</b>
							</div>
							<div class="col">
								<label>:&nbsp;&nbsp;<%=chrs.getString("hname")%></label>
							</div>
						</div>
						<div class="dropdown-divider"></div>
						<div class="row">
							<div class="col">
								<b>Address</b>
							</div>
							<div class="col">
								<label>:&nbsp;&nbsp;<%=chrs.getString("address")%><br />&nbsp;&nbsp;<%=chrs.getString("city")%>
									<%=chrs.getString("state")%><br />&nbsp;&nbsp;Pin-Code - <%=chrs.getString("pin")%></label>
							</div>
						</div>
						<div class="dropdown-divider"></div>
						<div class="row">
							<div class="col">
								<b>Contact Person Name</b>
							</div>
							<div class="col">
								<label>:&nbsp;&nbsp;<%=chrs.getString("cp_name")%></label>
							</div>
						</div>
						<div class="dropdown-divider"></div>
						<div class="row">
							<div class="col">
								<b>Contact Number</b>
							</div>
							<div class="col">
								<label>:&nbsp;&nbsp;<%=chrs.getString("cp_num")%></label>
							</div>
						</div>
						<div class="dropdown-divider"></div>
						<div class="row text-center">
							<div class="col card-header">
								<b>Available Bed</b>
							</div>
						</div>
						<div class="dropdown-divider"></div>
						<div class="row">
							<div class="col">
								<label class="text-success"><b>ICU - </b><%=chrs.getString("icunum")%></label><br />
							</div>
							<div class="col">
								<label class="text-success"><b>Special - </b><%=chrs.getString("numspcl")%></label><br />
							</div>
							<div class="col">
								<label class="text-success"><b>General - </b><%=chrs.getString("numgen")%></label>
							</div>
						</div>
						<div class="dropdown-divider"></div>
						<div class="row">
							<label class="text-secondary"><h5><b>Total Bed Available
									- </b><%=tbed%></h5></label>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>
		<%
		if (count < 1) {
		%>
		<div class="card"
			style="margin-left: auto; margin-right: auto; width: 90rem;">
			<div class="card-body">
				<div class="card" style="width: 450px;">
					<div class="card-body">
						<div class="card-header text-secondary">
							<h3>No Hospitals Found!</h3>
						</div>
					</div>
				</div>
			</div>
		</div>
		<%
	}
	%>
	</div>
</div>
<%
} catch (Exception ex) {
out.print(ex);
}
%>
<br />
<%@include file="footer.jsp"%>