<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <html>
 <head>
<!--  <script src="jquery-3.6.0.js"></script> -->
<!--  <script src="jquery.min.js"></script> -->
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
 </head>
 <body>
 <div class="craw">
     <input type="text" id="craw_id" name="craw_id" class="form-control" placeholder="ID 입력" style="width:300px;"/>
     <input type="button" id="craw_submit" name="craw_submit" class="btn btn-warning" value="조회"/>  
 </div>
 
 
 <script type="text/javascript">
 	$(document).ready(function (){
 		alert("11");
 		$("#craw_submit").click(function() {
 			alert($("#craw_id").val());
         $.ajax({
             url :"craw_select",
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
         });
 		});
 	});
 </script>
 <div class="content_craw">
 </div>
 </body>
</html>