<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../include/header.jsp"%>

<div id="page-wrapper">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">Board Register</h1>
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">Board Register Page</div>
				<!-- /.panel-heading -->
				<div class="panel-body">
					<form role="from" method="post"> <!-- action="/board/register" -->
						<div class="form-group">
							<label for = "title">Title</label>
							<input class="form-control" name="title"/>
						</div>
						<div class="form-group">
							<label for = "writer">Writer</label>
							<input class="form-control" name="writer"/>
						</div>
						<div class="form-group">
							<label for = "content">Text area</label>
							<textarea class="form-control" name="content" col="3"></textarea>
						</div>
						<div class="form-group">
							<button type= "submit" class="btn btn-default">Submit</button>
							<button type= "reset" class="btn btn-danger" onclick="location.href='/board/list'">Reset</button>
						</div>
					</form>
				</div>
				<!-- /.panel-body -->
			</div>
			<!-- /.panel -->
		</div>
		<!-- /.col-lg-12 -->
	</div>

</div>
<!-- /#page-wrapper -->


<%@include file="../include/footer.jsp"%>
