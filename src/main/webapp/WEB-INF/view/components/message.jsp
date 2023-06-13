<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<link
        rel="shortcut icon"
        href="resources/images/favicon-32x32.png"
        type="image/png"
/>
<%
    String status=(String)request.getAttribute("status");
    if(status != null)
    {
    	//out.print(message);
%>
    <div class="alert alert-success alert-dismissible fade show text-center" role="alert">
        <strong><%=status %></strong>
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
        </button>
   </div>
<%    		
    }
%>