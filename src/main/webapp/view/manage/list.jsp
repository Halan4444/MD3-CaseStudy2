<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Service List</title>
<%--    online--%>
<%--    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"--%>
<%--          integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">--%>
<%--    <link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/dataTables.bootstrap4.min.css">--%>

<%--    offline--%>
    <link rel="stylesheet" href="/components/bootstrap-4.6.1-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="/components/DataTables/DataTables-1.11.5/css/dataTables.bootstrap4.min.css">

</head>
<body>
<c:import url="/components/header.jsp"/>
<c:import url="/components/navbar.jsp"/>
<div class="container-fluid mx-auto">
    <div class="row justify-content-between py-1">
        <div class="col-4">
            <a class="btn btn-primary" href="/manages?action=create" role="button"> + Add new House</a>
        </div>
        <div class="col-2">
            <button type="button" class="btn btn-primary btn-block " data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">
                Search House
            </button>
        </div>
    </div>
    <table id="myTable2" class="table table-striped table-bordered table-dark table-hover" style="width: 100%">
        <thead class="thead-dark">
        <tr>
            <th scope="col">#</th>
            <th scope="col">Name</th>
            <th scope="col">House type</th>
            <th scope="col">Address</th>
            <th scope="col">Maximum people</th>
            <th scope="col">House standard</th>
            <th scope="col">Status</th>
            <th scope="col">Price</th>
            <th scope="col">Edit</th>
            <th scope="col">Delete</th>
        </tr>
        </thead>
        <tbody>
        <c:if test="${houseList.size()>0}">
        <c:forEach var="i" begin="0" end="${houseList.size()-1}">
            <tr>
                <td>${(i+1)}</td>
                <td>
                    <a href="/houses?action=detail&id=${houseList.get(i).id}">
                            ${houseList.get(i).name}
                    </a>
                </td>
                <td> ${typeList.get(i).type} </td>
                <td> ${houseList.get(i).address} </td>
                <td> ${houseList.get(i).maxPeople} </td>
                <td> ${standardList.get(i).standard} </td>
                <td> ${houseList.get(i).status} </td>
                <td>
                    <fmt:setLocale value="vi_VN"/>
                    <fmt:formatNumber value="${houseList.get(i).price}" type="currency"/>
                </td>
                <td>
                    <a class="btn btn-warning" role="button" href="/manages?action=edit&id=${houseList.get(i).id}">
                        edit
                    </a>
                </td>
                          <td>
                    <!-- Button trigger modal -->
                    <button type="button" class="btn btn-danger"
                            data-toggle="modal"
                            data-target="#deleteModal"
                            onclick="deleteProduct
                                    (
                                <c:out value="${houseList.get(i).id}}"/>,
                                <c:out value="\'${houseList.get(i).name}}\'"/>
                                    )"
                    >
                        <a href="/manages?action=delete&id=${houseList.get(i).id}">delete</a>
                    </button>
                </td>
            </tr>
        </c:forEach>
        </c:if>
        </tbody>
    </table>
    <c:if test='${message != null}'>
        <small class="text-danger">${message}</small>
    </c:if>
</div>
<c:import url="/components/footer.jsp"/>
<!-- Modal -->
<div class="modal fade" id="deleteModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Delete house</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p>Do you really want to delete house
                    <span class="text-danger font-weight-bold" id="nameDelete"></span>
                </p>
            </div>
            <div class="modal-footer">
                <div class="mx-auto row">
                    <form action="/manages" method="post">
                        <input type="hidden" name="action" value="delete">
                        <input type="hidden" name="id" id="idDelete">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                        <button type="submit" class="btn btn-danger">Delete</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<%--Search--%>
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Search house</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="/houses?action=searchModal" method="get">
                <div class="modal-body">
                    <div class="form-group row">
                        <div class="input-group col-5">
                            <select class="form-control" id="fieldSearch1" name="fieldSearch1">
                                <option value="name">Name</option>
                                <option value="typeId">HouseType</option>
                                <option value="address">Address</option>
                                <option value="birthday">Maximum People</option>
                                <option value="standardId">House Standard</option>
                                <option value="status">Status</option>
                                <option value="price">Price</option>
                            </select>
                        </div>
                        <input type="text" class="form-control col-6" placeholder="Key word 1" aria-label="search" name="searchKey1">
                    </div>
                    <div class="form-group row">
                        <div class="input-group col-5">
                            <select class="form-control" id="fieldSearch2" name="fieldSearch2">
                                <option value="name">Name</option>
                                <option value="typeId">House Type</option>
                                <option value="address">Address</option>
                                <option value="birthday">Maximum People</option>
                                <option value="standardId">House Standard</option>
                                <option value="status">Status</option>
                                <option value="price">Price</option>
                            </select>
                        </div>
                        <input type="text" class="form-control col-6" placeholder="Key word 2" aria-label="search" name="searchKey2">
                    </div>
                    <div class="form-group row">
                        <div class="input-group col-5">
                            <select class="form-control" id="fieldSearch3" name="fieldSearch3">
                                <option value="name">Name</option>
                                <option value="typeId">House Type</option>
                                <option value="address">Address</option>
                                <option value="birthday">Maximum People</option>
                                <option value="standardId">House Standard</option>
                                <option value="status">Status</option>
                                <option value="price">Price</option>
                            </select>
                        </div>
                        <input type="text" class="form-control col-6" placeholder="Key word 3" aria-label="search" name="searchKey3">
                    </div>
                </div>
                <div class="modal-footer">
                    <input type="hidden" name="action" value="searchModal">
                    <button class="btn btn-outline-primary" type="submit" id="button-addon2">Search</button>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>
<%--offline--%>
<script src="/components/jquery/jquery-3.5.1.slim.min.js"></script>
<script src="/components/bootstrap-4.6.1-dist/js/bootstrap.bundle.min.js"></script>
<script src="/components/DataTables/DataTables-1.11.5/js/jquery.dataTables.min.js"></script>
<script src="/components/DataTables/DataTables-1.11.5/js/dataTables.bootstrap4.min.js"></script>

<script>
    function deleteProduct(id, name) {
        document.getElementById("idDelete").value = id;
        document.getElementById("nameDelete").innerText = " " + name + "?";
    }
</script>
<script>
    $(document).ready(function () {
        $('#myTable2').DataTable({
            "bFilter": false,
            dom: 'frtlip',
            aLengthMenu: [
                [5, 7, 9, 10, 25, 50, -1],
                [5, 7, 9, 10, 25, 50, "All"]
            ],
            iDisplayLength: 5
        });
    });
</script>
