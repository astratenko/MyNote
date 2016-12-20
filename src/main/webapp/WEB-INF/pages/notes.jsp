<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<link rel="stylesheet" href="../css/noteList.css" type="text/css"/>
<html>
<head>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script type="text/javascript" src="../js/main.js"></script>
    <title>Note Page</title>
</head>
<body>
<br/>
<br/>
<h1>Welcome to notepad</h1>
<div>
    <div>
        <a href="javascript:PopUpShow()"><img src="../images/doc_add_one.png" width="25px" height="25px"/></a>
    </div>

    <div>
        <div>
            <div class="noteContextWindow" >
                <c:forEach items="${listNotes}" var="note">
                    <div class="notesList">
                        <a type="text" id="${note.id}" onclick="send()">${note.noteTitle}</a>
                        <%--<a href="/notedata/${note.id}">${note.noteTitle}</a>--%>
                        <br/>
                        <a class="contextInList">${note.noteContent}</a>
                    </div>
                </c:forEach>
            </div>
        </div>
        <div class="noteContext">
            <a id="notesFullTextDiv">  </a>
        </div>
    </div>
</div>

<%--Pop Up start--%>
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
                    <td>
                        <input type="submit" value="<spring:message text="Add Note"/>"/>
                    </td>
                </tr>
            </table>
        </form:form>
        <a href="javascript:PopUpHide()">Close</a>
    </div>
</div>

<%--Pop Up end--%>
</body>
</html>
