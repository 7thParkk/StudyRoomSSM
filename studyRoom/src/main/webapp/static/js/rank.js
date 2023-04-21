$(() => {
    $.ajax({
        url: '/getTimeSumRankList',
        type: 'GET',
        success: function (data) {
            // alert(typeof data);
            let head = document.getElementById("hint");
            $.each(data, function (index, studyTime) {
                let userAccount = studyTime.userAccount;
                let min = studyTime.min;

                let table = document.getElementById("recordTable");
                let newRow = document.createElement("tr");
                let newCell1 = document.createElement("td");
                newCell1.textContent = index + 1;
                newRow.appendChild(newCell1);
                let newCell2 = document.createElement("td");
                newCell2.textContent = userAccount;
                newRow.appendChild(newCell2);
                let newCell3 = document.createElement("td");
                newCell3.textContent = min;
                newRow.appendChild(newCell3);

                let tbody = table.getElementsByTagName("tbody")[0];
                tbody.appendChild(newRow);
            });

        },
        error: function (xhr, status, error) {
            console.error(error);
        }
    });

    $('#backToStart').on('click', () => {
        window.location.href = "/index.jsp";
    })
})