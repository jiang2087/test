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
                                    Tên: Thông tin về hỗ trợ lái xe
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

                            <table>
                                <tr>
                                    <th>Hỗ trợ đường cao tốc</th>
                                    <th>Hỗ trợ giữ làn đường</th>
                                    <th>Nhận diện biển báo giao thông</th>
                                    <th>Giám sát người lái xe</th>
                                    <th>Hỗ trợ căn giữa làn đường</th>
                                    <th>Hỗ trợ tắc đường</th>
                                    <th>Kiểm soát hành trình</th>
                                    <th>Kiểm soát hành trình thích ứng</th>
                                    <th>Điều chỉnh tốc độ</th>
                                    <th>Cảnh báo va chạm phía trước</th>
                                    <th>Phanh tự động phía trước</th>
                                    <th>Phanh tự động phía sau</th>
                                    <th>Cảnh báo va chạm tại giao lộ</th>
                                    <th>Tự động giữ làn đường</th>
                                    <th>Cảnh báo phương tiện cắt ngang phía sau</th>
                                    <th>Cảnh báo điểm mù</th>
                                    <th> Thiết lập </th>

                                </tr>
                                <c:forEach var="item" items="${list}">
                                    <tr>
                                        <c:if test="${item.hwyAssist}">
                                            <td>Có</td>
                                        </c:if>
                                        <c:if test="${!item.hwyAssist}">
                                            <td>Không</td>
                                        </c:if>
                                        <c:if test="${item.laneKeepAssist}">
                                            <td>Có</td>
                                        </c:if>
                                        <c:if test="${!item.laneKeepAssist}">
                                            <td>Không</td>
                                        </c:if>
                                         <c:if test="${item.trafficSignRec}">
                                            <td>Có</td>
                                        </c:if>
                                        <c:if test="${!item.trafficSignRec}">
                                            <td>Không</td>
                                        </c:if>
                                          <c:if test="${item.driverMon}">
                                            <td>Có</td>
                                        </c:if>
                                        <c:if test="${!item.driverMon}">
                                            <td>Không</td>
                                        </c:if>
                                        <c:if test="${item.laneCentering}">
                                            <td>Có</td>
                                        </c:if>
                                        <c:if test="${!item.laneCentering}">
                                            <td>Không</td>
                                        </c:if>
                                         <c:if test="${item.trafficJamAssist}">
                                            <td>Có</td>
                                        </c:if>
                                        <c:if test="${!item.trafficJamAssist}">
                                            <td>Không</td>
                                        </c:if>
                                        <c:if test="${item.cruise}">
                                            <td>Có</td>
                                        </c:if>
                                        <c:if test="${!item.cruise}">
                                            <td>Không</td>
                                        </c:if>
                                        <c:if test="${item.adaptiveCruise}">
                                            <td>Có</td>
                                        </c:if>
                                        <c:if test="${!item.adaptiveCruise}">
                                            <td>Không</td>
                                        </c:if>
                                         <c:if test="${item.speedAdjust}">
                                            <td>Có</td>
                                        </c:if>
                                        <c:if test="${!item.speedAdjust}">
                                            <td>Không</td>
                                        </c:if>
                                          <c:if test="${item.frontCollWarn}">
                                            <td>Có</td>
                                        </c:if>
                                        <c:if test="${!item.frontCollWarn}">
                                            <td>Không</td>
                                        </c:if>
                                        <c:if test="${item.frontAutoBrake}">
                                            <td>Có</td>
                                        </c:if>
                                        <c:if test="${!item.frontAutoBrake}">
                                            <td>Không</td>
                                        </c:if>
                                         <c:if test="${item.rearAutoBrake}">
                                            <td>Có</td>
                                        </c:if>
                                        <c:if test="${!item.rearAutoBrake}">
                                            <td>Không</td>
                                        </c:if>
                                        <c:if test="${item.intersectionWarn}">
                                            <td>Có</td>
                                        </c:if>
                                        <c:if test="${!item.intersectionWarn}">
                                            <td>Không</td>
                                        </c:if>
                                          <c:if test="${item.autoLaneKeep}">
                                            <td>Có</td>
                                        </c:if>
                                        <c:if test="${!item.autoLaneKeep}">
                                            <td>Không</td>
                                        </c:if>
                                        <c:if test="${item.rearCrossWarn}">
                                            <td>Có</td>
                                        </c:if>
                                        <c:if test="${!item.rearCrossWarn}">
                                            <td>Không</td>
                                        </c:if>
                                         <c:if test="${item.blindSpotWarn}">
                                            <td>Có</td>
                                        </c:if>
                                        <c:if test="${!item.blindSpotWarn}">
                                            <td>Không</td>
                                        </c:if>
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
                    <label for="hwyAssist" class="form-label fw-bold">Hỗ trợ đường cao tốc</label>
                    <select id="hwyAssist" class="hwyAssist" data-live-search="true">
                        <option value="true"> Có</option>
                        <option value="false" >Không</option>
                    </select>
                </div>
                <div class="col-md-4 mb-3">
                    <label for="laneKeepAssist" class="form-label fw-bold">Hỗ trợ giữ làn đường</label>
                    <select id="laneKeepAssist" class="laneKeepAssist" data-live-search="true">
                        <option value="true"> Có</option>
                        <option value="false" >Không</option>
                    </select>
                </div>
                <div class="col-md-4 mb-3">
                    <label for="trafficSignRec" class="form-label fw-bold">Nhận diện biển báo giao thông</label>
                    <select id="laneKeepAssist" class="trafficSignRec" data-live-search="true">
                        <option value="true"> Có</option>
                        <option value="false" >Không</option>
                    </select>
                </div>
                <div class="col-md-4 mb-3">
                    <label for="driverMon" class="form-label fw-bold">Giám sát người lái xe</label>
                    <select id="driverMon" class="driverMon" data-live-search="true">
                        <option value="true"> Có</option>
                        <option value="false" >Không</option>
                    </select>
                </div>
                <div class="col-md-4 mb-3">
                    <label for="laneCentering" class="form-label fw-bold">Hỗ trợ căn giữa làn đường</label>
                    <select id="laneCentering" class="laneCentering" data-live-search="true">
                        <option value="true"> Có</option>
                        <option value="false" >Không</option>
                    </select>
                </div>
                <div class="col-md-4 mb-3">
                    <label for="trafficJamAssist" class="form-label fw-bold">Hỗ trợ tắc đường</label>
                    <select id="trafficJamAssist" class="trafficJamAssist" data-live-search="true">
                        <option value="true"> Có</option>
                        <option value="false" >Không</option>
                    </select>
                </div>
                <div class="col-md-4 mb-3">
                    <label for="cruise" class="form-label fw-bold">Kiểm soát hành trình</label>
                    <select id="cruise" class="cruise" data-live-search="true">
                        <option value="true"> Có</option>
                        <option value="false" >Không</option>
                    </select>
                </div>
                <div class="col-md-4 mb-3">
                    <label for="adaptiveCruise" class="form-label fw-bold">Kiểm soát hành trình thích ứng</label>
                    <select id="adaptiveCruise" class="adaptiveCruise" data-live-search="true">
                        <option value="true"> Có</option>
                        <option value="false" >Không</option>
                    </select>
                </div>
                <div class="col-md-4 mb-3">
                    <label for="speedAdjust" class="form-label fw-bold">Điều chỉnh tốc độ</label>
                    <select id="speedAdjust" class="speedAdjust" data-live-search="true">
                        <option value="true"> Có</option>
                        <option value="false" >Không</option>
                    </select>
                </div>
                <div class="col-md-4 mb-3">
                    <label for="frontCollWarn" class="form-label fw-bold">Cảnh báo va chạm phía trước</label>
                    <select id="frontCollWarn" class="frontCollWarn" data-live-search="true">
                        <option value="true"> Có</option>
                        <option value="false" >Không</option>
                    </select>
                </div>
                <div class="col-md-4 mb-3">
                    <label for="frontAutoBrake" class="form-label fw-bold">Phanh tự động phía trước</label>
                    <select id="frontAutoBrake" class="frontAutoBrake" data-live-search="true">
                        <option value="true"> Có</option>
                        <option value="false" >Không</option>
                    </select>
                </div>
                <div class="col-md-4 mb-3">
                    <label for="rearAutoBrake" class="form-label fw-bold">Phanh tự động phía sau</label>
                    <select id="rearAutoBrake" class="rearAutoBrake" data-live-search="true">
                        <option value="true"> Có</option>
                        <option value="false" >Không</option>
                    </select>
                </div>
                <div class="col-md-4 mb-3">
                    <label for="intersectionWarn" class="form-label fw-bold">Cảnh báo va chạm tại giao lộ</label>
                    <select id="intersectionWarn" class="intersectionWarn" data-live-search="true">
                        <option value="true"> Có</option>
                        <option value="false" >Không</option>
                    </select>
                </div>
                <div class="col-md-4 mb-3">
                    <label for="autoLaneKeep" class="form-label fw-bold">Tự động giữ làn đường</label>
                    <select id="autoLaneKeep" class="autoLaneKeep" data-live-search="true">
                        <option value="true"> Có</option>
                        <option value="false" >Không</option>
                    </select>
                </div>
                <div class="col-md-4 mb-3">
                    <label for="rearCrossWarn" class="form-label fw-bold">Cảnh báo phương tiện cắt ngang phía sau</label>
                    <select id="rearCrossWarn" class="rearCrossWarn" data-live-search="true">
                        <option value="true"> Có</option>
                        <option value="false" >Không</option>
                    </select>
                </div>
                <div class="col-md-4 mb-3">
                    <label for="blindSpotWarn" class="form-label fw-bold">Cảnh báo điểm mù</label>
                    <select id="blindSpotWarn" class="blindSpotWarn" data-live-search="true">
                        <option value="true"> Có</option>
                        <option value="false" >Không</option>
                    </select>
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
<script src="${pageContext.request.contextPath}/template/admin/assets/js/manage-driver-assist.js"></script>


</body>
</html>

