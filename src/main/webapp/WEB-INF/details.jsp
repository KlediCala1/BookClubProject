<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Details Page For Viewer</title>
</head>
<body>
<div>
    <h1>Welcome,<c:out value="${user.username}"/></h1>
    <p>Added by: <c:out value="${book.user.username}"/></p>
    <p>Added on: <c:out value="${book.createdAt}"></c:out></p>
    <p>Last updated on: <c:out value="${book.updatedAt}"></c:out></p>
    <p>Description:<c:out value="${book.description}"/></p>
</div>
</body>
</html>