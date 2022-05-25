<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Confirm Booking</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
          integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
</head>
<body>
<c:import url="/components/header.jsp"/>
<c:import url="/components/navbar.jsp"/>
<div class="container-fluid row ">
    <div class="col-5 mx-auto">
        <h2 class="text-center py-1 text-white"> Confirm Booking </h2>
        <div class="container mx-auto shadow-lg p-3 mb-5 bg-white rounded-lg">
            <form method="post" action="">
                <div class="form-group row">
                    <label class="col-sm-3 col-form-label">Start Date</label>
                    <div class="col-sm-9">
                        <p>${booking.startTime}</p>
                    </div>
                    <div class="col-sm-10">
                        <c:if test='${error != null}'>
                            <small class="text-danger">${error.get("startDate")}</small>
                        </c:if>
                    </div>
                </div>

                <div class="form-group row">
                    <label class="col-sm-3 col-form-label">End Date</label>
                    <div class="col-sm-9">
                        <p>${booking.endTime}</p>
                    </div>
                    <div class="col-sm-10">
                        <c:if test='${error != null}'>
                            <small class="text-danger">${error.get("endDate")}</small>
                        </c:if>
                    </div>
                </div>

                <div class="form-group row">
                    <label class="col-sm-3 col-form-label">House Name</label>
                    <div class="col-sm-9">
                        <p>${house.name}</p>
                    </div>
                    <div class="col-sm-10">
                        <c:if test='${error != null}'>
                            <small class="text-danger">${error.get("houseName")}</small>
                        </c:if>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-3 col-form-label">House Price</label>
                    <div class="col-sm-9">
                        <p>${house.price}</p>
                    </div>
                    <div class="col-sm-10">
                        <c:if test='${error != null}'>
                            <small class="text-danger">${error.get("housePrice")}</small>
                        </c:if>
                    </div>
                </div>

                <div class="form-group row">
                    <label class="col-sm-3 col-form-label">Customer Name</label>
                    <div class="col-sm-9">
                        <p>${sessionScope.usernameSession}</p>
                    </div>
                    <div class="col-sm-10">
                        <c:if test='${error != null}'>
                            <small class="text-danger">${error.get("userId")}</small>
                        </c:if>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-3 col-form-label">Number Of Days</label>
                    <div class="col-sm-9">
                        <p>${noOfDay}</p>
                    </div>
                    <div class="col-sm-10">
                        <c:if test='${error != null}'>
                            <small class="text-danger">${error.get("customerId")}</small>
                        </c:if>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-3 col-form-label">Total Fee</label>
                    <div class="col-sm-9">
                        <p>${booking.totalFee}</p>
                    </div>
                    <div class="col-sm-10">
                        <c:if test='${error != null}'>
                            <small class="text-danger">${error.get("totalFee")}</small>
                        </c:if>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-3 col-form-label">Booking Status</label>
                    <div class="col-sm-9">
                        <p>${booking.status}</p>
                    </div>
                    <div class="col-sm-10">
                        <c:if test='${error != null}'>
                            <small class="text-danger">${error.get("status")}</small>
                        </c:if>
                    </div>
                </div>


                <div class="form-group row">
                    <div class="col-sm-6 mx-auto">
                        <a class="btn btn-secondary btn-block" role="button" href="/bookeds">
                            Back to Homepage
                        </a>
                    </div>
                    <%--                    <div class="col-sm-6 mx-auto">--%>
                    <%--                        <button type="submit" class="btn btn-primary btn-block">+ Book</button>--%>
                    <%--                    </div>--%>
                </div>
                <div class="form-group row">
                    <div class="mx-auto">
                        <c:if test='${message != null}'>
                            <span class="message text-success">${message}</span>
                        </c:if>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<c:import url="/components/footer.jsp"/>
</body>
</html>
