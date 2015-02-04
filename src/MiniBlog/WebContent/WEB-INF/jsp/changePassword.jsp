<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<div class="clearfix"></div>
	<div class="container">
		<div class="row" style="margin-top:10px;">
			<ol class="breadcrumb">
				<li><a href="${pageContext.request.contextPath}/">Home</a></li>
				<li><a href="${pageContext.request.contextPath}/edit/${sessionScope.user_loged_in}">My Account</a></li>
				<li class="active">Change password</li>
			</ol>
			<!--Content-->
			<div class="container">
				<div class="row">
					<div class="col-md-3"></div>
					<div class="col-md-6">
						<form:form role="form" method="POST" action="${pageContext.request.contextPath}/changepassword"  >
						<c:if test="${!empty error}">
						${error}
						<c:choose>
   							<c:when test="${error == 'false'}" >
								<div class="alert alert-success" role="alert">
									<button type="button" class="close" data-dismiss="alert">
										<span aria-hidden="true">&times;</span>
										<span class="sr-only">Close</span>
									</button>
									Change your password successfully
								</div>
							</c:when>
   							<c:otherwise>
								<div class="alert alert-danger" role="alert">
									<button type="button" class="close" data-dismiss="alert">
										<span aria-hidden="true">&times;</span>
										<span class="sr-only">Close</span>
									</button>
									Change your password unsuccessfully:<br/>
									- ${error}<br/>
									
								</div>
							</c:otherwise>
						</c:choose>
						</c:if>
							<div class="form-group">
								<label for="current-password">Current</label>
								<input type="password" class="form-control" name="currentpassword" placeholder="Enter your current password">
							</div>
							<div class="form-group">
								<label for="new-password">New</label>
								<input type="password" class="form-control" name="newpassword" placeholder="Enter your new password">
							</div>
							<div class="form-group">
								<label for="retype-password">Retype</label>
								<input type="password" class="form-control" name="retypepassword" placeholder="Retype your new password">
							</div>
							<div class="form-group pull-right">
								<button type="submit" class="btn btn-default">Save</button>
								<button type="RESET" class="btn btn-primary">Cancel</button>
							</div>
						</form:form>
					</div>
				</div>
			</div>
   		</div>
   </div>
<!--End Content-->
