
<%@include file="DBCON.jsp" %>
<html>
    <body bgcolor="#E6E6FA" align="center">
        <h1>Fund Transfer DBMS Page</h1>
        <%
            
            String accountfrom = (String)session.getAttribute("accountno");
//            String accountfrom = request.getParameter("accountfrom");
            String accountto = request.getParameter("accountto");
            
            String date = request.getParameter("date");
//            String transID = request.getParameter("transID");
            String amount = request.getParameter("amount");
            
              out.println(accountfrom);
//            out.println(accountto);
//            out.println(date);
//            out.println(transID);
//            out.println(amount);
            
            String viewquerytest = "select * from " + accountfrom;
            Statement stmttest = con.createStatement();
            ResultSet rstest = stmttest.executeQuery(viewquerytest);

            String transIDold = "";

            while(rstest.next()) {
                transIDold = rstest.getString(4);
            }
            
            String temp = transIDold.replace("T", "");
            int i = Integer.parseInt(temp);
            i = i + 1;
            String transID = Integer.toString(i);
            transID = "T" + transID;
            
            
            
            try {
                String viewquery = "select * from " + accountfrom;
                Statement stmt = con.createStatement();
                
                ResultSet rs = stmt.executeQuery(viewquery);
                
                int lastbal = 0;
                
                while(rs.next()) {
                    lastbal = rs.getInt(7);
                }
                
                
                String cashdepquery = "insert into " +accountfrom+" values(?,?,?,?,?,?,?);";
                
                PreparedStatement pst = con.prepareStatement(cashdepquery);
                pst.setString(1, accountfrom);
                pst.setString(2, accountto);
                pst.setString(3, date);
                pst.setString(4, transID);
                pst.setInt(5, 0);
                pst.setInt(6, Integer.parseInt(amount));
                pst.setInt(7, lastbal - Integer.parseInt(amount));
                
                pst.executeUpdate();
                
                out.println("Connection done.. fund transfer done from " + accountfrom);
                out.println();
                
                String viewquery2 = "select * from " + accountto;
                Statement stmt2 = con.createStatement();
                
                ResultSet rs2 = stmt2.executeQuery(viewquery2);
                
                int lastbal2 = 0;
                
                while(rs2.next()) {
                    lastbal2 = rs2.getInt(7);
                }
                
                
                String cashdepquery2 = "insert into " +accountto+" values(?,?,?,?,?,?,?);";
                
                PreparedStatement pst2 = con.prepareStatement(cashdepquery2);
                pst2.setString(1, accountfrom);
                pst2.setString(2, accountto);
                pst2.setString(3, date);
                pst2.setString(4, transID);
                pst2.setInt(5, 0);
                pst2.setInt(6, Integer.parseInt(amount));
                pst2.setInt(7, Integer.parseInt(amount) + lastbal2);
                
                pst2.executeUpdate();
                
                out.println("Connection done.. fund transfer done in " + accountto);
                
                
                out.println("<html>");
                out.println("<body>");
                out.println("<form >");
                out.println("<table border= 2 bgcolor= pink align= center>");
                out.println("<tr>");
                out.println("<td>");
                out.println("Account From");
                out.println("</td>");
                out.println("<td>");
                out.println(accountfrom);
                out.println("</td>");
                out.println("</tr>");
                
                out.println("<tr>");
                out.println("<td>");
                out.println("Account To");
                out.println("</td>");
                out.println("<td>");
                out.println(accountto);
                out.println("</td>");
                out.println("</tr>");
                
                out.println("<tr>");
                out.println("<td>");
                out.println("Date of Transfer");
                out.println("</td>");
                //out.println("<td>");
                out.println("<td>");
                out.println(date);
                out.println("</td>");
                out.println("</tr>");
                
                out.println("<tr>");
                out.println("<td>");
                out.println("Transfer ID");
                out.println("</td>");
               // out.println("<td>");
                out.println("<td>");
                out.println(transID);
                out.println("</td>");
                out.println("</tr>");
                
                
                out.println("<tr>");
                out.println("<td>");
                out.println("Amount");
                out.println("</td>");
                out.println("<td>");
                //out.println("<td>");
                out.println(amount);
                out.println("</td>");
                out.println("</tr>"); 
             
                
                out.println("</table>");
                out.println("</form>");
                out.println("</body>");
                out.println("</html>");
            }
            
            catch(Exception e) {
                out.println("Transfer failed.." + e);
            }
            
            
        %>
    </body>
</html>
