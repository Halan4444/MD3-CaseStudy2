<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit House</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
          integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
</head>
<body>
<c:import url="/components/header.jsp"/>
<c:import url="/components/navbar.jsp"/>
<div class="container-fluid row ">
    <div class="col-6 mx-auto">
        <h2 class="text-center py-1 text-white"> Edit House Information </h2>
        <div class="container mx-auto shadow-lg p-3 mb-5 bg-white rounded-lg">
            <form method="post">
                <div class="form-group row">
                    <div class="mx-auto">
                        <c:if test='${message != null}'>
                            <span class="message text-success">${message}</span>
                        </c:if>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="name" class="col-sm-4 col-form-label">Name</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" id="name" name="name" value="${house.name}">
                    </div>
                    <div class="col-sm-10">
                        <c:if test='${error != null}'>
                            <small class="text-danger">${error.get("name")}</small>
                        </c:if>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="address" class="col-sm-4 col-form-label">Address</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" id="address" name="address" value="${house.address}">
                    </div>
                    <div class="col-sm-10">
                        <c:if test='${error != null}'>
                            <small class="text-danger">${error.get("address")}</small>
                        </c:if>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="maxPeople" class="col-sm-4 col-form-label">Maximum people</label>
                    <div class="col-sm-8">
                        <input type="number" step="any" class="form-control" id="maxPeople" name="maxPeople"
                               value="${house.maxPeople}">
                    </div>
                    <div class="col-sm-10">
                        <c:if test='${error != null}'>
                            <small class="text-danger">${error.get("maxPeople")}</small>
                        </c:if>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="typeId" class="col-sm-4 col-form-label">House type</label>
                    <div class="col-sm-8">
                        <select class="form-control" name="typeId" id="typeId">
                            <c:forEach var="i" begin="0" end="${typeList.size()-1}">
                                <option value="${typeList.get(i).id}" >${typeList.get(i).type}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="col-sm-10">
                        <c:if test='${error != null}'>
                            <small class="text-danger">${error.get("houseType")}</small>
                        </c:if>
                    </div>
                </div>


                <div class="form-group row">
                    <label for="standardId" class="col-sm-4 col-form-label">Standard</label>
                    <div class="col-sm-8">
                        <select class="form-control" name="standardId" id="standardId">
                            <c:forEach var="i" begin="0" end="${standardList.size()-1}">
                                <option value="${standardList.get(i).id}">${standardList.get(i).standard}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="col-sm-10">
                        <c:if test='${error != null}'>
                            <small class="text-danger">${error.get("standardId")}</small>
                        </c:if>
                    </div>
                </div>


                <div class="form-group row">
                    <label for="image" class="col-sm-4 col-form-label">Image</label>
                    <div class="col-sm-8">
                        <input type="text" step="any" class="form-control" id="image" name="image"
                               value="${house.image}">
                    </div>
                    <div class="col-sm-10">
                        <c:if test='${error != null}'>
                            <small class="text-danger">${error.get("image")}</small>
                        </c:if>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="price" class="col-sm-4 col-form-label">Price</label>
                    <div class="col-sm-8">
                        <input type="number" step="any" class="form-control" id="price" name="price"
                               value="${house.price}">
                    </div>
                    <div class="col-sm-10">
                        <c:if test='${error != null}'>
                            <small class="text-danger">${error.get("price")}</small>
                        </c:if>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="description" class="col-sm-4 col-form-label">Description</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" id="description" name="description"
                               value="${house.description}">
                    </div>
                    <div class="col-sm-10">
                        <c:if test='${error != null}'>
                            <small class="text-danger">${error.get("description")}</small>
                        </c:if>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="status" class="col-sm-4 col-form-label">Status</label>
                    <div class="col-sm-8">
                        <select class="form-control" name="status" id="status">
                                <option value="available">available</option>
                                <option value="not available">not available</option>
                                <option value="repairing">repairing</option>
                        </select>
                    </div>
                    <div class="col-sm-10">
                        <c:if test='${error != null}'>
                            <small class="text-danger">${error.get("status")}</small>
                        </c:if>
                    </div>
                </div>

                <div class="form-group row">
                    <div class="col-sm-6 mx-auto">
                        <a class="btn btn-secondary btn-block" role="button" href="/manages">
                            Back to Service
                        </a>
                    </div>
                    <div class="col-sm-6 mx-auto">
                        <button type="submit" class="btn btn-primary btn-block">Update</button>
                    </div>
                </div>


            </form>
        </div>
    </div>
</div>
<c:import url="/components/footer.jsp"/>
</body>
</html>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>

<%--<script>--%>

<%--function showFacilityType(selectObject) {--%>
<%--    let selected = selectObject.value;--%>
<%--    if (selected ==3){--%>
<%--        document.getElementById("villaAndHouseOnly").hidden = true;--%>
<%--        document.getElementById("villaOnly").hidden = true;--%>
<%--        $('#villaAndHouseOnly').find("input").each(function () {--%>
<%--            $(this).val('');--%>
<%--        });--%>
<%--        $('#villaOnly').find("input").each(function () {--%>
<%--            $(this).val('');--%>
<%--        });--%>
<%--    }else if(selected ==2){--%>
<%--        document.getElementById("villaAndHouseOnly").hidden = false;--%>
<%--        document.getElementById("villaOnly").hidden = true;--%>
<%--        $('#villaOnly').find("input").each(function () {--%>
<%--            $(this).val('');--%>
<%--        });--%>
<%--    }else {--%>
<%--        document.getElementById("villaAndHouseOnly").hidden = false;--%>
<%--        document.getElementById("villaOnly").hidden = false;--%>
<%--    }--%>
<%--}--%>
<%--$(function() {--%>
<%--    let selected =document.getElementById("facilityTypeId").value;--%>
<%--    if (selected ==3){--%>
<%--        document.getElementById("villaAndHouseOnly").hidden = true;--%>
<%--        document.getElementById("villaOnly").hidden = true;--%>
<%--        $('#villaAndHouseOnly').find("input").each(function () {--%>
<%--            $(this).val('');--%>
<%--        });--%>
<%--        $('#villaOnly').find("input").each(function () {--%>
<%--            $(this).val('');--%>
<%--        });--%>
<%--    }else if(selected ==2){--%>
<%--        document.getElementById("villaAndHouseOnly").hidden = false;--%>
<%--        document.getElementById("villaOnly").hidden = true;--%>
<%--        $('#villaOnly').find("input").each(function () {--%>
<%--            $(this).val('');--%>
<%--        });--%>
<%--    }else {--%>
<%--        document.getElementById("villaAndHouseOnly").hidden = false;--%>
<%--        document.getElementById("villaOnly").hidden = false;--%>
<%--    }--%>
<%--});--%>
<%--</script>--%>
