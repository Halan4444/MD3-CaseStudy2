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
    <script src="common/script.js" defer></script>
    <script src="js/script.js" defer></script>
    <script>
        AOS.init({
            duration: 800,
            offset:150,
        });
    </script>


</head>
<body>
<c:import url="/components/header.jsp"/>
<c:import url="/components/navbar.jsp"/>
<section class="home" id="home">
    <div class="content">
        <span data-aos="fade-up" data-aos-delay="150">Welcome Customer~</span>
        <h3 data-aos="fade-up" data-aos-delay="300">follow our Homestay</h3>
        <p data-aos="fade-up" data-aos-delay="450">Here, all the details of the Homestay you are looking for are displayed here</p>
        <a data-aos="fade-up" data-aos-delay="600" class="btn" href="/view/booking/list.jsp"> Book Now</a>
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
<section class="destination">
    <!DOCTYPE html>
    <html class="no-js" lang="en">

    <!-- belle/cart-variant2.html   11 Nov 2019 12:44:32 GMT -->
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Your cart &ndash; Belle Multipurpose Bootstrap 4 Template</title>
        <meta name="description" content="description">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Favicon -->
        <link rel="shortcut icon" href="/view/facility/assets/images/favicon.png" />
        <!-- Plugins CSS -->
        <link rel="stylesheet" href="/view/facility/assets/css/plugins.css">
        <!-- Bootstap CSS -->
        <link rel="stylesheet" href="/view/facility/assets/css/bootstrap.min.css">
        <!-- Main Style CSS -->
        <link rel="stylesheet" href="/view/facility/assets/css/style.css">
        <link rel="stylesheet" href="/view/facility/assets/css/responsive.css">
    </head>
    <body class="page-template belle">
    <div class="pageWrapper">
        <!--Top Header-->
        <!--End Top Header-->
        <!--Header-->
        <!--End Header-->
        <!--Mobile Menu-->
        <div class="mobile-nav-wrapper" role="navigation">
            <div class="closemobileMenu"><i class="icon anm anm-times-l pull-right"></i> Close Menu</div>
            <ul id="MobileNav" class="mobile-nav">
                <li class="lvl1 parent megamenu"><a href="index.html">Home <i class="anm anm-plus-l"></i></a>
                    <ul>
                        <li><a href="#" class="site-nav">Home Group 1<i class="anm anm-plus-l"></i></a>
                            <ul>
                                <li><a href="index.html" class="site-nav">Home 1 - Classic</a></li>
                                <li><a href="home2-default.html" class="site-nav">Home 2 - Default</a></li>
                                <li><a href="home15-funiture.html" class="site-nav">Home 15 - Furniture </a></li>
                                <li><a href="home3-boxed.html" class="site-nav">Home 3 - Boxed</a></li>
                                <li><a href="home4-fullwidth.html" class="site-nav">Home 4 - Fullwidth</a></li>
                                <li><a href="home5-cosmetic.html" class="site-nav">Home 5 - Cosmetic</a></li>
                                <li><a href="home6-modern.html" class="site-nav">Home 6 - Modern</a></li>
                                <li><a href="home7-shoes.html" class="site-nav last">Home 7 - Shoes</a></li>
                            </ul>
                        </li>
                        <li><a href="#" class="site-nav">Home Group 2<i class="anm anm-plus-l"></i></a>
                            <ul>
                                <li><a href="home8-jewellery.html" class="site-nav">Home 8 - Jewellery</a></li>
                                <li><a href="home9-parallax.html" class="site-nav">Home 9 - Parallax</a></li>
                                <li><a href="home10-minimal.html" class="site-nav">Home 10 - Minimal</a></li>
                                <li><a href="home11-grid.html" class="site-nav">Home 11 - Grid</a></li>
                                <li><a href="home12-category.html" class="site-nav">Home 12 - Category</a></li>
                                <li><a href="home13-auto-parts.html" class="site-nav">Home 13 - Auto Parts</a></li>
                                <li><a href="home14-bags.html" class="site-nav last">Home 14 - Bags</a></li>
                            </ul>
                        </li>
                        <li><a href="#" class="site-nav">New Sections<i class="anm anm-plus-l"></i></a>
                            <ul>
                                <li><a href="home11-grid.html" class="site-nav">Image Gallery</a></li>
                                <li><a href="home5-cosmetic.html" class="site-nav">Featured Product</a></li>
                                <li><a href="home7-shoes.html" class="site-nav">Columns with Items</a></li>
                                <li><a href="home6-modern.html" class="site-nav">Text columns with images</a></li>
                                <li><a href="home2-default.html" class="site-nav">Products Carousel</a></li>
                                <li><a href="home9-parallax.html" class="site-nav last">Parallax Banner</a></li>
                            </ul>
                        </li>
                        <li><a href="#" class="site-nav">New Features<i class="anm anm-plus-l"></i></a>
                            <ul>
                                <li><a href="home13-auto-parts.html" class="site-nav">Top Information Bar </a></li>
                                <li><a href="#" class="site-nav">Age Varification </a></li>
                                <li><a href="#" class="site-nav">Footer Blocks</a></li>
                                <li><a href="#" class="site-nav">2 New Megamenu style</a></li>
                                <li><a href="#" class="site-nav">Show Total Savings </a></li>
                                <li><a href="#" class="site-nav">New Custom Icons</a></li>
                                <li><a href="#" class="site-nav last">Auto Currency</a></li>
                            </ul>
                        </li>
                    </ul>
                </li>
                <li class="lvl1 parent megamenu"><a href="#">Shop <i class="anm anm-plus-l"></i></a>
                    <ul>
                        <li><a href="#" class="site-nav">Shop Pages<i class="anm anm-plus-l"></i></a>
                            <ul>
                                <li><a href="shop-left-sidebar.html" class="site-nav">Left Sidebar</a></li>
                                <li><a href="shop-right-sidebar.html" class="site-nav">Right Sidebar</a></li>
                                <li><a href="shop-fullwidth.html" class="site-nav">Fullwidth</a></li>
                                <li><a href="shop-grid-3.html" class="site-nav">3 items per row</a></li>
                                <li><a href="shop-grid-4.html" class="site-nav">4 items per row</a></li>
                                <li><a href="shop-grid-5.html" class="site-nav">5 items per row</a></li>
                                <li><a href="shop-grid-6.html" class="site-nav">6 items per row</a></li>
                                <li><a href="shop-grid-7.html" class="site-nav">7 items per row</a></li>
                                <li><a href="shop-listview.html" class="site-nav last">Product Listview</a></li>
                            </ul>
                        </li>
                        <li><a href="#" class="site-nav">Shop Features<i class="anm anm-plus-l"></i></a>
                            <ul>
                                <li><a href="shop-left-sidebar.html" class="site-nav">Product Countdown </a></li>
                                <li><a href="shop-right-sidebar.html" class="site-nav">Infinite Scrolling</a></li>

                                <li><a href="shop-grid-3.html" class="site-nav">Pagination - Classic</a></li>
                                <li><a href="shop-grid-6.html" class="site-nav">Pagination - Load More</a></li>
                                <li><a href="product-labels.html" class="site-nav">Dynamic Product Labels</a></li>
                                <li><a href="product-swatches-style.html" class="site-nav">Product Swatches </a></li>
                                <li><a href="product-hover-info.html" class="site-nav">Product Hover Info</a></li>
                                <li><a href="shop-grid-3.html" class="site-nav">Product Reviews</a></li>
                                <li><a href="shop-left-sidebar.html" class="site-nav last">Discount Label </a></li>
                            </ul>
                        </li>
                    </ul>
                </li>
                <li class="lvl1 parent megamenu"><a href="product-layout-1.html">Product <i class="anm anm-plus-l"></i></a>
                    <ul>
                        <li><a href="product-layout-1.html" class="site-nav">Product Page<i class="anm anm-plus-l"></i></a>
                            <ul>
                                <li><a href="product-layout-1.html" class="site-nav">Product Layout 1</a></li>
                                <li><a href="product-layout-2.html" class="site-nav">Product Layout 2</a></li>
                                <li><a href="product-layout-3.html" class="site-nav">Product Layout 3</a></li>
                                <li><a href="product-with-left-thumbs.html" class="site-nav">Product With Left Thumbs</a></li>
                                <li><a href="product-with-right-thumbs.html" class="site-nav">Product With Right Thumbs</a></li>
                                <li><a href="product-with-bottom-thumbs.html" class="site-nav last">Product With Bottom Thumbs</a></li>
                            </ul>
                        </li>
                        <li><a href="short-description.html" class="site-nav">Product Features<i class="anm anm-plus-l"></i></a>
                            <ul>
                                <li><a href="short-description.html" class="site-nav">Short Description</a></li>
                                <li><a href="product-countdown.html" class="site-nav">Product Countdown</a></li>
                                <li><a href="product-video.html" class="site-nav">Product Video</a></li>
                                <li><a href="product-quantity-message.html" class="site-nav">Product Quantity Message</a></li>
                                <li><a href="product-visitor-sold-count.html" class="site-nav">Product Visitor/Sold Count </a></li>
                                <li><a href="product-zoom-lightbox.html" class="site-nav last">Product Zoom/Lightbox </a></li>
                            </ul>
                        </li>
                        <li><a href="#" class="site-nav">Product Features<i class="anm anm-plus-l"></i></a>
                            <ul>
                                <li><a href="product-with-variant-image.html" class="site-nav">Product with Variant Image</a></li>
                                <li><a href="product-with-color-swatch.html" class="site-nav">Product with Color Swatch</a></li>
                                <li><a href="product-with-image-swatch.html" class="site-nav">Product with Image Swatch</a></li>
                                <li><a href="product-with-dropdown.html" class="site-nav">Product with Dropdown</a></li>
                                <li><a href="product-with-rounded-square.html" class="site-nav">Product with Rounded Square</a></li>
                                <li><a href="swatches-style.html" class="site-nav last">Product Swatches All Style</a></li>
                            </ul>
                        </li>
                        <li><a href="#" class="site-nav">Product Features<i class="anm anm-plus-l"></i></a>
                            <ul>
                                <li><a href="product-accordion.html" class="site-nav">Product Accordion</a></li>
                                <li><a href="product-pre-orders.html" class="site-nav">Product Pre-orders </a></li>
                                <li><a href="product-labels-detail.html" class="site-nav">Product Labels</a></li>
                                <li><a href="product-discount.html" class="site-nav">Product Discount In %</a></li>
                                <li><a href="product-shipping-message.html" class="site-nav">Product Shipping Message</a></li>
                                <li><a href="product-shipping-message.html" class="site-nav last">Size Guide </a></li>
                            </ul>
                        </li>
                    </ul>
                </li>
                <li class="lvl1 parent megamenu"><a href="about-us.html">Pages <i class="anm anm-plus-l"></i></a>
                    <ul>
                        <li><a href="cart-variant1.html" class="site-nav">Cart Page <i class="anm anm-plus-l"></i></a>
                            <ul class="dropdown">
                                <li><a href="cart-variant1.html" class="site-nav">Cart Variant1</a></li>
                                <li><a href="cart-variant2.html" class="site-nav">Cart Variant2</a></li>
                            </ul>
                        </li>
                        <li><a href="compare-variant1.html" class="site-nav">Compare Product <i class="anm anm-plus-l"></i></a>
                            <ul class="dropdown">
                                <li><a href="compare-variant1.html" class="site-nav">Compare Variant1</a></li>
                                <li><a href="compare-variant2.html" class="site-nav">Compare Variant2</a></li>
                            </ul>
                        </li>
                        <li><a href="checkout.html" class="site-nav">Checkout</a></li>
                        <li><a href="about-us.html" class="site-nav">About Us<span class="lbl nm_label1">New</span></a></li>
                        <li><a href="contact-us.html" class="site-nav">Contact Us</a></li>
                        <li><a href="faqs.html" class="site-nav">FAQs</a></li>
                        <li><a href="lookbook1.html" class="site-nav">Lookbook<i class="anm anm-plus-l"></i></a>
                            <ul>
                                <li><a href="lookbook1.html" class="site-nav">Style 1</a></li>
                                <li><a href="lookbook2.html" class="site-nav last">Style 2</a></li>
                            </ul>
                        </li>
                        <li><a href="404.html" class="site-nav">404</a></li>
                        <li><a href="coming-soon.html" class="site-nav">Coming soon<span class="lbl nm_label1">New</span></a></li>
                    </ul>
                </li>
                <li class="lvl1 parent megamenu"><a href="blog-left-sidebar.html">Blog <i class="anm anm-plus-l"></i></a>
                    <ul>
                        <li><a href="blog-left-sidebar.html" class="site-nav">Left Sidebar</a></li>
                        <li><a href="blog-right-sidebar.html" class="site-nav">Right Sidebar</a></li>
                        <li><a href="blog-fullwidth.html" class="site-nav">Fullwidth</a></li>
                        <li><a href="blog-grid-view.html" class="site-nav">Gridview</a></li>
                        <li><a href="blog-article.html" class="site-nav">Article</a></li>
                    </ul>
                </li>
                <li class="lvl1"><a href="#"><b>Buy Now!</b></a>
                </li>
            </ul>
        </div>
        <!--End Mobile Menu-->

        <!--Body Content-->
        <div id="page-content">
            <!--Page Title-->
            <div class="page section-header text-center">
                <div class="page-title">
                    <div class="wrapper"><h1 class="page-width">Your Booking</h1></div>
                </div>
            </div>
            <!--End Page Title-->

            <div class="container">
                <div class="row">
                    <div class="col-12 col-sm-12 col-md-8 col-lg-8 main-col">
                        <form action="#" method="post" class="cart style2">
                            <table>
                                <thead class="cart__row cart__header">
                                <tr>
                                    <th colspan="2" class="text-center">Homestay</th>
                                    <th class="text-center">Price</th>
                                    <th class="text-center">Quantity</th>
                                    <th class="text-right">Total</th>
                                    <th class="action">&nbsp;</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr class="cart__row border-bottom line1 cart-flex border-top">
                                    <td class="cart__image-wrapper cart-flex-item">
                                        <a href="#"><img class="cart__image" src="/view/facility/assets/images/product-images/product-image1.jpg" alt="Elastic Waist Dress - Navy / Small"></a>
                                    </td>
                                    <td class="cart__meta small--text-left cart-flex-item">
                                        <div class="list-view-item__title">
                                            <a href="#">Elastic Waist Dress </a>
                                        </div>

                                        <div class="cart__meta-text">
                                            Color: Navy<br>Size: Small<br>
                                        </div>
                                    </td>
                                    <td class="cart__price-wrapper cart-flex-item">
                                        <span class="money">$735.00</span>
                                    </td>
                                    <td class="cart__update-wrapper cart-flex-item text-right">
                                        <div class="cart__qty text-center">
                                            <div class="qtyField">
                                                <a class="qtyBtn minus" href="javascript:void(0);"><i class="icon icon-minus"></i></a>
                                                <input class="cart__qty-input qty" type="text" name="updates[]" id="qty" value="1" pattern="[0-9]*">
                                                <a class="qtyBtn plus" href="javascript:void(0);"><i class="icon icon-plus"></i></a>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="text-right small--hide cart-price">
                                        <div><span class="money">$735.00</span></div>
                                    </td>
                                    <td class="text-center small--hide"><a href="#" class="btn btn--secondary cart__remove" title="Remove tem"><i class="icon icon anm anm-times-l"></i></a></td>
                                </tr>
                                <tr class="cart__row border-bottom line1 cart-flex border-top">
                                    <td class="cart__image-wrapper cart-flex-item">
                                        <a href="#"><img class="cart__image" src="/view/facility/assets/images/product-images/product-image3.jpg" alt="3/4 Sleeve Kimono Dress"></a>
                                    </td>
                                    <td class="cart__meta small--text-left cart-flex-item">
                                        <div class="list-view-item__title">
                                            <a href="#">3/4 Sleeve Kimono Dress</a>
                                        </div>
                                    </td>
                                    <td class="cart__price-wrapper cart-flex-item">
                                        <span class="money">$735.00</span>
                                    </td>
                                    <td class="cart__update-wrapper cart-flex-item text-right">
                                        <div class="cart__qty text-center">
                                            <div class="qtyField">
                                                <a class="qtyBtn minus" href="javascript:void(0);"><i class="icon icon-minus"></i></a>
                                                <input class="cart__qty-input qty" type="text" name="updates[]" id="qty" value="1" pattern="[0-9]*">
                                                <a class="qtyBtn plus" href="javascript:void(0);"><i class="icon icon-plus"></i></a>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="text-right small--hide cart-price">
                                        <div><span class="money">$735.00</span></div>
                                    </td>
                                    <td class="text-center small--hide"><a href="#" class="btn btn--secondary cart__remove" title="Remove tem"><i class="icon icon anm anm-times-l"></i></a></td>
                                </tr>
                                <tr class="cart__row border-bottom line1 cart-flex border-top">
                                    <td class="cart__image-wrapper cart-flex-item">
                                        <a href="#"><img class="cart__image" src="/view/facility/assets/images/product-images/product-image6.jpg" alt="Minerva Dress black"></a>
                                    </td>
                                    <td class="cart__meta small--text-left cart-flex-item">
                                        <div class="list-view-item__title">
                                            <a href="#">Minerva Dress black</a>
                                        </div>
                                    </td>
                                    <td class="cart__price-wrapper cart-flex-item">
                                        <span class="money">$526.00</span>
                                    </td>
                                    <td class="cart__update-wrapper cart-flex-item text-right">
                                        <div class="cart__qty text-center">
                                            <div class="qtyField">
                                                <a class="qtyBtn minus" href="javascript:void(0);"><i class="icon icon-minus"></i></a>
                                                <input class="cart__qty-input qty" type="text" name="updates[]" id="qty" value="1" pattern="[0-9]*">
                                                <a class="qtyBtn plus" href="javascript:void(0);"><i class="icon icon-plus"></i></a>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="text-right small--hide cart-price">
                                        <div><span class="money">$735.00</span></div>
                                    </td>
                                    <td class="text-center small--hide"><a href="#" class="btn btn--secondary cart__remove" title="Remove tem"><i class="icon icon anm anm-times-l"></i></a></td>
                                </tr>
                                </tbody>
                                <tfoot>
                                <tr>
                                    <td colspan="3" class="text-left"><a href="http://annimexweb.com/" class="btn--link cart-continue"><i class="icon icon-arrow-circle-left"></i> Continue Renting</a></td>
                                    <td colspan="3" class="text-right"><button type="submit" name="update" class="btn--link cart-update"><i class="fa fa-refresh"></i> Update</button></td>
                                </tr>
                                </tfoot>
                            </table>

                            <div class="currencymsg">We processes all orders in USD. While the content of your cart is currently displayed in USD, the checkout will use USD at the most current exchange rate.</div>
                            <hr>
                            <div id="shipping-calculator" class="mb-4">
                                <h5 class="small--text-center">Check Your Information</h5>
                                <div class="row">
                                    <div class="col-12 col-sm-12 col-md-4">
                                        <div class="form-group">
                                            <label for="customer name">Customer Name</label>
                                            <input type="text" id="customer name" >
                                        </div>
                                    </div>
                                    <div class="col-12 col-sm-12 col-md-4">
                                        <div class="form-group">
                                            <label for="Phone">Phone Number</label>
                                            <input type="text" id="Phone" >
                                        </div>
                                    </div>
                                    <div class="col-12 col-sm-12 col-md-4">
                                        <div class="form-group">
                                            <label for="Email">Contact Email</label>
                                            <input type="text" id="Email" >
                                        </div>
                                    </div>
                                    <div class="col-12 col-sm-12 col-md-12 actionRow text-center">
                                        <div><input type="button" class="btn btn--secondary get-rates" value="Confirm Information"></div>
                                    </div>
                                </div>
                            </div>

                        </form>
                    </div>
                    <div class="col-12 col-sm-12 col-md-4 col-lg-4 cart__footer">
                        <div class="cart-note">
                            <div class="solid-border">
                                <h5><label for="CartSpecialInstructions" class="cart-note__label small--text-center">Add a note to your order</label></h5>
                                <textarea name="note" id="CartSpecialInstructions" class="cart-note__input"></textarea>
                            </div>
                        </div>
                        <div class="solid-border">
                            <div class="row">
                                <span class="col-12 col-sm-6 cart__subtotal-title"><strong>Subtotal</strong></span>
                                <span class="col-12 col-sm-6 cart__subtotal-title cart__subtotal text-right"><span class="money">$735.00</span></span>
                            </div>
                            <div class="cart__shipping">Confirm &amp; taxes calculated at checkout</div>
                            <p class="cart_tearm">
                                <label>
                                    <input type="checkbox" name="tearm" id="cartTearm" class="checkbox" value="tearm" required="">
                                    I agree with the terms and conditions</label>
                            </p>
                            <input type="submit" name="checkout" id="cartCheckout" class="btn btn--small-wide checkout" value="Book Now !" disabled="disabled">
                            <div class="paymnet-img"><img src="/view/facility/assets/images/payment-img.jpg" alt="Payment"></div>
                        </div>

                    </div>
                </div>
            </div>

        </div>
        <!--End Body Content-->

        <!--Footer-->
        <footer id="footer">
            <div class="newsletter-section">
                <div class="container">
                    <div class="row">
                        <div class="col-12 col-sm-12 col-md-12 col-lg-7 w-100 d-flex justify-content-start align-items-center">
                            <div class="display-table">
                                <div class="display-table-cell footer-newsletter">
                                    <div class="section-header text-center">
                                        <label class="h2"><span>Search for other </span>products</label>
                                    </div>
                                    <form action="#" method="post">
                                        <div class="input-group">
                                            <input type="email" class="input-group__field newsletter__input" name="EMAIL" value="" placeholder="Product Name" required="">
                                            <span class="input-group__btn bottom-5">
                                                <i class="px-3 fa-2x icon anm anm-search-l"></i>
                                            </span>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 col-sm-12 col-md-12 col-lg-5 d-flex justify-content-end align-items-center">
                            <div class="footer-social">
                                <ul class="list--inline site-footer__social-icons social-icons">
                                    <li><a class="social-icons__link" href="#" target="_blank" title="Belle Multipurpose Bootstrap 4 Template on Facebook"><i class="icon icon-facebook"></i></a></li>
                                    <li><a class="social-icons__link" href="#" target="_blank" title="Belle Multipurpose Bootstrap 4 Template on Twitter"><i class="icon icon-twitter"></i> <span class="icon__fallback-text">Twitter</span></a></li>
                                    <li><a class="social-icons__link" href="#" target="_blank" title="Belle Multipurpose Bootstrap 4 Template on Pinterest"><i class="icon icon-pinterest"></i> <span class="icon__fallback-text">Pinterest</span></a></li>
                                    <li><a class="social-icons__link" href="#" target="_blank" title="Belle Multipurpose Bootstrap 4 Template on Instagram"><i class="icon icon-instagram"></i> <span class="icon__fallback-text">Instagram</span></a></li>
                                    <li><a class="social-icons__link" href="#" target="_blank" title="Belle Multipurpose Bootstrap 4 Template on Tumblr"><i class="icon icon-tumblr-alt"></i> <span class="icon__fallback-text">Tumblr</span></a></li>
                                    <li><a class="social-icons__link" href="#" target="_blank" title="Belle Multipurpose Bootstrap 4 Template on YouTube"><i class="icon icon-youtube"></i> <span class="icon__fallback-text">YouTube</span></a></li>
                                    <li><a class="social-icons__link" href="#" target="_blank" title="Belle Multipurpose Bootstrap 4 Template on Vimeo"><i class="icon icon-vimeo-alt"></i> <span class="icon__fallback-text">Vimeo</span></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
        <!--End Footer-->
        <!--Scoll Top-->
        <span id="site-scroll"><i class="icon anm anm-angle-up-r"></i></span>
        <!--End Scoll Top-->

        <!-- Including Jquery -->
        <script src="assets/js/vendor/jquery-3.3.1.min.js"></script>
        <script src="assets/js/vendor/jquery.cookie.js"></script>
        <script src="assets/js/vendor/modernizr-3.6.0.min.js"></script>
        <script src="assets/js/vendor/wow.min.js"></script>
        <!-- Including Javascript -->
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/plugins.js"></script>
        <script src="assets/js/popper.min.js"></script>
        <script src="assets/js/lazysizes.js"></script>
        <script src="assets/js/main.js"></script>
    </div>
    </body>

    <!-- belle/cart-variant2.html   11 Nov 2019 12:44:32 GMT -->
    </html>

</section>

<!-- destination section starts  -->

<c:import url="/components/footer.jsp"/>
</body>
</html>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>

