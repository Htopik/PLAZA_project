<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<link
        rel="shortcut icon"
        href="resources/images/favicon-32x32.png"
        type="image/png"
/>
<%@ page import ="java.sql.*"%>
<%@ page import ="java.util.Date"%>
<%@ page import ="java.util.*"%>
<%@ page import ="java.text.SimpleDateFormat"%>
<%@ page import ="java.text.DateFormat"%>
<%@ page import ="java.time.LocalDate"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PLAZA</title>
<%@ include file="./components/common_cs_js.jsp"%>
</head>
<body>
<%@ include file="./components/navbar.jsp"%>
<div class="container-fluid">
  <div class="row mt-4">
       <form class="form-inline ml-5" action="searchorderbyid">
          <div class="form-group">
            <label for="inputPassword2" class="text-color"><h4>Поиск по ID заказа</h4></label>
            <input type="text" class="form-control ml-3" id="inputPassword2" name="orderid" placeholder="Введите Id заказа..">
          </div>
          <button type="submit" class="btn text-color custom-bg ml-2">Найти</button>
       </form>
 
       <a href="searchorderbydate?orderdate=<%=LocalDate.now().toString()%>&userid=<%=user.getId()%>" class="ml-2"><button class="btn text-color custom-bg ml-2">Сегодняшние заказы</button></a>
  </div>
  <div class="table-responsive">
          <table class="table">
  <thead class="custom-bg text-color">
    <tr>
      <th scope="col">Id Заказа</th>
      <th scope="col">User Id</th>
      <th scope="col">Имя</th>
      <th scope="col">Почта</th>
      <th scope="col">Номер</th>
      <th scope="col">Изображение</th>
      <th scope="col">Название</th>
      <th scope="col">Количество</th>
      <th scope="col">Цена</th>
      <th scope="col">Дата заказа</th>
      <th scope="col">Дата доставки</th>
      <th scope="col">Статус доставки</th>
    </tr>
  </thead>
  
   <%
      List<Orders> listOfOrders = new ArrayList<>();
   
      listOfOrders = (List<Orders>)request.getAttribute("orders");
       
      if(listOfOrders != null ) {
          for(Orders o : listOfOrders) {
                 
           	  
           	  Optional<Food> of = foodDao.findById(o.getFoodId());
                 Food f = null;
                 
                 if(of.isPresent()) {
               	  f = of.get();
                 }
           	  
                 Optional<User> ou = userDao.findById(o.getUserId());
                 User u = null;
                 
                 if(of.isPresent()) {
               	  u = ou.get();
                 }
           	  
      %>
  <tbody>
    <tr class="text-center">
      <td class="mid-align"><%=o.getOrderId() %></td>
      <td class="mid-align"><%=u.getId() %></td>
      <td class="mid-align"><%=u.getFirstname() %></td>
      <td class="mid-align"><%=u.getEmailid() %></td>
      <td class="mid-align"><%=u.getMobileno() %></td>
      <td><img style="max-height:100px;max-width:70px;width:auto;" class="img-fluid mx-auto d-block" src="resources/productpic/<%=f.getImagePath() %>" alt="users_pic" ></td>
      <td class="mid-align"><%=f.getName() %></td>
      <td class="mid-align"><%=o.getQuantity() %></td>
      <td class="mid-align"><%= (new Helper().getFoodSellingPrice(f.getPrice(), f.getDiscount())) * o.getQuantity() %></td>
      <td class="mid-align"><%=o.getOrderDate() %></td>
      <td class="mid-align"><%=o.getDeliveryDate() %></td>
      <td class="mid-align"><%=o.getDeliveryStatus() %></td>
    </tr>
  </tbody>
    <%
          }
      }
    %>
</table>
   </div>
</div>

</body>
</html>