<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>自习排行榜</title>
    <style>
        @import url(https://fonts.googleapis.com/css?family=Roboto:400,500,700,300,100);

        body {
            background-color: #3e94ec;
            font-family: "Roboto", helvetica, arial, sans-serif;
            font-size: 16px;
            font-weight: 400;
            text-rendering: optimizeLegibility;
        }

        div.table-title {
            display: block;
            margin: auto;
            max-width: 600px;
            padding: 5px;
            width: 100%;
        }

        .table-title h3 {
            color: #fafafa;
            font-size: 30px;
            font-weight: 400;
            font-style: normal;
            font-family: "Roboto", helvetica, arial, sans-serif;
            text-shadow: -1px -1px 1px rgba(0, 0, 0, 0.1);
            text-transform: uppercase;
        }


        /*** Table Styles **/

        .table-fill {
            background: white;
            border-radius: 3px;
            border-collapse: collapse;
            /* height: 320px; */
            margin: auto;
            max-width: 600px;
            padding: 5px;
            width: 100%;
            box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
            animation: float 5s infinite;
        }

        th {
            color: #D5DDE5;
            ;
            background: #1b1e24;
            border-bottom: 4px solid #9ea7af;
            border-right: 1px solid #343a45;
            font-size: 23px;
            font-weight: 100;
            padding: 24px;
            text-align: left;
            text-shadow: 0 1px 1px rgba(0, 0, 0, 0.1);
            vertical-align: middle;
        }

        th:first-child {
            border-top-left-radius: 3px;
        }

        th:last-child {
            border-top-right-radius: 3px;
            border-right: none;
        }

        tr {
            border-top: 1px solid #C1C3D1;
            border-bottom: 1px solid #C1C3D1;
            color: #666B85;
            font-size: 16px;
            font-weight: normal;
            text-shadow: 0 1px 1px rgba(256, 256, 256, 0.1);
        }

        tr:hover td {
            background: #4E5066;
            color: #FFFFFF;
            border-top: 1px solid #22262e;
        }

        tr:first-child {
            border-top: none;
        }

        tr:last-child {
            border-bottom: none;
        }

        tr:nth-child(odd) td {
            background: #EBEBEB;
        }

        tr:nth-child(odd):hover td {
            background: #4E5066;
        }

        tr:last-child td:first-child {
            border-bottom-left-radius: 3px;
        }

        tr:last-child td:last-child {
            border-bottom-right-radius: 3px;
        }

        td {
            background: #FFFFFF;
            padding: 20px;
            text-align: left;
            vertical-align: middle;
            font-weight: 300;
            font-size: 18px;
            text-shadow: -1px -1px 1px rgba(0, 0, 0, 0.1);
            border-right: 1px solid #C1C3D1;
        }

        td:last-child {
            border-right: 0px;
        }

        th.text-left {
            text-align: left;
        }

        th.text-center {
            text-align: center;
        }

        th.text-right {
            text-align: right;
        }

        td.text-left {
            text-align: left;
        }

        td.text-center {
            text-align: center;
        }

        td.text-right {
            text-align: right;
        }

        #backToStart button {
            background-color: white;
            color: black;
            border-radius: 10em;
            font-size: 17px;
            font-weight: 600;
            padding: 0.7em 1.4em;
            cursor: pointer;
            transition: all 0.3s ease-in-out;
            border: 1px solid black;
            box-shadow: 0 0 0 0 black;
            position: absolute;
            right: 30px;
            top: 30px;
        }

        #backToStart button:hover {
            transform: translateY(-4px) translateX(-2px);
            box-shadow: 2px 5px 0 0 black;
        }

        #backToStart button:active {
            transform: translateY(2px) translateX(1px);
            box-shadow: 0 0 0 0 black;
        }
    </style>
    <script src="/static/js/jQueryLib.js"></script>
    <script src="/static/js/rank.js"></script>
</head>
<body>
    <div id="container">
        <div id="backToStart"><button>返回首页</button></div>
        <div class="table-title">
            <h3 id="hint">自习时长排行榜</h3>
        </div>
        <table class="table-fill" id="recordTable">
            <thead>
                <tr>
                    <th class="text-left">排名</th>
                    <th class="text-left">用户名</th>
                    <th class="text-left">时长(单位:min)</th>
                </tr>
            </thead>
            <tbody class="table-hover">

            </tbody>
        </table>
    </div>
</body>
</html>