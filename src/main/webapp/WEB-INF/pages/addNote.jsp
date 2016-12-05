<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<link rel="stylesheet" href="css/noteList.css" type="text/css"/>
<html>
<head>
    <title>Add Note</title>
</head>
<body>
<a href="../../index.jsp">Back to main menu</a>

<br/>
<br/>

<h1>Add Note</h1>

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
                <td>
                    <form:input path="id" readonly="true" size="8" disabled="true"/>
                    <form:hidden path="id"/>
                </td>
            </tr>
        </c:if>
        <tr>
            <td>
                <form:label path="noteTitle">
                    <spring:message text="Title"/>
                </form:label>
            </td>
            <td>
                <form:input path="noteTitle"/>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="noteContent">
                    <spring:message text="Content"/>
                </form:label>
            </td>
            <td>
                <form:input path="noteContent"/>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <c:if test="${!empty note.noteTitle}">
                    <input type="submit"
                           value="<spring:message text="Edit Note"/>"/>
                </c:if>
                <c:if test="${empty note.noteTitle}">
                    <input type="submit"
                           value="<spring:message text="Add Note"/>"/>
                </c:if>
            </td>
        </tr>
    </table>
</form:form>

</body>
</html>
