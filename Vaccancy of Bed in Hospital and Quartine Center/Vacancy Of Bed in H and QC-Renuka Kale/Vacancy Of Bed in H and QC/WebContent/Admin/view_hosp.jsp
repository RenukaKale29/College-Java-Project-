<%@include file="header.jsp"%>
<div class="card text-center" style=" background-color: lavender;">
    <div class="card-body">
    	<%
    		try{
    			Class.forName("com.mysql.cj.jdbc.Driver");
    			Connection vcon  = DriverManager.getConnection(url, user, rootPsw);
    			Statement vst = vcon.createStatement();
    			ResultSet vrs = vst.executeQuery("select * from hosp");
    			int count = 0;
    			int tbed = 0 ;
    				%>
    				<table class="table table-hover" style=" width: 85rem; margin-right: auto; margin-left: auto;">
    					<thead>
    						<tr>
	    						<th class="scope">Sr No.</th>
	    						<th class="scope">Hospital Name</th>
	    						<th class="scope">Hospital Type</th>
	    						<th class="scope">Address</th>
	    						<th class="scope">Contact Person</th>
	    						<th class="scope">Contact Number</th>
	    						<th class="scope">Total Beds</th>
	    						<th class="scope">Action</th>
    						</tr>
    					</thead>
    					<tbody>
    					<%while(vrs.next()){ 
    						count++;
    					%>
    						<tr>
    							<td><%=count%></td>
    							<td><%=vrs.getString("hname")%></td>
    							<td><%=vrs.getString("hosptype")%></td>
    							<td><%=vrs.getString("address")%> <%=vrs.getString("city")%> <%=vrs.getString("state")%> <%=vrs.getString("pin")%></td>
    							<td><%=vrs.getString("cp_name")%></td>
    							<td><%=vrs.getString("cp_num")%></td>
    							<% tbed = vrs.getInt("icunum")+vrs.getInt("numspcl")+vrs.getInt("numgen"); %>
    							<td><%=tbed %></td>
    							<td>
	    							<form method="post">
	    								<input name="hid" type="text" style=" display: none;" class="form-control" value="<%=vrs.getInt("hosp_id")%>" readonly>
	    								<button type="submit" formaction="update.jsp" class="btn btn-primary">Update</button>
	    								<button type="submit" formaction="delete.jsp" class="btn btn-danger" >Delete</button>
	    							</form>
    							</td>
    						</tr>
    					<%} %>
    					</tbody>
    				</table>
    				<%
    		}catch(Exception ex){
    			
    		}
    	%>
    </div>
</div>
<%@include file="footer.jsp"%>