<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@ page import ="com.onlinefoodorder.model.*"%>
<%@ page import="com.onlinefoodorder.utility.*"%>
<%@ page import="com.onlinefoodorder.dao.*"%>
<%@ page import ="org.springframework.context.ApplicationContext"%>
<%@ page import ="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@ page import ="java.sql.*"%>
<%@ page import ="java.util.*"%>
<link
        rel="shortcut icon"
        href="resources/images/favicon-32x32.png"
        type="image/png"
/>
<%

String userType=(String)session.getAttribute("user-login");
Admin admin = null;
User user = null ;
if(userType != null && userType.equals("admin")){
	 admin = (Admin) session.getAttribute("active-user");
}

else if(userType != null && userType.equals("user")){
	 user= (User)session.getAttribute("active-user");
}

ApplicationContext context =  WebApplicationContextUtils.getWebApplicationContext(getServletContext());
CategoryDao categoryDao = context.getBean(CategoryDao.class);
CartDao cartDao = context.getBean(CartDao.class);
FoodDao foodDao = context.getBean(FoodDao.class);
UserDao userDao =context.getBean(UserDao.class);
OrderDao orderDao =context.getBean(OrderDao.class);
      
%>

<nav class="navbar navbar-expand-lg navbar-dark custom-bg">

<div class="container-fluid">
  <img src="resources/images/mainlogo.png" width="35" height="35" class="d-inline-block align-top" alt="">
  <a class="navbar-brand" href="/"><h3 class="text-color"><i>PLAZA</i></h3></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
    
    
    <%
        	 if(userType != null && userType.equals("admin"))
        	 {
    %>
                 <li class="nav-item active">
                    <a class="nav-link" href="admindashboard"><b class="text-color">Администраторская</b> <span class="sr-only">(current)</span></a>
                 </li>
    <%
        	 }
    %>
      <li class="nav-item active dropdown text-color">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
         <b class="text-color"> Категории</b>
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="category?categoryId=0" >All</a>
               <%
                    for(Category c: categoryDao.findAll())
                    {    	
               %> 
                         <a class="dropdown-item" href="category?categoryId=<%=c.getId() %>"><%=c.getName() %></a>     
               <%
                    }
               %>
          
        </div>
      </li>
      
      <li class="nav-item active text-color ml-2" data-toggle="modal" data-target=".aboutusmodal">
          <div class="nav-link" ><b class="text-color">О нас</b></div>
      </li>
      
      <li class="nav-item active text-color ml-2" data-toggle="modal" data-target=".contactusmodal">
          <div class="nav-link" ><b class="text-color">Свяжитесь с нами</b></div>
      </li>
     
    </ul>
    
    <form class="form-inline my-2 my-lg-0" action="searchfood">
      <input class="form-control mr-sm-2" type="text" placeholder="Search Food" aria-label="Search" size="40" name="foodname">
      <button type="submit" class="btn btn-light text-color"><b>Поиск</b></button>
    </form>
    
    
        <%
           if(userType != null) {
        %>
          <ul class="navbar-nav ml-auto">
              
              <%
                  if(userType.equals("user"))
                  {	  
              %>
                     <li class="nav-item active" data-toggle="modal" data-target="#showmycartmodal">
                        <div class="nav-link text-color"><img src="resources/images/cart.png" style="width:23px;" alt="img"></div>
                     </li> 
                     
                     <li class="nav-item active text-color">
                        <a class="nav-link" href="myorder"><b class="text-color">Мои заказы</b></a>
                     </li>
            
              <%
                  }
             %> 
           
             
             <li class="nav-item active text-color" data-toggle="modal" data-target=".logout-modal">
               <a class="nav-link" href="#" ><b class="text-color">Выйти</b></a>
             </li> 
              
               
              </ul>   
              <%
             
           }     
              
                    
        else
        {
    %>
      <ul class="navbar-nav ml-auto text-color">
    
      <li class="nav-item active text-color">
        <a class="nav-link" href="userregister"><b class="text-color">Зарегистрироваться</b></a>
      </li>  
      
      <li class="nav-item text-color active">
        <a class="nav-link" href="userlogin"><b class="text-color">Войти</b></a>
      </li>    
    </ul>
    
    <%
        }
    %>     
    
  </div>
  </div>
</nav>

<!-- show my cart modal -->

<div class="modal fade" id="showmycartmodal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header custom-bg text-white text-center">
        <h5 class="modal-title" id="exampleModalLongTitle" >Корзина</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
     <%
      if(user!=null)
      {
    	  List<Cart> l= cartDao.findByUserId(user.getId());
    	 
     %>
      <div class="modal-body">
        
        <%
            if(l.isEmpty())
            {
        %>
        <div class="text-center">
        <h1>Ваша корзина пуста, сэр.</h1>
        <hr>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Закрыть</button>
        </div>
        <%
            }
        
            else
            {
            	
            	
        %>
        <div class="table-responsive">
          <table class="table">
  <thead class="custom-bg text-white">
    <tr>
      <th scope="col">Изображение блюда</th>
      <th scope="col">Название</th>
      <th scope="col">Описание</th>
      <th scope="col">Количество</th>
      <th scope="col">Цена</th>
      <th scope="col">Дата</th>
      <th scope="col">Статус</th>
    </tr>
  </thead>
  
 
  
  <tbody>

   <%
       double totalCartPrice = 0;
      List<Integer> listOfFoodId = new ArrayList<>();
     
      for(Cart c:l)
      {
    	  int foodId=c.getFoodId();
    	  Optional<Food> optional = foodDao.findById(foodId);
    	  Food f = null;
    	  if(optional.isPresent()) {
    		  f = optional.get();
    	  }
    	  
    	  double foodPrice = Helper.getFoodSellingPrice(f.getPrice(), f.getDiscount());
    	  double cartPrice = foodPrice * c.getQuantity();
    	  
    	  totalCartPrice = totalCartPrice + cartPrice;
     	  
    	  listOfFoodId.add(f.getId());
   %>
    <tr class="text-center">
      <td><img style="max-height:100px;max-width:70px;width:auto;" class="img-fluid mx-auto d-block" src="resources/productpic/<%=f.getImagePath()%>" alt="users_pic" ></td>
      <td class="mid-align"><%=f.getName() %></td>
      <td class="mid-align"><%=f.getDescription() %></td>
      <td class="mid-align"><%=c.getQuantity() %></td>
      <td class="mid-align"><%=Helper.getFoodSellingPrice(f.getPrice(), f.getDiscount()) %></td>
      <td class="mid-align"><%=c.getDate() %></td>
      <td class="mid-align"><a href="deletecart?cartId=<%=c.getId()%>"><button type="button" class="btn btn-danger">Удалить</button></a></td>
    </tr>
    <%
      }
    %>
  </tbody>
 
  
</table>
</div>
<hr>

<div class="text-right">
     <p style="font-size:25px;"><b>Общая сумма :₽<%= totalCartPrice %> </b></p>
</div>
<hr>
<div class="row">
      <form action="checkout" method="post">
           <input type="hidden" name="amount" value="<%=totalCartPrice%>">
          <input type="submit" class="btn custom-bg text-light ml-5" value="Checkout">
      </form>
      <button type="button" class="btn btn-secondary ml-5" data-dismiss="modal">Закрыть</button>
</div>

       <%
            }
       %>
         
      </div>
  <%
           
      }
  %>
    </div>
  </div>
</div>

<!--  -->

<!-- Logout modal -->

<div class="modal fade logout-modal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
    <div class="modal-header custom-bg text-white text-center">
        <h5 class="modal-title" id="exampleModalLongTitle" >Выйти</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
    </div>
    <div class="modal-body text-center">
            <h5>Выйти?</h5>
          
          <div class="text-center">
            <a href="logout"><button type="button" class="btn custom-bg text-white">Да</button></a>
            <button type="button" class="btn btn-secondary ml-5" data-dismiss="modal">Нет</button>
          </div> 
     </div>     
    </div>
  </div>
</div>

<!-- *********** -->

<!-- About us modal -->

<div class="modal fade aboutusmodal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
       <div class="modal-header custom-bg text-white text-center">
        <h5 class="modal-title text-color" id="exampleModalLongTitle" >О нас</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div> 
      <div class="modal-body">
        <div class="container">
        <p style="font-size:20px;">
          <b>
              Еда, которая доставляется в нужное время. Модный партнер по доставке еды.<br /> Твой спутник по голоду!
          </b>
        </p>
        </div>
      </div>
      <div class="modal-footer">
       <div class="text-center">
        <button type="button" class="btn custom-bg text-color" data-dismiss="modal">Закрыть</button>
       </div>
      </div>
    </div>
  </div>
</div>
<!-- ********** -->

<!-- Contact us modal -->

<div class="modal fade contactusmodal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
       <div class="modal-header custom-bg text-white text-center">
        <h5 class="modal-title text-color" id="exampleModalLongTitle" >Связаться с нами</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div> 
      <div class="modal-body">
        <div class="container text-center">
        <p style="font-size:23px;">
            <b>
                <img src="resources/images/phonee.png" style="width:27px;" alt="img"> +7 800 555 3535<br>
                <img src="resources/images/emaill.png" style="width:29px;" alt="img">bestindcods@gmail.com
            </b>
        </p>
        </div>
      </div>
      <div class="modal-footer">
       <div class="text-center">
        <button type="button" class="btn custom-bg text-color" data-dismiss="modal">Закрыть</button>
       </div>
      </div>
    </div>
  </div>
</div>
<!-- ********** -->

<!-- forget password modal -->

<div class="modal fade forgetpasswordmodal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header custom-bg text-white text-center">
        <h5 class="modal-title" id="exampleModalLongTitle" >Забыл пароль?</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <form action="forgetpassword" method="post">


  <div class="form">

    <div class="form-group ">
      <label for="inputPassword4">Почта</label>
      <input type="email" class="form-control" id="email" name="email">
    </div>
    <div class="form-group ">
      <label for="inputPassword4">Телефон</label>
      <input type="text" class="form-control" id="phone" name="phone">
    </div>
    <div class="form-group">
      <label for="inputPassword4">Новый пароль</label>
      <input type="password" class="form-control" id="pass" name="pass" >
    </div>

  </div>
 
  <div class="container text-center">
       
       <input type="submit" class="btn custom-bg text-light" value="Change">
       <button type="button" class="btn custom-bg text-light ml-5" data-dismiss="modal">Закрыть</button>
                                      
  </div>   
</form>
      </div>
    </div>
  </div>
</div>


<!--  -->