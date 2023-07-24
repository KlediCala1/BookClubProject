<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Details Page For Creator</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
<div>
    <h1>Welcome,<c:out value="${user.username}"/></h1
    <a href="index.jsp">Log out</a>
</div>
<%--@elvariable id="book" type="javax"--%>
<form:form action="/books/${book.id}" method="post" modelAttribute="book">
<input type="hidden" name="_method" value="put">
    <div class="row border border-primary p-1">
        <div class="col border-end border-primary">
            <form:label path="title">Title: </form:label>
            <form:errors cssClass="text-danger" path="title"></form:errors>
        </div>
        <div class="col">
            <form:input cssClass="w-100" path="title"></form:input>
        </div>
    </div>
<p>Added by: <c:out value="${book.user.username}"/></p>
<p>Added on: <c:out value="${book.createdAt}"/></p>
<p>Last updated on: <c:out value="${book.updatedAt}"/></p>
    <div class="row border border-primary p-1">
        <div class="col border-end border-primary">
            <form:label path="description">Description: </form:label>
            <form:errors cssClass="text-danger" path="description"></form:errors>
        </div>
        <div class="col">
            <form:input cssClass="w-100" path="description"></form:input>
        </div>
    </div>
    <input type="submit" value="Update">
</form:form>
<form:form action="/books/${book.id}" method="post">
    <input type="hidden" name="_method" value="delete">
    <input type="submit" value="Delete">
</form:form>
</body>
</html>