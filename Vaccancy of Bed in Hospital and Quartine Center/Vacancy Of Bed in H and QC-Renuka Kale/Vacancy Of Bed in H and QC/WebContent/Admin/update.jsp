<%@include file="header.jsp"%>
<%
	if(request.getParameter("numspcl")!=null){
		int numspcl = Integer.parseInt(request.getParameter("numspcl"));
		if(request.getParameter("numgen")!=null){
			int numgen = Integer.parseInt(request.getParameter("numgen"));
			try{
				String hosp_id = request.getParameter("hospid");
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection uhcon = DriverManager.getConnection(url, user, rootPsw);
				Statement uhst = uhcon.createStatement();
				int status = uhst.executeUpdate("update hosp set numspcl = '"+numspcl+"', numgen = '"+numgen+"' where hosp_id = '"+hosp_id+"'"); 
				if(status==1){
					%>
        		    <script type="text/javascript">
        		        alert("Record Updated Successfully !");
        		        window.location.href = "view_hosp.jsp";
        		    </script>
        		    <% 
				}
			}catch(Exception ex){
				out.print(ex);
			}
		}
	}
%>
<div class="card" style="background-color: lavender;">
	<div class="card-body"
		style="width: 900px; margin-left: auto; margin-right: auto;">
		<% 
        	String hosp_id = request.getParameter("hid");
        	Class.forName("com.mysql.cj.jdbc.Driver");
        	Connection vhcon = DriverManager.getConnection(url, user, rootPsw);
        	Statement vhst = vhcon.createStatement();
        	ResultSet vhrs = vhst.executeQuery("select * from hosp where hosp_id = '"+hosp_id+"'");
        	if(vhrs.next()){
        %>
        <form>
		<div class="form-row">
			<div class="col">
				<label for="inputfname">Hospital Name</label> <input type="text"
					class="form-control" value="<%=vhrs.getString("hname") %>" readonly>
			</div>
			<div class="col">
				<label for="inputlname" style="color: green; font-weight: bolder">Permanent
					Registration Number</label> <input type="text"
					class="form-control" value="<%=vhrs.getString("prn") %>" readonly>
			</div>
		</div>
		<div class="form-row">
			<div class="col-md-4">
				<label for="gender">Hospital Type</label> <input type="text"
					class="form-control" value="<%=vhrs.getString("hosptype") %>" readonly>
			</div>
		</div>
		<div class="row">
			<div class="col-md-6">
				<label for="address">Address</label> <input type="text"
					class="form-control" value="<%=vhrs.getString("address") %>" readonly>
			</div>
			<div class="col-md-6">
				<label for="inputCity">City</label> <input type="text"
					class="form-control" value="<%=vhrs.getString("city") %>" readonly>
			</div>
		</div>
		<div class="row">
			<div class="col-md-6">
				<label for="inputState">State</label> <input type="text"
					class="form-control" value="<%=vhrs.getString("state") %>" readonly>
			</div>
			<div class="col-md-6">
				<label for="inputZip">Pin-Code</label> <input type="text"
					class="form-control" value="<%=vhrs.getString("pin") %>" readonly>
			</div>
		</div>
		<div class="row">
			<div class="col-md-6">
				<label for="cp_name">Contact Person</label> <input type="text"
					class="form-control" value="<%=vhrs.getString("cp_name") %>" readonly>
			</div>
			<div class="col-md-6">
				<label for="cp_num">Contact Number</label> <input type="text"
					class="form-control" value="<%=vhrs.getString("cp_num") %>" readonly>
			</div>
		</div>
		<div class="dropdown-divider"></div>
		<div class="card-header">
			<h4 class="card-title text-dark">Surgical Facilities</h4>
		</div>
		<div class="dropdown-divider"></div>
		<div class="row">
			<div class="col-md-4">
				<label for="numIcu">ICU Beds</label> <input type="text"
					class="form-control" value="<%=vhrs.getString("icunum") %>" readonly>
			</div>
			<div class="col-md-4">
				<label for="numSpcl">Special Beds</label> <input type="text"
					name="numspcl" class="form-control" value="<%=vhrs.getString("numspcl") %>">
			</div>
			<div class="col-md-4">
				<label for="numGen">General Beds</label> <input type="text"
					name="numgen" class="form-control" value="<%=vhrs.getString("numgen") %>">
			</div>
		</div>
		<input type="text" name="hospid" class="form-control" value="<%=vhrs.getString("hosp_id") %>" style="display:none;">
		<div class="dropdown-divider"></div>
		<center>
			<button type="submit" formaction="update.jsp" class="btn btn-success">Update</button>
		</center>
		</form>
		<%} %>
	</div>
</div>
<%@include file="footer.jsp"%>