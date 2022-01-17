// src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"



//win5
/*window.onload = function appendChampByTier(data) {

	const champDiv = 
	'<span class="test">'+data.champ[0]+'</span>'
	'<span class="test">'+data.champ[1]+'</span>'
	'<span class="test">'+data.champ[2]+'</span>'  
	'<span class="test">'+data.champ[3]+'</span>'  
	'<span class="test">'+data.champ[4]+'</span>'  
	$('#lainvalue').append(champDiv);
	

}*/



// win, ban Ajax 

function champAjax(lane, kind){
	return fetch (`/champion?lane=${lane}&kind=${kind}`,   //get으로 보낼때는 url도 queryString으로
	{           
		method:'get',      //정보를 가져올때 get 보낼때 post 
		headers : {"Content-Type": "application/json"}, 
		// body: JSON.stringify({
        //     'tier' : tier      //-> {'tier': 'bronze'}


	}).then((response)=>{
		if(response.status !==200){
			throw ' 아직 미정.'
		}
		console.log(response.status);
		return response.json(); 
	}).then((response)=>{
		var response = {
			// lane: [  이런식으로 날라올 예정
			// 	{
			// 		name: 'top',
			// 		champ: 1 , 2 , 3 ,4 ,5 
			// 	},
			// 	{
			// 		name: '이블린',
			// 		win: 10,
			// 	},
			// ]
		}
		appendChampByTier(data);
		
	}).then((response)=>{
		filterLane(response);

	}).catch((error)=>{   //200~ 299 그 외에는 다 잡아낸다
		console.log(error);
		alert(error);
})
}


// @RequestMapping(value = "/champion/championinfo")
// public String champinfo(String champ_name) {
// 	fjdkfjkdjfksdjvkdsj

// 	return "~~~";
// }

// champInfo 시작 
function champinfo(champname){
	return fetch(`/champion/championinfo?champ_name=${champname}`,
		{
			method: 'get',
			headers: { "Content-Type": "application/json" },
			
		}).then((res)=>{
			if(res.status !== 200){
				throw '쌉오류났음~ '
			}
			res.json();
		}).catch((res)=>{
			alert(res);
		})
	 }

	 	








//champion_lst 
/*const champion_list = ['Annie',
'Olaf','Galio','TwistedFate','XinZhao','Urgot','LeBlanc',
'Vladimir','FiddleSticks','Kayle','MasterYi','Alistar','Ryze',
'Sion','Sivir','Soraka','Teemo','Tristana','Warwick','Nunu',
'MissFortune','Ashe','Tryndamere','Jax','Morgana','Zilean',
'Singed','Evelynn','Twitch','Karthus','ChoGath','Amumu','Rammus','Anivia',
'Shaco','DrMundo','Sona','Kassadin','Irelia','Janna','Gangplank','Corki',
'Karma','Taric','Veigar','Trundle','Swain','Caitlyn','Blitzcrank','Malphite',
'Katarina','Nocturne','Maokai','Renekton','JarvanIV','Elise','Orianna','Wukong',
'Brand','LeeSin','Vayne','Rumble','Cassiopeia','Skarner','Heimerdinger',
'Nasus','Nidalee','Udyr','Poppy','Gragas','Pantheon','Ezreal','Mordekaiser','Yorick',
'Akali','Kennen','Garen','Leona','Malzahar','Talon','Riven','KogMaw',
'Shen','Lux','Xerath','Shyvana','Ahri','Graves','Fizz','Volibear','Rengar','Varus',
'Nautilus','Viktor','Sejuani','Fiora','Ziggs','Lulu','Draven','Hecarim','KhaZix','Darius',
'Jayce','Lissandra','Diana','Quinn','Syndra','AurelionSol','Kayn','Zoe','Zyra',
'Kaisa','Seraphine','Gnar','Zac','Yasuo','VelKoz','Taliyah','Camille','Akshan',
'Braum','Jhin','Kindred','Jinx','Viego','Senna','Lucian','Zed','Kled','Ekko','Qiyana',
'Vi','Aatrox','Nami','Azir','Yuumi','Samira','Thresh','Illaoi','RekSai','Ivern',
'Kalista','Bard','Rakan','Xayah','Ornn','Sylas','Neeko','Aphelios','Rell','Pyke','Vex',
'Yone','Sett','Lillia','Gwen'
];*/


window.onload = function() {   //dom element가 그려지기전에 실행하게끔 하는 코드
	let champ_div = $('#champ_img');
	$.ajax({
		type: "GET",
		url: '/champ_img',

		dataType: 'json',
		success: function (data) {
			console.log(data)

			for(id of data){
				let a = $('<a>');
				let div = $('<div>').attr('class','cl');
				let name = $('<div>').attr('class','champName');

				$('<img>').attr('src', '/resources/images/LOL_CHAMPION_ICON/lol_champion_' + id + '.png').attr('alt', id).appendTo(a);
				a.attr('href', "http://localhost:8090/champion/"+id).appendTo(div);
				name.html("<p>"+id+"</p>").appendTo(div);
				//console.log(name);
				div.appendTo(champ_div);
			}
		},
		error: function test (err) {
			console.log(err)
		}
	});
}







// values = "/championinfo"
// chapionInfo(HttpRequest request, ModelAndView mav) {
// 	String champ = request.getParameter("champ")//Teemo
// 	paramMap.get("champ")
// 	ArrayList<ChampInfo> champList = ServiceWorker.getChampasdf()
// 	mav.setView('detail')
// 	mav.addObject("champList", champList)
// 	return mav
// }





