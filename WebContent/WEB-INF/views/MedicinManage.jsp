<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
body {
	padding-top: 100px;
}
.container-fluid{
	padding-bottom: 100px;
}
td{
	float: inherit;
}
</style>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-offset-3 col-md-6">
			<div class="row">
				<div class="col-md-12">
					<div>
						<header>
							<h1>의약품 상세정보</h1>
						</header>
					</div>
					<table class="table">
						<tr>
							<th colspan="3" style="text-align: center;"><h3>${info["ITEM_NAME"]}</h3></th>
						</tr>
						<tr>
							<td><h4>제조사</h4></td>
							<td>${info["ENTP_NAME"]}</td>
							<td rowspan="3"><img style="width: 300px; height: 200px;"
								alt="약품 이미지" src="${info['ITEM_IMAGE'] }" /></td>
						</tr>
						<tr>
							<td><h4>성상</h4></td>
							<td>${info["CHART"]}</td>
						</tr>
						<tr>
							<td><h4>모양</h4></td>
							<td>${info["DRUG_SHAPE"]}</td>
						</tr>
						<tr>
							<td colspan="3"><h4>원료약품 및 분량</h4></td>
						</tr>
						<tr>
							<td colspan="3">${info['MATERIAL_NAME']}</td>
						</tr>
						<tr>
							<td colspan="3"><h4>효능/효과</h4></td>
						</tr>
						<tr>
							<td colspan="3">${info['EE_DOC']}</td>
						</tr>
						<tr>
							<td colspan="3"><h4>용법/용량</h4></td>
						</tr>
						<tr>
							<td colspan="3">${info['UD_DOC']}</td>
						</tr>
						<tr>
							<td colspan="3"><h4>사용상의 주의사항</h4></td>
						</tr>
						<tr>
							<td colspan="3">${info['NB_DOC']}</td>
						</tr>
						<tr>
							<td colspan="3"><h4>기타정보</h4></td>
						</tr>
						<tr>
							<td colspan="3">
							보관방법: ${info['STORAGE_METHOD']}
						</br> 유효기간: ${info['VALID_TERM'] }</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>