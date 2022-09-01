
<html>
    
    <body bgcolor="#E6E6FA" align="center">
          Welcome Dear :
        <%
            out.println(session.getAttribute("loginname"));
            out.println("           "+session.getAttribute("accountno"));
                        
        %>
        <h1> Login Page</h1>
        <form action="Check.jsp" method="post">
            Select Role <select name="role">
                <option>Admin</option>
                <option>Customer</option>
            </select><br>
            Enter Account Number<input type="text" name="accountno"><br>
            Enter Password <input type="text" name="password"><br>
            <a href="GoogleMap.jsp"> Visit Branch </a><br>
            <input type="submit" name="b1" value="Login">
            <input type="RESET" name="b2" value="RESET">
        </form>
        
            
    </body>
</html>
