<html>
    <body bgcolor="#E6E6FA" align="center">
        <h1>Transaction Page</h1>
        <%
            String accountnumber = (String)session.getAttribute("accountno");
            String loginname = (String)session.getAttribute("loginname");
            out.println("Welcome " + loginname + " ( " + accountnumber + " )");
        %>
        <form action="TransactionDBMS.jsp" method="post">
            Select <select name="choice">
                <option value="All">All</option>
                <option value="Accountno">Account Number</option>
                <option value="date">Date</option>
                <option value="amount">Amount</option>
            </select>
            <input type="text" name="txt1">
            <input type="submit" name="b1" value="View">
        </form>
    </body>
</html>