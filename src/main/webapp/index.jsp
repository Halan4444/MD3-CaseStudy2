<%@ page import="service.IHouseService" %>
<%@ page import="service.impl.HouseServiceImpl" %>
<%@ page import="service.IStandardService" %>
<%@ page import="service.impl.StandardServiceImpl" %>
<%@ page import="service.ITypeService" %>
<%@ page import="service.impl.TypeServiceImpl" %>
<%@ page import="service.IBookingService" %>
<%@ page import="service.impl.BookingServiceImpl" %>
<%@ page import="models.House" %>
<%@ page import="models.Standard" %>
<%@ page import="java.util.List" %>
<%@ page import="models.Type" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Home</title>

<%--    <!-- font awesome cdn link  -->--%>
<%--    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">--%>
<%--    <!-- custom css file link  -->--%>
<%--    <link rel="stylesheet" href="webapp/css/style.css">--%>
<%--    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.css">--%>
<%--    <!-- custom js file link  -->--%>
<%--    <link rel="stylesheet" href="webapp/css/style.scss">--%>
<%--    <script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.js"></script>--%>
<%--    <script src="common/script.js" defer></script>--%>
<%--    <script src="js/script.js" defer></script>--%>
<%--    <script>--%>
<%--        AOS.init({--%>
<%--            duration: 800,--%>
<%--            offset:150,--%>
<%--        });--%>
<%--    </script>--%>

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

<!-- booking form section ends -->

<section class="destination" id="destination">
    <div class="heading">
        <span>our destination</span>
        <h1>make yours destination</h1>
    </div>
    <div class="box-container">
        <c:if test="${houseList.size()>0}">
            <c:forEach begin="1" var="i" end="4" varStatus="loop">
                <div class="box" data-aos="fade-up" data-aos-delay="150">
                    <div class="image">
                        <a href="/houses?action=detail&id=${loop.count+1}"><img src="images/pic${houseList.get(i).typeId}-a1.jpg" alt=""></a>
                    </div>
                    <div class="content">
                        <h3>${houseList.get(i).name}</h3>
                        <p>${houseList.get(i).address}</p>
                        <p>${houseList.get(i).price}</p>
                        <a href="/houses?action=detail&id=${loop.count+1}">read more <i class="fas fa-angle-right"></i></a>
                    </div>
                </div>
            </c:forEach>
        </c:if>
    </div>
</section>
<!-- about section starts  -->
<section class="about" id="about">
    <div class="video-container" data-aos="fade-right" data-aos-delay="300">
        <video src="/images/about-vid-1.mp4" muted autoplay loop class="video"></video>
        <div class="controls">
            <span class="control-btn" data-src="/images/about-vid-1.mp4"></span>
            <span class="control-btn"   data-src="/images/about-vid-2.mp4"></span>
            <span class="control-btn"  data-src="/images/about-vid-3.mp4"></span>
        </div>
    </div>
    <div class="content" data-aos="fade-left" data-aos-delay="600">
        <span>why choose us?</span>
        <h3>Homestay's Majesty Awaits You</h3>
        <p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Unde fugit repellat error deserunt nam aperiam odit libero quos provident. Nostrum?</p>
        <a href="#" class="btn">read more</a>
    </div>
</section>







<!-- about section ends -->

<!-- destination section starts  -->




<section class="services" id="services">

    <div class="heading">
        <span>our services</span>
        <h1>countless expericences</h1>
    </div>

    <div class="box-container">

        <div class="box" data-aos="zoom-in-up" data-aos-delay="150">
            <i class="fas fa-globe"></i>
            <h3>worldwide</h3>
            <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Numquam, cumque.</p>
        </div>

        <div class="box" data-aos="zoom-in-up" data-aos-delay="300">
            <i class="fas fa-hiking"></i>
            <h3>adventures</h3>
            <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Numquam, cumque.</p>
        </div>

        <div class="box" data-aos="zoom-in-up" data-aos-delay="450">
            <i class="fas fa-utensils"></i>
            <h3>food & drinks</h3>
            <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Numquam, cumque.</p>
        </div>

        <div class="box" data-aos="zoom-in-up" data-aos-delay="600">
            <i class="fas fa-hotel"></i>
            <h3>affordable hotels</h3>
            <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Numquam, cumque.</p>
        </div>

        <div class="box" data-aos="zoom-in-up" data-aos-delay="750">
            <i class="fas fa-wallet"></i>
            <h3>affordable price</h3>
            <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Numquam, cumque.</p>
        </div>

        <div class="box" data-aos="zoom-in-up" data-aos-delay="900">
            <i class="fas fa-headset"></i>
            <h3>24/7 support</h3>
            <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Numquam, cumque.</p>
        </div>

    </div>

</section>

<!-- services section ends -->

<!-- gallery section starts  -->

<section class="gallery" id="gallery">

    <div class="heading">
        <span>We capture every moment</span>
        <h1> Of your stay at Homestay </h1>
    </div>

    <div class="box-container">

        <div class="box" data-aos="zoom-in-up" data-aos-delay="150">
            <img src="images/gallery-img-1.jpg" alt="">
            <span>travel spot</span>
            <h3>iceland</h3>
        </div>

        <div class="box" data-aos="zoom-in-up" data-aos-delay="300">
            <img src="images/gallery-img-2.jpg" alt="">
            <span>travel spot</span>
            <h3>greenland</h3>
        </div>

        <div class="box" data-aos="zoom-in-up" data-aos-delay="450">
            <img src="images/gallery-img-3.jpg" alt="">
            <span>travel spot</span>
            <h3>alaska</h3>
        </div>

        <div class="box" data-aos="zoom-in-up" data-aos-delay="150">
            <img src="images/gallery-img-4.jpg" alt="">
            <span>travel spot</span>
            <h3>thailand</h3>
        </div>

        <div class="box" data-aos="zoom-in-up" data-aos-delay="300">
            <img src="images/gallery-img-5.jpg" alt="">
            <span>travel spot</span>
            <h3>brazil</h3>
        </div>

        <div class="box" data-aos="zoom-in-up" data-aos-delay="450">
            <img src="images/gallery-img-6.jpg" alt="">
            <span>travel spot</span>
            <h3>maldive</h3>
        </div>

        <div class="box" data-aos="zoom-in-up" data-aos-delay="150">
            <img src="images/gallery-img-7.jpg" alt="">
            <span>travel spot</span>
            <h3>iceland</h3>
        </div>

        <div class="box" data-aos="zoom-in-up" data-aos-delay="300">
            <img src="images/gallery-img-8.jpg" alt="">
            <span>travel spot</span>
            <h3>alaska</h3>
        </div>

        <div class="box" data-aos="zoom-in-up" data-aos-delay="450">
            <img src="images/gallery-img-9.jpg" alt="">
            <span>travel spot</span>
            <h3>maldive</h3>
        </div>

    </div>

</section>

<!-- gallery section ends -->

<!-- review section starts  -->

<section class="review">

    <div class="content" data-aos="fade-right" data-aos-delay="300">
        <span>testimonials</span>
        <h3>good news from our clients</h3>
        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Assumenda laudantium corporis fugiat quae unde perspiciatis similique ab modi enim consequatur aperiam cumque distinctio facilis sit, debitis possimus asperiores non harum.</p>
    </div>

    <div class="box-container" data-aos="fade-left" data-aos-delay="600">

        <div class="box">
            <p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Quia, ratione.</p>
            <div class="user">
                <img src="images/pic-1.png" alt="">
                <div class="info">
                    <h3>john deo</h3>
                    <span>designer</span>
                </div>
            </div>
        </div>
        <div class="box">
            <p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Quia, ratione.</p>
            <div class="user">
                <img src="images/pic-2.png" alt="">
                <div class="info">
                    <h3>john deo</h3>
                    <span>designer</span>
                </div>
            </div>
        </div>
        <div class="box">
            <p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Quia, ratione.</p>
            <div class="user">
                <img src="images/pic-3.png" alt="">
                <div class="info">
                    <h3>john deo</h3>
                    <span>designer</span>
                </div>
            </div>
        </div>
        <div class="box">
            <p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Quia, ratione.</p>
            <div class="user">
                <img src="images/pic-4.png" alt="">
                <div class="info">
                    <h3>john deo</h3>
                    <span>designer</span>
                </div>
            </div>
        </div>

    </div>

</section>

<!-- review section ends -->

<!-- blogs section starts  -->

<section class="blogs" id="blogs">

    <div class="heading">
        <span>The Story</span>
        <h1> That Homestay Brings</h1>
    </div>

    <div class="box-container">

        <div class="box" data-aos="fade-up" data-aos-delay="150">
            <div class="image">
                <img src="images/blog-1.jpg" alt="">
            </div>
            <div class="content">
                <a href="#" class="link">Life is a journey, not a destination</a>
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Pariatur, natus!</p>
                <div class="icon">
                    <a href="#"><i class="fas fa-clock"></i> 21st may, 2021</a>
                    <a href="#"><i class="fas fa-user"></i> by admin</a>
                </div>
            </div>
        </div>

        <div class="box" data-aos="fade-up" data-aos-delay="300">
            <div class="image">
                <img src="images/blog-2.jpg" alt="">
            </div>
            <div class="content">
                <a href="#" class="link">Life is a journey, not a destination</a>
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Pariatur, natus!</p>
                <div class="icon">
                    <a href="#"><i class="fas fa-clock"></i> 21st may, 2021</a>
                    <a href="#"><i class="fas fa-user"></i> by admin</a>
                </div>
            </div>
        </div>

        <div class="box" data-aos="fade-up" data-aos-delay="450">
            <div class="image">
                <img src="images/blog-3.jpg" alt="">
            </div>
            <div class="content">
                <a href="#" class="link">Life is a journey, not a destination</a>
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Pariatur, natus!</p>
                <div class="icon">
                    <a href="#"><i class="fas fa-clock"></i> 21st may, 2021</a>
                    <a href="#"><i class="fas fa-user"></i> by admin</a>
                </div>
            </div>
        </div>

    </div>

</section>

<!-- blogs section ends -->

<!-- banner section starts  -->

<div class="banner">

    <div class="content" data-aos="zoom-in-up" data-aos-delay="300">
        <span>start your codegym's adventures</span>
        <h3>Let's Explore This Global Homestay</h3>
        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Earum voluptatum praesentium amet quibusdam quam officia suscipit odio.</p>
        <a href="#book-form" class="btn">book now</a>
    </div>

</div>

<!-- banner section ends -->

<c:import url="/components/footer.jsp"/>
</body>
</html>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
