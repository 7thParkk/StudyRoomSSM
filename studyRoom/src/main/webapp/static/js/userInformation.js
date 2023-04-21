$(()=>{
    $('.card #backHome').on('click', ()=>{
        event.preventDefault();
        window.location.href='/index.jsp';
    })

    $('.card #editInformation').on('click', ()=>{
        event.preventDefault();
        window.location.href= "/pages/user/editUserInformation.jsp";
    })

    $('#logOut').on('click', ()=> {
        $.ajax({
            url: '/logOut',
            type: 'GET'
        });
        window.location.href = "/index.jsp";
    })
})