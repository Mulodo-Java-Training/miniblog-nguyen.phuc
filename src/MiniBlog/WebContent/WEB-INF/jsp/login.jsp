<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>Login</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/res/css/bootstrap.css">

</head>
<body>





	<div class="container-fluid"
		style="background-color: #28AAE0; border-color: #28AAE0;">
		<div class="container">
			<div class="navbar-header col-md-3">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span
						class="glyphicon glyphicon-align-justify" style="color: #fff"></span>
				</button>
				<a class="logo" href="index.html">Mini Blog</a>
			</div>
			<div class="col-md-5" style="margin-top: 8px;">
				<form role="form">

					<div class="input-group">
						<input name="word" class="form-control"
							placeholder="Firstname, Lastname, Username" type="text">
						<span class="input-group-btn"> <input
							class="btn btn-primary" value="Search" type="submit">
						</span>

					</div>
					<!-- /input-group -->

				</form>
			</div>
			<div id="navbar" class="navbar-collapse collapse col-md-4">

				<ul class="nav navbar-nav navbar-right">
					<li><a href="list-all-posts.html">Blog</a></li>
					<li class="active"><a href="#about">Login</a></li>

				</ul>
			</div>
		</div>
	</div>
	<div class="clearfix"></div>
	<div class="container">
		<div class="row" style="margin-top: 10px;">
			<ol class="breadcrumb">
				<li><a href="index.html">Home</a></li>
				<li>Login</li>
			</ol>
			<!--Content-->
			<div class="container">
				<div class="row">
					<div class="col-md-3"></div>
					<div class="col-md-6">
						<form:form role="form" style="margin-top: 100px;" method="post"
							commandName="userLogin">
							<!--<div class="alert alert-success" role="alert">Login success</div>-->
							<div class="alert alert-danger" role="alert">
								<c:out value="${message}" />

								<form:errors path="username" cssClass="error" />
								<br>
								<form:errors path="password" cssClass="error" />
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Username</label>
								<form:input path="username" class="form-control"
									id="exampleInputEmail1" placeholder="Enter username" />
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label>
								<form:input type="password" class="form-control" path="password"
									id="exampleInputPassword1" placeholder="Enter password" />
							</div>
							<button type="submit" class="btn btn-default">Login</button>

						</form:form>
					</div>
				</div>
			</div>
			<!--End Content-->

		</div>

		<script type="text/javascript"
			src="${pageContext.request.contextPath}/res/js/jquery.js"></script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath}/res/js/bootstrap.js"></script>
	</div>
</body>
</html>