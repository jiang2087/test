$(function() {
    $('#addBtn').click(function() {
        type = "add"
        $('#overlay').show();
        $('#myForm').show();
        reset();
    });
    function reset(){
        $('#myForm select').prop('selectedIndex', 0);
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
    function realOrFake(check) {
        return check ? "Có" : "Không";
    }
    var g_Id;
    $('.editBtn').click(function(e) {
        e.preventDefault();
        type = "edit"
        var dataId = $(this).data('id');
        g_Id = dataId;
        $.ajax({
            url: '/vinfast/api-driver-assist?id=' + dataId,
            type: "GET",
            dataType: 'json',
            contentType: 'application/json',
            success: function (response) {
                $('#hwyAssist').val(realOrFake(response.data.hwyAssist))
                $('#laneKeepAssist').val(realOrFake(response.data.laneKeepAssist))
                $('#trafficSignRec').val(realOrFake(response.data.trafficSignRec))
                $('#driverMon').val(realOrFake(response.data.driverMon))
                $('#laneCentering').val(realOrFake(response.data.laneCentering))
                $('#trafficJamAssist').val(realOrFake(response.data.trafficJamAssist));
                $('#cruise').val(realOrFake(response.data.cruise));
                $('#adaptiveCruise').val(realOrFake(response.data.adaptiveCruise));
                $('#speedAdjust').val(realOrFake(response.data.speedAdjust));
                $('#frontCollWarn').val(realOrFake(response.data.frontCollWarn));
                $('#frontAutoBrake').val(realOrFake(response.data.frontAutoBrake));
                $('#rearAutoBrake').val(realOrFake(response.data.rearAutoBrake));
                $('#intersectionWarn').val(realOrFake(response.data.intersectionWarn));
                $('#autoLaneKeep').val(realOrFake(response.data.autoLaneKeep));
                $('#rearCrossWarn').val(realOrFake(response.data.rearCrossWarn));
                $('#blindSpotWarn').val(realOrFake(response.data.blindSpotWarn));

                $('#overlay').show();
                $('#myForm').show();
            },
            error: function (xhr, status, error) {
                console.error("Lỗi khi lấy dữ liệu sản phẩm:", error);
                alert("Không thể lấy thông tin sản phẩm. Vui lòng thử lại!");
            }
        })
    });
    function fakeOrReal(s){
        if(s === "Không"){
            return false;
        }else{
            return true;
        }
    }
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
                console.log(g_Id);
                $.ajax({
                    url: '/vinfast/api-driver-assist?id=' + g_Id + "&type=" + type,
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
                Swal.fire("Lựa chọn chưa được thay đổi!", "Thông báo", "warning");
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
                    url: "api-driver-assist?id=" + id,
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
