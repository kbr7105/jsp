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
						<label for="bno">Bno</label> <input class="form-control"
							name="bno" value="${board.bno}" readonly="readonly" />
					</div>
					<div class="form-group">
						<label for="title">Title</label> <input class="form-control"
							name="title" value="${board.title}" readonly="readonly" />
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
						<button data-oper="modify" class="btn btn-default">Modify</button>
						<button data-oper="list" class="btn btn-info">List</button>
					</div>
					<form id="operForm" action="/board/modify" method="get">
						<input type="hidden" id="bno" name="bno" value="${board.bno}" />
						<input type="hidden" name="pageNum" value="${cri.pageNum}" /> <input
							type="hidden" name="amount" value="${cri.amount}" /> <input
							type="hidden" name="type" value="${cri.type}"> <input
							type="hidden" name="keyword" value="${cri.keyword}">
					</form>

				</div>
				<!-- /.panel-body -->
			</div>
			<!-- /.panel -->
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<!--  댓글 -->
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					<i class="fa fa-comments fa-fw"></i>Reply
					<button id="addReplyBtn" class="btn btn-primary btn-xs pull-right">
						New Reply</button>
				</div>
				<!-- /.panel-heading -->
				<div class="panel-body">
					<ul class="chat">
						<li class="left clearfix" data-rno="12">
							<div>
								<div class="header">
									<strong class="primary-font">user00</strong> <small
										class="pull-right text-muted">2018-01-01 13:13</small>
								</div>
								<p>Good job!</p>
							</div>
						</li>
					</ul>

				</div>
				<!-- /.panel-body -->
				<div class="panel-footer">
				</div>
			</div>
			<!-- /.panel -->
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<!--  새로운 댓글 모달창 -->
	<!-- The Modal -->
	<div class="modal" id="myModal">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title" id="myModalLabel">Reply Modal</h4>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<div class="form-group">
						<label>Reply</label> 
						<input class="form-control" name="reply" value="New Reply!" />
					</div>
					<div class="form-group">
						<label>Replyer</label> 
						<input class="form-control" name="replyer" value="Replyer" />
					</div>
					<div class="form-group">
						<label>Reply Date</label> 
						<input class="form-control" name="replyDate" value="" />
					</div>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button id="modalRegisterBtn" type="button" class="btn btn-primary">Register</button>
					<button id="modalMoBtn" type="button" class="btn btn-warning">Modify</button>
					<button id="modalRemoveBtn" type="button" class="btn btn-danger">Remove</button>
					<button id="modalCloseBtn" type="button" class="btn btn-info" data-dismiss="modal">Close</button>
				</div>

			</div>
		</div>
	</div>


</div>
<!-- /#page-wrapper -->
<script type="text/javascript" src="/resources/js/reply.js"></script>
<style>
	.chat >li : hover{
		cursor: pointer;
	}
</style>
<script type="text/javascript">
	/* 	$(document).ready(function(){
	 console.log(replyService);
	 }) */

	/* 	console.log("================");
	 console.log("js test"); */

	var bnoValue = "${board.bno}";
	var replyUL = $(".chat");
	console.log("bnoValue >>" + bnoValue);

	showList(1);

	function showList(page) {
		replyService.getList({
			bno : bnoValue,
			page : page || 1
		}, function(replyCnt, list) {
			console.log("page>>"+page);
			if(page == -1){
				pageNum = Math.ceil(replyCnt/10.0);
				showList(pageNum);
				return;
			}
			
			var str = "";
			if (list == null || list.length == 0) {
				replyUL.html("");
				return;
			}

			for (var i = 0, len = list.length || 0; i < len; i++) {
				str += "<li class='left clearfix' data-rno='"+list[i].rno+"'>";
				str += "<div><div class='header'>";
				str += "<strong class='primary-font'>" + list[i].replyer
						+ "</strong>";
				str += "<small class='pull-right text-muted'>"
						+ replyService.displayTime(list[i].replyDate)
						+ "</small>"
				str += "</div><p>" + list[i].reply + "</p>";
				str += "</div></li>";

			}
			replyUL.html(str);
			showReplyPage(replyCnt);
		});
	}
	
	
	var modal = $(".modal");
	var modalInputReply = modal.find("input[name='reply']");
	var modalInputReplyer = modal.find("input[name='replyer']");
	var modalInputReplyDate = modal.find("input[name='replyDate']");
	
	var modalRegisterBtn = $("#modalRegisterBtn");
	var modalMoBtn = $("#modalMoBtn");
	var modalRemoveBtn = $("#modalRemoveBtn");
	var modalCloseBtn = $("#modalCloseBtn");
	
	//댓글등록창 띄우기
	$("#addReplyBtn").on("click",function(e){
		modal.find("input").val("");
		modalInputReplyDate.closest("div").hide();
		modal.find("button[id !='modalCloseBtn']").hide();
		modalRegisterBtn.show();
		
		$(".modal").modal("show");
	});
	
	//댓글등록
	modalRegisterBtn.on("click",function(e){
		var reply = {bno : bnoValue, reply : modalInputReply.val(), replyer : modalInputReplyer.val()};
		replyService.add(reply, function(result){
			alert(result);
			modal.find("input").val();
			modal.modal("hide");
			
			//등록 후 댓글 리스트 재 호출(새로고침)
			showList(-1);
		})
	});
	
	//댓글 클릭 조회 이벤트
	$(".chat").on("click","li",function(e){
		var rno = $(this).data("rno");
		console.log("rno>>"+rno);
		
		replyService.get(rno, function(reply){
			console.log("reply>>>"+reply);
			modalInputReply.val(reply.reply);
			modalInputReplyer.val(reply.replyer).attr("readonly", "readonly");
			modalInputReplyDate.val(replyService.displayTime(reply.replyDate)).attr("readonly", "readonly");
			modal.data("rno", reply.rno);
			
			modal.find("button[id !='modalCloseBtn']").hide();
			modalMoBtn.show();
			modalRemoveBtn.show();
			
			$(".modal").modal("show");
		});
		
	});
	
	//댓글 수정
	modalMoBtn.on("click",function(e){
		var reply = {rno : modal.data("rno"), reply : modalInputReply.val()};
		
		replyService.update(reply,function(result){
			alert(result);
			modal.modal("hide");
			showList(pageNum);
		})
	})
	
	//댓글 삭제
	modalRemoveBtn.on("click",function(e){
		replyService.remove(modal.data("rno"),function(result){
			alert(result);
			modal.modal("hide");
			showList(pageNum);
		})
	});
	
	//댓글 페이징
	var pageNum = 1;
	var replyPageFooter = $(".panel-footer");
	
	function showReplyPage(replyCnt) {
		var endNum = Math.ceil(pageNum/10.0)*10;
		var startNum = endNum-9;
		var prev = startNum !=1;
		var next = false;
		if(endNum * 10 >=replyCnt){
			endNum = Math.ceil(replyCnt/10.0);
		}
		if(endNum * 10 < replyCnt){
			next = true;
		}
		
		var str = "<ul class='pagination pull-right'>";
		if(prev){
			str +="<li class='page-item'><a class='page-link' href='"+(startNum-1)+"'>Previous</a></li>";
		}
		for(var i = startNum; i<=endNum; i++){
			var active = pageNum ==i?"active" : "";
			str += "<li class='page-item "+active+"'><a class='page-link' href='"+i+"'>"+i+"</a></li>"
		}
		
		if(next){
			str +="<li class='page-item'><a class='page-link' href='"+(endNum+1)+"'>Next</a></li>";
		}
		
		str += "</ul>";
		console.log("str>>"+str);
		replyPageFooter.html(str);
	}
	
	//페이지 이동
	replyPageFooter.on("click","li a",function(e){
		e.preventDefault();
		
		var targetPageNum = $(this).attr("href");
		showList(targetPageNum);
	})
	
	

	/* 	replyService.add({reply : "js test", replyer : "tester", bno : bnoValue}
	 ,function(result){
	 alert("result : "+result);
	 }); */

	/* 	replyService.getList({bno : bnoValue, page : 1}, function(list){
	 for(var i = 0, len = list.length || 0; i<len ; i++){
	 console.log(list[i]);
	 }
	 }) */

	/* 	replyService.remove(11, function(data){
	 console.log(data);
	 if(data === "success") alert("removed");
	
	 },function(err){
	 alert("삭제 실패!! 에러 발생!!!");
	 }) */

	/* 	replyService.update({reply : "update", rno : 12}, function(data){
	 alert("수정완료 : "+data);
	 }, function(err){
	 alert("수정 실패!!" + err);
	 }) */

	/* 	replyService.get(10, function(data) {
	 console.log(data);
	 }, function(err){
	 console.log(err);
	 }) */
</script>

<script type="text/javascript">
	$(document).ready(function() {
		var operForm = $("#operForm");
		$("button[data-oper='modify']").on("click", function(e) {
			operForm.attr("action", "/board/modify").submit();
		});

		$("button[data-oper='list']").on("click", function(e) {
			operForm.find("#bno").remove();
			operForm.attr("action", "/board/list").submit();
		});

	})
</script>

<%@include file="../include/footer.jsp"%>
