<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<title>顧客管理</title>
<link rel="stylesheet"
    href="${pageContext.request.contextPath}/style.css">
</head>
<body>
    <h1>顧客管理</h1>
    <div class="main">
    <h2>更新未完了</h2>
        <h2><%=session.getAttribute("errMessage")%></h2>
        <form action="CustomerServlet" method="post">
            <p>
              <button name="state" value="search">検索画面</button> 
            </p>
        </form>
    </div>
</body>
</html>