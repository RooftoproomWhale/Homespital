<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- SummerNote -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script src='<c:url value="/js/summernote/lang/summernote-ko-KR.js"/>'></script>
<style>
    .modal-backdrop {
        z-index: -1;
    }
</style>
<script>
$(document).ready(function() {
     $('#summernote').summernote({
        lang:'ko-KR',
        height: 500,                 // set editor height
        minHeight: null,             // set minimum height of editor
        maxHeight: null,             // set maximum height of editor
        focus: true
     });
     
     $('#button').click(function(){

        if($('#title').val()==''){
           alert('제목을 입력하세요');
           $('#title').focus();
           return;
        }
        console.log('내용'+$('#summernote').val());
//         if($('#summernote').val() == "" || $('#summernote').val() == "<p><br></p>" ){
//            alert('내용을 입력하세요');
//            $('#summernote').focus();
//            return;
//         }

       $('#frm').submit(); 
     });
          
});
</script>
   <div class="page-container">
      <div class="section__content section__content--p30"
         style="padding-top: 50px">
         <div class="container-fluid">
            <div class="row">
               <div class="col-lg-10 col-md-push-2">
                  <div class="card">
                     <div class="card-header">
                        <strong>공지사항 작성</strong>
                     </div>
                     <div class="card-body card-block">
                        <form id="frm" action='<c:url value="Noticeinsert.hst"/>' method="post" enctype="multipart/form-data" class="form-horizontal"> 
                           <div class="row form-group">
                              <div class="col-12 col-md-12">
                                 <input type="text" id="title" name="title" placeholder="제목" class="form-control"> 
                                 <small class="form-text text-muted"></small>
                                 <input type="hidden" id="user" name="mem_email" value="${user}"/>
                              </div>
                           </div>
                           <div class="row form-group">
                              <div style="text-align: center;line-height:32px;height:32px" class="col-md-1">   
                                 <label style="margin-bottom: 0" for="file-input" class=" form-control-label">파일 첨부</label>
                              </div>
                              <div class="col-md-11">
                                 <input type="file" id="upload" name="upload" class="form-control-file">
                              </div>
                           </div>
                           <div class="row form-group">
                              <div class="col-12 col-md-12">
                                 <textarea id="summernote" name="content" placeholder="내용"></textarea>
                              </div>
                           </div>
                           <div class="row">
                              <a id="button" style="color: white;" class="btn btn-primary btn-lg"><i class="fa fa-dot-circle-o"></i> 작성</a>
                           </div>
                        </form>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>