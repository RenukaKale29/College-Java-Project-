<%@include file="header.jsp"%>
<div class="card text-center" style=" background-color: lavender;">
    <div class="card-body">
        <%
        	if(request.getParameter("hid")!=null){
        		try{
        			String hosp_id = request.getParameter("hid");
        			Class.forName("com.mysql.cj.jdbc.Driver");
        			Connection delcon = DriverManager.getConnection(url, user, rootPsw);
        			Statement delst = delcon.createStatement();
        			int status = delst.executeUpdate("delete from hosp where hosp_id = '"+hosp_id+"'");
        			if(status == 1){
        				%>
            		    <script type="text/javascript">
            		        alert("Hospital Deleted Successfully !");
            		        window.location.href = "view_hosp.jsp";
            		    </script>
            		    <% 
        			}
        		}catch(Exception ex){
        			
        		}
        	}
			if(request.getParameter("qc_id")!=null){
				try{
					String qc_id = request.getParameter("qc_id");
					Class.forName("com.mysql.cj.jdbc.Driver");
        			Connection delcon = DriverManager.getConnection(url, user, rootPsw);
        			Statement delst = delcon.createStatement();
        			int status = delst.executeUpdate("delete from qurantine_center where qc_id = '"+qc_id+"'");
        			if(status == 1){
        				%>
            		    <script type="text/javascript">
            		        alert("Quarantine Center Deleted Successfully !");
            		        window.location.href = "view_qc.jsp";
            		    </script>
            		    <% 
        			}
        		}catch(Exception ex){
        			
        		}
			}
        %>
    </div>
</div>
<%@include file="footer.jsp"%>