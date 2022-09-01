package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class ViewStatement_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

 Connection con;
  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(1);
    _jspx_dependants.add("/DBCON.jsp");
  }

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write('\n');
      out.write("\n");
      out.write("\n");
      out.write("<html>\n");
      out.write("    \n");
      out.write("    <body>\n");
      out.write("        ");
      out.write("\n");
      out.write("        ");

            try
            {
                Class.forName("com.mysql.jdbc.Driver");
           String connectionURL="jdbc:mysql://localhost:3306/soprabanking";
            String dbuser="root";
            String dbpass="root";
             con=DriverManager.getConnection(connectionURL,dbuser,dbpass);
            System.out.println("Connection Success");
            out.println("Connection Successful");
            }
            
            catch(Exception e)
            {
                out.println("Connection Failed.... " +e);
            }
            
            
            
      out.write("\n");
      out.write("        \n");
      out.write("    </body>\n");
      out.write("</html>\n");
      out.write("\n");
      out.write("<html>\n");
      out.write("    <style>\n");
      out.write("        * {\n");
      out.write("            margin: 0;\n");
      out.write("            padding: 0;\n");
      out.write("            box-sizing: border-box;\n");
      out.write("        }\n");
      out.write("        body {\n");
      out.write("            font-family: sans-serif;\n");
      out.write("            background: #fff ;\n");
      out.write("        }\n");
      out.write("        h1 {\n");
      out.write("            font-size: 40px;\n");
      out.write("            text-align: center;\n");
      out.write("            text-transform: uppercase;\n");
      out.write("            margin-top: 30px;\n");
      out.write("            margin-bottom: 60px;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .content-table {\n");
      out.write("            left: 50%;\n");
      out.write("            width: 1300px;\n");
      out.write("            transform: translate(-50%, 0);\n");
      out.write("            position: absolute;\n");
      out.write("            margin-top: 50px;\n");
      out.write("            border-collapse: collapse;\n");
      out.write("            font-size: 1em;\n");
      out.write("            min-width: 400px;\n");
      out.write("        }\n");
      out.write("        .header {\n");
      out.write("            background-color: #009879;\n");
      out.write("            color: #ffffff;\n");
      out.write("            text-align: left;\n");
      out.write("            font-weight: bold;\n");
      out.write("        }\n");
      out.write("        .content-table td {\n");
      out.write("            padding: 12px 15px;\n");
      out.write("        }\n");
      out.write("        \n");
      out.write("        .content-table tr {\n");
      out.write("            border-bottom: 1px solid #ddd;\n");
      out.write("        }\n");
      out.write("        .content-table tr:nth-of-type(even) {\n");
      out.write("            background-color: #f3f3f3;\n");
      out.write("        }\n");
      out.write("    </style>\n");
      out.write("    <body>\n");
      out.write("        <h1>Account Statements</h1>\n");
      out.write("        <table class=\"content-table\">\n");
      out.write("            <tr class=\"header\">\n");
      out.write("                <td>\n");
      out.write("                    <p>Account Number</p>\n");
      out.write("                </td>\n");
      out.write("                <td>\n");
      out.write("                    <p>Reference</p>\n");
      out.write("                </td>\n");
      out.write("                <td>\n");
      out.write("                    <p>Date of Transaction</p>\n");
      out.write("                </td>\n");
      out.write("                <td>\n");
      out.write("                    <p>Transaction ID</p>\n");
      out.write("                </td>\n");
      out.write("                <td>\n");
      out.write("                    <p>Deposited Amount</p>\n");
      out.write("                </td>\n");
      out.write("                <td>\n");
      out.write("                    <p>Withdrawn Amount</p>\n");
      out.write("                </td>\n");
      out.write("                <td>\n");
      out.write("                    <p>Net Balance</p>\n");
      out.write("                </td>\n");
      out.write("            </tr>\n");
      out.write("        ");

            String accountnumber = (String)session.getAttribute("accountno");
            try {
                String viewquery = "select * from " + accountnumber;
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery(viewquery);
                while(rs.next()) {
                    String accountno = rs.getString(1);
                    String reference = rs.getString(2);
                    String dotrans = rs.getString(3);
                    String transid = rs.getString(4);
                    String depamount = rs.getString(5);
                    String withamount = rs.getString(6);
                    String netbal = rs.getString(7);
        
      out.write("\n");
      out.write("        <tr>\n");
      out.write("            <td>\n");
      out.write("                <p>");
      out.print(accountno);
      out.write("</p>\n");
      out.write("            </td>\n");
      out.write("            <td>\n");
      out.write("                <p>");
      out.print(reference);
      out.write("</p>\n");
      out.write("            </td>\n");
      out.write("            <td>\n");
      out.write("                <p>");
      out.print(dotrans);
      out.write("</p>\n");
      out.write("            </td>\n");
      out.write("            <td>\n");
      out.write("                <p>");
      out.print(transid);
      out.write("</p>\n");
      out.write("            </td>\n");
      out.write("            <td>\n");
      out.write("                <p>");
      out.print(depamount);
      out.write("</p>\n");
      out.write("            </td>\n");
      out.write("            <td>\n");
      out.write("                <p>");
      out.print(withamount);
      out.write("</p>\n");
      out.write("            </td>\n");
      out.write("            <td>\n");
      out.write("                <p>");
      out.print(netbal);
      out.write("</p>\n");
      out.write("            </td>\n");
      out.write("        </tr>\n");
      out.write("        ");

                }
            } catch(Exception e) {
                
            }
        
      out.write("\n");
      out.write("        </table>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
