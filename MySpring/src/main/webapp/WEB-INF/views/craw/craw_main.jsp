<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <div class="craw">
     <input type="text" id="craw_id" name="craw_id" class="form-control" placeholder="ID 입력" style="width:300px;"/>
     <input type="button" id="craw_submit" name="craw_submit" class="btn btn-warning" value="조회"/>  
 </div>
 <div class="content_craw">
 </div>
 
 <script type="text/javascript">
     $("#craw_submit").click(function(){
         $.ajax({
             url :"/craw/craw_select.ajax",
             data :{
                 user_id : $("#craw_id").val(),
             },
             dataType : "json",
             type : "post",
             success:function(data){
                console.log(data.NameResult);
                console.log(data.PlayedResult);
                     $(".content_craw").append("<tr><th>"+data.NameResult+"</th><th>"+data.PlayedResult+"</th></tr>");    
                 
             }
         })
     })
 </script>
