<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%@ include file="/WEB-INF/jsp/includes.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
	<title>Home</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/res/css/bootstrap.css">
</head>
<body>
	
	<div class="container-fluid" style="background-color: #28AAE0;border-color: #28AAE0;">
		<div class="container">
				<div class="navbar-header col-md-3">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
						<span class="sr-only">Toggle navigation</span>
						<span class="glyphicon glyphicon-align-justify" style="color:#fff"></span>
					</button>
					<a class="logo" href="index.html">Mini Blog</a>
				</div>
				<div class="col-md-5" style="margin-top: 8px;">
					<form role="form" action="searchUser.html">
						
					<div class="input-group">
						<input name="word" class="form-control txtSearch"  placeholder="Firstname, Lastname, Username" type="text">
						<span class="input-group-btn">
							<input class="btn btn-primary" value="Search" type="submit">
						</span>
		
					</div><!-- /input-group -->
			
					</form>
				</div>
				<div id="navbar" class="navbar-collapse collapse col-md-4">
	
					<ul class="nav navbar-nav navbar-right">
						<li><a href="list-all-posts.html">Blog</a></li>
						<li><a href="login.html">Login</a></li>
					</ul>
				</div>
		</div>
	</div>
	<div class="clearfix"></div>
	<div class="container">
		<div class="row" style="margin-top:10px;">
			<ol class="breadcrumb">
				<li><a href="index.html">Home</a></li>
			</ol>
			<!--Content-->
			<div class="container-fluid">
			
			<c:forEach items="${postList}" var="post">
	
				<div class="row">
				  <div class="col-md-2">
				    <a href="#">
				     <img data-holder-rendered="true" src="${post.image}" style="" class="img-responsive" alt="">
				    </a>	
				  </div>
				  <div class="col-md-4">
				 
				  	<div class="title"><a href="#">${post.title}</a></div>
				  	<div class="date"> ${post.created_at} | Author: <a href="listUserPost.html">${post.user_id}  </a></div>
				  	<div class="description">
				  		
				  		 
				  		  ${post.description}
				  	</div>
				  </div>
				  <div class="col-md-2">
				    <a href="#">
				     <img data-holder-rendered="true" src=" ${post.image}" style="" class="img-responsive" alt="">
				    </a>	
				  </div>
				  <div class="col-md-4">
				  	<div class="title"><a href="#">Blog 1</a></div>
				  	<div class="date">  ${post.created_at} | Author: <a href="listUserPost.html">${post.user_id}</a></div>
				  	<div class="description">
				  		 ${post.description}
				  	</div>
				  </div>
				</div><br>
				</c:forEach>
				
				
				
			</div>
			<!--End Content-->
		</div>

	<script type="text/javascript" src="${pageContext.request.contextPath}/res/js/jquery.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/res/js/bootstrap.js"></script>
	</div>
</body>
</html>