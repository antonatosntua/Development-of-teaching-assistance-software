<%
String query="";
String newParameterStr="";
 String newParameterStr_h="";
 String chkPhwn="";

if(request.getParameter("flag_k")!=null)
{
   if(request.getParameter("Id_Xrhsths")!=""){
        newParameterStr=  new String(request.getParameter("Id_Xrhsths").getBytes("ISO8859_1"),"ISO8859_7");
        if (newParameterStr.indexOf('+') == -1){
		    if (newParameterStr.indexOf('%') == -1){
               query += " and  Id_Xrhsths = '"+newParameterStr+"' ";}
            else {  query += " and  Id_Xrhsths like '"+newParameterStr+"' ";}}
        else {  query += newParameterStr.replace('+',' ');}}
   if(request.getParameter("Password")!=""){
        newParameterStr=  new String(request.getParameter("Password").getBytes("ISO8859_1"),"ISO8859_7");
        if (newParameterStr.indexOf('+') == -1){
		    if (newParameterStr.indexOf('%') == -1){
               query += " and  Password = '"+newParameterStr+"' ";}
            else {  query += " and  Password like '"+newParameterStr+"' ";}}
        else {  query += newParameterStr.replace('+',' ');}}

%>
<%
//jasper
//session.setAttribute("whereParam",query);
//session.setAttribute("query",query);
session.setAttribute("whereParam","");

session.setAttribute("query","");
if( request.getParameter("Id_Xrhsths")!=""&& request.getParameter("Password")!=""){
String Id_Xrhsths = ""+request.getParameter("Id_Xrhsths");
String Password = ""+request.getParameter("Password");


response.sendRedirect("user_cridendials.jsp?Id_Xrhsths="+Id_Xrhsths+"&Password="+Password);}
else {response.sendRedirect("notUser.jsp");}
}
%>
