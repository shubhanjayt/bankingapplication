
<%@include file="DBCON.jsp" %>

<html>

    <body bgcolor="#E6E6FA" align="center">
        <h1>View Customer DBMS</h1>
        <%
            String choice=request.getParameter("choice");
            
            try
            {
                String viewquery="";
                
                if(choice.equalsIgnoreCase("ACCOUNTNO"))
                        {
                            String ac=request.getParameter("txt1");
                            viewquery="select * from account where accno='"+ac+"'";
                        }
                else
                {
                    viewquery="select * from account";
                }
                Statement stmt=con.createStatement();
                ResultSet rs=stmt.executeQuery(viewquery);
                
                while(rs.next())
                {
                    out.println(" "+rs.getString(1));
                    out.println(" "+rs.getString(2));
                    out.println(" "+rs.getString(3));
                    out.println(" "+rs.getString(4));
                    out.println(" "+rs.getString(5));
                    out.println(" "+rs.getInt(6));
                    out.println(" "+rs.getString(7));
                    out.println(" "+rs.getString(8));
                    out.println(" "+rs.getString(9));
                    out.println(" "+rs.getString(10));
                    out.println("<br>");
                    
                }
            }
            catch(Exception e)
            {
                out.println("Data not found"+e);
            }
            %>
        
    </body>
</html>
