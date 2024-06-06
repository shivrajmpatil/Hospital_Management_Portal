<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Logged</title>
    <link href="https://cdn.lineicons.com/4.0/lineicons.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link rel="stylesheet" href="CSS/Hospital.css">
</head>

<body>
	
    <header>
    <div id="title">
        <h1><b>Lotus Multi-specility Hospital</b></h1>  
    </div> 
    </header>
    <nav style="padding-left: 1250px;">
        <ul>
           	<li >
            	<a href="AdminLogged.jsp"><b>Profile&nbsp;&nbsp;<i class="lni lni-user"></i></b></a>
            </li>
        </ul>
    </nav>
    <div class="wrapper" style="background-image: url(Image/back.jpg); background-size:cover;  height: 85vh;">
        <aside id="sidebar">
            <div class="d-flex">
                <button class="toggle-btn" type="button">
                    <i class="lni lni-grid-alt"></i>
                </button>
                <div class="sidebar-logo">
                    <a href="AdminLogged">&nbsp;&nbsp;Admin</a>
                </div>
            </div>
            <ul class="sidebar-nav">

                <li class="sidebar-item">
                    <a href="#" class="sidebar-link collapsed has-dropdown" data-bs-toggle="collapse"
                        data-bs-target="#dr" aria-expanded="false" aria-controls="dr">
                        <i class="lni lni-sthethoscope"></i>
                        <span>Doctor</span>
                    </a>
                    <ul id="dr" class="sidebar-dropdown list-unstyled collapse" data-bs-parent="#sidebar">
                        <li class="sidebar-item">
                            <a href="AddDoctor.jsp" class="sidebar-link">Add Doctor</a>
                        </li>
                        <li class="sidebar-item">
                            <a href="ViewDoctor.jsp" class="sidebar-link">View Doctor</a>
                        </li>
                    </ul>
                </li>
                <li class="sidebar-item">
                    <a href="#" class="sidebar-link collapsed has-dropdown" data-bs-toggle="collapse"
                        data-bs-target="#speci" aria-expanded="false" aria-controls="speci">
                        <i class="lni lni-first-aid"></i>
                        <span>Specialization</span>
                    </a>
                    <ul id="speci" class="sidebar-dropdown list-unstyled collapse" data-bs-parent="#sidebar">
                        <li class="sidebar-item">
                            <a href="AddSpecilization.jsp" class="sidebar-link">Add Specialization</a>
                        </li>
                        <li class="sidebar-item">
                            <a href="ViewSpecilization.jsp" class="sidebar-link">View Specialization</a>
                        </li>
                    </ul>
                </li>
                <li class="sidebar-item">
                    <a href="#" class="sidebar-link collapsed has-dropdown" data-bs-toggle="collapse"
                        data-bs-target="#auth" aria-expanded="false" aria-controls="auth">
                        <i class="lni lni-pencil-alt"></i>
                        <span>Receptionist</span>
                    </a>
                    <ul id="auth" class="sidebar-dropdown list-unstyled collapse" data-bs-parent="#sidebar">
                        <li class="sidebar-item">
                            <a href="AddReceptionist.jsp" class="sidebar-link">Add Receptionist</a>
                        </li>
                        <li class="sidebar-item">
                            <a href="ViewReceptionist.jsp" class="sidebar-link">View Receptionist</a>
                        </li>
                    </ul>
                </li>
            </ul>
            <div class="sidebar-footer">  
                    <a href="HomePage.jsp" class="btn btn-sm btn-default"><i class="lni lni-exit"></i><span class="glyphicon glyphicon-log-out"></span> Logout
                </a>
               <%
            session.invalidate();
            response.sendRedirect("HomePage.jsp");
            %>
            </div>
        </aside>
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
    	<script src="JS/Sidebar.js"></script>