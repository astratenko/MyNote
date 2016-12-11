<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<link rel="stylesheet" href="css/noteList.css" type="text/css"/>
<html>
<head>
    <script src="http://code.jquery.com/jquery-2.0.2.min.js"></script>
    <script type="text/javascript" src="WEB-INF/js/main,js"></script>
    <script>
        $(document).ready(function () {
            //Скрыть PopUp при загрузке страницы
            PopUpHide();
        });
        //Функция отображения PopUp
        function PopUpShow() {
            $("#popup1").show();
        }
        //Функция скрытия PopUp
        function PopUpHide() {
            $("#popup1").hide();
        }
    </script>
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
<div>
    <a href="javascript:PopUpShow()"><img src="../images/doc_add_one.png" width="25px" height="25px"/></a>
</div>
<div class="b-popup" id="popup1">
    <div class="b-popup-content">
        <c:url var="addAction" value="/notes/add"/>

        <form:form action="${addAction}" commandName="note">
            <table>
                <c:if test="${!empty note.noteTitle}">
                    <tr>
                        <td>
                            <form:label path="id">
                                <spring:message text="ID"/>
                            </form:label>
                        </td>

                    </tr>
                </c:if>
                <tr>
                    <td>
                        <form:label path="noteTitle">
                            <spring:message text="Give a name to the note"/>
                        </form:label>
                    </td>
                    <td>
                        <form:input path="noteTitle"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <form:label path="noteContent">
                            <spring:message text="Please enter some text"/>
                        </form:label>
                    </td>
                    <td style="height: 250px; width: 300px">
                        <form:input path="noteContent"/>
                    </td>
                </tr>

                <tr>
                    <td >
                        <%--<c:if test="${empty note.noteTitle}">--%>
                            <input type="submit" value="<spring:message text="Add Note"/>"/>
                       <%-- </c:if>--%>
                    </td>
                </tr>
            </table>
        </form:form>
        <a href="javascript:PopUpHide()">Close</a>
    </div>
</div>

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
