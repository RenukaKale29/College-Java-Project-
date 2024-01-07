<%@include file="header.jsp"%>
<%
if (request.getParameter("bed") != null) {
	int bed = Integer.parseInt(request.getParameter("bed"));
	try {
		String qc_id = request.getParameter("qcid");
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection uhcon = DriverManager.getConnection(url, user, rootPsw);
		Statement uhst = uhcon.createStatement();
		int status = uhst
		.executeUpdate("update qurantine_center set bed = '" + bed + "' where qc_id = '" + qc_id + "'");
		if (status == 1) {
			%>
			<script type="text/javascript">
				alert("Record Updated Successfully !");
				window.location.href = "view_qc.jsp";
			</script>
			<%
		}
	} catch (Exception ex) {
		out.print(ex);
	}
}
%>
<div class="card" style="background-color: lavender;">
	<div class="card-body"
		style="width: 900px; margin-left: auto; margin-right: auto;">
		<%
		String qc_id = request.getParameter("qc_id");
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection vhcon = DriverManager.getConnection(url, user, rootPsw);
		Statement vhst = vhcon.createStatement();
		ResultSet vhrs = vhst.executeQuery("select * from qurantine_center where qc_id = '" + qc_id + "'");
		if (vhrs.next()) {
		%>
		<form method="post">
			<div class="card-header text-center">
				<h3>Update Quarantine Center Details</h3>
			</div>
			<div class="dropdown-divider"></div>
			<div class="row">
				<div class="col-md-6">
					<label for="inputfname" style="color: green; font-weight: bolder">Quarantine
						Center Name</label> <input type="text" class="form-control"
						value="<%=vhrs.getString("cen_name")%>" readonly>
				</div>
				<div class="col-md-6">
					<label for="inputlname" style="color: green; font-weight: bolder">Number
						of Beds</label> <input type="text" name="bed" class="form-control"
						value="<%=vhrs.getString("bed")%>">
				</div>
			</div>
			<div class="row">
				<div class="col">
					<label for="inputlname" style="color: green; font-weight: bolder">Address</label>
					<input type="text" class="form-control"
						value="<%=vhrs.getString("cen_add")%>" readonly>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6">
					<label for="inputlname" style="color: green; font-weight: bolder">Contact
						Person</label> <input type="text" class="form-control"
						value="<%=vhrs.getString("cont_person")%>" readonly>
				</div>
				<div class="col-md-6">
					<label for="inputlname" style="color: green; font-weight: bolder">Contact
						Number</label> <input type="text" class="form-control"
						value="<%=vhrs.getString("cont_num")%>" readonly>
				</div>
			</div>
			<div class="dropdown-divider"></div>
			<input type="text" name="qcid" value="<%=vhrs.getString("qc_id")%>"
				readonly>
			<center>
				<button type="submit" formaction="updateqc.jsp"
					class="btn btn-success">Update</button>
				<a href="view_qc.jsp" class="btn btn-primary">Back</a>
			</center>
			<div class="dropdown-divider"></div>
		</form>
		<%
		}
		%>
	</div>
</div>
<%@include file="footer.jsp"%>