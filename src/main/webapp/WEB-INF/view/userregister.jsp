<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
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
                    <h3 class="text-center my-3">Регистрация пользователя</h3>
            <form action="userregister" method="post">
           
           <div class="form-group">
                     <label for="name">Имя</label>
                     <input type="text" class="form-control" id="firstname" aria-describedby="emailHelp" name="firstname" placeholder="Введи имя.." required>
                 </div>
                 
                  <div class="form-group">
                     <label for="name">Фамилия</label>
                     <input type="text" class="form-control" id="lastname" aria-describedby="emailHelp" name="lastname" placeholder="Введи фамилию.." required>
                 </div>
             
                 <div class="form-group">
                     <label for="email">Почта</label>
                     <input type="email" class="form-control" id="emailid" aria-describedby="emailHelp" name="emailid" placeholder="Введи почту.." required>
                 </div>
           
          
                  <div class="form-group">
                     <label for="email">Телефон</label>
                     <input type="number" class="form-control" id="mobileno" aria-describedby="emailHelp" name="mobileno" placeholder="Введи номер телефона.." required>
                 </div>
                 
                  <div class="form-group">
                     <label for="name">Улица</label>
                     <input type="text" class="form-control" id="street" aria-describedby="emailHelp" name="street" placeholder="Введи почту.." required>
                 </div>
                 
             
                 <div class="form-group">
                     <label for="name">Город</label>
                     <input type="text" class="form-control" id="city" aria-describedby="emailHelp" name="city" placeholder="Введи город.." required>
                 </div>
                 
                 <div class="form-group">
                     <label for="email">Пинкод</label>
                     <input type="number" class="form-control" id="pincode" aria-describedby="emailHelp" name="pincode" placeholder="Введи пинкод.." required>
                 </div>
              
               
                 <div class="form-group">
                     <label for="password">Пароль</label>
                     <input type="password" class="form-control" id="password" aria-describedby="emailHelp" name="password" placeholder="Введи пароль.." required>
                     <small id="passwordHelpInline" class="text-muted">
                        Должно быть 8-20 символов в длину.
                     </small>
                 </div>
             
                <div class="container text-center">
                      <button class="btn custom-bg text-color"><b>Зарегистрироваться</b></button>
                 </div>
                 
            </form>
                </div>
            </div>
           
            
       </div>
  </div>
</div>
</body>
</html>