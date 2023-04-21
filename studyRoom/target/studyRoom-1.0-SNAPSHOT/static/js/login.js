$(() => {
    $('.form .btn .button2').on('click', () => {
        event.preventDefault();
        window.location.href = "register.jsp";
    })

    // $('.form .btn .button1').on('click', () => {
    //     event.preventDefault();
    // })

    $('#backToStart button').on('click', ()=> {
        window.location.href = "../../index.jsp";
    })

    $('.form .button3').on('click', ()=>{
        alert("您好，如果这个账号对您有着重要的意义，且您急需找回，可以通过向2459406270@qq.com发送邮件并提供相关信息，目前为止此功能由人工实现");
    })
})