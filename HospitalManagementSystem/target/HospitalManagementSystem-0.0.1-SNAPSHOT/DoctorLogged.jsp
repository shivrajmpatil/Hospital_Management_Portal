<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="org.Hospital.Model.*,org.Hospital.Service.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    </style>
</head>

<body>
   <%@ include file="DoctorDash.html" %>
        <div class="p-3">
        <% if(session.getAttribute("Did")==null)
	{
		response.sendRedirect("DoctorLogin.jsp");
	}
		response.setHeader("Cache-Control", "no-cache, must-revalidate");
		%>
            <div class="frm profile">
            <% DoctorModel model = new DoctorModel();
               DoctorService ds = new DoctorService();
               
               int did = Integer.parseInt(session.getAttribute("Did").toString());
               
               model = ds.getProfile(did);
               
               if(model!=null)
               {
            	   
            %>
                <h3>Doctor Profile</h3>
                <table>
                	<tr><th>Name : </th><td><%= model.getName() %></td></tr>
                	<tr><th>Contact : </th><td><%= model.getContact() %></td></tr>
                	<tr><th>Username : </th><td><%= model.getUsername() %></td></tr>
                	<tr><th>Password : </th><td><%= model.getPassword() %></td></tr>
                </table>
             <%} %>
            </div>
        </div>
    </div>
    

    <footer>

        <p>&copy; 2024 Our Hospital. All rights reserved.</p>

    </footer>
</body>

</html>