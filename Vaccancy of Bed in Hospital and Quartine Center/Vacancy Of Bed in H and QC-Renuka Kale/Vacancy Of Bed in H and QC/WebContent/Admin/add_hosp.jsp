<%@include file="header.jsp"%>
<div class="card" style=" background-color: lavender;">
    <div class="card-body" style=" width: 900px; margin-left: auto; margin-right:auto;">
    <div class="dropdown-divider"></div>
    <div class="card-header text-center" style="margin-left: auto; margin-right:auto;"><h4 class="card-title text-dark">Hospital Details</h4></div>
    <div class="dropdown-divider"></div>
        <form action="add_hosp.jsp" method="post" autocomplete="off" style=" margin-left: 10px; margin-right: 10px;">
                            <div class="form-row">
                                <div class="col">
                                    <label for="inputfname">Hospital Name</label>
                                    <input name="hname" type="text" class="form-control" placeholder="Hospital Name" required>
                                </div>
                                <div class="col">
                                    <label for="inputlname" style=" color: green; font-weight: bolder">Permanent Registration Number</label>
                                    <input name="prn" type="text" class="form-control border-success" placeholder="Permanent Registration Number">
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="col-md-4">
                                    <label for="gender">Hospital Type</label>
                                    <select name="hosptype" id="htype" class="form-control" required>
                                        <option selected>Choose...</option>
                                        <option value="Government">Government</option>
                                        <option value="Semi Government">Semi Government</option>
                                        <option value="Private">Private</option>
                                        <option value="Institute">Institute</option>
                                    </select>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <label for="address">Address</label>
                                    <textarea name="address" class="form-control" id="exampleFormControlTextarea1" rows="6" placeholder="Address" required></textarea>
                                </div>
								<div class="col-md-6">
									<div class="row">
										<div class="col">
											<label for="inputCity">City</label> 
											<input name="city" type="text" class="form-control" id="inputCity" placeholder="City" required>
										</div>
										</div>
										<div class="row">
										<div class="col">
											<label for="inputState">State</label> 
											<input name="state" type="text" class="form-control" id="inputState" placeholder="State" required>
										</div>
										</div>
										<div class="row">
										<div class="col">
											<label for="inputZip">Pin-Code</label> 
											<input name="pin" type="text" class="form-control" id="inputZip" placeholder="Pin-Code" required>
										</div>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-6">
										<label for="cp_name">Contact Person</label> 
										<input name="cp_name" type="text" class="form-control" id="cp_name" placeholder="Full Name" required>
									</div>
									<div class="col-md-6">
										<label for="cp_num">Contact Number</label> 
										<input name="cp_num" type="text" class="form-control" id="cp_num" placeholder="Mobile Number" required>
									</div>
								</div>
								<div class="dropdown-divider"></div>
                            <div class="card-header"><h4 class="card-title text-dark">Surgical Facilities</h4></div>
                            <div class="dropdown-divider"></div>
                            <div class="row">
                                <div class="col-md-4">
                                    <label for="numIcu">ICU Beds</label>
                                    <input id="ib" name="icuNum" type="text" class="form-control" placeholder="No. of ICU Beds" required>
                                </div>
                                <div class="col-md-4">
                                    <label for="numSpcl">Special Beds</label>
                                    <input id="sb" name="numSpcl" type="text" class="form-control" placeholder="No. of Special Beds" required>
                                </div>
                                <div class="col-md-4">
                                    <label for="numGen">General Beds</label>
                                    <input id="gb" name="numGen" type="text" class="form-control" placeholder="No. of General Beds" required>
                                </div>
                            </div>
                            <div class="dropdown-divider"></div>
                            <center>
                            <p>
                            <%
                            	if(request.getParameter("hname") != null){
                            		String hname = request.getParameter("hname");
                            		if(request.getParameter("prn") != null){
                                		String prn = request.getParameter("prn");
                                		if(request.getParameter("hosptype") != null){
                                    		String hosptype = request.getParameter("hosptype");
                                    		if(request.getParameter("address") != null){
                                        		String address = request.getParameter("address");
                                        		if(request.getParameter("city") != null){
                                            		String city = request.getParameter("city");
                                            		if(request.getParameter("state") != null){
                                                		String state = request.getParameter("state");
                                                		if(request.getParameter("pin") != null){
                                                    		String pin = request.getParameter("pin");
                                                    		if(request.getParameter("cp_name") != null){
                                                        		String cp_name = request.getParameter("cp_name");
                                                        		if(request.getParameter("cp_num") != null){
                                                            		String cp_num = request.getParameter("cp_num");
                                                            		if(request.getParameter("icuNum") != null){
                                                                		int icuNum = Integer.parseInt(request.getParameter("icuNum"));
                                                                		if(request.getParameter("numSpcl") != null){
                                                                    		int numSpcl = Integer.parseInt(request.getParameter("numSpcl"));
                                                                    		if(request.getParameter("numGen") != null){
                                                                        		int numGen = Integer.parseInt(request.getParameter("numGen"));
                                                                        		try{
                                                                        			Class.forName("com.mysql.cj.jdbc.Driver");
                                                                        			Connection hospcon = DriverManager.getConnection(url, user, rootPsw);
                                                                        			String sql ="insert into hosp (hname, prn, hosptype, address, city, state, pin, cp_name, cp_num, icunum, numspcl, numgen) values(?,?,?,?,?,?,?,?,?,?,?,?)";
                                                                        			PreparedStatement pst = hospcon.prepareStatement(sql);
                                                                        			pst.setString(1, hname);
                                                                        			pst.setString(2, prn);
                                                                        			pst.setString(3, hosptype);
                                                                        			pst.setString(4, address);
                                                                        			pst.setString(5, city);
                                                                        			pst.setString(6, state);
                                                                        			pst.setString(7, pin);
                                                                        			pst.setString(8, cp_name);
                                                                        			pst.setString(9, cp_num);
                                                                        			pst.setInt(10, icuNum);
                                                                        			pst.setInt(11, numSpcl);
                                                                        			pst.setInt(12, numGen);
                                                                        			int states = pst.executeUpdate();
                                                                        			if(states == 1){
	                                                                        			//out.print("<h4 class=\"text-success\">Added Successfully!</h4>");
	                                                                        			%>
	                                                                        		    <script type="text/javascript">
	                                                                        		        alert("Record Added Successfully !");
	                                                                        		        window.location.href = "add_hosp.jsp";
	                                                                        		    </script>
	                                                                        		    <% 
                                                                        			}
                                                                         		}catch(SQLIntegrityConstraintViolationException ex){
                                                                         			out.print("<h4 class=\"text-warning\">Registration Number Already Registered!</h4>");	
                                                                        		}catch(Exception ex){
                                                                        			out.print(ex);
                                                                        		}
                                                                    		}
                                                                		}
                                                            		}
                                                        		}
                                                    		}
                                                		}
                                            		}
                                        		}
                                    		}
                                		}
                            		}
                            	}
                            %>
                            </p>
                                <button class="btn btn-success" type="submit">Submit</button> &nbsp;
                            	<a class="btn btn-danger" href="admin_home.jsp" style="width: 85px;">Cancel</a>
                            </center>
                        </form>
    </div>
</div>
<%@include file="footer.jsp"%>