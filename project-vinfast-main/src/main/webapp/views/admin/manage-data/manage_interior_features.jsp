<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 27/11/2024
  Time: 10:56 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.1/css/jquery.dataTables.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/template/admin/assets/css/mdb.min.css">
    <style>
        /* Tùy chỉnh ô tìm kiếm */
        .dataTables_filter {
          text-align: right;
          margin-bottom: 15px;
        }

        .dataTables_filter input {
          width: 250px; /* Độ rộng của ô tìm kiếm */
          padding: 15px; /* Khoảng cách bên trong */
          outline: none; /* Ẩn viền khi chọn */
          font-size: 14px;
          transition: all 0.3s ease; /* Hiệu ứng */
        }

        .dataTables_filter input:focus {
          box-shadow: 0 0 5px rgba(0, 123, 255, 0.5); /* Hiệu ứng đổ bóng */
        }

        /* Tùy chỉnh phân trang */
        .dataTables_paginate {
          margin-top: 15px; /* Khoảng cách trên */
          display: flex;
          justify-content: center; /* Căn giữa */
          gap: 5px; /* Khoảng cách giữa các nút */
        }
        .dataTables_paginate .paginate_button {
            height: 35px;  /* Chiều cao của nút phân trang */
            line-height: 35px;  /* Căn chỉnh nội dung giữa nút */
            padding: 0 15px;  /* Thêm khoảng cách bên trái và bên phải */
        }

        .dataTables_paginate .paginate_button {
            margin: 0 15px; /* Thêm khoảng cách bên trái và bên phải */
            padding: 10px 20px; /* Điều chỉnh padding để tăng kích thước của các nút */
            font-size: 14px; /* Thay đổi kích thước font chữ trong nút */
        }

        .dataTables_paginate {
            padding-top: 20px; /* Thêm khoảng cách phía trên */
            padding-bottom: 20px; /* Thêm khoảng cách phía dưới */
        }
        .dataTables_paginate .paginate_button {
          padding: 8px 12px;
          border: 1px solid #ddd; /* Viền */
          background-color: #f8f9fa; /* Màu nền */
          color: #007bff; /* Màu chữ */
          border-radius: 4px;
          font-size: 14px;
          cursor: pointer;
          transition: all 0.3s ease;
        }

        .dataTables_paginate .paginate_button:hover {
          background-color: #007bff; /* Màu nền khi hover */
          color: white; /* Màu chữ khi hover */
        }

        .dataTables_paginate .paginate_button.current {
          background-color: #007bff; /* Màu nền của trang hiện tại */
          color: white; /* Màu chữ của trang hiện tại */
          font-weight: bold;
        }
    </style>
</head>
<body>
<main id="main" class="main">
    <div class="pagetitle">
        <h1>Chỉnh sửa dữ liệu</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="">Trang chủ</a></li>
                <li class="breadcrumb-item">Dữ liệu</li>
                <li class="breadcrumb-item active">Dữ liệu về xe</li>
            </ol>
        </nav>
    </div><!-- End Page Title -->
    <section class="section">
        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="col-lg-12">
                        <div class="content-2-1 d-flex justify-content-between align-items-center mt-2">
                            <div class="title">
                                Tên: Thông tin về hỗ trợ lái xe
                            </div>
                            <div class="icon">
                                <button type="button" id="addBtn">Thêm bản ghi<i
                                        class="fa-solid fa-plus"></i></button>
                            </div>
                        </div>
                    </div>
                    <div class="card-body">
                        <form action="" id="form-submit" method="get">
                            <div class="desc">Giao diện hỗ trợ các tính năng như tìm kiếm, sắp xếp, phân trang, và các
                                nút hành động như Chỉnh sửa, Xoá. Người quản trị có thể nhanh chóng quản lý dữ liệu sản
                                phẩm với các thao tác trực quan, đồng thời lọc và xuất dữ liệu khi cần thiết.
                            </div>

                            <table id="group" class="table table-striped table-bordered w-100">
                                <thead class="text-center align-middle">
                                    <th>Số chỗ ngồi</th>
                                    <th>Độ lớn màn hình</th>
                                    <th>Màn hình HUD</th>
                                    <th>Ghế khách hàng</th>
                                    <th>Điều chỉnh vô lăng</th>
                                    <th>Loại vô năng</th>
                                    <th>Hệ thống điều hòa không khí</th>
                                    <th>Số cổng USB</th>
                                    <th>Kết nối bluetooth và wifi</th>
                                    <th>Hệ thống âm thanh</th>
                                    <th>Dịch vụ kết nối vinfast</th>
                                    <th> Thiết lập </th>
                                </thead>

                               <tbody>
                                <c:forEach var="item" items="${list}">
                                   <tr>
                                       <td>${item.touchscreenSize}</td>
                                       <td>${item.hudDisplay}</td>
                                       <td>${item.driverSeatConfig}</td>
                                       <td>${item.passengerSeatConfig}</td>
                                       <td>${item.steeringWheelAdjustment}</td>
                                       <td>${item.steeringWheelType}</td>
                                       <td>${item.airConditioningSystem}</td>
                                       <td>${item.usbPorts}</td>
                                       <td>${item.bluetoothWifiConnectivity}</td>
                                       <td>${item.soundSystem}</td>
                                       <td>${item.vinFastConnectService}</td>
                                       <td>
                                           <ul class="action-list">
                                               <li>
                                                   <button type="button" class="editBtn btn btn-primary" data-id="${item.id}"><i
                                                           class="fa fa-pencil-alt"></i></button>
                                               </li>
                                               <li>
                                                   <button type="button" class="deleteBtn btn btn-danger" data-id="${item.id}"><i
                                                           class="fa fa-times"></i></button>
                                               </li>
                                           </ul>
                                       </td>
                                   </tr>
                               </c:forEach>
                               </tbody>
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
            <h3>Nhập thông tin sản phẩm</h3>
            <button class="close-btn" id="closeFormBtn">X</button> <!-- Nút đóng -->
        </div>
        <form id="form-product">
            <input type="hidden" name="productId">
            <div class="row">
                 <div class="col-md-4 mb-3">
                    <div data-mdb-input-init class="form-outline">
                        <input type="text" id="seatCount" name="seatCount"
                               class="form-control form-control-lg"/>
                        <label class="form-label" for="seatCount">Số chỗ ngồi</label>
                    </div>
                </div>
                <div class="col-md-4 mb-3">
                    <div data-mdb-input-init class="form-outline">
                        <input type="text" id="touchscreenSize" name="touchscreenSize"
                               class="form-control form-control-lg"/>
                        <label class="form-label" for="touchscreenSize">Độ lớn màn hình</label>
                    </div>
                </div>
                <div class="col-md-4 mb-3">
                    <div data-mdb-input-init class="form-outline">
                        <input type="text" id="hudDisplay" name="hudDisplay"
                               class="form-control form-control-lg"/>
                        <label class="form-label" for="hudDisplay">Màn hình HUB</label>
                    </div>
                </div>
                <div class="col-md-4 mb-3">
                    <div data-mdb-input-init class="form-outline">
                        <input type="text" id="driverSeatConfig" name="driverSeatConfig"
                               class="form-control form-control-lg"/>
                        <label class="form-label" for="driverSeatConfig">Ghế khách hàng</label>
                    </div>
                </div>
                 <div class="col-md-4 mb-3">
                    <div data-mdb-input-init class="form-outline">
                        <input type="text" id="steeringWheelAdjustment" name="steeringWheelAdjustment"
                               class="form-control form-control-lg"/>
                        <label class="form-label" for="steeringWheelAdjustment">Điều chỉnh vô lăng</label>
                    </div>
                </div>
                <div class="col-md-4 mb-3">
                    <div data-mdb-input-init class="form-outline">
                        <input type="text" id=" steeringWheelType" name=" steeringWheelType"
                               class="form-control form-control-lg"/>
                        <label class="form-label" for=" steeringWheelType">Loại vô năng</label>
                    </div>
                </div>
                <div class="col-md-4 mb-3">
                    <div data-mdb-input-init class="form-outline">
                        <input type="text" id="airConditioningSystem" name="airConditioningSystem"
                               class="form-control form-control-lg"/>
                        <label class="form-label" for="airConditioningSystem">Hệ thống điều hòa không khí</label>
                    </div>
                </div>
                <div class="col-md-4 mb-3">
                    <div data-mdb-input-init class="form-outline">
                        <input type="text" id="usbPorts" name="usbPorts"
                               class="form-control form-control-lg"/>
                        <label class="form-label" for="usbPorts">Số cổng USB</label>
                    </div>
                </div>
                 <div class="col-md-4 mb-3">
                    <div data-mdb-input-init class="form-outline">
                        <input type="text" id="bluetoothWifiConnectivity" name="bluetoothWifiConnectivity"
                               class="form-control form-control-lg"/>
                        <label class="form-label" for="bluetoothWifiConnectivity">Kết nối bluetool và wifi</label>
                    </div>
                </div>
                <div class="col-md-4 mb-3">
                    <div data-mdb-input-init class="form-outline">
                        <input type="text" id="soundSystem" name="soundSystem"
                               class="form-control form-control-lg"/>
                        <label class="form-label" for="soundSystem">Hệ thống âm thanh</label>
                    </div>
                </div>
                <div class="col-md-4 mb-3">
                    <div data-mdb-input-init class="form-outline">
                        <input type="text" id="vinFastConnectService" name="vinFastConnectService"
                               class="form-control form-control-lg"/>
                        <label class="form-label" for="vinFastConnectService">Dịch vụ kết nối vinfast</label>
                    </div>
                </div>
                <div>
                    <div data-mdb-input-init class="form-outline">
                                <textarea id="description" class="form-control" rows="3"
                                          placeholder="Mô tả    "></textarea>
                        <label class="form-label fw-bold" for="description">Mô tả</label>
                    </div>
                </div>
                <div class="btn-form">
                    <button type="button" id="confirmBtn">Xác nhận</button>
                    <button type="button" id="cancelBtn">Hủy bỏ</button>
                </div>
            </div>
        </form>
    </div>
</main>

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert2/11.14.5/sweetalert2.min.js"
        integrity="sha512-JCDnPKShC1tVU4pNu5mhCEt6KWmHf0XPojB0OILRMkr89Eq9BHeBP+54oUlsmj8R5oWqmJstG1QoY6HkkKeUAg=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="${pageContext.request.contextPath}/template/admin/assets/js/manage-interior-features.js"></script>
<script src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.min.js"></script>

</body>
</html>

