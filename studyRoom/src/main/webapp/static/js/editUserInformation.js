$(()=>{
    $('.card #backHome').on('click', ()=>{
        window.location.href='/index.jsp';
    })

    $('.card-body #myInformation').on('click', ()=>{
        window.location.href='/pages/user/userInformation.jsp';
    })

})

// function submitForm(event) {
//     event.preventDefault();
//     const form = event.target;
//     const data = {
//         userName: form.elements.userName.value,
//         userPassword: form.elements.userPassword.value,
//         confirmPassword: form.elements.confirmPassword.value,
//         userProfile: form.elements.userProfile.value
//     };
//     const xhr = new XMLHttpRequest();
//     xhr.open('POST', '/edit');
//     xhr.setRequestHeader('Content-Type', 'application/json');
//     xhr.send(JSON.stringify(data));
// }