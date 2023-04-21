var running = false;

$(() => {
    $('#timeRemaining #concreteTime').text(remainTime());
    //页面加载完成后修改距离高考的天数

    //修改闹钟进度条
    
    $('#buttons #start').on('click', () => {
        // clearInterval(timer);
        if(!running) {
            running = true;
            progress();
        }
    })

    $('#inputTodo').on('keypress', (e) => {
        if (e.which == 13) {
            addTodo();
        }
    })

    $('.plan ul').on('click', 'input[type="checkbox"]', function () {
        if ($(this).is(':checked')) {
            let item = $(this).closest('li').detach();
            $('.plan .total').text($('.plan ul').find('li').length);
            item.find('input[type="checkbox"]').prop('disabled', true).prop('checked', true);
            $('.done ul').append(item);
            $('.done .total').text($('.done ul').find('li').length);
        }
    });

    $('#todoList ul').on('click', 'span', function () {
        let item = $(this).closest('li').remove();
        $('.plan .total').text($('.plan ul').find('li').length);
        $('.done .total').text($('.done ul').find('li').length);
    });

    $('#backHome').on('click', ()=> {
        window.location.href = "/index.jsp";
    })

    $.ajax({
        url: '/getSoup',
        type: 'GET',
        success: function(data) {
            $('#soup').text(data);
        },
        error: function(xhr, status, error) {
            console.error(error);
        }
    });
})

//部分全局变量
var timeSum = 0;

//时钟
function clock() {
    var time = new Date(),
        hours = time.getHours(),
        minutes = time.getMinutes(),
        seconds = time.getSeconds();
    document.querySelectorAll('.clock')[0].innerHTML = harold(hours) + ":" + harold(minutes) + ":" + harold(seconds);

    function harold(standIn) {
        if (standIn < 10) {
            standIn = '0' + standIn
        }
        return standIn;
    }
}
setInterval(clock, 1000);

// 计算距离高考的剩余时间
const remainTime = () => {
    const today = new Date();
    const targetDate = new Date(today.getFullYear(), 5, 7);
    // 计算时间差（以毫秒为单位）
    const timeDiff = targetDate.getTime() - today.getTime();
    // 将时间差转换为天数
    const daysDiff = Math.ceil(timeDiff / (1000 * 60 * 60 * 24));
    return daysDiff;
}


// 进度条颜色变化
var width = 100;    
function progress() {
    let box = document.getElementById('progress');
    let studyTimeVal = parseFloat(document.getElementById('studyTime').value);
    let relaxTimeVal = parseFloat(document.getElementById('relaxTime').value);
    let turnVal = parseInt(document.getElementById('turns').value);
    let count = 0;
    let blank = document.getElementById('classBlankDiv5');
    let nowTime = getNowTime();
    let minute = (studyTimeVal + relaxTimeVal) * turnVal;

    if (document.getElementById('turns').value.includes(".")) {
        blank.innerHTML = "您输入的轮次应该为整数";
        running = false;
        return;
    }

    var timer = setInterval(function () {
        if (count % 2 === 0) { // 偶数周期，让宽度减少
            width -= 100 / (studyTimeVal * 60);
            blank.innerHTML = "自习ing"
        } else { // 奇数周期，让宽度增加
            width += 100 / (relaxTimeVal * 60);
            blank.innerHTML = "休息ing"
        }
        box.style.width = width + "%"; // 更新盒子的宽度
        if (width <= 0 && count % 2 === 0) { // 如果宽度减少到0，且是偶数周期，进入下一个周期
            count++;
            box.style.backgroundColor = "red";
        }
        if (width >= 100 && count % 2 === 1) { // 如果宽度增加到最大，且是奇数周期，进入下一个周期
            count++;
            box.style.backgroundColor = "#37c5e1";
        }
        if (count >= 2 * turnVal) { // 如果已经循环了两个周期，停止定时器
            clearInterval(timer);
            timeSum += (studyTimeVal + relaxTimeVal) * turnVal;
            document.getElementById('sumTime').innerHTML = timeSum;
            blank.innerHTML = "";
            postStudyTime(nowTime, minute);
        }
    }, 1000);

    let button = document.getElementById("stop");
    let isPaused = false; // 标记当前是否已经暂停定时器
    button.addEventListener("click", function () {
        if (isPaused) { // 如果已经暂停定时器，恢复定时器
            timer = setInterval(function () {
                if (count % 2 === 0) { // 偶数周期，让宽度减少
                    width -= 100 / (studyTimeVal * 60);
                    blank.innerHTML="自习ing";
                } else { // 奇数周期，让宽度增加
                    width += 100 / (relaxTimeVal * 60);
                    blank.innerHTML="休息ing";
                }
                box.style.width = width + "%"; // 更新盒子的宽度
                if (width <= 0 && count % 2 === 0) { // 如果宽度减少到0，且是偶数周期，进入下一个周期
                    count++;
                    box.style.backgroundColor = "red";
                }
                if (width >= 100 && count % 2 === 1) { // 如果宽度增加到最大，且是奇数周期，进入下一个周期
                    count++;
                    box.style.backgroundColor = "#37c5e1";
                }
                if (count >= 2 * turnVal) { // 如果已经循环了两个周期，停止定时器
                    running = false;
                    clearInterval(timer);
                    timeSum += (studyTimeVal + relaxTimeVal) * turnVal;
                    document.getElementById('sumTime').innerHTML = timeSum;
                    blank.innerHTML="";
                    postStudyTime(nowTime, minute);
                }
            }, 1000);
            button.innerHTML = "暂停";
        } else { // 如果还没有暂停定时器，暂停定时器
            clearInterval(timer);
            button.innerHTML = "恢复";
        }
        isPaused = !isPaused; // 取反标记变量的值
    });

    let cancelButton = document.getElementById('cancel');
    cancelButton.addEventListener("click", () => {
        clearInterval(timer);
        button.innerHTML = "暂停";
        isPaused = false;
        count = 0;
        width=100;
        box.style.width = 100 + "%";
        box.style.backgroundColor = "#37c5e1";
        running = false;
        blank.innerHTML="";
    })
}

//todoList的部分
function addTodo() {
    let item = $('#inputTodo').val();
    // alert(item);
    $('#inputTodo').val("");
    let newLi = $('<li>').append(
        $('<input>').attr('type', 'checkbox').addClass('state'),
        $('<input>').attr('type', 'text').addClass('content').val(item),
        $('<span>').addClass('delete').append($('<strong>').text('-'))
    );

    $('.plan ul').append(newLi);
    $('.plan .total').text($('.plan ul').find('li').length);
}

function getNowTime() {
    const now = new Date();
    const year = now.getFullYear();
    const month = String(now.getMonth() + 1).padStart(2, '0');
    const day = String(now.getDate()).padStart(2, '0');
    const hour = String(now.getHours()).padStart(2, '0');
    const minute = String(now.getMinutes()).padStart(2, '0');
    const second = String(now.getSeconds()).padStart(2, '0');
    const formattedTime = `${year}-${month}-${day} ${hour}:${minute}:${second}`;
    return formattedTime;
}

function postStudyTime(nowTime, minute) {
    let data = {
        startTime: nowTime,
        min: minute
    }

    $.ajax({
        url: '/addStudyTime',
        type: 'POST',
        data: JSON.stringify(data),
        contentType: "application/json"
    });
}