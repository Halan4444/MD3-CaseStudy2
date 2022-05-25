<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Home</title>
    <%--    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"--%>
    <%--          integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">--%>
    <%--    <link href="../css/Styles.css">--%>
    <!-- font awesome cdn link  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <!-- custom css file link  -->
    <link rel="stylesheet" href="/css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.css">
    <!-- custom js file link  -->
    <script src="js/script.js" defer></script>
    <link rel="stylesheet" href="/css/style.scss">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.js"></script>
    <script>

        AOS.init({
            duration: 800,
            offset:150,
        });

    </script>
 <style>
     hr {border-top: 1px solid #ffffff; width:50%;}

     a {color: #ffffff;}
     a:link{text-decoration:none;}

     #contact2{
         letter-spacing:3px;
     }
     #author a{
         color: white;
         text-decoration: none;
     }
 </style>

    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">--%>
    <%--        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>--%>
    <%--        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>--%>
    <!------ Include the above in your HEAD tag ---------->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.10/css/all.css"
          integrity="sha384-+d0P83n9kaQMCwj8F4RJB66tzIwOKmrdb46+porD/OvrJ+37WqIM7UoBtwHO6Nlg" crossorigin="anonymous">
</head>
<body>
<c:import url="/components/header.jsp"/>
<c:import url="/components/navbar.jsp"/>

<section class="home" id="home">
    <div class="content">
        <span data-aos="fade-up" data-aos-delay="150">follow us</span>
        <h3 data-aos="fade-up" data-aos-delay="300">follow our CodeGym</h3>
        <p data-aos="fade-up" data-aos-delay="450">Welcome to the Global Homestay service, provided by CodeGym travel agency.
            Let's explore this magical world with us</p>
        <c:if test="${not empty sessionScope.usernameSession}">
            <a data-aos="fade-up" data-aos-delay="600" class="btn" href="/houses?action=book"> Book Now</a>
        </c:if>
        <c:if test="${empty sessionScope.usernameSession}">
            <a data-aos="fade-up" data-aos-delay="600" class="btn" href="/common/login.jsp"> Book Now</a>
        </c:if>
    </div>
    <div class="video-container">
        <video src="images/about-vid-4.mp4" id="video-slider" loop autoplay muted></video>
    </div>
</section>

<!-- home section ends -->

<!-- booking form section starts  -->

<section class="book-form" id="book-form">
    <form action="/houses">
        <a href="/houses?action=search">
            <div data-aos="zoom-in" data-aos-delay="150" class="inputBox">
                <span>where to?</span>
                <input type="text" name="placeName" placeholder="place name" value="">
            </div>
        </a>
        <div data-aos="zoom-in" data-aos-delay="300" class="inputBox">
            <span>when?</span>
            <input type="date" name="search" value="">
        </div>
        <div data-aos="zoom-in" data-aos-delay="450" class="inputBox">
            <span>how many?</span>
            <input type="number" placeholder="number of people" value="">
        </div>
        <input data-aos="zoom-in" data-aos-delay="600" type="submit" value="find now" class="btn">
    </form>
</section>

<section class="about" id="about">
        <div class="col-sm-8">
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3723.924416300666
            !2d105.76602881476342!3d21.035710085994655!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x313454b9444c676b%3A0xe713200541b7
            456d!2sCodeGym!5e0!3m2!1svi!2s!4v1653422112902!5m2!1svi!2s"
                    width="100%" height="500" frameborder="0" style="border:0" allowfullscreen></iframe>

        </div>
        <div class="col-sm-4 text-white" id="contact">
            <h3>L’Étoile</h3>
            <hr align="left" width="50%">
            <h4 class="pt-2">L’arc de triomphe de l’Étoile</h4>
            <i class="fas fa-globe" style="color:#000"></i> address<br>
            <h4 class="pt-2">Halan4444b-Long</h4>
            <i class="fas fa-phone" style="color:#000"></i> <a href="tel:+"> 0915924256 </a><br>
            <i class="fab fa-whatsapp" style="color:#000"></i><a href="tel:+"> 0915924256 </a><br>
            <h4 class="pt-2">Email</h4>
            <i class="fa fa-envelope" style="color:#000"></i> <a href="">Halan4444b@gmail.com</a><br>
        </div>
</section>

<!-- home section ends -->

<!-- booking form section starts  -->

<section class="book-form" id="book-form">

    <form action="">
        <div data-aos="zoom-in" data-aos-delay="150" class="inputBox">
            <span>where to?</span>
            <input type="text" placeholder="place name" value="">
        </div>
        <div data-aos="zoom-in" data-aos-delay="300" class="inputBox">
            <span>when?</span>
            <input type="date" value="">
        </div>
        <div data-aos="zoom-in" data-aos-delay="450" class="inputBox">
            <span>how many?</span>
            <input type="number" placeholder="number of travelers" value="">
        </div>
        <input data-aos="zoom-in" data-aos-delay="600" type="submit" value="find now" class="btn">
    </form>

</section>
<c:import url="/components/footer.jsp"/>
</body>
</html>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>

