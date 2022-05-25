<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create Booking</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
          integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
</head>
<body>
<c:import url="/components/header.jsp"/>
<c:import url="/components/navbar.jsp"/>
<div class="container-fluid row ">
    <div class="col-5 mx-auto">
        <h2 class="text-center py-1 text-white"> Create new Booking</h2>
        <div class="container mx-auto shadow-lg p-3 mb-5 bg-white rounded-lg">
            <form method="post" action="/houses?action=book">
                <c:if test="${mess!=null}">
                    <p style="color: red; font-style: italic">${mess}</p>
                </c:if>
                <div class="form-group row">
                    <label for="startTime" class="col-sm-3 col-form-label">Start Date</label>
                    <div class="col-sm-9">
                        <input type="date" class="form-control" id="startTime" name="startTime" >
                    </div>
                    <div class="col-sm-10">
                        <c:if test='${error != null}'>
                            <small class="text-danger">${error.get("startTime")}</small>
                        </c:if>
                    </div>
                </div>

                <div class="form-group row">
                    <label for="endTime" class="col-sm-3 col-form-label">End Date</label>
                    <div class="col-sm-9">
                        <input type="date" class="form-control" id="endTime" name="endTime" >
                    </div>
                    <div class="col-sm-10">
                        <c:if test='${error != null}'>
                            <small class="text-danger">${error.get("endTime")}</small>
                        </c:if>
                    </div>
                </div>

                <div class="form-group row">
                    <label for="houseId" class="col-sm-3 col-form-label">House Name</label>
                    <div class="col-sm-9">
                        <select class="form-control" name="houseId" id="houseId">
                            <c:forEach var="i" begin="0" end="${houseList.size()-1}">
                                <option value="${houseList.get(i).id}">${houseList.get(i).name} - ${houseList.get(i).price}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="col-sm-10">
                        <c:if test='${error != null}'>
                            <small class="text-danger">${error.get("houseId")}</small>
                        </c:if>
                    </div>
                </div>

                <div class="form-group row">
                    <label for="userName" class="col-sm-3 col-form-label">Customer Name</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" id="userName" name="userName" value="${sessionScope.usernameSession}">
                    </div>
                    <div class="col-sm-10">
                        <c:if test='${error != null}'>
                            <small class="text-danger">${error.get("userId")}</small>
                        </c:if>
                    </div>
                </div>
                <div class="form-group row">
                    <div class="col-sm-6 mx-auto">
                        <a class="btn btn-secondary btn-block" role="button" href="/houses">
                            Back to Homepage
                        </a>
                    </div>
                    <div class="col-sm-6 mx-auto">
                        <button type="submit" class="btn btn-primary btn-block">+ Book</button>
                    </div>
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
