<%@ page import="java.util.Calendar"%>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

<script type="text/javascript" src="disableRC.js"></script>
<script language="javascript">
		var browser=navigator.appName;
		var b_version=navigator.appVersion;
		var version=parseFloat(b_version);
		if((browser!="Microsoft Internet Explorer")&&(version<"4")){
		var URLStr="null.jsp";
		location = URLStr; 
		

		 }
</script>
<style>
	.header1{align:"center"; border:"0"; 	background-repeat:repeat;}
	.header1td1{font-family: Georgia, "Times New Roman", Times, serif; font-weight: bold;font-size: 18px; color:#000066;}
	.header2{align:"center";}
	.header2td{align:"center";font-family: Georgia, "Times New Roman", Times, serif; font-size: 12px;font-weight: bold; border-top:1px solid #000066; border-bottom:1px solid #000066; color:#000066;}
	.header3td{font-size: 0.8em;color: #000066;}
</style>


<table width="100%">
  <tr>
    <td width="30%" align="center" class="header3td"><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&Chi;&rho;&#942;&sigma;&tau;&eta;&sigmaf;: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(<%=session.getAttribute("UserName")%>) <%=session.getAttribute("UserFirstLastName")%> </strong></td>
   <td colspan="3" align="center" class="header2td">&lt;<%="("+session.getAttribute("RoleUser")+")"%> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <%=session.getAttribute("RoleName")%>&nbsp;&nbsp;&gt;</td>
    <td width="33%" align="center" class="header3td">&nbsp;</td>
	<td width="4%"><div> <a href="http://localhost:8084/edtpr/">Exit </a></div> </td>
  </tr>
 
</table>
