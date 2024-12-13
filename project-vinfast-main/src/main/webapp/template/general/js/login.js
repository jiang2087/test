$(function (){
    $('#loginBtn').click(function (e) {
        e.preventDefault()
        var data = {}
        var formData = $('#form').serializeArray()
        formData.forEach(item => data[item.name] = item.value)
        $.ajax({
            url: '/vinfast/login?action=login',
            method: 'POST',
            contentType: 'application/json; charset=UTF-8',
            data: JSON.stringify(data),
            dataType: 'json',
            success: function(response) {
                if(response.status === "success"){
                    Swal.fire({
                        position: "top-end",
                        icon: "success",
                        title: response.message,
                        showConfirmButton: false,
                        timer: 100
                    });
                    setTimeout(() => {
                        window.location.href = '/vinfast' + response.url;
                    }, 100);
                }else{
                    Swal.fire({
                        position: "top-end",
                        icon: "error",
                        title: response.message,
                        showConfirmButton: false,
                        timer: 1500
                    });
                }
            },
            error: function(xhr, status, error) {
                const errorResponse = xhr.responseJSON;
                if (errorResponse && errorResponse.message) {
                    Swal.fire({
                        position: "top-end",
                        icon: "error",
                        title: errorResponse.message,
                        showConfirmButton: false,
                        timer: 1500
                    });
                } else {
                    console.error("Lỗi không xác định.");
                }
            }
        });
    })
})