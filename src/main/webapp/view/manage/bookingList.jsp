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
      <%--      <a class="btn btn-primary" href="/manages?action=create" role="button"> + Add new House</a>--%>
    </div>
  </div>
  <table id="myTable2" class="table table-striped table-bordered table-dark table-hover" style="width: 100%">
    <thead class="thead-dark">
    <tr>
      <th scope="col">#</th>
      <th scope="col">House Name</th>
      <th scope="col">User Name</th>
      <th scope="col">StartTime</th>
      <th scope="col">EndTime</th>
      <th scope="col">Status</th>
      <th scope="col">Total Fee</th>
    </tr>
    </thead>
    <tbody>
    <c:if test="${bookingList.size()>0}">
      <c:forEach var="i" begin="0" end="${bookingList.size()-1}">
        <tr>
          <td>${(i+1)}</td>
          <td>
            <a href="/houses?action=detail&id=${houseList.get(i).id}">
                ${houseList.get(i).name}
            </a>
          </td>
          <td> ${accountList.get(i).lastname} </td>
          <td> ${bookingList.get(i).startTime} </td>
          <td> ${bookingList.get(i).endTime} </td>
          <td> ${bookingList.get(i).status} </td>
          <td>
            <fmt:setLocale value="vi_VN"/>
            <fmt:formatNumber value="${bookingList.get(i).totalFee}" type="currency"/>
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

<%--Search--%>

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
