<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link
        rel="shortcut icon"
        href="resources/images/favicon-32x32.png"
        type="image/png"
/>
<head>
<meta charset="UTF-8">
<title>PLAZA</title>
<%@ include file="./components/common_cs_js.jsp"%>
</head>
<body>
<%@ include file="./components/navbar.jsp"%>
<div class="container-fluid">
  <div class="row mt-2">
       <div class="col-md-4 offset-md-4 admin" >
            <div class="card">
                <%@ include file="./components/message.jsp"%>
                <%
                   String amount = (String)request.getAttribute("amount");
                %>
                <div class="card-body px-5">
                    <h3 class="text-center my-3">Страница оплаты</h3>
            <form action="order" method="post">
                 <div class="form-group">
                     <label for="email">Сумма</label>
                     <input type="text" class="form-control" id="username" aria-describedby="emailHelp" name="amount" value="<%=amount %>" требуется только для чтения>
                 </div>
        
                <div class="container text-center">
                      <button class="btn custom-bg text-color"><b>Оплатить и создать заказ</b></button>
                </div>
                 
            </form>
                </div>
            </div>
           
            
       </div>
  </div>
</div>
</body>
</html>