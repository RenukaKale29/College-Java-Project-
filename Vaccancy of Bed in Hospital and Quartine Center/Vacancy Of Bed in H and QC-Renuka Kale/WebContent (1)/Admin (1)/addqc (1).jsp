<%@include file="header.jsp"%>
<div class="card" style="background-color: lavender;">
	<div class="card-body"
		style="width: 900px; margin-left: auto; margin-right: auto;">
		<div class="dropdown-divider"></div>
		<div class="card-header text-center"
			style="margin-left: auto; margin-right: auto;">
			<h4 class="card-title text-dark">Quarantine Center Details</h4>
		</div>
		<p>
			<%
				if(request.getParameter("cen_name")!=null){
					String cen_name = request.getParameter("cen_name");
					if(request.getParameter("cen_add")!=null){
						String cen_add = request.getParameter("cen_add");
						if(request.getParameter("cont_person")!=null){
							String cont_person = request.getParameter("cont_person");
							if(request.getParameter("cont_num")!=null){
								String cont_num = request.getParameter("cont_num");
								if(request.getParameter("bed")!=null){
									int bed = Integer.parseInt(request.getParameter("bed"));
									try{
										Class.forName("com.mysql.cj.jdbc.Driver");
										Connection qccon = DriverManager.getConnection(url, user, rootPsw);
										String sql = "insert into qurantine_center(cen_name, cen_add, cont_person, cont_num, bed) values (?,?,?,?,?)";
										PreparedStatement qpst = qccon.prepareStatement(sql);
										qpst.setString(1, cen_name);
										qpst.setString(2, cen_add);
										qpst.setString(3, cont_person);
										qpst.setString(4, cont_num);
										qpst.setInt(5, bed);
										int states = qpst.executeUpdate();
										if(states == 1){
											//out.print("<h4 class=\"text-success\">Added Successfully!</h4>");
											%>
	                            		    <script type="text/javascript">
	                            		        alert("Record Added Successfully !");
	                            		        window.location.href = "addqc.jsp";
	                            		    </script>
	                            		    <% 
										}
									}catch(Exception ex){
										out.print(ex);
									}
								}
							}
						}
					}
				}
			%>
		</p>
		<div class="dropdown-divider"></div>
		<form action="addqc.jsp" method="post" autocomplete="off" style="margin-left: 10px; margin-right: 10px;">
			<div class="row">
				<div class="col-md-6">
					<label for="cen_name">Center Name</label>
					<input type="text" class="form-control" name="cen_name" placeholder="Center Name">
				</div>
				<div class="col-md-6">
					<div class="row">
						<label for="bed">Total Beds Available</label>
						<input type="text" class="form-control" name="bed" placeholder="Beds Available">
					</div>
				</div>
			</div>
			<div class="row" style=" margin-top: 8px;">
				<div class="col-md-6">
					<label for="cen_add">Center Address</label>
					<textarea type="text" class="form-control" name="cen_add" rows="4" placeholder="Center Address"></textarea>
				</div>
				<div class="col-md-6">
					<div class="row">
						<label for="cont_person">Contact Person</label>
						<input type="text" class="form-control" name="cont_person" placeholder="Contact Person Name">
					</div>
					<div class="row" style=" margin-top: 8px;">
						<label for="cont_num">Contact Number</label>
						<input type="text" class="form-control" name="cont_num" placeholder="Contact Number">
					</div>
				</div>
			</div>
			<div class="dropdown-divider"></div>
			<center>
				<button style=" width: fit-content;" type="submit" class="btn btn-primary">Submit</button>&nbsp;<a href="admin_home.jsp"  style=" width: fit-content;" class="btn btn-primary">Back</a>
			</center>
		</form>
	</div>
</div>
<%@include file="footer.jsp"%>
