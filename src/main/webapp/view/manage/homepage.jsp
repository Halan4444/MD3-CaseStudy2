<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Home</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
          integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <link href="../css/Styles.css">
</head>
<body>
<c:import url="/components/header.jsp"/>
<c:import url="/components/navbar.jsp"/>
<section class="home" id="home">
    <div class="content">
        <span data-aos="fade-up" data-aos-delay="150">follow us</span>
        <h3 data-aos="fade-up" data-aos-delay="300">follow our CodeGym</h3>
        <p data-aos="fade-up" data-aos-delay="450">Go to the End-Of-Earth, provided by CodeGym travel agency.
            Let's explore this magical world with us</p>
        <c:if test="${not empty sessionScope.usernameSession}">
            <a data-aos="fade-up" data-aos-delay="600" class="btn" href="/view/house/booking.jsp"> Book Now</a>
        </c:if>
        <c:if test="${empty sessionScope.usernameSession}">
            <a data-aos="fade-up" data-aos-delay="600" class="btn" href="/common/login.jsp"> Book Now</a>
        </c:if>
    </div>
    <div class="video-container">
        <video src="images/about-vid-4.mp4" id="video-slider" loop autoplay muted></video>
    </div>
</section>
<div class="container-fluid row  bg-white" style="position: relative">
    <img src="/view/house/assets/images/homestay-bg2.jpg" style="width: 100vw;position: absolute">
    <div class="col-sm-2 border-end bg-white" id="sidebar">
        <div class="list-group list-group-flush border" style="font-size: large">
            <a class="list-group-item list-group-item-action list-group-item-light p-3" href="/manages?action=houseList">Manage House</a>
            <a class="list-group-item list-group-item-action list-group-item-light p-3" href="/manages?action=bookingList">Manage Booking</a>
            <a class="list-group-item list-group-item-action list-group-item-light p-3" href="/user?action=contract">Manage Customer</a>
            <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">Events</a>
            <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">Profile</a>
            <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">Status</a>
        </div>
    </div>
    <div class="col-sm-10 " style="position: relative ;
    background: linear-gradient(rgba(17, 17, 17, 0.7), rgba(17, 17, 17, 0.7));
    background-size: cover;
    background-position: center;
    background-attachment: fixed;color: white">
        <h1 style="font-size: xxx-large" class="mt-4">Welcome to the world famous Homestay Codegym</h1>
        <br>
        <p style="font-size: medium" class="col-sm-9">Homestay is unquestionably the lodging of choice, especially for a foreign student.
            At Global Homestay Services(GHS), we provide you, the international student, a way to feel truly at home
            while attending school in the United States. Our students are very carefully placed into an environment with
            an experienced host family who welcomes each student as a member of their own family. We fully understand the
            nervous anticipation felt by our Foreign Students. In most cases, it may be your first venture away from
            your familiar home, country and cultural atmosphere. You are faced not only with the demanding educational challenges,
            but transported into a culture and environment many times very different from the one that you are most familiar with.
        <br>
        <br>
            GHS provides the international students with the proper kind of pleasant, supportive,
            safe and caring environment that they are accustomed to in their home country. The environment is safe,
            and secure . . . Our goal is to make each and every student happy, safe and contented in a caring home,
            with good food, pleasant surroundings with warm and friendly people around them every day. In addition, the student's
            language skills will increase while they learn and experience, first-hand, our local and nation's customs and traditions. Through the efforts of our expert, experienced staff, working closely with students, parents, host families, school staff and agents, we are able to deliver a well rounded,
            enjoyable, learning experience. We welcome your participation in this exciting and rewarding program.</p>
        <br>
        <br>
        <br>
        <br>
        <br>
    </div>
</div>
<c:import url="/components/footer.jsp"/>
</body>
</html>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>

