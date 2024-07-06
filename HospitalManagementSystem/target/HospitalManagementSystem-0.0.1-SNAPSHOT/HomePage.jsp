<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="org.Hospital.Model.*,org.Hospital.Service.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, initial-scale=1.0">
<title>Home</title>
<link rel="stylesheet" href="CSS/Hospital.css">
<link href="https://cdn.lineicons.com/4.0/lineicons.css"
	rel="stylesheet" />
<link

	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">
<script src='JS/Validation.js'></script>
<style>
* {
	box-sizing: border-box;
}

body {
	font-family: Verdana, sans-serif;
}

.mySlides {
	display: none;
}

img {
	vertical-align: middle;
}

/* Slideshow container */
.slideshow-container {
	position: relative;
}

/* The dots/bullets/indicators */
.dot {
	height: 15px;
	width: 15px;
	margin: 0 2px;
	background-color: #ECCEAE;
	border-radius: 50%;
	display: inline-block;
	transition: background-color 0.6s ease;
}

.active {
	background-color: #E68369;
}

/* Fading animation */
.fade {
	animation-name: fade;
	animation-duration: 3.3s;
	/* Increase duration for smoother transition */
}

@keyframes fade {
    from { 
        opacity: 0; 
    }
    to { 
        opacity: 1; 
    }
}

/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) {
	.text {
		font-size: 11px;
	}
}

.quote {
	margin: 20px 100px;
	font-style: italic;
	background-color: #FFBF78;
}

.count {
	padding: 10px;
	color: #254336;
	font-size: 20px;
	border-radius: 50px;
	text-align: center;
	background: radial-gradient(circle, rgba(238,174,202,1) 0%, rgba(148,187,233,1) 100%);
}

.about {
	color: #F7F9F2;
	font-size: 20px;
	margin: 30px 50px;
	padding: 25px;
	background: rgb(132,171,117);
	background: linear-gradient(229deg, rgba(132,171,117,1) 4%, rgba(53,121,103,1) 95%);
	border-radius: 5px;
}

.faci {
	padding: 15px;
	color: #2F3645;
	border-radius: 15px;
	font-size: 20px;
	text-align: center;
	background: linear-gradient(90deg, rgba(180,154,58,1) 0%, rgba(253,183,29,1) 50%, rgba(226,252,69,1) 100%);
	height: 320px;
	box-shadow: 5px 5px 6px 5px grey;
}

#address {
	margin-top:30px;
	padding: 30px 100px;
	font-size: 20px;
	heigth: 500px;
	background-color: #36BA98;
}
</style>
</head>
<body>
	<header>
		<div id="title">
			<h1>
				<b>LOTUS HEALTH CARE</b>
			</h1>
		</div>
	</header>
	<nav>
		<ul>
			<li><a href="HomePage.jsp"><b>Home</b></a></li>
			<li><a href="AdminLogin.jsp"><b>Admin Login</b></a></li>
			<li><a href="DoctorLogin.jsp"><b>Doctor Login</b></a></li>
			<li><a href="ReceptionistLogin.jsp"><b>Reception Login</b></a></li>
		</ul>
	</nav>
	<div class="slideshow-container">
		<div class="mySlides fade">
			<img src="Image/Image2.jpg" style="width: 100%"
				alt="Hospital Image 2">
		</div>
	 	<div class="mySlides fade">
			<img src="Image/Image3.jpg" style="width: 100%"
				alt="Hospital Image 3">
		</div>
		<div class="mySlides fade">
			<img src="Image/Image4.jpg" style="width: 100%"
				alt="Hospital Image 4">
		</div>
		<div class="mySlides fade">
			<img src="Image/Image5.jpg" style="width: 100%"
				alt="Hospital Image 5">
		</div>  
	</div>
	<br>
	<div style="text-align: center">
		<span class="dot"></span> <span class="dot"></span> <span class="dot"></span>
		<span class="dot"></span>
	</div>
 	<script>
		let slideIndex = 0;
		showSlides();

		function showSlides() {
			let i;
			let slides = document.getElementsByClassName("mySlides");
			let dots = document.getElementsByClassName("dot");
			for (i = 0; i < slides.length; i++) {
				slides[i].style.display = "none";
			}
			slideIndex++;
			if (slideIndex > slides.length) {
				slideIndex = 1
			}
			for (i = 0; i < dots.length; i++) {
				dots[i].className = dots[i].className.replace(" active", "");
			}
			slides[slideIndex - 1].style.display = "block";
			dots[slideIndex - 1].className += " active";
			setTimeout(showSlides, 3000);
		}
	</script>
	<div class="quote frm">
		<p>
			"You treat a disease, you win, you lose. You treat a person, I
			guarantee you, you'll win — no matter what the outcome. <br>—
			Patch Adams"
		</p>
	</div>

	<%
	DoctorService ds = new DoctorService();
	PatientService ps = new PatientService();

	int dcount = ds.getDoctorsCount();
	int pcount = ps.getPatientsCount();
	int tpcount = ps.getTodayPatientCount();
	%>
	<div class="container">
		<div class="row">
			<div class="col-md-4">
				<div class="count col-md-12">
				<h3 id="patientCount"><%=pcount%></h3>
				<p>Total Patients</p>
				</div>
			</div>
			<div class="col-md-4">
				<div class="count col-md-12">
				<h3 id="doctorCount"><%=dcount%></h3>
				<p>Total Doctors</p>
				</div>
			</div>
			<div class="col-md-4">
				<div class="count col-md-12">
				<h3 id="dailyPatientCount"><%=tpcount%></h3>
				<p>Today's Patients</p>
				</div>
			</div>
		</div>
	</div>
	
	<div class="about" style="text-align: center">
		<p>
		<h2>About us :</h2>
		With a capacity of 24 beds, this state-of-the-art specialty hospital
		is committed to bringing together the world-class medical services and
		world’s best healthcare management practices. <br>The hospital
		offers superlative care in the wide range of surgical specialties
		including Bariatric Surgery, ENT, General & Laparoscopic Surgery,
		Orthopaedics & Spine, Urology, Varicose Veins, to name a few. <br>Spread
		over 30000 sq. ft. area, the hospital houses about 5 beds dedicated to
		critical care services, 5 ultra-modern modular OTs, state-of-the-art
		rehabilitation unit, in-house pharmacy, and in-patients ’ family
		waiting for the area to name a few.<br>
		</p>
	</div>
	
	<h2 style="padding-left:20px;color: #304463">Why we Stand out ?</h2><br>
	<div class="container">
		<div class="row">
			<div class="col-md-4">
				<div class="faci col-md-12">
				<h3>World Class Doctors</h3><br>
				<p>Our dedicated team of skilled healthcare professionals stays current on the latest medical advancements and utilizes cutting-edge technologies to ensure the highest quality care for our patients. We prioritize patient comfort and personalized treatment plans.</p>
				</div>
			</div>
			<div class="col-md-4">
				<div class="faci col-md-12">
				<h3>Compassionate Care</h3><br>
				<p>Our team of compassionate caregivers is dedicated to providing emotional support and comfort to our patients and their families. We firmly believe that empathy and understanding are essential components of holistic healthcare.</p>
				</div>
			</div>
			<div class="col-md-4">
				<div class="faci col-md-12">
				<h3>Advance Technology</h3><br>
				<p>Our commitment to technological advancement ensures that we are always at the forefront of medical innovative medical technology, which allows us to provide more accurate diagnoses, more effective treatments, and a more personalized patient experience.</p>
				</div>
			</div>
		</div>
	</div>
	<div id="address">
		<table>
			<tr>
				<td><img alt="Hospital Logo" src="Image/logo.png"></td>
			</tr>
			<tr>
				<th>LOTUS HEALTH CARE, SENAPATI BAPAT MARG, PUNE - 411011,
					MAHARASHTRA, INDIA.</th>
			</tr>
		</table>
		<table>
			<tr>
				<td><i class="lni lni-phone">&nbsp;&nbsp;</i></td>
				<td>+91 8777855511</td>
			</tr>
			<tr>
				<td><i class="lni lni-envelope"></i>&nbsp;&nbsp;</td>
				<td>corporate.desk@lotushealthcare.in</td>
			</tr>
		</table>
		<table>
			<tr style="color: red;">
				<th>Emergency no.</th>
				<th>Emergency no.</th>
				<th>Appointment no.</th>
			</tr>
			<tr>
				<td>+91 8538482233&nbsp;&nbsp;</td>
				<td>+91 7747612112&nbsp;&nbsp;</td>
				<td>+91 9876333111&nbsp;&nbsp;</td>
			</tr>
		</table>
	</div>
	<footer>
		<p>COPYRIGHT &copy; 2024 | LOTUS HEALTH SERVICES LTD. | ALL RIGHTS
			RESERVED | DESIGNED & POWERED BY SHIVA FRAME INDIA</p>
	</footer>
</body>
</html>
