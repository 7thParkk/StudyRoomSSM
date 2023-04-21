$(()=> {
    $('#backToStart button').on('click', ()=> {
        window.location.href = "/index.jsp";
    })

    $('.btn .button3').on('click', ()=> {
        event.preventDefault();
        window.location.href = "/pages/user/login.jsp";
    })

    // 表单验证
    function validateForm() {
        const username = $('input[name="userAccount"]').val();
        const password = $('input[name="userPassword"]').val();
        const confirmPassWord = $('input[name="confirmPassword"]').val();

        // alert(username + "+" + password);

        // 验证用户名
        var usernameRegex = /^[a-zA-Z0-9_]{5,12}$/;
        if (!usernameRegex.test(username)) {
            $('#errorMsg').text("用户名不合法！");
            return false;
        }

        // 验证密码
        var passwordRegex = /^[a-zA-Z0-9_]{5,}$/;
        if (!passwordRegex.test(password)) {
            $('#errorMsg').text("密码不合法！");
            return false;
        }

        if (!(confirmPassWord === password)) {
            $('#errorMsg').text("密码与确认密码不一致！");
            return false;
        }

        return true;
    }

    $('.form .button2').on('click', validateForm);
})