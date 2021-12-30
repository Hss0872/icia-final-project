src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"


function summoner_name(){
    let userName = document.querySelector('#userName');

    if(userName.value.length< 2 ){
        Swal.fire({
            title: '최소2글자 이상입니다.',
            imageUrl: 'images/pngwing.com (5).png',
            imageWidth: 360,
            imageHeight: 210,

          })
        userName.value = null; 
        return false;
        }  
        return true;
    
}
