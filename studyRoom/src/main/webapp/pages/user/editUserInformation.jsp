<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>编辑信息</title>
    <style>
        <%--html,--%>
        <%--body {--%>
        <%--    width: 100%;--%>
        <%--    height: 100%;--%>
        <%--}--%>

        <%--body {--%>
        <%--    background-image: url("${pageContext.request.contextPath}/static/img/bgc2.jpg");--%>
        <%--    background-size: cover;--%>
        <%--    background-repeat: no-repeat;--%>
        <%--}--%>
        .container {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: url(/static/img/bgc2.jpg) center 0 no-repeat;
            background-size: cover;
            background-attachment: fixed;
        }

        .card {
            width: 500px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-shadow: 2px 2px 8px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            margin: 100px auto;
        }

        .card-header {
            background-color: #333;
            padding: 16px;
            text-align: center;
        }

        .card-header .text-header {
            margin: 0;
            font-size: 18px;
            color: rgb(255, 255, 255);
            font-weight: bold;
        }

        .card-body {
            padding: 50px;
        }

        .form-group {
            margin-bottom: 10px;
        }

        .form-group label {
            display: block;
            font-size: 14px;
            color: #333;
            font-weight: bold;
            margin-bottom: 1px;
        }

        .form-group .form-control {
            width: 100%;
            padding: 8px;
            font-size: 14px;
            border: 1px solid #ccc;
            border-radius: 4px;
            min-height: 18px;
        }

        .btn {
            padding: 12px 24px;
            margin-bottom: -15px;
            margin-left: 18px;
            font-size: 16px;
            border: none;
            border-radius: 4px;
            background-color: #333;
            color: #fff;
            text-transform: uppercase;
            transition: background-color 0.2s ease-in-out;
            cursor: pointer
        }

        .btn:hover {
            background-color: #ccc;
            color: #333;
        }
    </style>

    
    <script src="${pageContext.request.contextPath}/static/js/jQueryLib.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/editUserInformation.js"></script>
</head>

<body>
<div class="container">
    <div class="card">
        
        <div class="card-header">
            <div class="text-header">${empty requestScope.get("editMsg") ? "请填写需要修改的信息" : requestScope.get("editMsg")}</div>
        </div>

        <div class="card-body">
            <form action="/edit" method="post">
                <div class="form-group">
                    <label for="userAccount">用户名:(登录唯一凭证，不可修改)</label>

                    <!-- <input required="" class="form-control" name="username" id="username" type="text"> -->
                    <div class="form-control" id="userAccount" >
                        ${sessionScope.get("user").userAccount}
                    </div>
                </div>

                <div class="form-group">
                    <label for="username" required="false">昵称:</label>

                    <input class="form-control" name="userName" id="username" type="text">
                    <!-- <div class="form-control" id="username" ></div> -->
                </div>

                <div class="form-group">
                    <label for="password">密码:</label>

                    <input class="form-control" name="userPassword" id="password" type="password" >
                    <!-- <div class="form-control" id="password"></div> -->
                </div>

                <div class="form-group">
                    <label for="confirmPassword" id="confirmPasswordLabel">确认密码:</label>

                    <input class="form-control" name="confirmPassword" id="confirmPassword" type="password">
                    <!-- <div class="form-control" id="password"></div> -->
                </div>

                <div class="form-group">
                    <label for="profile">简介:</label>

                    <input class="form-control" name="userProfile" id="profile" type="text">
                    <!-- <div class="form-control" id="profile"></div> -->
                </div>

                <input type="button" class="btn" id="backHome" value="返回首页">
                <!-- 点击返回首页按钮，通过js跳回首页 -->
                <input type="button" class="btn" id="myInformation" value="我的信息">
                <!-- 点击我的信息按钮， 通过js跳回我的信息页面 -->
                <input type="submit" class="btn" id="push" value="提交修改">
                <!-- 点击提交修改按钮，发送请求给修改信息的Controller -->

            </form>
        </div>
    </div>
</div>
</body>

</html>