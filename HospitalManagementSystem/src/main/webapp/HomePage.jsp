<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>Home</title>
   <link rel="stylesheet" href="CSS/Hospital.css">
   <link href="https://cdn.lineicons.com/4.0/lineicons.css" rel="stylesheet" />
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
     integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
   <script src='JS/Validation.js'></script>
   <style>
* {box-sizing: border-box;}
body {font-family: Verdana, sans-serif;}
.mySlides {display: none;}
img {vertical-align: middle;}

/* Slideshow container */
.slideshow-container {
  position: relative;
}


/* The dots/bullets/indicators */
.dot {
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}

.active {
  background-color: #717171;
}

/* Fading animation */
.fade {
  animation-name: fade;
  animation-duration: 4.5s;
}

@keyframes fade {
  from {opacity: .2} 
  to {opacity: 4.5}
}

/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) {
  .text {font-size: 11px}
}
        .quote {
        	margin: 10px 100px;
        	font-style: italic;
            }
     #address{
     padding-left:100px;
     font-size:20px;
     }
   </style>
</head>
<body>
    <header>
    <div id="title">
        <h1><b>Lotus Multi-specility Hospital</b></h1>  
    </div>
    </header>
    <nav>
        <ul>
           	<li>
            	<a href="HomePage.html"><b>Home</b></a>
            </li>
            <li>
                <a href="AdminLogin.jsp"><b>Admin Login</b></a>
            </li>
            <li>
                <a href="DoctorLogin.jsp"><b>Doctor Login</b></a>
            </li>
            <li>
                <a href="ReceptionistLogin.jsp"><b>Reception Login</b></a>
            </li>
            <li>
                <a href="About.html"><b>About us</b></a>
            </li>
            <li>
                <a href="Contact.html"><b>Contact us</b></a>
            </li>
        </ul>
    </nav>
 <div style="height:80px;"></div>
<div class="slideshow-container">

<div class="mySlides fade">
  <img src="Image/quote2.jpg" style="width:100%">
</div>

<div class="mySlides fade">
  <img src="Image/quote3.jpg" style="width:100%">
</div>

<div class="mySlides fade">
  <img src="Image/quote4.jpg" style="width:100%">
</div>

<div class="mySlides fade">
  <img src="Image/quote5.jpg" style="width:100%">
</div>

</div>
<br>

<div style="text-align:center">
  <span class="dot"></span> 
  <span class="dot"></span>
  <span class="dot"></span>
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
  if (slideIndex > slides.length) {slideIndex = 1}    
  for (i = 0; i < dots.length; i++) {
    dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";  
  dots[slideIndex-1].className += " active";
  setTimeout(showSlides, 3000);
}
</script>
<main class="backimg" style="background-color:white">
</main>
<div id="address">
	<table>
	<tr><td> <img alt="" src="Image/logo.png"></td></tr>
	<tr><td>LOTUS MEMORIAL HOSPITAL, SENAPATI BAPAT MARG, PUNE - 411011, MAHARASHTRA , INDIA.</td></tr>
	</table>
</div>
<footer>
   
    <p> COPYRIGHT &copy; 2023 |	LOTUS HEALTH SERVICES LTD. | ALL RIGHTS RESERVED | DESIGNED & POWERED BY SHIVA FRAME INDIA</p>

</footer>

</body>
</html>