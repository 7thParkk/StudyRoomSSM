$(()=>{
    // $('.functions .login').on("click", ()=> {
    //     window.location.href = "pages/user/login.jsp";
    // })
    $('.rooms .gkroom').on('click', ()=> {
        window.location.href = "/pages/rooms/room1.jsp";
    })

    $('.rooms .kyroom').on('click', ()=> {
        window.location.href = "/pages/rooms/room2.jsp";
    })

    $('.rooms .rcroom').on('click', ()=> {
        window.location.href = "/pages/rooms/room3.jsp";
    })

    $('#record').on('click', ()=> {
        window.location.href="/pages/records/record.jsp";
    })

    $('#rank').on('click', ()=> {
        window.location.href="/pages/records/rank.jsp";
    })
})