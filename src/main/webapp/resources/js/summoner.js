src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"


function summoner_name(){
    let userName = document.querySelector('#userName');

    if(userName.value.length< 2 ){
        Swal.fire({
            title: '최소2글자 이상입니다.',
            imageUrl: '/resources/images/Blood Moon Jhin.jpg',
            imageWidth: 380,
            imageHeight: 210,

          })
        userName.value = null; 
        return false;
        }  
        return true;
    
}
let riot_api_key = "RGAPI-e2c3b20e-ae8c-462e-868a-8e7185c9b12f";
//소환사 정보불러오는 함수
function getsummoner(name) {

    $.ajax({
        method: "GET",
        url: "https://kr.api.riotgames.com/lol/summoner/v4/summoners/by-name/" + name +
            "?api_key=" +
            riot_api_key,
        contentType: 'application/x-www-form-urlencoded; charset=UTF-8',

        dataType: "json",

        success: function (data) {

            console.log(summonerdata);

        },
        error: function (err) {
            console.log(err);

            Swal.fire({
                title: '존재하지 않은 소환사 입니다.',
                showClass: {
                    popup: 'animate__animated animate__fadeInDown'
                },
                hideClass: {
                    popup: 'animate__animated animate__fadeOutUp'
                }
            })
        }


    });
}
