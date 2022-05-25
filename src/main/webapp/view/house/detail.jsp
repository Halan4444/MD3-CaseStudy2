<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 5/20/2022
  Time: 2:17 PM
  To change this template use File | Settings | File Templates.
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Home</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
    <%--          integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">--%>
    <%--    <link href="../css/Styles.css">--%>
    <!-- font awesome cdn link  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <!-- custom css file link  -->
    <link rel="stylesheet" href="/css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.css">
    <!-- custom js file link  -->
    <link rel="stylesheet" href="/css/style.scss">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.js"></script>
    <script src="/js/script.js" defer></script>
    <!-- Favicon -->
    <link rel="shortcut icon" href="http://localhost:8080/view/house/assets/images/favicon.png" />
    <!-- Plugins CSS -->
    <link rel="stylesheet" href="http://localhost:8080/view/house/assets/css/plugins.css">
    <!-- Booststap CSS -->
    <link rel="stylesheet" href="http://localhost:8080/view/house/assets/css/bootstrap.min.css">
    <!-- Main Style CSS -->
    <link rel="stylesheet" href="http://localhost:8080/view/house/assets/css/style.css">
    <link rel="stylesheet" href="http://localhost:8080/view/house/assets/css/responsive.css">

    <script>
        AOS.init({
            duration: 800,
            offset: 150,
        });
    </script>
    
</head>
<body>
<c:import url="/components/header.jsp"/>
<c:import url="/components/navbar.jsp"/>
<c:set var="context" value="${pageContext.request.contextPath}" />
<section class="home" id="home">
    <div class="content">
        <span data-aos="fade-up" data-aos-delay="150">Welcome Customer~</span>
        <h3 data-aos="fade-up" data-aos-delay="300">follow our Homestay</h3>
        <p data-aos="fade-up" data-aos-delay="450">Here, all the details of the Homestay you are looking for are
            displayed here</p>
        <c:if test="${not empty sessionScope.usernameSession}">
            <a data-aos="fade-up" data-aos-delay="600" class="btn" href="/view/house/booking.jsp"> Book Now</a>
        </c:if>
        <c:if test="${empty sessionScope.usernameSession}">
            <a data-aos="fade-up" data-aos-delay="600" class="btn" href="/common/login.jsp"> Book Now</a>
        </c:if>
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

<!-- booking form section ends -->

<!-- about section starts  -->
<!-- about section ends -->
<section class="destination" style="background-color: white">
    <!DOCTYPE html>
    <html class="no-js" lang="en">

    <!-- belle/short-description.html   11 Nov 2019 12:43:10 GMT -->
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Short Description &ndash; Belle Multipurpose Bootstrap 4 Template</title>
        <meta name="description" content="description">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <style>
            <%@ include file="/view/house/assets/css/plugins.css" %>
        </style>
        <style>
            <%@ include file="/view/house/assets/css/bootstrap.min.css" %>
        </style>
        <style>
            <%@ include file="/view/house/assets/css/style.css" %>
        </style>
        <style>
            <%@ include file="/view/house/assets/css/responsive.css" %>
        </style>
        <!-- Favicon -->
        <link rel="shortcut icon" href="http://localhost:8080/view/house/assets/images/favicon.png"/>
        <!-- Plugins CSS -->
        <link rel="stylesheet" href="http://localhost:8080/view/house/assets/css/plugins.css">
        <!-- Bootstap CSS -->
        <link rel="stylesheet" href="http://localhost:8080/view/house/assets/css/bootstrap.min.css">
        <!-- Main Style CSS -->
        <link rel="stylesheet" href="http://localhost:8080/view/house/assets/css/style.css">
        <link rel="stylesheet" href="http://localhost:8080/view/house/assets/css/responsive.css">
    </head>
    <body class="template-product belle">

    <div class="pageWrapper">
        <!--Body Content-->
        <div id="page-content">
            <!--MainContent-->
            <div id="MainContent" class="main-content" role="main">

                <div id="ProductSection-product-template" class="product-template__container prstyle1 container">
                    <!--product-single-->
                    <div class="product-single">
                        <div class="row">
                            <div class="col-lg-6 col-md-6 col-sm-12 col-12">
                                <div class="product-details-img">
                                    <div class="product-thumb">
                                        <div id="galleryx" class="product-dec-slider-2 product-tab-left">
                                            <c:forEach begin="0" end="6" var="i" varStatus="loop">
                                                <a data-image="http://localhost:8080/view/house/assets/images/${type.getType()}/pic${type.getId()}-a${(i+1)}.jpg"
                                                   data-zoom-image="http://localhost:8080/view/house/assets/images/${type.getType()}/pic${type.getId()}-a${(i+1)}.jpg"
                                                   class="slick-slide slick-cloned" data-slick-index="${loop.index-4}"
                                                   aria-hidden="true" tabindex="-1">
                                                    <img class="blur-up lazyload" src="http://localhost:8080/view/house/assets/images/${type.getType()}/pic${type.getId()}-a${(i+1)}.jpg"
                                                         alt=""/>
                                                </a>
                                            </c:forEach>
                                        </div>
                                    </div>
                                    <div class="zoompro-wrap product-zoom-right pl-20">
                                        <div class="zoompro-span">
                                            <img class="zoompro blur-up lazyload"
                                                 data-zoom-image="http://localhost:8080/view/house/assets/images/${type.getType()}/pic${type.getId()}-a1.jpg"
                                                 alt="" src="http://localhost:8080/view/house/assets/images/${type.getType()}/pic${type.getId()}-a1.jpg"/>
                                        </div>
                                        <div class="product-labels"><span class="lbl on-sale">Sale</span><span
                                                class="lbl pr-label1">new</span></div>
                                        <div class="product-buttons">
                                            <a href="https://www.youtube.com/watch?v=93A2jOW5Mog"
                                               class="btn popup-video" title="View Video"><i class="icon anm anm-play-r"
                                                                                             aria-hidden="true"></i></a>
                                            <a href="#" class="btn prlightbox" title="Zoom"><i
                                                    class="icon anm anm-expand-l-arrows" aria-hidden="true"></i></a>
                                        </div>
                                    </div>
                                    <div class="lightboximages">
                                        <c:forEach begin="0" end="6" var="i">
                                            <a href="http://localhost:8080/view/house/assets/images/${type.getType()}/pic${type.getId()}-a${(i+1)}.jpg" data-size="1462x2048"></a>
                                        </c:forEach>
                                    </div>

                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-12 col-12">
                                <div class="product-single__meta">
                                    <h1 class="product-single__title">Short Description</h1>
                                    <div class="product-nav clearfix">
                                        <a href="#" class="next" title="Next"><i class="fa fa-angle-right"
                                                                                 aria-hidden="true"></i></a>
                                    </div>
                                    <div class="prInfoRow">
                                        <div class="product-stock"><span class="instock ">${house.getStatus()}</span>
                                               </div>
                                        <div class="product-sku">House Type: <span class="variant-sku">${type.getType()}</span></div>
                                        <div class="product-review"><a class="reviewLink" href="#tab2"><i
                                                class="font-13 fa fa-star"></i><i class="font-13 fa fa-star"></i><i
                                                class="font-13 fa fa-star"></i><i class="font-13 fa fa-star-o"></i><i
                                                class="font-13 fa fa-star-o"></i><span class="spr-badge-caption">6 reviews</span></a>
                                        </div>
                                    </div>
                                    <p class="product-single__price product-single__price-product-template">
                                        <span class="visually-hidden">Price for one night</span>
                                        <s id="ComparePrice-product-template"><span class="money">${house.getPrice()}</span></s>
                                        <span class="product-price__price product-price__price-product-template product-price__sale product-price__sale--single">
<%--                                                <span id="ProductPrice-product-template"><span--%>
<%--                                                        class="money">$500.00</span></span>--%>
<%--                                            </span>--%>
                                        <span class="discount-badge"> <span class="devider">|</span>&nbsp;
<%--                                                <span>You Save</span>--%>
<%--                                                <span id="SaveAmount-product-template"--%>
<%--                                                      class="product-single__save-amount">--%>
<%--                                                <span class="money">$100.00</span>--%>
<%--                                                </span>--%>
<%--                                                <span class="off">(<span>16</span>%)</span>--%>
                                            </span>
                                    </p>
                                    <div class="orderMsg" data-user="23" data-time="24">
                                        <img src="assets/images/order-icon.jpg" alt=""/> <strong
                                            class="items">5</strong> sold in last <strong class="time">26</strong> hours
                                    </div>
                                </div>
                                <div class="product-single__description rte">
                                    <ul>
                                        <li>Lorem ipsum dolor sit amet, consectetur adipiscing elit</li>
                                        <li>Sed ut perspiciatis unde omnis iste natus error sit</li>
                                        <li>Neque porro quisquam est qui dolorem ipsum quia dolor</li>
                                        <li>Lorem Ipsum is not simply random text.</li>
                                    </ul>
                                    <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem
                                        Ipsum has been the industry's standard dummy text ever since the 1500s, when an
                                        unknown printer took a galley of type and scrambled it to make a type specimen
                                        book.</p>
                                </div>
                                <div id="quantity_message">Hurry! Only <span class="items">4</span> left in stock.</div>
                                <form method="post" action="http://annimexweb.com/cart/add"
                                      id="product_form_10508262282" accept-charset="UTF-8"
                                      class="product-form product-form-product-template hidedropdown"
                                      enctype="multipart/form-data">
                                    <!-- Product Action -->
                                    <div class="product-action clearfix">
                                        <div class="product-form__item--quantity">
                                            <div class="wrapQtyBtn">
                                                <div class="qtyField">
                                                    <a class="qtyBtn minus" href="javascript:void(0);"><i
                                                            class="fa anm anm-minus-r" aria-hidden="true"></i></a>
<%--                                                    <input type="text" id="Quantity" name="quantity" value="1"--%>
<%--                                                           class="product-form__input qty">--%>
                                                    <a class="qtyBtn plus" href="javascript:void(0);"><i
                                                            class="fa anm anm-plus-r" aria-hidden="true"></i></a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="product-form__item--submit">
                                            <c:if test="${not empty sessionScope.usernameSession}">
                                                <a data-aos="fade-up" data-aos-delay="600" class="btn" href="/houses?action=book&id=${house.getId()}"> Book Now</a>
                                            </c:if>
                                            <c:if test="${empty sessionScope.usernameSession}">
                                                <a data-aos="fade-up" data-aos-delay="600" class="btn" href="/common/login.jsp"> Book Now</a>
                                            </c:if>
                                        </div>
                                        <div class="shopify-payment-button" data-shopify="payment-button">
<%--                                            <button type="button"--%>
<%--                                                    class="shopify-payment-button__button shopify-payment-button__button--unbranded">--%>
<%--                                                Buy it now--%>
<%--                                            </button>--%>
                                        </div>
                                    </div>
                                    <!-- End Product Action -->
                                </form>
                                <div class="display-table shareRow">
                                    <div class="display-table-cell medium-up--one-third">
                                        <div class="wishlist-btn">
                                            <a class="wishlist add-to-wishlist" href="#" title="Add to Wishlist"><i
                                                    class="icon anm anm-heart-l" aria-hidden="true"></i>
<%--                                                <span>Add to Wishlist</span>--%>
                                            </a>
                                        </div>
                                    </div>
                                    <div class="display-table-cell text-right">
                                        <div class="social-sharing">
                                            <a target="_blank" href="#"
                                               class="btn btn--small btn--secondary btn--share share-facebook"
                                               title="Share on Facebook">
                                                <i class="fa fa-facebook-square" aria-hidden="true"></i> <span
                                                    class="share-title" aria-hidden="true">Share</span>
                                            </a>
                                            <a target="_blank" href="#"
                                               class="btn btn--small btn--secondary btn--share share-twitter"
                                               title="Tweet on Twitter">
                                                <i class="fa fa-twitter" aria-hidden="true"></i> <span
                                                    class="share-title" aria-hidden="true">Tweet</span>
                                            </a>
                                            <a href="#" title="Share on google+"
                                               class="btn btn--small btn--secondary btn--share">
                                                <i class="fa fa-google-plus" aria-hidden="true"></i> <span
                                                    class="share-title" aria-hidden="true">Google+</span>
                                            </a>
                                            <a target="_blank" href="#"
                                               class="btn btn--small btn--secondary btn--share share-pinterest"
                                               title="Pin on Pinterest">
                                                <i class="fa fa-pinterest" aria-hidden="true"></i> <span
                                                    class="share-title" aria-hidden="true">Pin it</span>
                                            </a>
                                            <a href="#" class="btn btn--small btn--secondary btn--share share-pinterest"
                                               title="Share by Email" target="_blank">
                                                <i class="fa fa-envelope" aria-hidden="true"></i> <span
                                                    class="share-title" aria-hidden="true">Email</span>
                                            </a>
                                        </div>
                                    </div>
                                </div>

<%--                                <p id="freeShipMsg" class="freeShipMsg" data-price="199"><i class="fa fa-truck"--%>
<%--                                                                                            aria-hidden="true"></i>--%>
<%--                                    GETTING CLOSER! ONLY <b class="freeShip"><span class="money"--%>
<%--                                                                                   data-currency-usd="$199.00"--%>
<%--                                                                                   data-currency="USD">$199.00</span></b>--%>
<%--                                    AWAY FROM <b>FREE SHIPPING!</b></p>--%>
<%--                                <p class="shippingMsg"><i class="fa fa-clock-o" aria-hidden="true"></i> ESTIMATED--%>
<%--                                    DELIVERY BETWEEN <b id="fromDate">Wed. May 1</b> and <b id="toDate">Tue. May 7</b>.--%>
<%--                                </p>--%>
<%--                                <div class="userViewMsg" data-user="20" data-time="11000"><i class="fa fa-users"--%>
<%--                                                                                             aria-hidden="true"></i>--%>
<%--                                    <strong class="uersView">14</strong> PEOPLE ARE LOOKING FOR THIS PRODUCT--%>
<%--                                </div>--%>
                            </div>
                        </div>
                    </div>
                    <!--End-product-single-->
                    <!--Product Fearure-->
                    <div class="prFeatures">
                        <div class="row">
                            <div class="col-12 col-sm-6 col-md-3 col-lg-3 feature">
                                <img src="http://localhost:8080/view/house/assets/images/credit-card.png" alt="Safe Payment" title="Safe Payment"/>
                                <div class="details"><h3>Safe Payment</h3>Pay with the world's most payment methods.
                                </div>
                            </div>
                            <div class="col-12 col-sm-6 col-md-3 col-lg-3 feature">
                                <img src="http://localhost:8080/view/house/assets/images/shield.png" alt="Confidence" title="Confidence"/>
                                <div class="details"><h3>Confidence</h3>Protection covers your purchase and personal
                                    data.
                                </div>
                            </div>
                            <div class="col-12 col-sm-6 col-md-3 col-lg-3 feature">
                                <img src="http://localhost:8080/view/house/assets/images/worldwide.png" alt="Worldwide Delivery"
                                     title="Worldwide Delivery"/>

                                <div class="details"><h3>Perfect Service</h3>FREE &amp; Professional and friendly staffs.
                                </div>
                            </div>
                            <div class="col-12 col-sm-6 col-md-3 col-lg-3 feature">

                                <img src="http://localhost:8080/view/house/assets/images/phone-call.png" alt="Hotline" title="Hotline"/>
                                <div class="details"><h3>Hotline</h3>Talk to help line for your question on 4141 456
                                    789, 4125 666 888
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--End Product Fearure-->
                    <!--Product Tabs-->
                    <div class="tabs-listing">
                        <ul class="product-tabs">
                            <li rel="tab1"><a class="tablink">House Description</a></li>
                            <li rel="tab2"><a class="tablink">Reviews</a></li>
                            <li rel="tab3"><a class="tablink">Basic Utilities</a></li>
                            <li rel="tab4"><a class="tablink">Extra Utlities</a></li>
                        </ul>
                        <div class="tab-container">
                            <div id="tab1" class="tab-content">
                                <div class="product-description rte">
                                    <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem
                                        Ipsum has been the industry's standard dummy text ever since the 1500s, when an
                                        unknown printer took a galley of type and scrambled it to make a type specimen
                                        book. It has survived not only five centuries, but also the leap into electronic
                                        typesetting, remaining essentially unchanged.</p>
                                    <ul>
                                        <li>Lorem ipsum dolor sit amet, consectetur adipiscing elit</li>
                                        <li>Sed ut perspiciatis unde omnis iste natus error sit</li>
                                        <li>Neque porro quisquam est qui dolorem ipsum quia dolor</li>
                                        <li>Lorem Ipsum is not simply random text.</li>
                                        <li>Free theme updates</li>
                                    </ul>
                                    <h3>Sed ut perspiciatis unde omnis iste natus error sit voluptatem</h3>
                                    <p>You can change the position of any sections such as slider, banner, products,
                                        collection and so on by just dragging and dropping.&nbsp;</p>
                                    <h3>Lorem Ipsum is not simply random text.</h3>
                                    <p>But I must explain to you how all this mistaken idea of denouncing pleasure and
                                        praising pain was born and I will give you a complete account of the system, and
                                        expound the actual teachings of the great explorer of the truth, the
                                        master-builder of human happiness.</p>
                                    <p>Change colors, fonts, banners, megamenus and more. Preview changes are live
                                        before saving them.</p>
                                    <h3>1914 translation by H. Rackham</h3>
                                    <p>But I must explain to you how all this mistaken idea of denouncing pleasure and
                                        praising pain was born and I will give you a complete account of the system, and
                                        expound the actual teachings of the great explorer of the truth, the
                                        master-builder of human happiness.</p>
                                    <h3>Section 1.10.33 of "de Finibus Bonorum et Malorum", written by Cicero in 45
                                        BC</h3>
                                    <p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis
                                        praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias
                                        excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui
                                        officia deserunt mollitia animi, id est laborum et dolorum fuga.</p>
                                    <h3>The standard Lorem Ipsum passage, used since the 1500s</h3>
                                    <p>You can use variant style from colors, images or variant images. Also available
                                        differnt type of design styles and size.</p>
                                    <h3>Lorem Ipsum is not simply random text.</h3>
                                    <p>But I must explain to you how all this mistaken idea of denouncing pleasure and
                                        praising pain was born and I will give you a complete account of the system, and
                                        expound the actual teachings of the great explorer of the truth, the
                                        master-builder of human happiness.</p>
                                    <h3>Proin ut lacus eget elit molestie posuere.</h3>
                                    <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem
                                        Ipsum has been the industry's standard dummy text ever since the 1500s, when an
                                        unknown printer took a galley of type and scrambled.</p>
                                </div>
                            </div>

                            <div id="tab2" class="tab-content">
                                <div id="shopify-product-reviews">
                                    <div class="spr-container">
                                        <div class="spr-header clearfix">
                                            <div class="spr-summary">
                                                <span class="product-review"><a class="reviewLink"><i
                                                        class="font-13 fa fa-star"></i><i
                                                        class="font-13 fa fa-star"></i><i
                                                        class="font-13 fa fa-star"></i><i
                                                        class="font-13 fa fa-star-o"></i><i
                                                        class="font-13 fa fa-star-o"></i> </a><span
                                                        class="spr-summary-actions-togglereviews">Based on 6 reviews456</span></span>
                                                <span class="spr-summary-actions">
                                                    <a href="#"
                                                       class="spr-summary-actions-newreview btn">Write a review</a>
                                                </span>
                                            </div>
                                        </div>
                                        <div class="spr-content">
                                            <div class="spr-form clearfix">
                                                <form method="post" action="#" id="new-review-form"
                                                      class="new-review-form">
                                                    <h3 class="spr-form-title">Write a review</h3>
                                                    <fieldset class="spr-form-contact">
                                                        <div class="spr-form-contact-name">
                                                            <label class="spr-form-label"
                                                                   for="review_author_10508262282">Name</label>
                                                            <input class="spr-form-input spr-form-input-text "
                                                                   id="review_author_10508262282" type="text"
                                                                   name="review[author]" value=""
                                                                   placeholder="Enter your name">
                                                        </div>
                                                        <div class="spr-form-contact-email">
                                                            <label class="spr-form-label"
                                                                   for="review_email_10508262282">Email</label>
                                                            <input class="spr-form-input spr-form-input-email "
                                                                   id="review_email_10508262282" type="email"
                                                                   name="review[email]" value=""
                                                                   placeholder="john.smith@example.com">
                                                        </div>
                                                    </fieldset>
                                                    <fieldset class="spr-form-review">
                                                        <div class="spr-form-review-rating">
                                                            <label class="spr-form-label">Rating</label>
                                                            <div class="spr-form-input spr-starrating">
                                                                <div class="product-review"><a class="reviewLink"
                                                                                               href="#"><i
                                                                        class="fa fa-star-o"></i><i
                                                                        class="font-13 fa fa-star-o"></i><i
                                                                        class="font-13 fa fa-star-o"></i><i
                                                                        class="font-13 fa fa-star-o"></i><i
                                                                        class="font-13 fa fa-star-o"></i></a></div>
                                                            </div>
                                                        </div>

                                                        <div class="spr-form-review-title">
                                                            <label class="spr-form-label"
                                                                   for="review_title_10508262282">Review Title</label>
                                                            <input class="spr-form-input spr-form-input-text "
                                                                   id="review_title_10508262282" type="text"
                                                                   name="review[title]" value=""
                                                                   placeholder="Give your review a title">
                                                        </div>

                                                        <div class="spr-form-review-body">
                                                            <label class="spr-form-label" for="review_body_10508262282">Body
                                                                of Review <span
                                                                        class="spr-form-review-body-charactersremaining">(1500)</span></label>
                                                            <div class="spr-form-input">
                                                                <textarea
                                                                        class="spr-form-input spr-form-input-textarea "
                                                                        id="review_body_10508262282"
                                                                        data-product-id="10508262282"
                                                                        name="review[body]" rows="10"
                                                                        placeholder="Write your comments here"></textarea>
                                                            </div>
                                                        </div>
                                                    </fieldset>
                                                    <fieldset class="spr-form-actions">
                                                        <input type="submit"
                                                               class="spr-button spr-button-primary button button-primary btn btn-primary"
                                                               value="Submit Review">
                                                    </fieldset>
                                                </form>
                                            </div>
                                            <div class="spr-reviews">
                                                <div class="spr-review">
                                                    <div class="spr-review-header">
                                                        <span class="product-review spr-starratings spr-review-header-starratings"><span
                                                                class="reviewLink"><i class="fa fa-star"></i><i
                                                                class="font-13 fa fa-star"></i><i
                                                                class="font-13 fa fa-star"></i><i
                                                                class="font-13 fa fa-star"></i><i
                                                                class="font-13 fa fa-star"></i></span></span>
                                                        <h3 class="spr-review-header-title">Lorem ipsum dolor sit
                                                            amet</h3>
                                                        <span class="spr-review-header-byline"><strong>dsacc</strong> on <strong>Apr 09, 2019</strong></span>
                                                    </div>
                                                    <div class="spr-review-content">
                                                        <p class="spr-review-content-body">Lorem ipsum dolor sit amet,
                                                            consectetur adipiscing elit, sed do eiusmod tempor
                                                            incididunt ut labore et dolore magna aliqua. Ut enim ad
                                                            minim veniam, quis nostrud exercitation ullamco laboris nisi
                                                            ut aliquip ex ea commodo consequat.</p>
                                                    </div>
                                                </div>
                                                <div class="spr-review">
                                                    <div class="spr-review-header">
                                                        <span class="product-review spr-starratings spr-review-header-starratings"><span
                                                                class="reviewLink"><i class="fa fa-star"></i><i
                                                                class="font-13 fa fa-star"></i><i
                                                                class="font-13 fa fa-star"></i><i
                                                                class="font-13 fa fa-star"></i><i
                                                                class="font-13 fa fa-star"></i></span></span>
                                                        <h3 class="spr-review-header-title">Lorem Ipsum is simply dummy
                                                            text of the printing</h3>
                                                        <span class="spr-review-header-byline"><strong>larrydude</strong> on <strong>Dec 30, 2018</strong></span>
                                                    </div>

                                                    <div class="spr-review-content">
                                                        <p class="spr-review-content-body">Sed ut perspiciatis unde
                                                            omnis iste natus error sit voluptatem accusantium doloremque
                                                            laudantium, totam rem aperiam, eaque ipsa quae ab illo
                                                            inventore veritatis et quasi architecto beatae vitae dicta
                                                            sunt explicabo.
                                                        </p>
                                                    </div>
                                                </div>
                                                <div class="spr-review">
                                                    <div class="spr-review-header">
                                                        <span class="product-review spr-starratings spr-review-header-starratings"><span
                                                                class="reviewLink"><i class="fa fa-star"></i><i
                                                                class="font-13 fa fa-star"></i><i
                                                                class="font-13 fa fa-star"></i><i
                                                                class="font-13 fa fa-star"></i><i
                                                                class="font-13 fa fa-star"></i></span></span>
                                                        <h3 class="spr-review-header-title">Neque porro quisquam est qui
                                                            dolorem ipsum quia dolor sit amet, consectetur, adipisci
                                                            velit...</h3>
                                                        <span class="spr-review-header-byline"><strong>quoctri1905</strong> on <strong>Dec 30, 2018</strong></span>
                                                    </div>

                                                    <div class="spr-review-content">
                                                        <p class="spr-review-content-body">Lorem Ipsum is simply dummy
                                                            text of the printing and typesetting industry. Lorem Ipsum
                                                            has been the industry's standard dummy text ever since the
                                                            1500s, when an unknown printer took a galley of type and
                                                            scrambled.<br>
                                                            <br>Lorem Ipsum is simply dummy text of the printing and
                                                            typesetting industry.</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- End product details -->
                    </div>
                    <!-- Including Jquery -->
                    <script src="http://localhost:8080/view/house/assets/js/vendor/jquery-3.3.1.min.js"></script>
                    <script src="http://localhost:8080/view/house/assets/js/vendor/jquery.cookie.js"></script>
                    <script src="http://localhost:8080/view/house/assets/js/vendor/modernizr-3.6.0.min.js"></script>
                    <script src="http://localhost:8080/view/house/assets/js/vendor/wow.min.js"></script>
                    <!-- Including Javascript -->
                    <script src="http://localhost:8080/view/house/assets/js/bootstrap.min.js"></script>
                    <script src="http://localhost:8080/view/house/assets/js/plugins.js"></script>
                    <script src="http://localhost:8080/view/house/assets/js/popper.min.js"></script>
                    <script src="http://localhost:8080/view/house/assets/js/lazysizes.js"></script>
                    <script src="http://localhost:8080/view/house/assets/js/main.js"></script>
                    <!-- Photoswipe Gallery -->
                    <script src="http://localhost:8080/view/house/assets/js/vendor/photoswipe.min.js"></script>
                    <script src="http://localhost:8080/view/house/assets/js/vendor/photoswipe-ui-default.min.js"></script>
                    <script>
                        $(function () {
                            var $pswp = $('.pswp')[0],
                                image = [],
                                getItems = function () {
                                    var items = [];
                                    $('.lightboximages a').each(function () {
                                        var $href = $(this).attr('href'),
                                            $size = $(this).data('size').split('x'),
                                            item = {
                                                src: $href,
                                                w: $size[0],
                                                h: $size[1]
                                            }
                                        items.push(item);
                                    });
                                    return items;
                                }
                            var items = getItems();

                            $.each(items, function (index, value) {
                                image[index] = new Image();
                                image[index].src = value['src'];
                            });
                            $('.prlightbox').on('click', function (event) {
                                event.preventDefault();

                                var $index = $(".active-thumb").parent().attr('data-slick-index');
                                $index++;
                                $index = $index - 1;

                                var options = {
                                    index: $index,
                                    bgOpacity: 0.9,
                                    showHideOpacity: true
                                }
                                var lightBox = new PhotoSwipe($pswp, PhotoSwipeUI_Default, items, options);
                                lightBox.init();
                            });
                        });
                    </script>
                </div>

                <div class="pswp" tabindex="-1" role="dialog" aria-hidden="true">
                    <div class="pswp__bg"></div>
                    <div class="pswp__scroll-wrap">
                        <div class="pswp__container">
                            <div class="pswp__item">
                            </div>
                            <div class="pswp__item">
                            </div>
                            <div class="pswp__item">
                            </div>
                        </div>
                        <div class="pswp__ui pswp__ui--hidden">
                            <div class="pswp__top-bar">
                                <div class="pswp__counter">
                                </div>
                                <button class="pswp__button pswp__button--close" title="Close (Esc)"></button>
                                <button class="pswp__button pswp__button--share" title="Share"></button>
                                <button class="pswp__button pswp__button--fs" title="Toggle fullscreen"></button>
                                <button class="pswp__button pswp__button--zoom" title="Zoom in/out"></button>
                                <div class="pswp__preloader">
                                    <div class="pswp__preloader__icn">
                                        <div class="pswp__preloader__cut">
                                            <div class="pswp__preloader__donut"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="pswp__share-modal pswp__share-modal--hidden pswp__single-tap">
                                <div class="pswp__share-tooltip"></div>
                            </div>
                            <button class="pswp__button pswp__button--arrow--left"
                                    title="Previous (arrow left)"></button>
                            <button class="pswp__button pswp__button--arrow--right" title="Next (arrow right)"></button>
                            <div class="pswp__caption">
                                <div class="pswp__caption__center">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </body>

    <!-- belle/short-description.html   11 Nov 2019 12:43:10 GMT -->
    </html>
</section>

<!-- destination section starts  -->

<c:import url="/components/footer.jsp"/>
</body>
</html>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF"
        crossorigin="anonymous"></script>

