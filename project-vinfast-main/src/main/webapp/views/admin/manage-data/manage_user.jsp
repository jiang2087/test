<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 05/10/2024
  Time: 12:47 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:url var="link" value="/api-admin-newUser"/>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/template/admin/assets/css/mdb.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/template/admin/assets/css/table.css">
</head>
<body>
<main id="main" class="main">
    <div class="pagetitle">
        <h1>Chỉnh sửa dữ liệu</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="">Trang chủ</a></li>
                <li class="breadcrumb-item">Dữ liệu</li>
                <li class="breadcrumb-item active">Dữ liệu sản phẩm</li>
            </ol>
        </nav>
    </div><!-- End Page Title -->
    <section class="section">
        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-body">
                        <form action="" id="form-submit" method="get">
                            <div class="content-2-1 d-flex justify-content-between align-items-center mt-2">
                                <div class="title">
                                    Tên: Danh sách người dùng
                                </div>
                                <div class="icon">
                                    <button type="button" id="addBtn">Thêm bản ghi<i
                                            class="fa-solid fa-plus"></i></button>
                                </div>
                            </div>
                            <hr>
                            <div class="desc">Giao diện hỗ trợ các tính năng như tìm kiếm, sắp xếp, phân trang, và các
                                nút hành động như Chỉnh sửa, Xoá. Người quản trị có thể nhanh chóng quản lý dữ liệu sản
                                phẩm với các thao tác trực quan, đồng thời lọc và xuất dữ liệu khi cần thiết.
                            </div>
                            <div class="content-2-2 d-flex justify-content-between">
                                <div class="show d-flex align-items-center">
                                    Show
                                    <select name="limit" id="selectOp">
                                        <option value="5">5</option>
                                        <option value="10">10</option>
                                        <option value="15">15</option>
                                        <option value="20">20</option>
                                    </select>
                                    entries
                                </div>
                                <div class="search-child">
                                    Search:
                                    <input type="search" name="keyword" id="search">
                                </div>
                            </div>
                            <table>
                                <tr>
                                    <th></th>
                                    <th>Ảnh</th>
                                    <th>Họ và tên</th>
                                    <th>Email</th>
                                    <th>Số điện thoại</th>
                                    <th>Địa chỉ</th>
                                    <th>Vai trò</th>
                                    <th>Trạng thái</th>
                                    <th>Gới tính</th>
                                    <th>Ngày sinh</th>
                                    <th></th>
                                </tr>
                                <c:forEach var="item" items="${users}">
                                    <tr>
                                        <td><input type="radio"></td>
                                        <td>
                                            <div class="image-user"><img
                                                    src="${pageContext.request.contextPath}/template/uploads/${item.avatar}"
                                                    alt="anh"></div>
                                        </td>
                                        <td>${item.fullName}</td>
                                        <td>${item.email}</td>
                                        <td>${item.phoneNumber}</td>
                                        <td>${item.address}</td>
                                        <td>${item.role}</td>
                                        <td>${item.status}</td>
                                        <td>${item.gender}</td>
                                        <td>${item.dob}</td>
                                        <td>
                                            <ul class="action-list">
                                                <li>
                                                    <button type="button" class="editBtn btn btn-primary" data-id="${item.userId}"><i
                                                            class="fa fa-pencil-alt"></i></button>
                                                </li>
                                                <li>
                                                    <button type="button" class="deleteBtn btn btn-danger" data-id="${item.userId}"><i
                                                            class="fa fa-times"></i></button>
                                                </li>
                                            </ul>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </table>
                        </form>
                        <div class="paging">
                            <ul id="pagination-demo" class="pagination-sm"></ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <div id="overlay"></div> <!-- Lớp nền tối -->

    <div id="myForm">
        <div class="title">
            <h3>Nhập thông tin người dùng</h3>
            <button class="close-btn" id="closeFormBtn">X</button> <!-- Nút đóng -->
        </div>

        <form id="form-product">
            <input type="hidden" name="productId">
            <div class="row">
                <div class="col-xl-8">
                    <div class="row">
                        <div class="col-md-6 mb-4">
                            <div data-mdb-input-init class="form-outline">
                                <input type="text" id="fullName" name="fullName"
                                       class="form-control form-control-lg"/>
                                <label class="form-label" for="fullName">Họ và tên</label>
                            </div>
                        </div>
                        <div class="col-md-6 mb-4">
                            <div data-mdb-input-init class="form-outline">
                                <input type="text" id="email" name="email" class="form-control form-control-lg"/>
                                <label class="form-label" for="email">Email</label>
                            </div>
                        </div>
                        <div class="col-md-6 mb-4">
                            <div data-mdb-input-init class="form-outline">
                                <input type="text" id="phoneNumber" name="phoneNumber"
                                       class="form-control form-control-lg"/>
                                <label class="form-label" for="phoneNumber">Số điện thoại</label>
                            </div>
                        </div>
                        <div class="col-md-6 mb-4">
                            <div data-mdb-input-init class="form-outline">
                                <input type="text" id="address" name="address" class="form-control form-control-lg"/>
                                <label class="form-label" for="address">Địa chỉ</label>
                            </div>
                        </div>
                        <div class="col-md-6 mb-4">
                            <div data-mdb-input-init class="form-outline">
                                <input type="text" id="role" name="role"
                                       class="form-control form-control-lg"/>
                                <label class="form-label" for="role">Vai trò</label>
                            </div>
                        </div>
                        <div class="col-md-6 mb-4">
                            <div data-mdb-input-init class="form-outline">
                                <input type="text" id="gender" name="gender" class="form-control form-control-lg"/>
                                <label class="form-label" for="gender">Giới tính</label>
                            </div>
                        </div>
                        <div class="col-md-6 mb-4">
                            <select id="categorySelect">
                                <option>Trạng thái</option>
                            </select>
                        </div>
                        <div class="col-md-6 mb-4">
                            <select id="brandSelect">
                                <option>Loại tài khoản</option>
                            </select>
                        </div>
                        <div>
                            <div data-mdb-input-init class="form-outline">
                                <input id="dob" class="form-control" rows="3" type="date"
                                          placeholder="Message sent to the employer"></input>
                                <label class="form-label" for="dob">Ngày sinh</label>
                            </div>
                        </div>
                        <div class="btn-form">
                            <button type="button" id="confirmBtn">Xác nhận</button>
                            <button type="button" id="uploadBtn">Đẩy ảnh</button>
                            <button type="button" id="cancelBtn">Hủy bỏ</button>
                        </div>
                    </div>
                </div>
                <div class="col-xl-4">
                    <div class="image-upload">
                        <img src="" alt="">
                    </div>
                </div>
            </div>
        </form>
    </div>
</main>
<script src="${pageContext.request.contextPath}/template/admin/assets/js/mdb.umd.min.js"></script>
<script src="${pageContext.request.contextPath}/template/admin/assets/js/manage-user.js"></script>
<script>
    var totalP = ${books.totalPage};
    var currentP = ${books.page};
    var visibleP = ${books.limit};
    $(function () {
        window.pagObj = $('#pagination-demo').twbsPagination({
            totalPages: totalP,
            visiblePages: visibleP,
            startPage: currentP,

            onPageClick: function (event, page) {
                $('#page-content').text('Page ' + page);
                $('#page').val(page);
                if (page != currentP) {
                    $('#form-submit').submit();
                }
            }
        });
        $('#search').keypress(function (event) {
            if (event.which == 13) {
                $('#form-submit').submit();
            }
        })
    });
</script>
</body>
</html>


