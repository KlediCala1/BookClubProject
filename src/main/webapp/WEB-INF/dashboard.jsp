<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Book Club</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
<div>
    <h1>Welcome,<c:out value="${user.username}"/></h1>
    <a href="/">Log out</a>
</div>
<h2>Add a New Book</h2>
<%--@elvariable id="newBook" type="javax"--%>
<form:form action="/books/new" method="post" modelAttribute="newBook">
    <div class="row border border-primary p-1">
        <div class="col border-end border-primary">
            <form:label path="title">Title: </form:label>
            <form:errors cssClass="text-danger" path="title"></form:errors>
        </div>
        <div class="col">
            <form:input cssClass="w-100" path="title"></form:input>
        </div>
    </div>
    <div class="row border border-primary p-1">
        <div class="col border-end border-primary">
            <form:label path="description">Description: </form:label>
            <form:errors cssClass="text-danger" path="description"></form:errors>
        </div>
        <div class="col">
            <form:input cssClass="w-100" path="description"></form:input>
        </div>
    </div>
    <input type="submit" value="Add"/>
</form:form>

<h2>All books</h2>
<c:forEach items="${allBooks}" var="book">
    <div>
        <a href="/books/${book.id}"><c:out value="${book.title}"/></a>
        <p>(added by ${book.user.username})</p>
    </div>
</c:forEach>

</body>
</html>