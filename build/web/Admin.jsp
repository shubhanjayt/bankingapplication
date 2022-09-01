
<%@page import="java.util.Date"%>
<html>
    
   <body bgcolor="#E6E6FA" align="center">
        <h1> Admin Page
                 Welcome Dear :
            <%
        
            out.println(session.getAttribute("loginname"));
            out.println("           "+session.getAttribute("accountno"));            
        
              Date dt;
            dt=(Date)session.getAttribute("dat");
            out.println("<br>Last Access Time: "+dt);
                    
            dt=new Date();
            out.println("<br> Current Access Time "+dt);
            session.setAttribute("dat", dt);
            %>
        </h1>
        
        <a href="CreateAccount.jsp"> New Account </a> <br>
        <a href="ViewCustomer.jsp"> New Customers </a> <br>
         <a href="ViewStatement.jsp"> New Statement </a> <br>
         <a href="Deposite.jsp"> Deposit </a> <br>
         <a href="Withdraw.jsp"> Withdraw </a> <br>
         <a href="Transaction.jsp"> View Transaction </a> <br>   
    </body>
</html>
