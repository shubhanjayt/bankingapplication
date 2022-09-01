
<html>
   
   <body bgcolor="#E6E6FA" align="center">
        <h1>Change Password Page</h1>
          Welcome Dear
        <%
            out.println(session.getAttribute("loginname"));
            out.println("           "+session.getAttribute("accountno"));
                        
        %>
            <form action="ChangePasswordCheck.jsp" method="post">
                Enter Old Password <input type="text" name="oldpass"> <br>
                Enter New Password <input type="text" name="newpass"> <br>
                Enter Confirm Password <input type="text" name="cnpass"> <br>
                <input type="submit" name="b1" value="Change">
            </form>
    </body>
</html>
