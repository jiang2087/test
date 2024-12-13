<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 27/11/2024
  Time: 10:56 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/template/admin/assets/css/mdb.min.css">
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
                    <div class="card-body">
                        <form action="" id="form-submit" method="get">
                            <div class="content-2-1 d-flex justify-content-between align-items-center mt-2">
                                <div class="title">
                                    Tên: Thông tin xe
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
                                    <th>Tên xe</th>
                                    <th>Giá</th>
                                    <th>Dung lượng pini</th>
                                    <th>Thời gian sạc</th>
                                    <th>Công suất tối đa</th>
                                    <th>Khuyến mãi</th>
                                    <th>Thiết lập</th>
                                </tr>
                                <tr>
                                    <td><input type="radio"></td>
                                    <td>
                                        <div class="image"><img src="" alt="anh"></div>
                                    </td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td>
                                        <ul class="action-list">
                                            <li>
                                                <button type="button" class="editBtn btn btn-primary" data-id="${item.carId}"><i
                                                        class="fa fa-pencil-alt"></i></button>
                                            </li>
                                            <li>
                                                <button type="button" class="deleteBtn btn btn-danger" data-id="${item.carId}"><i
                                                        class="fa fa-times"></i></button>
                                            </li>
                                        </ul>
                                    </td>
                                </tr>
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
                <div class="image-car">
                    <img src="${pageContext.request.contextPath}/template/uploads/car/vf3.jpg" alt="anh-xe">
                </div>
                <div class="col-md-4 mb-3">
                    <div data-mdb-input-init class="form-outline">
                        <input type="text" id="modelName" name="modelName"
                               class="form-control form-control-lg"/>
                        <label class="form-label" for="modelName">Tên xe</label>
                    </div>
                </div>
                <div class="col-md-4 mb-3">
                    <div data-mdb-input-init class="form-outline">
                        <input type="text" id="price" name="price"
                               class="form-control form-control-lg"/>
                        <label class="form-label" for="price">Giá xe</label>
                    </div>
                </div>
                <div class="col-md-4 mb-3">
                    <div data-mdb-input-init class="form-outline">
                        <input type="text" id="batteryCapacity" name="batteryCapacity"
                               class="form-control form-control-lg"/>
                        <label class="form-label" for="batteryCapacity">Dung luọng pin (kWh)</label>
                    </div>
                </div>
                <div class="col-md-4 mb-3">
                    <div data-mdb-input-init class="form-outline">
                        <input type="text" id="rangePerCharge" name="rangePerCharge"
                               class="form-control form-control-lg"/>
                        <label class="form-label" for="rangePerCharge">Quãng đường đi được sau mỗi lần sạc</label>
                    </div>
                </div>
                <div class="col-md-4 mb-3">
                    <div data-mdb-input-init class="form-outline">
                        <input type="text" id="chargingTime" name="chargingTime"
                               class="form-control form-control-lg"/>
                        <label class="form-label" for="chargingTime">Thời gian sạc</label>
                    </div>
                </div>
                <div class="col-md-4 mb-3">
                    <div data-mdb-input-init class="form-outline">
                        <input type="text" id="maxPower" name="maxPower"
                               class="form-control form-control-lg"/>
                        <label class="form-label" for="maxPower">Công suất tối đa (hp)</label>
                    </div>
                </div>
                <div class="col-md-4 mb-3">
                    <div data-mdb-input-init class="form-outline">
                        <input type="text" id="maxSpeed" name="maxSpeed"
                               class="form-control form-control-lg"/>
                        <label class="form-label" for="maxSpeed">Tốc độ tối đa</label>
                    </div>
                </div>
                <div class="col-md-4 mb-3">
                    <div data-mdb-input-init class="form-outline">
                        <input type="text" id="stock" name="stock"
                               class="form-control form-control-lg"/>
                        <label class="form-label" for="stock">Số lượng tồn kho</label>
                    </div>
                </div>
                <div class="col-md-4 mb-3">
                    <div data-mdb-input-init class="form-outline">
                        <input type="text" id="warrantyPeriod" name="warrantyPeriod"
                               class="form-control form-control-lg"/>
                        <label class="form-label" for="warrantyPeriod">Thời gian bảo hành (năm)</label>
                    </div>
                </div>
                <div class="col-md-4 mb-3">
                    <div data-mdb-input-init class="form-outline">
                        <input type="text" id="transmission" name="transmission"
                               class="form-control form-control-lg"/>
                        <label class="form-label" for="transmission">Loại hộp số</label>
                    </div>
                </div>
                <div class="col-md-4 mb-3">
                    <div data-mdb-input-init class="form-outline">
                        <input type="text" id="energyConsumption" name="energyConsumption"
                               class="form-control form-control-lg"/>
                        <label class="form-label" for="energyConsumption">Mức tiêu thụ năng lượng (kWh/100km)</label>
                    </div>
                </div>
                <div class="col-md-4 mb-3">
                    <div data-mdb-input-init class="form-outline">
                        <input type="text" id="dimensions" name="dimensions"
                               class="form-control form-control-lg"/>
                        <label class="form-label" for="dimensions">Kích thước xe (dài x rộng x cao)</label>
                    </div>
                </div>
                <div class="col-md-4 mb-3">
                    <div data-mdb-input-init class="form-outline">
                        <input type="text" id="wheelBase" name="wheelBase"
                               class="form-control form-control-lg"/>
                        <label class="form-label" for="wheelBase">Chiều dài cơ sở của xe (mm)</label>
                    </div>
                </div>
                <div class="col-md-4 mb-3">
                    <div data-mdb-input-init class="form-outline">
                        <input type="text" id="weight" name="weight"
                               class="form-control form-control-lg"/>
                        <label class="form-label" for="weight">Trọng lượng xe (kg)</label>
                    </div>
                </div>
                <div class="col-md-4 mb-3">
                    <div data-mdb-input-init class="form-outline">
                        <input type="text" id="torque" name="torque"
                               class="form-control form-control-lg"/>
                        <label class="form-label" for="torque"> Mô-men xoắn (Nm/rpm)</label>
                    </div>
                </div>
                <div class="col-md-6 mb-4">
                    <div data-mdb-input-init class="form-outline">
                        <input type="text" id="drivetrain" name="drivetrain"
                               class="form-control form-control-lg"/>
                        <label class="form-label" for="drivetrain">Hệ dẫn động</label>
                    </div>
                </div>
                <div class="col-md-6 mb-4">
                    <select id="brandSelect">
                        <option>1</option>
                        <option>2</option>
                        <option>3</option>
                        <option>4</option>
                    </select>
                </div>
                <div>
                    <div data-mdb-input-init class="form-outline">
                                <textarea id="description" class="form-control" rows="3"
                                          placeholder="Message sent to the employer"></textarea>
                        <label class="form-label" for="description">Mô tả</label>
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
<script src="${pageContext.request.contextPath}/template/admin/assets/js/manage-car.js"></script>


</body>
</html>
