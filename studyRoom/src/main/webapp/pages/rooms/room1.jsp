<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>高考自习室</title>
    <style>
        #main {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: url(/static/img/bgcStar.jpg) center 0 no-repeat;
            background-size: cover;
            background-attachment: fixed;
        }

        #left {
            float: left;
            width: 20%;
            height: 400px;
            /* background-color: rgb(240, 189, 189); */
            margin-left: 2.5%;
        }

        #middle {
            float: left;
            width: 55%;
            height: 600px;
            /* height: 400px; */
            /* background-color: blue; */
            margin: 0;
        }

        #right {
            float: left;
            width: 22%;
            height: 400px;
            /* height: 400px; */
            /* background-color: green; */
            margin: 0;
        }

        /* 最左边的大盒子 */
        #timeRemaining {
            /* background-color: rgb(165, 224, 28); */
            text-align: center;
            font-size: 1.5em;
            color: white;
        }

        #timeRemaining #concreteTime {
            color: rgb(85, 185, 244);
        }

        /* 中间的大盒子 */
        .classBlankDiv1 {
            height: 50px;
        }

        .clock {
            text-align: center;
            font-size: 3em;
            color: white;
        }

        .classBlankDiv4 {
            height: 150px;
        }

        #setTime {
            text-align: center;
        }

        #setTime input {
            width: 50px;
            background-color: #4ecbed;
            font-size: 18px;
            border-radius: 15%;
        }

        #setTime #set1,
        #set2,
        #set3 {
            margin-left: 40px;
        }

        #setTime span {
            font-size: 18px;
            font-weight: bold;
            color: beige;
        }

        #progressContainer {
            text-align: center;
            margin-top: 30px;
            border: #37c5e1;
            border-style: dotted;
            border-radius: 25%;
        }

        #progress {
            height: 40px;
            background-color: #37c5e1;
            border-radius: 25%;
        }

        #classBlankDiv5 {
            height: 28px;
            text-align: center;
            font-size: 18px;
            color: beige;
            margin-top: 18px;
        }

        #buttons {
            margin-top: 30px;
            text-align: center;
        }

        #buttons span {
            display: inline-block;
            text-align: center;
            width: 80px;
            font-size: 18px;
            font-weight: bold;
            margin-left: 30px;
            color: rgb(147, 49, 196);
            background-color: #6fe6e6;
            border-radius: 15%;
        }

        #buttons #start:hover {
            width: 150px;
            height: 40px;
            font-size: 26px;
        }

        #buttons #stop:hover {
            width: 150px;
            height: 40px;
            font-size: 26px;
        }

        #buttons #cancel:hover {
            width: 150px;
            height: 40px;
            font-size: 26px;
        }

        #cnt {
            padding-top: 40px;
            text-align: center;
            color: #fff;
        }

        #soup {
            margin-top: 100px;
            text-align: center;
            color: #fff;
            font-size: 16px;
            font-weight: bold;
        }

        /* 右边的大盒子 */
        #todoList {
            text-align: center;
        }

        .classBlankDiv2 {
            height: 30px;
        }

        #todoList .label {
            color: white;
            font-size: 1.5em;
            font-weight: bold;
        }

        #todoList #inputTodo {
            min-height: 30px;
            /* min-width: 240px;
            max-width: 250px; */
            border-radius: 10px;
            background-color: #cdd6ec;
        }

        #todoList .plan h3,
        .total {
            display: inline-block;
            color: #fff;
        }

        #todoList .plan .total {
            width: 20px;
            background-color: rgb(83, 205, 199);
        }

        #todoList .done h3,
        .total {
            display: inline-block;
            color: #fff;
        }

        #todoList .done .total {
            width: 20px;
            background-color: rgb(83, 205, 199);
        }

        #todoList .plan .state {
            display: inline-block;
            width: 22px;
            height: 18px;
            border: 1px solid #ccc;
            border-radius: 50%;
            background-color: #fff;
        }

        #todoList .plan .content {
            display: inline-block;
            height: 26px;
            font-size: 16px;
            text-align: center;
            font-weight: bold;
        }

        #todoList .done .state {
            display: inline-block;
            width: 22px;
            height: 18px;
            border: 1px solid #ccc;
            border-radius: 50%;
            background-color: #fff;
        }

        #todoList .done .content {
            display: inline-block;
            height: 26px;
            font-size: 16px;
            text-align: center;
            font-weight: bold;
        }

        #todoList .delete {
            display: inline-block;
            width: 15px;
            height: 15px;
            /* border: 1px solid #ccc; */
            border-radius: 25%;
            background-color: #ccc;
        }

        #todoList ul {
            margin-top: -5px;
            margin-bottom: -5px;
            list-style-type: none;
            padding-left: 0px;
        }

        #backHome {
            position: fixed;
            bottom: 60px;
            left: 80px;
        }

        #backHome button {
            width: 150px;
            text-align: center;
            height: 40px;
            font-size: 18px;
            border-radius: 20%;
        }

        #backHome button:hover {
            width: 180px;
            height: 50px;
            font-size: 24px;
        }
    </style>
    <script src="/static/js/jQueryLib.js"></script>
    <script src="/static/js/room1.js"></script>
</head>

<body>
    <div id="main">
        <div id="left">
            <div id="timeRemaining">
                <h3>距离23年高考</h3>
                <h3>还有<span id="concreteTime">11</span> 天</h3>
            </div>
        </div>

        <div id="middle">
            <div class="classBlankDiv1"></div>
            <div class="clock"></div>
            <div class="classBlankDiv4"> </div>
            <div id="setTime">
                <span id="set1">自习</span><input type="text" value="2" id="studyTime"><span>分钟</span>
                <span id="set2">休息</span><input type="text" value="1 " id="relaxTime"><span>分钟</span>
                <span id="set3">轮次</span><input type="text" value="3" id="turns"><span>次</span>
            </div>

            <div id="progressContainer">
                <div id="progress"></div>
            </div>

            <div id="classBlankDiv5">
            </div>

            <div id="buttons">
                <span id="start">开始</span> <span id="stop">暂停</span> <span id="cancel">取消</span>
            </div>

            <div id="cnt">
                <h3>今日已专注：<span id="sumTime">0</span>分钟</h3>
            </div>

            <div id="soup">
                <p>这是一段鸡汤</p>
            </div>
        </div>

        <div id="right">

            <div id="todoList">
                <!-- <div class="classBlankDiv2"></div> -->
                <h3 class="label">ToDoList</h3>
                <!-- <div class="label">ToDoList</div> -->
                <div class="todoInput">
                    <input type="text" placeholder="写下小目标，轻敲回车~" id="inputTodo">
                </div>
                <div class="plan">
                    <h3>我的目标</h3>
                    <span class="total">0</span>
                    <ul>
                        <!-- <li>
                            <input type="checkbox" class="state">
                            <input type="text" class="content">
                            <span class="delete"><strong>-</strong></span>
                        </li> -->
                    </ul>
                </div>

                <div class="done">
                    <h3>已完成</h3>
                    <span class="total">0</span>
                    <ul>
                        <!-- <li>
                            <input type="checkbox" checked="checked" class="state">
                            <input type="text" class="content">
                            <span class="delete"><strong>-</strong></span>
                        </li> -->
                    </ul>
                </div>
            </div>
        </div>

        <div id="backHome">
            <button>返回首页</button>
        </div>
    </div>
</body>

</html>