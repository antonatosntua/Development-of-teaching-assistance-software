<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-7" />
<%@ page contentType="text/html; charset=iso-8859-7" language="java" import="java.sql.*,java.io.*,oracle.sql.*,oracle.jdbc.*,com.oreilly.servlet.multipart.*,java.util.Calendar,javax.naming.*,oracle.jdbc.pool.*" errorPage="error_page.jsp" %>
<%@ include file="lock.jsp"%>
<%
Driver DriverRstLst1 = (Driver)Class.forName(MM_DRIVER).newInstance();
Connection ConnRstLst1 = DriverManager.getConnection(MM_STRING,MM_USERNAME,MM_PASSWORD);
//Context initCtx1 = new InitialContext();
//Context envCtx1 = (Context) initCtx1.lookup("java:comp/env");    
//OracleDataSource ds1 = (OracleDataSource )envCtx1.lookup("jdbc/DAA");   
//Connection ConnRstLst1 = ds1.getConnection();
%>

<%



//Driver Driverpaging_recordset1 = (Driver)Class.forName(MM_DRIVER).newInstance();
//Connection Connpaging_recordset1 = DriverManager.getConnection(MM_STRING,MM_USERNAME,MM_PASSWORD);

String strWhere1 = ""+session.getAttribute("userGrands");
//System.out.println("strWhere1::"+strWhere1);

Driver DriverRecordset21 = (Driver)Class.forName(MM_DRIVER).newInstance();
Connection ConnRecordset21 = DriverManager.getConnection(MM_STRING,MM_USERNAME,MM_PASSWORD);
PreparedStatement  StatementRstLst1 ;
 ResultSet  RstLst1 ;
//Context initCtx2 = new InitialContext();
//Context envCtx2 = (Context) initCtx2.lookup("java:comp/env");    
//OracleDataSource ds2 = (OracleDataSource )envCtx2.lookup("jdbc/DAA");   
//Connection ConnRecordset21 = ds2.getConnection();
//PreparedStatement StatementRecordset21 = ConnRecordset21.prepareStatement("SELECT *  FROM PINMENU WHERE view_tab is not null  and pin3 in (select id from PIN_KATHG where kat = '"+session.getAttribute("RoleUser")+"') order by SEIRA_EMFANISIS ,TAB_LEKT");
PreparedStatement StatementRecordset21 = ConnRecordset21.prepareStatement("SELECT * FROM PINMENU WHERE PIN3 in (select id from PIN_KATHG where  kat = '"+selectedRole+"') order by SEIRA_EMFANISIS ,TAB_LEKT");
ResultSet Recordset21 = StatementRecordset21.executeQuery();
boolean Recordset21_isEmpty = !Recordset21.next();
boolean Recordset21_hasData = !Recordset21_isEmpty;
Object Recordset21_data;
int Recordset21_numRows = 0;
%>
<%
int Repeat11__numRows = -1;
int Repeat11__index = 0;
Recordset21_numRows += Repeat11__numRows;
%>



<!--Links used to initiate the sub menus. Pass in the desired submenu index numbers (ie: 0, 1) -->

<!-- Edit the dimensions of the below, plus background color-->
<ilayer width=100% height=25 name="dep1" bgColor="#E6E6FF">
<layer name="dep2" width=100% height=25>
</layer>
</ilayer>
<SCRIPT LANGUAGE="JavaScript" SRC="../pol/javascript/CalendarPopup.js"></SCRIPT>
      <SCRIPT LANGUAGE="JavaScript">document.write(getCalendarStyles());</SCRIPT> 

<div id="describe" style="background-color:#E6E6FF;width:100%px;height:25px" >

</div>

<!--onMouseover="clear_delayhide()" onMouseout="resetit(event)"-->

<script type="text/javascript">

/*
Tabs Menu (mouseover)- By Dynamic Drive
For full source code and more DHTML scripts, visit http://www.dynamicdrive.com
This credit MUST stay intact for use
*/

var submenu=new Array()
var jsp=new Array()
var jsps=new Array()
var descr=new Array()
var dd="";

//Set submenu contents. Expand as needed. For each content, make sure everything exists on ONE LINE. Otherwise, there will be JS errors.
 

	
 
<%
 String lekt1 ; 
 String lekt5 ; 
 String jsp_sysx;
 String query4;
 String pin3 ="";
 String lst = "";
  String jsp_d = "";
  int i2 = 0;
boolean    RstLst_isEmpty1 = false;
 boolean    RstLst_hasData1 = false;
 int        Repeat__index1 = 0;
 int        Repeat__numRows1 = -1;
  
  
  
  
   while ((Recordset21_hasData)&&(Repeat11__numRows-- != 0)) {
    lekt5=""+Recordset21.getObject("TAB_LEKT");  
	jsp_sysx =""+Recordset21.getObject("JSP_SYSX"); 
	lekt1=""+Recordset21.getObject("FORM"); 
	pin3=""+Recordset21.getObject("pin3");
    lst = "";
    jsp_d = "";
	ConnRstLst1.setAutoCommit(false);
 	StatementRstLst1 = ConnRstLst1.prepareStatement("SELECT *  FROM PINMENU_DETAIL WHERE ID_KATHG = '"+pin3+"'"+" order by id");
   	RstLst1 = StatementRstLst1.executeQuery();
    RstLst_isEmpty1 = !RstLst1.next();
    RstLst_hasData1 = !RstLst_isEmpty1;
    Repeat__index1 = 0;
    Repeat__numRows1 = -1;
	
	while ((RstLst_hasData1)&&(Repeat__numRows1-- != 0)) { 
			lst = ""+ RstLst1.getObject("DESCR");  
			jsp_d = ""+ RstLst1.getObject("JSP"); 
			//System.out.println(jsp_d);
%> 
dd = dd+ '| <a style="color:#66f;cursor:hand;" onclick="document.getElementById('+"'"+'tabIframe2'+"'"+").src='<%=jsp_d%>';"+'" ><u><%=lst%></u></a> ';
//alert(dd);
<%
Repeat__index1++;
RstLst_hasData1 = RstLst1.next();}
//RstLst1.close();
//StatementRstLst1.close();
//ConnRstLst1.close();


	%>
	
	

    jsp[<%=i2%>] = ""+' <%=lekt1%>';
	jsps[<%=i2%>] = ""+' <%=jsp_sysx%>';
	
	
	
	 submenu[<%=i2%>]='<font size="2" face="Verdana"><b><a  ><%=lekt5%>:</a> '+
	                 dd+
					 
		
		
					 
					 
					 '</u></a></b></font>'
dd='';

        
 <%

   i2++;
   
  Repeat11__index++;
  Recordset21_hasData = Recordset21.next();
}
%>



//Set delay before submenu disappears after mouse moves out of it (in milliseconds)
var delay_hide=500

/////No need to edit beyond here

var menuobj=document.getElementById? document.getElementById("describe") : document.all? document.all.describe : document.layers? document.dep1.document.dep2 : ""

function showit(which){
clear_delayhide()
thecontent=(which==-1)? "" : submenu[which]
if (document.getElementById||document.all)
menuobj.innerHTML=thecontent
else if (document.layers){
menuobj.document.write(thecontent)
menuobj.document.close()
}
}

function resetit(e){
if (document.all&&!menuobj.contains(e.toElement))
delayhide=setTimeout("showit(-1)",delay_hide)
else if (document.getElementById&&e.currentTarget!= e.relatedTarget&& !contains_ns6(e.currentTarget, e.relatedTarget))
delayhide=setTimeout("showit(-1)",delay_hide)
}

function clear_delayhide(){
if (window.delayhide)
clearTimeout(delayhide)
}

function contains_ns6(a, b) {
while (b.parentNode)
if ((b = b.parentNode) == a)
return true;
return false;
}

</script>
