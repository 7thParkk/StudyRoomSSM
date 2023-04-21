$(()=> {
    $.ajax({
        url: '/getStudyTime',
        type: 'GET',
        success: function(data) {
            // alert(typeof data);
            let head = document.getElementById("hint");
            if (data === "") {
                head.innerHTML = "自习记录(您还未登录";
            } else{
                $.each(data, function(index, studyTime) {
                    head.innerHTML = "自习记录";
                    let startTime = studyTime.startTime;
                    let min = studyTime.min;
                    
                    let table = document.getElementById("recordTable");
                    let newRow = document.createElement("tr");
                    let newCell1 = document.createElement("td");
                    newCell1.textContent = index + 1;
                    newRow.appendChild(newCell1);
                    let newCell2 = document.createElement("td");
                    newCell2.textContent = startTime;
                    newRow.appendChild(newCell2);
                    let newCell3 = document.createElement("td");
                    newCell3.textContent = min;
                    newRow.appendChild(newCell3);

                    let tbody = table.getElementsByTagName("tbody")[0];
                    tbody.appendChild(newRow);
                });
            }
        },
        error: function(xhr, status, error) {
            console.error(error);
        }
    });

    $('#backToStart').on('click', ()=> {
        window.location.href = "/index.jsp";
    })
})