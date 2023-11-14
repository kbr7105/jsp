<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../include/header.jsp"%>

<div id="page-wrapper">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">Board Modify</h1>
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">Board Modify Page</div>
				<!-- /.panel-heading -->
				<div class="panel-body">
					<form role="from" method="post" action="/board/modify">
						<!-- action="/board/register" -->
						<input type="hidden" name="pageNum" value="${cri.pageNum}" /> 
						<input type="hidden" name="amount" value="${cri.amount}" />
						<input type="hidden" name="type" value="${cri.type}"/>
						<input type="hidden" name="keyword" value="${cri.keyword}"/>

						<div class="form-group">
							<label for="bno">Bno</label> <input class="form-control"
								name="bno" value="${board.bno}" readonly="readonly" />
						</div>
						<div class="form-group">
							<label for="title">Title</label> <input class="form-control"
								name="title" value="${board.title}" />
						</div>
						<div class="form-group">
							<label for="writer">Writer</label> <input class="form-control"
								name="writer" value="${board.writer}" readonly="readonly" />
						</div>
						<div class="form-group">
							<label for="content">Text area</label>
							<textarea class="form-control" name="content" col="3">${board.content}</textarea>
						</div>
						<div class="form-group">
							<!-- data-oper 의 속성에 따라 action값을 바꿔줘야 함 -->
							<button type="submit" data-oper="modify" class="btn btn-default">Modify</button>
							<button type="submit" data-oper="remove" class="btn btn-danger">Reset</button>
							<button type="submit" data-oper="list" class="btn btn-info">List</button>
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
<script type="text/javascript">
	$(document).ready(function() {
		var formObj = $("form"); //폼 전체
		$("button").on("click", function(e) { //$("button") 버튼태그 전체
			e.preventDefault();//이동중지
			var operation = $(this).data("oper"); //클릭한 버튼의 data("-뒤의 글자") 밸류값
			console.log(operation);
			if (operation === "remove") {
				formObj.attr("action", "/board/remove");
			} else if (operation === "list") {
				formObj.attr("action", "/board/list").attr("method", "get");
				var pageNumTag = $("input[name='pageNum']").clone();
				var amountTag = $("input[name='amount']").clone();
				var typeTag = $("input[name='type']").clone();
				var keywordTag = $("input[name='keyword']").clone();
				formObj.empty(); //필요없는 쿼리스트링 날려줌 -> 전부 날아가기 때문에 추가하고 싶은 쿼리는 추가로 다시 append			
				formObj.append(pageNumTag);
				formObj.append(amountTag);
				formObj.append(typeTag);
				formObj.append(keywordTag);
			}

			formObj.submit();
		});
	});
</script>

<%@include file="../include/footer.jsp"%>
