<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>글작성 페이지</title>
    <script src="/resources/ckeditor/ckeditor.js"></script>
    <link rel="stylesheet" href="/resources/css/boardWriter_modify.css">
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<body>

<h3>글쓰기</h3>

<form action="" id="frm" method="post" enctype="multipart/form-data">
    <table border="1">
        <tr>
            <td>제목</td>
            <td>
                <select class="search" name="b_write_type">
                    <option class="select_free" value="free" selected="selected">자유게시판</option>
                    <option id="TOP" value="TOP">TOP</option>
                    <option id="JUNGLE" value="JUNGLE">JUNGLE</option>
                    <option id="MIDDLE" value="MIDDLE">MIDDLE</option>
                    <option id="BUTTOM" value="BUTTOM">BUTTOM</option>
                    <option id="SUPPOTER" value="SUPPOTER">SUPPOTER</option>
                </select>
                <input type="text" id="b_write_title" name="b_write_title" required>
            </td>
        </tr>
        <tr>
            <td>내용</td>
            <td><textarea rows="20" cols="60" id="b_write_content" name="b_write_content"></textarea>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <input type="submit" value="글수정">
                <input type="reset" id="reset" value="취소">
                <input type="button" onclick="location.href=document.referrer" value="뒤로가기">
            </td>
        </tr>
    </table>
</form>
</body>
<script>
    var ckeditor_config = {
        resize_enaleb : false,
        enterMode : CKEDITOR.ENTER_BR,
        shiftEnterMode : CKEDITOR.ENTER_P,
        filebrowserUploadUrl : "/community/ckUpload"
    };
    CKEDITOR.replace("b_write_content", ckeditor_config);

    let boardType = '${boardType}';

    if (boardType == 'free') {
        $('.select_free').attr('selected', 'selected');
        $('#b_write_title').val('${freeBoardInfo.b_free_title}');
        CKEDITOR.instances.b_write_content.setData(`
            ${freeBoardInfo.b_free_content}
        `)
    } else {
        $('#${laneBoardInfo.b_lane_type}').attr('selected', 'selected');
        $('#b_write_title').val('${laneBoardInfo.b_lane_title}');
        CKEDITOR.instances.b_write_content.setData(`
            ${laneBoardInfo.b_lane_content}
        `)
    }
</script>
</html>
