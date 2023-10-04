<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=utf-8" language="java"
         errorPage="" %>
<link rel="stylesheet" type="text/css" href="js/styleResults.css">

    <%
        out.print("<center>");
        out.print("<div class=\"error\">Σφάλμα: Παρακαλώ δοκιμάστε ξανά ή κλείστε τον browser και συνδεθείτε πάλι.<br>" + request.getAttribute("errorMsg"));
        out.print("</div>");

        out.print("</center>");
    %>