<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>글작성 페이지</title>
    <script src="/resources/ckeditor5-build-classic/ckeditor.js"></script>
    <link rel="stylesheet" href="/resources/css/boardWriter_modify.css">
</head>
<body>

<h3>글쓰기</h3>

<form action="boardwrite" id="frm" method="post" enctype="multipart/form-data">
    <table border="1">
        <tr>
            <td>제목</td>
            <td><input type="text" id="b_title" name="b_title" required></td>
        </tr>
        <tr>
            <td>내용</td>
            <td><textarea rows="20" cols="60" id="b_contents" name="b_contents" required></textarea>
            </td>
        </tr>
        <tr>
            <td>파일첨부</td>
            <td><input type="file" name="files" id="files" multiple>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <input type="button" onclick="formData()" value="FormData">
                <input type="submit" value="글작성">
                <input type="reset" id="reset" value="취소">
                <input type="button" onclick="location.href='./boardlist'" value="글목록">
            </td>
        </tr>
    </table>
</form>

</body>
<script>
    ClassicEditor
        .create( document.querySelector('#b_contents'), {
        } )
        .then( editor => {
            window.editor = editor;
        } )
        .catch( err => {
            console.error( err.stack );
        } );
</script>
</html>
