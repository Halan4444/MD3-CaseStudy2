<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Customer Information</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
          integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
</head>
<body>
<c:import url="/components/header.jsp"/>
<c:import url="/components/navbar.jsp"/>
<div class="container-fluid row ">
<div class="col-2 mx-auto">
    <img class="img-thumbnail img-responsive rounded-circle border-light center mb-3" src="/view/user/image/user_${user.id}.jpg" width="200">
</div>
</div>
<div class="container-fluid row ">
    <div class="col-6 mx-auto">
        <h2 class="text-center py-1 text-light"> Customer Information </h2>
        <div class="px-5 container mx-auto shadow-lg p-3 mb-5 bg-white rounded-lg">
            <form action="/user?action=edit" method="post">
                <div class="form-group row">
                    <label for="password" class="col-sm-3 col-form-label">Password</label>
                    <div class="col-sm-9">
                        <input type="password" class="form-control" id="password" name="password" value="${user.password}">
                    </div>
                    <div class="col-sm-10">
                        <c:if test='${error != null}'>
                            <small class="text-danger">${error.get("firstname")}</small>
                        </c:if>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="firstname" class="col-sm-3 col-form-label">First Name</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" id="firstname" name="firstname" value="${user.firstname}">
                    </div>
                    <div class="col-sm-10">
                        <c:if test='${error != null}'>
                            <small class="text-danger">${error.get("firstname")}</small>
                        </c:if>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="lastname" class="col-sm-3 col-form-label">Last Name</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" id="lastname" name="lastname" value="${user.lastname}">
                    </div>
                    <div class="col-sm-10">
                        <c:if test='${error != null}'>
                            <small class="text-danger">${user.get("lastname")}</small>
                        </c:if>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="gender" class="col-sm-3 col-form-label">Gender:</label>
                    <div class="col-sm-9">
                        <select class="form-control" name="gender" id="gender">
                            <option value="${user.gender}" > Choose Gender</option>
                            <option value="female" ${user.gender eq Female ? 'selected' : ''}>Female</option>
                            <option value="male" ${user.gender eq Male ? 'selected' : ''}>Male</option>
                            <option value="Other" ${empty user.gender ? 'selected' : ''}>Other</option>
                        </select>
                    </div>
                    <div class="col-sm-10">
                        <c:if test='${error != null}'>
                            <small class="text-danger">${error.get("gender")}</small>
                        </c:if>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="birthday" class="col-sm-3 col-form-label">Birthday</label>
                    <div class="col-sm-9">
                        <input type="date" class="form-control" id="birthday" name="dateOfBirth"
                               value="${user.dateOfBirth}">
                    </div>
                    <div class="col-sm-10">
                        <c:if test='${error != null}'>
                            <small class="text-danger">${error.get("dateOfBirth")}</small>
                        </c:if>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="phone" class="col-sm-3 col-form-label">Phone</label>
                    <div class="col-sm-9">
                        <input type="number" class="form-control" id="phone" name="phone"
                               value="${user.phone}">
                    </div>
                    <div class="col-sm-10">
                        <c:if test='${error != null}'>
                            <small class="text-danger">${error.get("phone")}</small>
                        </c:if>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="email" class="col-sm-3 col-form-label">Email</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" id="email" name="email"
                               value="${user.email}">
                    </div>
                    <div class="col-sm-10">
                        <c:if test='${error != null}'>
                            <small class="text-danger">${error.get("email")}</small>
                        </c:if>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="address" class="col-sm-3 col-form-label">Address</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" id="address" name="address"
                               value="${user.address}">
                    </div>
                    <div class="col-sm-10">
                        <c:if test='${error != null}'>
                            <small class="text-danger">${error.get("address")}</small>
                        </c:if>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="social" class="col-sm-3 col-form-label">Social Network</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" id="social" name="socialNetworking"
                               value="${user.socialNetwork}">
                    </div>
                    <div class="col-sm-10">
                        <c:if test='${error != null}'>
                            <small class="text-danger">${error.get("socialNetwork")}</small>
                        </c:if>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="payments" class="col-sm-3 col-form-label">Payment Card</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" id="payments" name="payments"
                               value="${user.payments}">
                    </div>
                    <div class="col-sm-10">
                        <c:if test='${error != null}'>
                            <small class="text-danger">${error.get("payments")}</small>
                        </c:if>
                    </div>
                </div>
                <div class="form-group row">
                    <div class="col-sm-6 mx-auto">
                        <a class="btn btn-secondary btn-block" role="button" href="/common/index.jsp">
                            Back
                        </a>
                    </div>
                    <div class="col-sm-6 mx-auto">
                        <button type="submit" class="btn btn-primary btn-block">Save</button>
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