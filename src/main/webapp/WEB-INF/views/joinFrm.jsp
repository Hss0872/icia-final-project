<%--
  Created by IntelliJ IDEA.
  User: MinwooKim
  Date: 2021-12-29
  Time: 오후 1:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

    <link rel="stylesheet" href="/resources/css/joinFrm.css">
    <script src="/resources/js/joinFrm.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>
</head>
<body>
<div class = "background"></div>

<div class = "logo" >
    <a href="/">
        <img src= "/resources/images/pngwing.com (1).png">
    </a>
</div>



<!-- joinTable -->
<form class="form-signup" onsubmit="return joinFrm(event)" >
    <label for="id">Id</label>
    <div class= "duplebtn">
        <input class="form-styling" id="id" type="id" name="id" placeholder="" required data-value="false"/>
        <button  id="idCheck"onclick="idDupleCheck()" class="emailBtn" type="button" style="display: inline-block;" >중복확인</button>
    </div>
    <label for="nickname">NickName</label>
    <div class="duplebtn">
        <input class="form-styling" id="nickname"type="text" name="nickname" placeholder="" required data-value="false"/>
        <button  id="nicknameCheck"onclick="nickNameDupleCheck()" class="emailBtn" type="button" style="display: inline-block;" >중복확인</button>
    </div>
    <label for="email">Email</label>
    <div class="duplebtn"><input class="form-styling1" id="email" type="text" name="email" value="" required data-value="false">
        <button onclick="emailDupleCheck()" class="emailBtn" type="button" >중복확인</button>
        <button  id="emailCheck"onclick="certificationCheck()" class="emailBtn" type="button" style="display: none;" >이메일인증</button>
    </div>
    <label for="phoneNumber">PhoneNumber</label>
    <input class="form-styling" id="phonenumber"type="text" name="phonenumber" placeholder="" required/>
    <label for="pw">Password</label>
    <input class="form-styling" id="pw" type="password" name="password" placeholder="" required/>
    <label for="confirmpw">Confirm password</label>
    <input class="form-styling" id="confirmpw" type="password" name="confirmpassword" placeholder="" required/>
    <button class="submitBtn" id="join" type="submit">submit</button>
</form>
<!-- 닉네임, 폰 -->
</body>
</html>
