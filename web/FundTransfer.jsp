
<html>
    
   <body bgcolor="Yellow" align="center">
        <h1> Fund Tranfer Page</h1>
         Welcome Dear
        <%
            out.println(session.getAttribute("loginname"));
            out.println("           "+session.getAttribute("accountno"));
                        
        %>
        <form action="FundTransferDBMS.jsp" method="post">
            <table  border='5' bgcolor="yellow">
           
                
            
                 
                 <tr>
                    <td> Account To</td>
                    <td> <input type="text" name="accountto">  </td>
                    
                </tr>
                
                    
                 <tr>
                    <td> Date</td>
                    <td> <input type="date" name="date">  </td>
                    
                </tr>
                
                 
                 <tr>
                    <td> Amount </td>
                    <td> <input type="text" name="amount">  </td>
                    
                </tr>
                 <tr>
                     <td> <input type="submit" name="b1" value="TransferNOW"> </td>
                     <td>  <input type="RESET" name="b2" value="RESET" </td>
                    
                </tr>
                
            </table>
            
        </form>
        
    </body>
</html>
