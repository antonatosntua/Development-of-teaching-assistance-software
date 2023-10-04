<%
String query="";
String newParameterStr="";
 String newParameterStr_h="";
 String chkPhwn="";

if(request.getParameter("flag_k")!=null)
{
if(request.getParameter("Rn")!="")
{
 newParameterStr=  new String(request.getParameter("Rn").getBytes("ISO8859_1"),"ISO8859_7");
        if (newParameterStr.indexOf('+') == -1){
  query += " and  Rn = '"+newParameterStr+"' ";}
        else {  query += newParameterStr.replace('+',' ');}
  }
if(request.getParameter("User_Id")!="")
{
 newParameterStr=  new String(request.getParameter("User_Id").getBytes("ISO8859_1"),"ISO8859_7");
        if (newParameterStr.indexOf('+') == -1){
  query += " and  User_Id = '"+newParameterStr+"' ";}
        else {  query += newParameterStr.replace('+',' ');}
  }
if(request.getParameter("Lesson_Id")!="")
{
 newParameterStr=  new String(request.getParameter("Lesson_Id").getBytes("ISO8859_1"),"ISO8859_7");
        if (newParameterStr.indexOf('+') == -1){
  query += " and  Lesson_Id = '"+newParameterStr+"' ";}
        else {  query += newParameterStr.replace('+',' ');}
  }
        if(request.getParameter("Fr_Lesson_Date")!="")
  {
   newParameterStr=  new String(request.getParameter("Fr_Lesson_Date").getBytes("ISO8859_1"),"ISO8859_7"); 
   newParameterStr_h=  new String(request.getParameter("Fr_Lesson_Date_h").getBytes("ISO8859_1"),"ISO8859_7"); 
   if(newParameterStr.length() <= 10)
  query += "  and Fr_Lesson_Date between  to_date( '"+newParameterStr+"000000','dd/mm/yyyyhh24miss')"+
" and  to_date( '"+newParameterStr+"235959','dd/mm/yyyyhh24miss')";
   if(newParameterStr.length() > 10)
  query += " "+newParameterStr_h ;
  }
        if(request.getParameter("To_Lesson_Date")!="")
  {
   newParameterStr=  new String(request.getParameter("To_Lesson_Date").getBytes("ISO8859_1"),"ISO8859_7"); 
   newParameterStr_h=  new String(request.getParameter("To_Lesson_Date_h").getBytes("ISO8859_1"),"ISO8859_7"); 
   if(newParameterStr.length() <= 10)
  query += "  and To_Lesson_Date between  to_date( '"+newParameterStr+"000000','dd/mm/yyyyhh24miss')"+
" and  to_date( '"+newParameterStr+"235959','dd/mm/yyyyhh24miss')";
   if(newParameterStr.length() > 10)
  query += " "+newParameterStr_h ;
  }
if(request.getParameter("Answer_Id")!="")
{
 newParameterStr=  new String(request.getParameter("Answer_Id").getBytes("ISO8859_1"),"ISO8859_7");
        if (newParameterStr.indexOf('+') == -1){
  query += " and  Answer_Id = '"+newParameterStr+"' ";}
        else {  query += newParameterStr.replace('+',' ');}
  }
%>
<%
//jasper
//session.setAttribute("whereParam",query);
//session.setAttribute("query",query);
session.setAttribute("whereParam",query);
session.setAttribute("query",query);
if( request.getParameter("Rn")!=""){
String Rn = ""+request.getParameter("Rn");

response.sendRedirect("AllLessons_m_p.jsp?Rn="+Rn);}
else {response.sendRedirect("AllLessons_m_m.jsp");}
}
%>
