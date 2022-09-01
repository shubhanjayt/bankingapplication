<%@include file="DBCON.jsp" %>
<html>
   
    <body bgcolor="#E6E6FA" align="center">
        <h1>ChangePasswordCheck Page</h1>
           Welcome Dear
        <%
            out.println(session.getAttribute("loginname"));
            out.println("           "+session.getAttribute("accountno"));
                        
        %>
        
        <%
            //String loginuid=(String)session.getAttribute("user_id");
             String s1oldpass=request.getParameter("oldpass");
               String s1newpass=request.getParameter("newpass");
               String s1cnpass=request.getParameter("cnpass");
               /*
               out.println(s1oldpass);
               out.println(s1newpass);
               out.println(s1cnpass);
               */
               try
               {
                   if(s1newpass.equals(s1cnpass))
                   {
                       if(session.getAttribute("loginpassword").equals(s1oldpass))
                       {
                           try
                           {
                               //String updatepassquery="update logintable set userpassword='" +s1newpass+"'where userid =" ;
                             
                                String updatepassquery = "update account set password='"+ s1newpass +"' where accno='"+session.getAttribute("accountno") +"'";


                               //con.prepareStatement(updatepassquery);
                               PreparedStatement pst=con.prepareStatement(updatepassquery);
                               
                               pst.executeUpdate();
                               out.println("Dear " +session.getAttribute("loginname") + "password changeeedd...<br>");
                              
                               session.invalidate();
                               
                               response.setHeader("Cache-Control", "no-store");
                               response.setHeader("Pragma", "no-cache");
                               response.setHeader("Expires", "0"); //prevents catching at the proxy server
                               
                               out.println("<a href =Login.jsp>Login Again</a>");
                               
                           }
                           catch(Exception ee)
                                   {
                                       out.println("<br> Password not a match" +ee);
                                   }
                       }
                       else
                       {
                        out.println("<br> OLD PASSWORD not a match");   
                       }
                   }
                   else
                   {
                       out.println("<br> NEW PASSWORD & CONFIRM PASSWORD not a match");
                   }
               }
               catch(Exception e)
               {
                   out.println(e);
               }
        %>
    </body>
</html>
