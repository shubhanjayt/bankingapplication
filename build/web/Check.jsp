
<%@include file="DBCON.jsp" %>
<html>
   
   <body bgcolor="#E6E6FA" align="center">
        <h1>Check Page</h1>
       <%
            String role = request.getParameter("role");
            String accountnumber = request.getParameter("accountno");
            String upass = request.getParameter("password");
            
            try {
                String viewquery = "select * from account";
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery(viewquery);
                int count =0;
                String loginname="";
                while(rs.next()) 
                {
                    if(role.equalsIgnoreCase(rs.getString(7)) && accountnumber.equalsIgnoreCase(rs.getString(1)) && upass.equals(rs.getString(8))) 
                    {
                       
                        
                       // out.println("Valid<br>");
                          count++;
                           loginname=rs.getString(2);
                            break;
                    }
                   
                }   
                if(count>0)
                {
                    session.setAttribute("accountno", accountnumber);
                    session.setAttribute("loginname", loginname);
                    session.setAttribute("loginpassword", upass);
                    if(role.equalsIgnoreCase("Admin"))
                    {
                        response.sendRedirect("Admin.jsp");
                    }
                    else
                    {
                        response.sendRedirect("CustomerLogin.jsp");
                    }
                   // out.println("Success");
                    //response.sendRedirect("Success.jsp");
                }
                    else 
                    {
                       RequestDispatcher dis=request.getRequestDispatcher("Login.jsp");
                        dis.include(request, response);
                        out.println("Invalid Login<br>");
                    }
                    
                
                
            } 
            catch(Exception e) {
                out.println("Record Not Found"+e);
            }
            
//            if(userid.equalsIgnoreCase("sparsh@soprasteria.com") && username.equalsIgnoreCase("sparsh") && password.equals("123")) {
//                response.sendRedirect("Success.jsp");
//            } else {
//                RequestDispatcher disp = request.getRequestDispatcher("Login.jsp");
//                disp.include(request, response);
//                out.println("<br>Invalid username or password");
//            }
        %>
            
    </body>
</html>
