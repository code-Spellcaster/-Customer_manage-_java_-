<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean class="user.UserBean" id="user" scope="session" />
<jsp:useBean class="customer.CustomerBean" id="customer" scope="session" />
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>顧客管理</title>
<link rel="stylesheet"
    href="${pageContext.request.contextPath}/style.css">
</head>
<body>
    <h1>顧客管理</h1>
    <div class="main">
    <h2>既存データの編集</h2>
    <form name="form1" action="CustomerServlet" method="post"
            onsubmit="return funcConfirm()">
            <table>
                <tr>
                    <td class="title">氏名</td>
                    <td><input type="text" name="name" maxlength="20" value="<%=customer.getName()%>"></td>
                </tr>
                <tr>
                    <td class="title">郵便番号</td>
                    <td><input type="text" name="zip" maxlength="20" value="<%=customer.getZip()%>"></td>
                </tr>
                <tr>
                    <td class="title">住所1</td>
                    <td><input type="text" name="address1" maxlength="100" value="<%=customer.getAddress1()%>"></td>
                </tr>
                <tr>
                    <td class="title">住所2</td>
                    <td><input type="text" name="address2" maxlength="100"
                        <%if (customer.getAddress2() != null) {%>
                            value=<%=customer.getAddress2()%>
                        <% } %>
                    ></td>
                </tr>
                <tr>
                    <td class="title">TEL</td>
                    <td><input type="text" name="tel" maxlength="20" value="<%=customer.getTel()%>"></td>
                </tr>
                <tr>
                    <td class="title">FAX</td>
                    <td><input type="text" name="fax" maxlength="20"
                        <%if (customer.getFax() != null) {%>
                            value=<%=customer.getFax()%>
                        <% } %>
                    ></td>
                </tr>
                <tr>
                    <td class="title">E-mail</td>
                    <td><input type="text" name="email" maxlength="100" value="<%=customer.getEmail()%>"></td>
                </tr>
            </table>
            <input type="hidden" name="id" value="<%=customer.getId()%>">
            <p>
                <!--
                <input type="submit" value="送信">
             -->
                <button name="state" value="edit_confirm">送信</button>
                <input type="button" value="戻る" onclick="history.back()">
            </p>
        </form>
    </div>
    <script type="text/javascript">
        function funcConfirm() {
            if (document.form1.name.value == "" || !document.form1.name.value.match(/\S/g)) {
                alert("氏名が入力されていません。");
                return false;
            }
            if (document.form1.zip.value == "") {
                alert("郵便番号が入力されていません。");
                return false;
            }
            if (!document.form1.zip.value.match(/^[0-9]{3}-[0-9]{4}$/)) {
                 alert("郵便番号はXXX-XXXXの形式で入力してください");
                 return false;
             }
            if (document.form1.address1.value == "") {
                alert("住所１が入力されていません。");
                return false;
            }
            if (document.form1.tel.value == "") {
                alert("電話番号が入力されていません。");
                return false;
            }
            if (!document.form1.tel.value.match(/^((0(\d{1}-\d{4}|\d{1}[1-9]{1}-\d{3}|\d{3}-\d{2}|\d{4}-\d{1}|[5789]0-\d{4})-\d{4})|((0120|0570|0800)-\d{3}-\d{3}))$/)) {
                alert("電話番号に誤りがあります（番号はハイフンを含めて入力してください）。");
                return false;
            }
            if (document.form1.email.value == "") {
                alert("E-mailが入力されていません。");
                return false;
            }
            if (!document.form1.email.value.match(/^[A-Za-z0-9]{1}[A-Za-z0-9_.-]*@{1}[A-Za-z0-9_.-]{1,}\.[A-Za-z0-9]{1,}$/)) {
                alert("メールアドレスを正しい形式で入力してください");
                return false;
            }
        }
    </script>
</body>
</html>
