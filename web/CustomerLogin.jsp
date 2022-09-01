
<%@page import="java.util.Date"%>
<html>
    
    <body bgcolor="#E6E6FA" align="center">
        Welcome Dear
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
        <h1> Customer Login Page</h1>
        <a href="ViewProfileDBMS.jsp"> View Profile </a> <br>
        <a href="ChangePassword.jsp"> Change Password </a> <br>
         <a href="ViewStatement.jsp"> View Statement </a> <br>
         <a href="FundTransfer.jsp"> Fund Transfer </a> <br>
         <a href="logout.jsp"> Logout </a> <br>
         
        
    </body>
</html>
