<%@include file="header.jsp"%>
<div class="card text-center" style=" background-color: lavender;">
    <div class="card-body">
    	<%
    		try{
    			Class.forName("com.mysql.cj.jdbc.Driver");
    			Connection vcon  = DriverManager.getConnection(url, user, rootPsw);
    			Statement vst = vcon.createStatement();
    			ResultSet vrs = vst.executeQuery("select * from qurantine_center");
    			int count = 0;
    			int tbed = 0 ;
    				%>
    				<table class="table table-hover" style=" width: 85rem; margin-right: auto; margin-left: auto;">
    					<thead>
    						<tr>
	    						<th class="scope">Sr No.</th>
	    						<th class="scope">Center Name</th>
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
    							<td><%=vrs.getString("cen_name")%></td>
    							<td><%=vrs.getString("cen_add")%></td>
    							<td><%=vrs.getString("cont_person")%></td>
    							<td><%=vrs.getString("cont_num")%></td>
    							<td><%=vrs.getString("bed")%></td>
    							<td>
	    							<form method="post">
	    								<input name="qc_id" type="text" style=" display: none;" class="form-control" value="<%=vrs.getInt("qc_id")%>" readonly>
	    								<button type="submit" formaction="updateqc.jsp" class="btn btn-primary">Update</button>
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