<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>login</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
          integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<%--    <link href="../css/Styles.css">--%>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.js"></script>
</head>
<body>
<c:import url="/components/header.jsp"/>
<c:import url="/components/navbar.jsp"/>
<div class="container-fluid row">
    <div class="col-4 mx-auto" style="padding: 5px">
        <br>
        <br>
        <br>
        <div class="container mx-auto shadow-lg p-3 mb-5 bg-white" style="border-radius: 10px;" >
            <h2 class="text-center py-1"> Sign Up</h2>
            <form action="/signup" method="post">
    <div class="form-group row">
        <div class="col-sm-1"></div>
        <label for="username" class="col-sm-2 col-form-label">Username</label>
        <div class="col-sm-8">
            <input type="text" class="form-control" id="username" name="username" placeholder="Username">
        </div>
    </div>
                <div class="form-group row">
                    <div class="col-sm-1"></div>
                    <label for="username" class="col-sm-2 col-form-label">First Name</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" id="First Name" name="First Name" placeholder="First Name">
                    </div>
                </div>
                <div class="form-group row">
                    <div class="col-sm-1"></div>
                    <label for="username" class="col-sm-2 col-form-label">Last Name</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" id="Last Name" name="Last Name" placeholder="Last Name">
                    </div>
                </div>
    <div class="form-group row">
        <div class="col-sm-1"></div>
        <label for="password" class="col-sm-2 col-form-label">Password</label>
        <div class="col-sm-8">
            <input type="password" class="form-control" id="password" name="password" placeholder="Password">
        </div>
    </div>
                <div class="form-group row">
                    <div class="col-sm-1"></div>
                    <label for="password" class="col-sm-2 col-form-label">Confirm Password</label>
                    <div class="col-sm-8">
                        <input type="password" class="form-control" id="Confirm Password" name="Confirm Password" placeholder="Confirm Password">
                    </div>
                </div>
                <div class="form-group row">
                    <div class="col-sm-1"></div>
                    <label for="password" class="col-sm-2 col-form-label">Email</label>
                    <div class="col-sm-8">
                        <input type="password" class="form-control" id="Email" name="email" placeholder="Email">
                    </div>
                </div>
                <div class="form-group row">
                    <div class="col-sm-1"></div>
                    <label for="password" class="col-sm-2 col-form-label">Phone Number</label>
                    <div class="col-sm-8">
                        <input type="password" class="form-control" id="Phone" name="email" placeholder="Phone Number">
                    </div>
                </div>
    <div class="form-group row">
        <div class="col-sm-8 mx-auto">
            <button type="submit" class="btn btn-primary btn-block">Create Account</button>
        </div>
    </div>
    <div class="form-group row">
        <div class="mx-auto">
            <c:if test='${message != null}'>
                <span class="message text-danger">${message}</span>
            </c:if>
        </div>
    </div>
            </form>
        </div>
        <br>
    </div>
</div>
<%--<c:import url="/components/footer.jsp"/>--%>
</body>
</html>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>

