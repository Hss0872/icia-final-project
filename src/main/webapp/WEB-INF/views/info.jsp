<%--
  Created by IntelliJ IDEA.
  User: tjdnf
  Date: 2021-12-22
  Time: 오후 3:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>

</head>
<body>

<script
        src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js">
</script>
<%--<script src="js/jquery.serializeObject.js"> </script>--%>
<form action="test1" id="test1" enctype="application/x-www-form-urlencoded" method="post">
    <input type="text" id="champ_name" name="champ_name">
    <input type="submit" value='가자가자'>
</form>


<div class="summonerInfo">
    <div class="summonerName">
        ${si.summonerName}
    </div>
    <div class="summonerLevel">
        ${si.level}
    </div>
    <div class="summonerRank">
        ${si.tier}<br>${si.rank}
    </div>
</div>


<div id="gameInfo">


</div>


<script>
    let puuid;

    $.ajax({
        type: "POST",
        url: 'getjson',
        data: { puuid :"${si.puuid}"},
        dataType: 'json',
        success: function (data) {
            console.log(data)

        },
        error: function (err) {
            console.log(err)
        }

    })

</script>

</body>
</html>
