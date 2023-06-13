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
                <div class="card-body px-5">
                    <img src="resources/images/registerphoto.jpeg" class="rounded mx-auto d-block" alt="img" height="90px" width="90px">
                    <h3 class="text-center my-3">Логин Администратора</h3>
            <form action="adminlogin" method="post">
                 <div class="form-group">
                     <label for="email">Почта</label>
                     <input type="text" class="form-control" id="username" aria-describedby="emailHelp" name="emailid" placeholder="Enter email id.." required>
                 </div>
              
                 <div class="form-group">
                     <label for="password">Пароль</label>
                     <input type="password" class="form-control" id="password" aria-describedby="emailHelp" name="password" placeholder="Enter password.." required>
                     <small id="passwordHelpInline" class="text-muted">
                        Должно быть 8-20 символов в длину
                     </small>
                 </div>
        
                <div class="container text-center">
                      <button class="btn custom-bg text-color"><b>Войти</b></button>
                </div>
                 
            </form>
                </div>
            </div>
           
            
       </div>
  </div>
</div>
</body>
</html>