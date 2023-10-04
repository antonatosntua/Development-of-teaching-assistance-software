<%
String query="";
String newParameterStr="";
 String newParameterStr_h="";
 String chkPhwn="";

if(request.getParameter("flag_k")!=null)
{
if(request.getParameter("Id_Les_Ans")!="")
{
 newParameterStr=  new String(request.getParameter("Id_Les_Ans").getBytes("ISO8859_1"),"ISO8859_7");
        if (newParameterStr.indexOf('+') == -1){
  query += " and  Id_Les_Ans = '"+newParameterStr+"' ";}
        else {  query += newParameterStr.replace('+',' ');}
  }
if(request.getParameter("Lesson_Id")!="")
{
 newParameterStr=  new String(request.getParameter("Lesson_Id").getBytes("ISO8859_1"),"ISO8859_7");
        if (newParameterStr.indexOf('+') == -1){
  query += " and  Lesson_Id = '"+newParameterStr+"' ";}
        else {  query += newParameterStr.replace('+',' ');}
  }
if(request.getParameter("User_Id")!="")
{
 newParameterStr=  new String(request.getParameter("User_Id").getBytes("ISO8859_1"),"ISO8859_7");
        if (newParameterStr.indexOf('+') == -1){
  query += " and  User_Id = '"+newParameterStr+"' ";}
        else {  query += newParameterStr.replace('+',' ');}
  }
if(request.getParameter("Answer_Id")!="")
{
 newParameterStr=  new String(request.getParameter("Answer_Id").getBytes("ISO8859_1"),"ISO8859_7");
        if (newParameterStr.indexOf('+') == -1){
  query += " and  Answer_Id = '"+newParameterStr+"' ";}
        else {  query += newParameterStr.replace('+',' ');}
  }
        if(request.getParameter("Answer_Date")!="")
  {
   newParameterStr=  new String(request.getParameter("Answer_Date").getBytes("ISO8859_1"),"ISO8859_7"); 
   newParameterStr_h=  new String(request.getParameter("Answer_Date_h").getBytes("ISO8859_1"),"ISO8859_7"); 
   if(newParameterStr.length() <= 10)
  query += "  and Answer_Date between  to_date( '"+newParameterStr+"000000','dd/mm/yyyyhh24miss')"+
" and  to_date( '"+newParameterStr+"235959','dd/mm/yyyyhh24miss')";
   if(newParameterStr.length() > 10)
  query += " "+newParameterStr_h ;
  }
%>
<%
//jasper
//session.setAttribute("whereParam",query);
//session.setAttribute("query",query);
session.setAttribute("whereParam",query);
session.setAttribute("query",query);
if( request.getParameter("Id_Les_Ans")!=""){
String Id_Les_Ans = ""+request.getParameter("Id_Les_Ans");

response.sendRedirect("LessonsAnswers_m_p.jsp?Id_Les_Ans="+Id_Les_Ans);}
else {response.sendRedirect("LessonsAnswers_m_m.jsp");}
}
%>
