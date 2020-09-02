<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/homepage/resources/bootstrap/css/bootstrap.css">

 <jsp:include page = "./header.jsp" /> 

</head>

<body>
         <% 
            String sql = "SELECT a.article_no, a.title, a.viewcnt, a.gu FROM article a WHERE 5 > (SELECT count(b.title) FROM article b WHERE a.gu = b.gu and a.regdate < b.regdate) ORDER BY a.regdate DESC";
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mariadb://jmtbusan.com/rnrcjf00", "rnrcjf00", "jmtbusan1!");
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
         %>
            
<div class="container">
      <div class="row">
        <div class="col-4">
          <div class="card border-primary mb-3">
            <div class="card-header">
                 사하구
            </div>
            <div class="card-body">
         <table class = "table table-hover">
         <tbody>
             <%
          try {
             rs.beforeFirst();
                while(rs.next()) {
                   if(!rs.getString("gu").equals("saha"))
                      continue;
                   int num = rs.getInt("article_no");
                   %>
                   <tr>
                      <td><%= num %></td>
                      <td>
                      <a href="./Gu/saha/read?${pageMaker.makeQuery(pageMaker.criteria.page)}&articleNo=<%=num%>">
                      <%
                      	String title = (String)rs.getString("title");
                     	if(title.length() < 10){
                     %> <%= title %>
                     <% }else {
                    	 	String short_title = title.substring(0,10);
                    	 	String jum = "...";
							short_title = short_title + jum;
                     %> <%= short_title %>
                     <% }
                     %>
                      </a>
                      </td>
                      <td><%=rs.getInt("viewcnt")%></td>
                   </tr>
                   <%
                }
          } catch (Exception e) {
             e.printStackTrace();
          }
            %>
            </tbody>        
              </table>
            </div>
          </div>
        </div>
        <div class="col-4">
          <div class="card border-primary mb-3">
            <div class="card-header">
                 부산진구
            </div>
<div class="card-body">
         <table class = "table table-hover">
         <tbody>
             <%
          try {
             rs.beforeFirst();
                while(rs.next()) {
                   if(!rs.getString("gu").equals("busanjin"))
                      continue;
                   int num = rs.getInt("article_no");
                   %>
                   <tr>
                      <td><%= num %></td>
                      <td>
                      <a href="./Gu/busanjin/read?${pageMaker.makeQuery(pageMaker.criteria.page)}&articleNo=<%=num%>"><%=rs.getString("title")%></a>
                      </td>
                      <td><%=rs.getInt("viewcnt")%></td>
                   </tr>
                   <%
                }
          } catch (Exception e) {
             e.printStackTrace();
          }
            %>
            </tbody>        
              </table>
            </div>
          </div>
        </div>
        <div class="col-4">
          <div class="card border-primary mb-3">
            <div class="card-header">
                 해운대구
            </div>
<div class="card-body">
         <table class = "table table-hover">
         <tbody>
             <%
          try {
             rs.beforeFirst();
                while(rs.next()) {
                   if(!rs.getString("gu").equals("haeundae"))
                      continue;
                   int num = rs.getInt("article_no");
                   %>
                   <tr>
                      <td><%= num %></td>
                      <td>
                      <a href="./Gu/haeundae/read?${pageMaker.makeQuery(pageMaker.criteria.page)}&articleNo=<%=num%>"><%=rs.getString("title")%></a>
                      </td>
                      <td><%=rs.getInt("viewcnt")%></td>
                   </tr>
                   <%
                }
          } catch (Exception e) {
             e.printStackTrace();
          }
            %>
            </tbody>        
              </table>
            </div>
          </div>
        </div>
        <p></p>
        <div class="col-4">
          <div class="card border-primary mb-3">
            <div class="card-header">
                 동구
            </div>
<div class="card-body">
         <table class = "table table-hover">
         <tbody>
             <%
          try {
             rs.beforeFirst();
                while(rs.next()) {
                   if(!rs.getString("gu").equals("donggu"))
                      continue;
                   int num = rs.getInt("article_no");
                   %>
                   <tr>
                      <td><%= num %></td>
                      <td>
                      <a href="./Gu/donggu/read?${pageMaker.makeQuery(pageMaker.criteria.page)}&articleNo=<%=num%>"><%=rs.getString("title")%></a>
                      </td>
                      <td><%=rs.getInt("viewcnt")%></td>
                   </tr>
                   <%
                }
          } catch (Exception e) {
             e.printStackTrace();
          }
            %>
            </tbody>        
              </table>
            </div>
          </div>
        </div>
        <div class="col-4">
          <div class="card border-primary mb-3">
            <div class="card-header">
                 북구
            </div>
            <div class="card-body">
         <table class = "table table-hover">
         <tbody>
             <%
          try {
             rs.beforeFirst();
                while(rs.next()) {
                   if(!rs.getString("gu").equals("bukgu"))
                      continue;
                   int num = rs.getInt("article_no");
                   %>
                   <tr>
                      <td><%= num %></td>
                      <td>
                      <a href="./Gu/bukgu/read?${pageMaker.makeQuery(pageMaker.criteria.page)}&articleNo=<%=num%>"><%=rs.getString("title")%></a>
                      </td>
                      <td><%=rs.getInt("viewcnt")%></td>
                   </tr>
                   <%
                }
          } catch (Exception e) {
             e.printStackTrace();
          }
            %>
            </tbody>        
              </table>
            </div>
          </div>
        </div>
        <div class="col-4">
          <div class="card border-primary mb-3">
            <div class="card-header">
                 동래구
            </div>
            <div class="card-body">
         <table class = "table table-hover">
         <tbody>
             <%
          try {
             rs.beforeFirst();
                while(rs.next()) {
                   if(!rs.getString("gu").equals("dongnae"))
                      continue;
                   int num = rs.getInt("article_no");
                   %>
                   <tr>
                      <td><%= num %></td>
                      <td>
                      <a href="./Gu/dongnae/read?${pageMaker.makeQuery(pageMaker.criteria.page)}&articleNo=<%=num%>"><%=rs.getString("title")%></a>
                      </td>
                      <td><%=rs.getInt("viewcnt")%></td>
                   </tr>
                   <%
                }
          } catch (Exception e) {
             e.printStackTrace();
          }
            %>
            </tbody>        
              </table>
            </div>
          </div>
        </div>
        <div class="col-4">
          <div class="card border-primary mb-3">
            <div class="card-header">
                 강서구
            </div>
            <div class="card-body">
         <table class = "table table-hover">
         <tbody>
             <%
          try {
             rs.beforeFirst();
                while(rs.next()) {
                   if(!rs.getString("gu").equals("gangseo"))
                      continue;
                   int num = rs.getInt("article_no");
                   %>
                   <tr>
                      <td><%= num %></td>
                      <td>
                      <a href="./Gu/gangseo/read?${pageMaker.makeQuery(pageMaker.criteria.page)}&articleNo=<%=num%>"><%=rs.getString("title")%></a>
                      </td>
                      <td><%=rs.getInt("viewcnt")%></td>
                   </tr>
                   <%
                }
          } catch (Exception e) {
             e.printStackTrace();
          }
            %>
            </tbody>        
              </table>
            </div>
          </div>
        </div>
      <div class="col-4">
          <div class="card border-primary mb-3">
            <div class="card-header">
                 금정구
            </div>
            <div class="card-body">
         <table class = "table table-hover">
         <tbody>
             <%
          try {
             rs.beforeFirst();
                while(rs.next()) {
                   if(!rs.getString("gu").equals("geumjeong"))
                      continue;
                   int num = rs.getInt("article_no");
                   %>
                   <tr>
                      <td><%= num %></td>
                      <td>
                      <a href="./Gu/geumjeong/read?${pageMaker.makeQuery(pageMaker.criteria.page)}&articleNo=<%=num%>"><%=rs.getString("title")%></a>
                      </td>
                      <td><%=rs.getInt("viewcnt")%></td>
                   </tr>
                   <%
                }
          } catch (Exception e) {
             e.printStackTrace();
          }
            %>
            </tbody>        
              </table>
            </div>
          </div>
        </div>
        <div class="col-4">
          <div class="card border-primary mb-3">
            <div class="card-header">
                 기장군
            </div>
            <div class="card-body">
         <table class = "table table-hover">
         <tbody>
             <%
          try {
             rs.beforeFirst();
                while(rs.next()) {
                   if(!rs.getString("gu").equals("gijang"))
                      continue;
                   int num = rs.getInt("article_no");
                   %>
                   <tr>
                      <td><%= num %></td>
                      <td>
                      <a href="./Gu/gijang/read?${pageMaker.makeQuery(pageMaker.criteria.page)}&articleNo=<%=num%>"><%=rs.getString("title")%></a>
                      </td>
                      <td><%=rs.getInt("viewcnt")%></td>
                   </tr>
                   <%
                }
          } catch (Exception e) {
             e.printStackTrace();
          }
            %>
            </tbody>        
              </table>
            </div>
          </div>
        </div>
      <div class="col-4">
          <div class="card border-primary mb-3">
            <div class="card-header">
                 중구
            </div>
            <div class="card-body">
         <table class = "table table-hover">
         <tbody>
             <%
          try {
             rs.beforeFirst();
                while(rs.next()) {
                   if(!rs.getString("gu").equals("junggu"))
                      continue;
                   int num = rs.getInt("article_no");
                   %>
                   <tr>
                      <td><%= num %></td>
                      <td>
                      <a href="./Gu/junggu/read?${pageMaker.makeQuery(pageMaker.criteria.page)}&articleNo=<%=num%>"><%=rs.getString("title")%></a>
                      </td>
                      <td><%=rs.getInt("viewcnt")%></td>
                   </tr>
                   <%
                }
          } catch (Exception e) {
             e.printStackTrace();
          }
            %>
            </tbody>        
              </table>
            </div>
          </div>
        </div>
      <div class="col-4">
          <div class="card border-primary mb-3">
            <div class="card-header">
                 남구
            </div>
            <div class="card-body">
         <table class = "table table-hover">
         <tbody>
             <%
          try {
             rs.beforeFirst();
                while(rs.next()) {
                   if(!rs.getString("gu").equals("namgu"))
                      continue;
                   int num = rs.getInt("article_no");
                   %>
                   <tr>
                      <td><%= num %></td>
                      <td>
                      <a href="./Gu/namgu/read?${pageMaker.makeQuery(pageMaker.criteria.page)}&articleNo=<%=num%>"><%=rs.getString("title")%></a>
                      </td>
                      <td><%=rs.getInt("viewcnt")%></td>
                   </tr>
                   <%
                }
          } catch (Exception e) {
             e.printStackTrace();
          }
            %>
            </tbody>        
              </table>
            </div>
          </div>
        </div>
      <div class="col-4">
          <div class="card border-primary mb-3">
            <div class="card-header">
                 사상구
            </div>
            <div class="card-body">
         <table class = "table table-hover">
         <tbody>
             <%
          try {
             rs.beforeFirst();
                while(rs.next()) {
                   if(!rs.getString("gu").equals("sasang"))
                      continue;
                   int num = rs.getInt("article_no");
                   %>
                   <tr>
                      <td><%= num %></td>
                      <td>
                      <a href="./Gu/sasang/read?${pageMaker.makeQuery(pageMaker.criteria.page)}&articleNo=<%=num%>"><%=rs.getString("title")%></a>
                      </td>
                      <td><%=rs.getInt("viewcnt")%></td>
                   </tr>
                   <%
                }
          } catch (Exception e) {
             e.printStackTrace();
          }
            %>
            </tbody>        
              </table>
            </div>
          </div>
        </div>
       <div class="col-4">
          <div class="card border-primary mb-3">
            <div class="card-header">
                 서구
            </div>
            <div class="card-body">
         <table class = "table table-hover">
         <tbody>
             <%
          try {
             rs.beforeFirst();
                while(rs.next()) {
                   if(!rs.getString("gu").equals("seogu"))
                      continue;
                   int num = rs.getInt("article_no");
                   %>
                   <tr>
                      <td><%= num %></td>
                      <td>
                      <a href="./Gu/seogu/read?${pageMaker.makeQuery(pageMaker.criteria.page)}&articleNo=<%=num%>"><%=rs.getString("title")%></a>
                      </td>
                      <td><%=rs.getInt("viewcnt")%></td>
                   </tr>
                   <%
                }
          } catch (Exception e) {
             e.printStackTrace();
          }
            %>
            </tbody>        
              </table>
            </div>
          </div>
        </div>
      <div class="col-4">
          <div class="card border-primary mb-3">
            <div class="card-header">
                 수영구
            </div>
            <div class="card-body">
         <table class = "table table-hover">
         <tbody>
             <%
          try {
             rs.beforeFirst();
                while(rs.next()) {
                   if(!rs.getString("gu").equals("suyeong"))
                      continue;
                   int num = rs.getInt("article_no");
                   %>
                   <tr>
                      <td><%= num %></td>
                      <td>
                      <a href="./Gu/suyeong/read?${pageMaker.makeQuery(pageMaker.criteria.page)}&articleNo=<%=num%>"><%=rs.getString("title")%></a>
                      </td>
                      <td><%=rs.getInt("viewcnt")%></td>
                   </tr>
                   <%
                }
          } catch (Exception e) {
             e.printStackTrace();
          }
            %>
            </tbody>        
              </table>
            </div>
          </div>
        </div>
       <div class="col-4">
          <div class="card border-primary mb-3">
            <div class="card-header">
                 연제구
            </div>
            <div class="card-body">
         <table class = "table table-hover">
         <tbody>
             <%
          try {
             rs.beforeFirst();
                while(rs.next()) {
                   if(!rs.getString("gu").equals("yeonje"))
                      continue;
                   int num = rs.getInt("article_no");
                   %>
                   <tr>
                      <td><%= num %></td>
                      <td>
                      <a href="./Gu/yeonje/read?${pageMaker.makeQuery(pageMaker.criteria.page)}&articleNo=<%=num%>"><%=rs.getString("title")%></a>
                      </td>
                      <td><%=rs.getInt("viewcnt")%></td>
                   </tr>
                   <%
                }
          } catch (Exception e) {
             e.printStackTrace();
          }
            %>
            </tbody>        
              </table>
            </div>
          </div>
        </div>
<div class="col-4">
          <div class="card border-primary mb-3">
            <div class="card-header">
                 영도구
            </div>
            <div class="card-body">
         <table class = "table table-hover">
         <tbody>
             <%
          try {
             rs.beforeFirst();
                while(rs.next()) {
                   if(!rs.getString("gu").equals("yeongdo"))
                      continue;
                   int num = rs.getInt("article_no");
                   %>
                   <tr>
                      <td><%= num %></td>
                      <td>
                      <a href="./Gu/yeongdo/read?${pageMaker.makeQuery(pageMaker.criteria.page)}&articleNo=<%=num%>"><%=rs.getString("title")%></a>
                      </td>
                      <td><%=rs.getInt("viewcnt")%></td>
                   </tr>
                   <%
                }
          } catch (Exception e) {
             e.printStackTrace();
          }
            %>
            </tbody>        
              </table>
            </div>
          </div>
        </div>
      </div>
</div>



<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="http://js/bootstrap.js"></script>
</body>

</html>