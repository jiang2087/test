$(function() {
    $('#addBtn').click(function() {
        type = "add"
        $('#overlay').show();
        $('#myForm').show();
        reset();
    });
    function reset(){
        $('#myForm input').val("");
    }
    $('#closeFormBtn').click(function() {
        $('#overlay').hide();
        $('#myForm').hide();
    });

    $('#cancelBtn').click(function(){
        $('#overlay').hide();
        $('#myForm').hide();
    })

    $('#overlay').click(function() {
        $('#overlay').hide();
        $('#myForm').hide();
    });
    var g_Id;
    $('.editBtn').click(function(e) {
        e.preventDefault();
        type = "edit"
        var dataId = $(this).data('id');
        g_Id = dataId;
        $.ajax({
            url: '/vinfast/api-interior-features?id=' + dataId,
            type: "GET",
            dataType: 'json',
            contentType: 'application/json',
            success: function (response) {
                $('#touchscreenSize').val(response.data.touchscreenSize);
                $('#hudDisplay').val(response.data.hudDisplay);
                $('#driverSeatConfig').val(response.data.driverSeatConfig);
                $('#passengerSeatConfig').val(response.data.passengerSeatConfig);
                $('#steeringWheelAdjustment').val(response.data.steeringWheelAdjustment);
                $('#steeringWheelType').val(response.data.steeringWheelType);
                $('#airConditioningSystem').val(response.data.airConditioningSystem);
                $('#usbPorts').val(response.data.usbPorts);
                $('#bluetoothWifiConnectivity').val(response.data.bluetoothWifiConnectivity);
                $('#soundSystem').val(response.data.soundSystem);
                $('#vinFastConnectService').val(response.data.vinFastConnectService);

                $('#overlay').show();
                $('#myForm').show();
            },
            error: function (xhr, status, error) {
                console.error("Lỗi khi lấy dữ liệu sản phẩm:", error);
                alert("Không thể lấy thông tin sản phẩm. Vui lòng thử lại!");
            }
        })
    });
     $(document).ready(function() {
        $('#group').DataTable({
            paging: true,        // Kích hoạt phân trang
            searching: true,     // Kích hoạt tìm kiếm
            ordering: true,       // Kích hoạt sắp xếp
            pagingType: "full_numbers",
            language: {
                search: "Tìm kiếm:",
                lengthMenu: "Hiển thị: _MENU_",
                info: "Hiển thị từ _START_ đến _END_ của _TOTAL_ bản ghi",
                 paginate: {
                    first: 'Đầu',
                    last: 'Cuối',
                    next: '<i class="fas fa-chevron-right"></i>',
                    previous: '<i class="fas fa-chevron-left"></i>'
                }
            },
            lengthMenu: [5, 8, 20],
            dom: '<"row"<"col-md-6"l><"col-md-6"f>>' + // Dòng đầu: l bên trái, f bên phải
                          '<"row"<"col-md-12"t>>' +           // Dòng giữa: bảng
                          '<"row"<"col-md-5"i><"col-md-7"p>>'
        });
    });

    $('#confirmBtn').click(function (e) {
        e.preventDefault();
        var data = {}
        var formData = $('#myForm').serializeArray()
        formData.forEach(item => data[item.name] = fakeOrReal(item.value))
        Swal.fire({
            title: "Bạn có muốn lưu thay đổi?",
            showDenyButton: true,
            showCancelButton: true,
            confirmButtonText: "Lưu",
            denyButtonText: `Không lưu`
        }).then((result) => {
            if (result.isConfirmed) {
                $.ajax({
                    url: '/vinfast/api-interior-features?id=' + g_Id + "&type=" + type,
                    type: "POST",
                    contentType: 'application/json',
                    data: JSON.stringify(data),
                    dataType: 'json',
                    success: function (response) {
                        Swal.fire("Đã lưu!", response.message, "success");
                        $('#overlay').hide()
                        $('#myForm').hide()
                    },
                    error: function (xhr, status, error) {
                        Swal.fire("Lỗi!", "Không thể lưu thay đổi. Vui lòng thử lại sau.", "error");
                        console.error(error);
                    }
                })
            } else if (result.isDenied) {
                Swal.fire("Lựa chọn chưa được thay đổi!");
                $('#overlay').hide()
                $('#myForm').hide()
            }
        });

    })

    $('.deleteBtn').click(function (e) {
        e.preventDefault()
        var id = $(this).data('id')
        Swal.fire({
            title: "Bạn có chắc chắn xóa hỗ trợ lái xe này không?",
            showDenyButton: true,
            showCancelButton: true,
            confirmButtonText: "Xóa",
            denyButtonText: `Hủy`
        }).then((result) => {
            if (result.isConfirmed) {
                $.ajax({
                    url: "api-interior-features?id=" + id,
                    type: 'DELETE',
                    dataType: 'json',
                    success: function (response) {
                        Swal.fire({
                            title: "Thông báo",
                            text: response.message,
                            icon: "success"
                        });
                    },
                    error: function (xhr, status, error) {
                        console.log(error);
                    }
                })
            }else if (result.isDenied) {
                Swal.fire("Thay đổi chưa được lưu!", "warning", "Thông báo");
                $('#overlay').hide()
                $('#myForm').hide()
            }
        });
    })
});
