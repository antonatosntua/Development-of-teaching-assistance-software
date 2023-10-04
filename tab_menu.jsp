
<html>
    <%@ page contentType="text/html; charset=iso-8859-7" language="java" import="java.sql.*,javax.sql.*,java.io.*,java.util.Calendar,javax.naming.*,oracle.jdbc.pool.*" errorPage="error_page.jsp" %>
    <%@ include file="Connections/edtpr.jsp" %>
    <%@ include file="lock.jsp"%>

    <%
       

         
        String strWhere = "";//+session.getAttribute("userGrands");

        Driver DriverRecordset2 = (Driver)Class.forName(MM_DRIVER).newInstance();
        Connection ConnRecordset2 = DriverManager.getConnection(MM_STRING,MM_USERNAME,MM_PASSWORD);
        String selectedRole = "" + session.getAttribute("RoleUser");
        String slchk = "";

        if (selectedRole.equals("11") || selectedRole.equals("12") || selectedRole.equals("13") || selectedRole.equals("14")) {
            slchk = ",'2'";
        }
      //  Context initCtx = new InitialContext();
      //  Context envCtx = (Context) initCtx.lookup("java:comp/env");
      //  DataSource ds = (DataSource) envCtx.lookup("jdbc/DAA");
      //  Connection ConnRecordset2 = ds.getConnection();

        PreparedStatement StatementRecordset2 = ConnRecordset2.prepareStatement("SELECT * FROM PINMENU WHERE PIN3 in (select id from PIN_KATHG where  kat = '"+selectedRole+"') order by SEIRA_EMFANISIS ,TAB_LEKT"); //SELECT * FROM PINMENU WHERE view_tab is not null order by lekt
        ResultSet Recordset2 = StatementRecordset2.executeQuery();
        boolean Recordset2_isEmpty = !Recordset2.next();
        boolean Recordset2_hasData = !Recordset2_isEmpty;
        Object Recordset2_data;
        int Recordset2_numRows = 0;
    %>
    <%
        int Repeat1__numRows = -1;
        int Repeat1__index = 0;
        Recordset2_numRows += Repeat1__numRows;
    %>

    <head>
        <title>Εφαρμογή Ασφάλεια</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-7" />

        <style type="text/css">



            div.tabBox {}

            div.tabArea {
                font-size: 100%;
                font-weight: bold;
                /*padding: 0px 0px 0px 0px;*/
                padding:3px 0px 0px 0px;
                margin: 0px 0px 0px 0px;
            }

            a.tab {
                background-color: #E8EEFF/*#E2EBED*/;  
                border: 2px solid  #9AAEDC/*#C1E0FF*/;
                border-bottom-width: 2px solid;
                /* vertical-align:top;*/
                border-color: #9AAEDC #8E9FE1 #8E9FE1#9AAEDC;
                -moz-border-radius: .75em .75em 0em 0em;
                border-radius-topleft: .75em;
                border-radius-topright: .75em;
                padding: 0px .2em 0px .2em;
                position:relative;
                text-decoration: none;
                top: 0px;
                left: 0px;
                z-index: 100;

            }

            a.tab, a.tab:visited {
                color:#5F5FB1;
            }

            a.tab:hover {
                background-color:  #5E77B3  /*#9AAEDC#7E87D1*/;
                border-color: #9ebdf1#5F5FB1#5F5FB1#9ebdf1;
                color:#FFFFFF /*#ccffff*/;
            }


            a.tab.activeTab, a.tab.activeTab:hover, a.tab.activeTab:visited {
                background-color: #6D87C2;
                border-color: #8E9FE1#4F5EA2 #4F5EA2 #8E9FE1;
                color: #ccffff;
            }

            a.tab.activeTab {
                padding-bottom: 4px;
                top: 1px;
                z-index: 102;
            }

            div.tabMain {
                background-color:#ffffff;
                border: 2px solid #000000;
                border-color: #8E9FE1 #4F5EA2 #4F5EA2 #8E9FE1;
                -moz-border-radius: 0em .5em .5em 0em;
                border-radius-topright: .5em;
                border-radius-bottomright: .5em;
                padding: .5em;
                position: relative;
                z-index: 101  ;
            }

            div.tabIframeWrapper {
                width: 100%;
            }

            iframe.tabContent {
                background-color:#6D87C2;
                border: 1px solid #000000;
                border-color: #4F5EA2 #8E9FE1#8E9FE1#4F5EA2 ;
                width: 100%;
                /* height: 91ex;*/
                height: 94ex;  
            }

            /******************************************************************************
            * Additional styles.                                                          *
            ******************************************************************************/

            h4#title {
                background-color: #4F5EA2;
                border: 1px solid #000000;
                border-color: #4F5EA2 #8E9FE1#8E9FE1#4F5EA2 ;
                color: #2F4282 /*#B0BAFF*/;
                font-weight: bold;
                margin-top: 0em;
                margin-bottom: .5em;
                padding: 2px .5em 2px .5em;
            }

            a:link {
                color: #4F5EA2 /*#000099*/;
            }
            a:visited {
                color: #4F5EA2 /*#000099*/;
            }
            a:hover {
                color: #4F5EA2 /*#000099*/;
            }
            a:active {
                color: #4F5EA2 /*#000099*/;
            }
        </style>
        <script type="text/javascript">//<![CDATA[

        //*****************************************************************************
        // Do not remove this notice.
        //
        // Copyright 2002 by Mike Hall.
        // See http://www.brainjar.com for terms of use.
        //*****************************************************************************

            function synchTab(frameName) {

                var elList, i;

                // Exit if no frame name was given.

                if (frameName === null)
                    return;

                // Check all links.

                elList = document.getElementsByTagName("A");
                for (i = 0; i < elList.length; i++)
                    // Check if the link's target matches the frame being loaded.

                    if (elList[i].target == frameName) {

                        // If the link's URL matches the page being loaded, activate it.
                        // Otherwise, make sure the tab is deactivated.

                        if (elList[i].href == window.frames[frameName].location.href) {
                            elList[i].className += " activeTab";
                            elList[i].blur();
                        } else
                            removeName(elList[i], "activeTab");
                    }
            }

            function removeName(el, name) {

                var i, curList, newList;

                if (el.className === null)
                    return;

                // Remove the given class name from the element's className property.

                newList = new Array();
                curList = el.className.split(" ");
                for (i = 0; i < curList.length; i++)
                    if (curList[i] !== name)
                        newList.push(curList[i]);
                el.className = newList.join(" ");
            }

        //]]></script>
    </head>
    <body onMouseOut="window.status = 'Ολοκληρώθηκε';
        return true;"  onMouseOver="window.status = 'Ολοκληρώθηκε';
                return true;" onMouseUp="window.status = 'Ολοκληρώθηκε ';
                        return true;"  leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
        <%@ include file="header.jsp"%>
        <div class="tabBox" style="clear:both;">
            <div class="tabArea">

                <%
                    String lekt = "";
                    String jsp_name = "";
                    int i = 0;
                    while ((Recordset2_hasData) && (Repeat1__numRows-- != 0)) {
                        lekt = "" + Recordset2.getObject("TAB_LEKT");

                        jsp_name = "" + Recordset2.getObject("FORM");
                        if (jsp_name.equals("daa0033") || jsp_name.equals("daa0034") || jsp_name.equals("daa0035") || jsp_name.equals("daa0093")) {
                            jsp_name = jsp_name + "_k.jsp";
                        } else {
                           // jsp_name = jsp_name + "_k.jsp";
						    jsp_name = jsp_name ;
                        }
                %>
                <a class="tab"  id="tt<%=i%>"
                     onMouseOut="tt<%=i%>.style.background = '#E8EEFF';
                tt<%=i%>.style.color = '#5f5fb1';
                window.status = 'Ολοκληρώθηκε';
                return true;" 
                     onMouseOver="tt<%=i%>.style.background = '#69c';
            tt<%=i%>.style.color = '#fff';
            window.status = ' ';
            return true;"
                     style="cursor:hand;"
                     onClick="showit(<%=i%>);
                  document.getElementById('tabIframe2').src = '<%=jsp_name%>';"  target=""><%=lekt%></a>

                <%
                        i++;

                        Repeat1__index++;
                        Recordset2_hasData = Recordset2.next();
                    }
                %>




            </div>
            <div class="tabMain">


                <div class="tabIframeWrapper">
                    <h4 id="title"><%@ include file="mnu.jsp"%></h4>

                    <iframe width="100%" height="100%" class="tabContent" id="tabIframe2" name="tabIframe2" src="home.jsp" marginheight="8" marginwidth="8" frameborder="0">
                    </iframe>

                </div>
            </div>
        </div>

    </body>
</html>
<%    ConnRecordset2.close();
%>