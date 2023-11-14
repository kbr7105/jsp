<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../include/header.jsp"%>

<div id="page-wrapper">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">Board List</h1>
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					Board List Page result => ${result}
					<button id="regBtn" type="button" class="btn btn-xs pull-right">Register
						New Board</button>
				</div>
				<!-- /.panel-heading -->
				<div class="panel-body">
					<table width="100%"
						class="table table-striped table-bordered table-hover"
						id="dataTables-example">
						<thead>
							<tr>
								<th>#번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>작성일</th>
								<th>수정일</th>
							</tr>
						</thead>
						<c:forEach items="${list}" var="list">
							<tbody>
								<tr class="odd gradeX">
									<td>${list.bno}</td>
									<td><a class="move" href="${list.bno}">${list.title}</a></td>
									<td>${list.writer}</td>
									<td class="center"><fmt:formatDate
											pattern="yyyy-MM-dd HH:mm" value="${list.regidate}" /></td>
									<td class="center"><fmt:formatDate
											pattern="yyyy-MM-dd HH:mm" value="${list.updatedate}" /></td>
								</tr>
							</tbody>
						</c:forEach>
					</table>

					<!-- 페이징 -->
					<div class="pull-right">
						<ul class="pagination">
						<c:if test="${pageMaker.prev}">
							<li class="page-item"><a class="page-link" href="${pageMaker.startPage-1}">Previous</a></li>
						</c:if>	
						<c:forEach begin="${pageMaker.startPage}"
							end="${pageMaker.endPage}" var="num">
							<li class="page-item" ${pageMaker.cri.pageNum == num? 'activate' : ''}>
								<a class="page-link" href="${num}">${num}</a>
							</li>
						</c:forEach>
						<c:if test="${pageMaker.next}">
							<li class="page-item"><a class="page-link" href="${pageMaker.endPage+1}">Next</a></li>
						</c:if>	
						</ul>
					</div>
					<form id="actionForm" action="/board/list" method="get">
						<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
						<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
					</form>

					<!-- 모달창 추가 -->
					<!-- The Modal -->
					<div class="modal" id="myModal">
						<div class="modal-dialog">
							<div class="modal-content">

								<!-- Modal Header -->
								<div class="modal-header">
									<h4 class="modal-title" id="myModalLabel">Modal Heading</h4>
									<button type="button" class="close" data-dismiss="modal">&times;</button>
								</div>

								<!-- Modal body -->
								<div class="modal-body">처리가 완료되었습니다.</div>

								<!-- Modal footer -->
								<div class="modal-footer">
									<button type="button" class="btn btn-danger"
										data-dismiss="modal">Close</button>
								</div>

							</div>
						</div>
					</div>


				</div>
				<!-- /.panel-body -->
			</div>
			<!-- /.panel -->
		</div>
		<!-- /.col-lg-12 -->
	</div>

</div>
<!-- /#page-wrapper -->
<!-- 폼파일 1개를 만들고 상황에 따라 form.append로 추가사항 append + form.attr 속성 및 get/post 변경 -->
<script type="text/javascript">
	$(document).ready(
			function() {
				var result = '<c:out value="${result}"/>';
				checkModal(result);
				history.replaceState({}, null, null);

				function checkModal(result) {
					if (result === "" || history.state) {
						return;
					}
					if (parseInt(result) > 0) {
						$(".modal-body").html(
								"게시글" + parseInt(result) + "번이 등록되었습니다.");
					}
					$("#myModal").modal("show");
				}

				//register 호출
				$("#regBtn").on("click", function() {
					self.location = "/board/register";
				})
				
				
				//페이지 버튼 클릭 이동
				var actionForm = $("#actionForm");
				$(".page-item a").on("click",function(e){
					e.preventDefault();
					actionForm.find("input[name='pageNum']").val($(this).attr("href")); //클릭한 num 의 href value 값을 가져와 name=pageNum 의 val 값에 넣음
					actionForm.submit();
				});
				
				//조회 후 리스트페이지 이동 시 기본 pageNum 유지(detail 페이지로 이동하는 링크)
				$(".move").on("click",function(e){
					e.preventDefault();
					actionForm.append("<input type='hidden' name='bno' value='"+$(this).attr("href")+"'/>"); //bno값 input 추가
					actionForm.attr("action","/board/get"); //action 값 변경
					actionForm.submit(); //form 제출
				});
				
				
			});
	

</script>

<%@include file="../include/footer.jsp"%>
