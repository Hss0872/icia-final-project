<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

    <link rel="stylesheet" href="/resources/css/joinFrm.css?ver=1">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="/resources/js/joinFrm.js?ver=1"></script>
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
<form class="form-signup" onsubmit="return joinFrm()" action="/member/join" method="post" >
    <label for="id">Id</label>
    <div class= "duplebtn">
        <input class="form-styling" id="id" type="text" name="m_id" required data-value="false" onblur="id_check(event)"
        />
        <div class="idMsg" id="id_check"></div>
    </div>
    <label for="nickname">NickName</label>
    <div class="duplebtn">
        <input class="form-styling" id="nickname"type="text" name="m_nickname" data-value="false" onblur="nickname_check(event)"
        />
        <div class="idMsg" id="nickname_check"></div>
    </div>1
    <label for="email">Email</label>
    <div class="duplebtn">
        <input class="form-styling1" id="email" type="text" name="m_email"  data-value="false" onblur="email_check(event)"
    />
        <div class="idMsg" id="email_check"></div>
    </div>
    <label for="phoneNumber">PhoneNumber</label>
    <input class="form-styling" id="phonenumber"type="text" name="m_phone" onblur="phone_check(event)"
    />
    <div class="idMsg" id="phoneNumber_check"></div>
    <label for="pw">Password</label>
    <input class="form-styling" id="pw" type="password" name="m_pw" onblur="password_check(event)"
    />
    <div class="idMsg" id="pw_check"></div>
    <label for="confirmpw">Confirm password</label>
    <input class="form-styling" id="confirmpw" type="password" name="m_confirmpassword" data-value="false" onblur="confirm_password(event)"
    />
    <div class="idMsg" id="confirmpw_check"></div>
    <button class="submitBtn" id="join" type="submit">submit</button>
</form>
<!-- 닉네임, 폰 -->
</body>
</html>
