<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login & Registration</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body class="p-4 bg-light">
<div class="d-flex justify-content-around w-100">
    <div class="container rounded" style="margin-right: 5%">
        <%--@elvariable id="newUser" type="javax"--%>
        <form:form action="/register" method="post" modelAttribute="newUser">

            <div class="row d-flex justify-content-center">
                <h2>Register: </h2>
            </div>

            <div class="row border border-primary p-1">
                <div class="col border-end border-primary">
                    <form:label path="username">Name: </form:label>
                    <form:errors cssClass="text-danger" path="username"></form:errors>
                </div>
                <div class="col">
                    <form:input cssClass="w-100" path="username"></form:input>
                </div>
            </div>

            <div class="row border border-primary p-1">
                <div class="col border-end border-primary">
                    <form:label path="email">Email: </form:label>
                    <form:errors cssClass="text-danger" path="email"></form:errors>
                </div>
                <div class="col">
                    <form:input cssClass="w-100" path="email"></form:input>
                </div>
            </div>

            <div class="row border border-primary p-1">
                <div class="col border-end border-primary">
                    <form:label path="password">Password: </form:label>
                    <form:errors cssClass="text-danger" path="password"></form:errors>
                </div>
                <div class="col">
                    <form:input cssClass="w-100" type="password" path="password"></form:input>
                </div>
            </div>

            <div class="row border border-primary p-1">
                <div class="col border-end border-primary">
                    <form:label path="confirm">Confirm Password: </form:label>
                    <form:errors cssClass="text-danger" path="confirm"></form:errors>
                </div>
                <div class="col">
                    <form:input cssClass="w-100" type="password" path="confirm"></form:input>
                </div>
            </div>

            <div class="d-flex justify-content-center row border border-primary p-1">
                <input class="w-50 btn btn-primary" type="submit" value="Sumbit">
            </div>
        </form:form>

    </div>
    <div class="container rounded" style="margin-left: 5%">
        <%--@elvariable id="newLogin" type="javax"--%>
        <form:form action="/login" method="post" modelAttribute="newLogin">

            <div class="row d-flex justify-content-center">
                <h2>Login: </h2>
            </div>


            <div class="row border border-primary p-1">
                <div class="col border-end border-primary">
                    <form:label path="email">Email: </form:label>
                    <form:errors cssClass="text-danger" path="email"></form:errors>
                </div>
                <div class="col">
                    <form:input cssClass="w-100" path="email"></form:input>
                </div>
            </div>

            <div class="row border border-primary p-1">
                <div class="col border-end border-primary">
                    <form:label path="password">Password: </form:label>
                    <form:errors cssClass="text-danger" path="password"></form:errors>
                </div>
                <div class="col">
                    <form:input cssClass="w-100" type="password" path="password"></form:input>
                </div>
            </div>

            <div class="d-flex justify-content-center row border border-primary p-1">
                <input class="w-50 btn btn-primary" type="submit" value="Sumbit">
            </div>
        </form:form>
    </div>
</div>
</body>
</html>