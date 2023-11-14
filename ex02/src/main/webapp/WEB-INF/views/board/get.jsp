<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../include/header.jsp"%>

<div id="page-wrapper">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">Board Read</h1>
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">Board Read Page</div>
				<!-- /.panel-heading -->
				<div class="panel-body">
				
						<div class="form-group">
							<label for = "bno">Bno</label>
							<input class="form-control" name="bno" value="${board.bno}" readonly="readonly"/>
						</div>
						<div class="form-group">
							<label for = "title">Title</label>
							<input class="form-control" name="title" value="${board.title}" readonly="readonly"/>
						</div>
						<div class="form-group">
							<label for = "writer">Writer</label>
							<input class="form-control" name="writer" value="${board.writer}" readonly="readonly"/>
						</div>
						<div class="form-group">
							<label for = "content">Text area</label>
							<textarea class="form-control" name="content" col="3">${board.content}</textarea>
						</div>
						<div class="form-group">
							<button data-oper= "modify" class="btn btn-default">Modify</button>
							<button data-oper= "list" class="btn btn-info" >List</button>
						</div>
						<form id="operForm" action="/board/modify" method="get">
							<input type="hidden" id="bno" name = "bno" value="${board.bno}"/>
							<input type="hidden"  name = "pageNum" value="${cri.pageNum}"/>
							<input type="hidden"  name = "amount" value="${cri.amount}"/>
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
<script type="text/javascript">
$(document).ready(function(){
	var operForm = $("#operForm");
	$("button[data-oper='modify']").on("click", function(e){
		operForm.attr("action","/board/modify").submit();
	});
	
	$("button[data-oper='list']").on("click",function(e){
		operForm.find("#bno").remove();
		operForm.attr("action","/board/list").submit();
	});
	
})
</script>

<%@include file="../include/footer.jsp"%>
