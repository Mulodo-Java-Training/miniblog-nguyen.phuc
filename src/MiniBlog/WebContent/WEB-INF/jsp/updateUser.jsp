<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="/WEB-INF/jsp/includes.jsp"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="com.blog.model.User"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>UpdaeUserInfo</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/res/css/bootstrap.css">

<style>
.styled-select {
	height: 30px;
}

/*Blue style*/
.blue {
	color: #2FADE0;
}

.blue-border {
	border: 1px solid #28AAE0;
}

.no-blue-border-top {
	border-top: 1px solid #28AAE0;
	border-right: 1px solid #28AAE0;
	border-left: 1px solid #28AAE0;
	border-bottom: none;
}

.blue-tab {
	border-radius: 0px;
	padding-right: 45px;
	padding-left: 45px;
}

/*Upload image*/
.fileUpload {
	overflow: hidden;
	position: absolute;
	width: 140px;
	left: 20px;
	top: 111px;
	border-radius: 0px;
}

.fileUpload input.upload {
	position: absolute;
	top: 0;
	right: 0;
	margin: 0;
	padding: 0;
	font-size: 20px;
	cursor: pointer;
	opacity: 0;
	filter: alpha(opacity = 0);
}
</style>
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
				<form role="form" action="searchUser.html">
					<div class="input-group">
						<input name="word" class="form-control" value="" type="text">
						<span class="input-group-btn"> <input
							class="btn btn-primary" value="Search" type="submit">
						</span>
					</div>
					<!-- /input-group -->
				</form>
			</div>

			<div id="navbar" class="navbar-collapse collapse col-md-4">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#">Blog</a></li>
					<li class="dropdown active"><a href="#"
						class="dropdown-toggle" data-toggle="dropdown" role="button"
						aria-expanded="true">My Account<span class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="UpdateUserInfo.html">Update Info</a></li>
							<li><a href="change-password.html">Change Password</a></li>
							<li><a href="manage-post.html">Manage Post</a></li>
							<li><a href="index.html">Log out</a></li>
						</ul></li>
				</ul>
			</div>

		</div>
	</div>

	<div class="clearfix"></div>

	<div class="container">
		<div class="row" style="margin-top: 10px;">
			<ol class="breadcrumb">
				<li><a href="index.html">Home</a></li>
				<li><a href="#">My Account</a></li>
				<li class="active">Update User's Information</li>
			</ol>

			<!--Content-->
			<div class="container-fluid"
				style="padding-top: 15px; padding-bottom: 20px">
				<div class="alert alert-success" role="alert"
					style="margin-top: 5px;">
					<button type="button" class="close" data-dismiss="alert">
						<span aria-hidden="true">&times;</span> <span class="sr-only">Close</span>
					</button>
					You have updated successfully
				</div>
				<div class="alert alert-danger" role="alert"
					style="margin-top: 5px;">
					<button type="button" class="close" data-dismiss="alert">
						<span aria-hidden="true">&times;</span> <span class="sr-only">Close</span>
					</button>
					You have updated unsuccessfully
				</div>
				<form:form class="form-horizontal" role="form" method="post"
					commandName="userinfo">
					<div class="row">
						<div class="col-md-12">
							<span class="btn btn-primary blue-tab no-blue-border-top">Basic
								info</span>
						</div>
					</div>


					<div class="container-fluid blue-border">
						<div class="col-md-6 col-md-offset-1" style="margin-top: 10px">
							<div class="form-group">
								<label for="first-name" class="col-md-3 control-label">First
									name</label>
								<div class="col-md-9">
									<form:input path="firstName" 
										type="text" class="form-control" id="first-name"/>
								</div>
							</div>
							<div class="form-group">
								<label for="last-name" class="col-md-3 control-label">Last
									name</label>
								<div class="col-md-9">
									<form:input path="lastName" 
										type="text" class="form-control" id="last-name"/>
								</div>
							</div>
							<div class="form-group">
								<label for="gender" class="col-md-3 control-label">Gender</label>
								<div class="col-md-9">
									<select class="styled-select" name="gender" id="gender">
										<option value="0">Female</option>
										<option value="1" selected="true">Male</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label for="birthday" class="col-md-3 control-label">Birthday</label>
								<div class="col-md-9" style="display: inline-flex">
									<select class="styled-select" name="day" id="birthday">
										<option value="0">Day</option>
										<%  
										
									     Calendar cal = Calendar.getInstance();
										User userinfo = (User)request.getAttribute("userinfo");
									    cal.setTime(userinfo.getBirthday());
									    int day = cal.get(Calendar.DAY_OF_MONTH);
									   // int day=4;
										String str;
										for(int i=1; i<31; i++){
											if(i==day)
											{
												str = String.format("<option value='%d' selected='true'>%d</option>",i,i);
											}
											else
											{
												str = String.format("<option value='%d'>%d</option>",i,i);
											}

								              out.print(str);
								         } %>


									</select> <select class="styled-select" name="month" id="birthday">
										<option value="0">Month</option>
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
										<option value="5">5</option>
										<option value="6">6</option>
										<option value="7">7</option>
										<option value="8">8</option>
										<option value="9">9</option>
										<option value="10" selected="true">10</option>
										<option value="11">11</option>
										<option value="12">12</option>
									</select> <select class="styled-select" name="year" id="birthday">
										<option value="0">Year</option>
										<option value="1987">1987</option>
										<option value="1988">1988</option>
										<option value="1989">1989</option>
										<option value="1990">1990</option>
										<option value="1991" selected="true">1991</option>
										<option value="1992">1992</option>
										<option value="1993">1993</option>
										<option value="1994">1994</option>
										<option value="1995">1995</option>
										<option value="1996">1996</option>
									</select>
								</div>
							</div>
						</div>

						<div class="col-md-3" style="margin-top: 10px">
							<div class="fileUpload btn btn-primary">
								<span>Change Avatar</span> <input
									onchange="handlerInputFileChange(this)" class="upload"
									type="file">
							</div>

							<img id="image-upload" class="img-thumbnail"
								style="width: 150px; height: 150px;"
								src="${pageContext.request.contextPath}/res/img/${userinfo.avatar}"
								alt="Avatar User" />
						</div>
					</div>

					<div class="row" style="margin-top: 20px;">
						<div class="col-md-12">
							<span class="btn btn-primary blue-tab no-blue-border-top">Contact
								info</span>
						</div>
					</div>


					<div class="container-fluid blue-border">
						<div class="col-md-6 col-md-offset-1" style="margin-top: 10px">
							<div class="form-group">
								<label for="address" class="col-md-3 control-label">Addreess</label>
								<div class="col-md-9">
									<form:input path="address"
										 type="text"
										class="form-control" id="address" />
								</div>
							</div>

							<div class="form-group">
								<label for="city" class="col-md-3 control-label">City</label>
								<div class="col-md-9">
									<select class="styled-select" name="gender" id="city">
										<option value="Ho Chi Minh" selected="true">Ho Chi
											Minh</option>
										<option value="Da Nang">Da Nang</option>
										<option value="Ha Noi">Ha Noi</option>
									</select>
								</div>
							</div>

							<div class="form-group">
								<label for="email" class="col-md-3 control-label">Email</label>
								<div class="col-md-9">
									<form:input path="email"
										 type="email"
										class="form-control" id="email" />
								</div>
							</div>

							<div class="form-group">
								<label for="mobile" class="col-md-3 control-label">Mobile</label>
								<div class="col-md-9">
									<form:input path="mobile"
										 type="text"
										class="form-control" id="mobile" />
								</div>
							</div>
						</div>
					</div>

					<div class="row" style="margin-top: 20px">
						<div class="col-md-12">
							<span class="btn btn-primary blue-tab no-blue-border-top">Comfirm</span>
						</div>
					</div>
					<div class="container-fluid blue-border">
						<div class="col-md-12"
							style="margin-top: 10px; margin-bottom: 10px; margin-left: auto; margin-right: auto; text-align: center">
							<button type="submit" class="btn btn-primary"
								style="border-radius: 0px;">OK</button>
							<button class="btn btn-primary" style="border-radius: 0px;">CANCEL</button>
						</div>
					</div>
				</form:form>
			</div>


		</div>
		<!--End Content-->
	</div>
	</div>


	<script type="text/javascript"
		src="${pageContext.request.contextPath}/res/js/jquery.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/res/js/bootstrap.js"></script>
	<script>
	$('#mobile').keypress(function(evt) {
		var theEvent = evt || window.event;
		var key = theEvent.keyCode || theEvent.which;
		key = String.fromCharCode( key );
		var regex = /[0-9]|\./;
		if( !regex.test(key) ) {
			theEvent.returnValue = false;
			if(theEvent.preventDefault) 
				theEvent.preventDefault();
		}
		if($(this).val().length-2 <= 11){
			$(this).val(function(i, text) {
				text = text.replace(/(\d\d\d\d)(\d\d\d\d)([0-9])/, "$1.$2.$3");
				return text;
			});
		}else{
			theEvent.returnValue = false;
			if(theEvent.preventDefault) 
				theEvent.preventDefault();
		}
	});
	
	function handlerInputFileChange(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();

			reader.onload = function (e) {
				$('#image-upload')
				.attr('src', e.target.result);
			};

			reader.readAsDataURL(input.files[0]);
		}
	}
</script>

</body>
</html>