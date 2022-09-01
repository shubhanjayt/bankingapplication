<%@include file="DBCON.jsp" %>
<html>
    <body bgcolor="Red" align="center">
        <%
            try {
                String newpassword = request.getParameter("newpassword");
                String accountno = (String)session.getAttribute("accountno");
                String updatequery = "update account set password='"+ newpassword +"' where accno='"+ accountno +"'";
                PreparedStatement pst = con.prepareStatement(updatequery);
                pst.executeUpdate();
                out.println("Dear '" + accountno + "' password reset successful");
                
            } catch(Exception e) {
                out.println("password reset failed");
            }
        %>
    </body>
</html>