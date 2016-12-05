<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<link rel="stylesheet" href="css/noteList.css" type="text/css"/>
<html>
<head>
    <title>Note Page</title>
    <script type="text/JavaScript"
            src="${pageContext.request.contextPath}/resources/js/jquery-1.9.1.min.js">
    </script>

    <script type="text/javascript">
        function doAjax() {

            var inputText = $("#input_str").val();

            $.ajax({
                url: 'getCharNum',
                type: 'GET',
                dataType: 'json',
                contentType: 'application/json',
                mimeType: 'application/json',
                data: ({
                    text: inputText
                }),
                success: function (data) {

                    var result = '"' + data.text + '", ' + data.count + ' characters';
                    $("#result_text").text(result);
                }
            });
        }
    </script>
</head>
<body>
<br/>
<br/>

<h1>Note List</h1>

<%--<c:if test="${!empty listNotes}">--%>
<div>
    <div>
        <div style="padding: 0px 4px 4px 4px; float: left">
            <c:forEach items="${listNotes}" var="note">
                <div class="notesList">
                    <a href="/notedata/${note.id}">${note.noteTitle}</a>
                    <br/>
                    <a class="smallContext">${note.noteContent}</a>
                </div>
            </c:forEach>
        </div>
    </div>
    <div class="noteContext">
        <a> Some note text Some note textSome note textSome note textSome note textSome note textSome note textSome note
            textSome note textSome note textSome note textSome note textSome note textSome note textSome note textSome
            note textSome note textSome note textSome note textSome note textSome note textSome note textSome note
            textSome note textSome note textSome note textSome note textSome note textSome note textSome note textSome
            note text </a>
    </div>
</div>

<%--</c:if>--%>
<%--<jsp:forward page="addNote.jsp"/>--%>

<h3>Enter text:</h3>
<input id="input_str" type="text">
<input type="button" value="OK" onclick="doAjax()">
<p id="result_text"></p>
</body>
</html>
