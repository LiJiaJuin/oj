<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fnt" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: xanarry
  Date: 17-12-28
  Time: 上午10:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>提交代码</title>

    <link rel="stylesheet" href="css/bootstrap/bootstrap.min.css">

    <script src="js/jquery-3.2.1.min.js"></script>
    <script src="js/bootstrap/popper.min.js"></script>
    <script src="js/bootstrap/bootstrap.min.js"></script>
</head>
<body>
<jsp:include page="navbar.jsp"/>

<%--
        request.setAttribute("problem", problemBean);
        request.setAttribute("languages", languages);
        request.setAttribute("user", userBean);
        request.setAttribute("submitRecords", submitRecordBeans);

--%>

<div class="container" style="margin-top: 70px">
    <h3 class="text-center">${problem.title}</h3>
    <div class="card">
        <h5 class="card-header">最近提交记录</h5>
        <c:choose>
            <c:when test="${recordList != null && fnt:length(recordList) > 0}">
                <table class="table table-sm table-striped">
                    <thead>
                    <tr>
                        <th class="text-center">提交ID</th>
                        <th class="text-center">题号</th>
                        <th class="text-center">耗时(ms)</th>
                        <th class="text-center">内存(KB)</th>
                        <th class="text-center">语言</th>
                        <th class="text-center">代码长度(字节)</th>
                        <th class="text-center">提交时间</th>
                        <th class="text-center">结果</th>
                    </tr>
                    </thead>
                    <tbody>
                    <jsp:useBean id="submitTime" class="java.util.Date"/>
                    <c:forEach items="${recordList}" var="record">
                        <tr>
                            <td class="text-center">${record.submitID}</td>
                            <td class="text-center">p${1000 + record.problemID}</td>
                            <td class="text-center">${record.timeConsume}</td>
                            <td class="text-center">${record.memConsume}</td>
                            <td class="text-center">${record.language}</td>
                            <td class="text-center">${record.codeLength}</td>
                            <c:set target="${submitTime}" property="time" value="${record.submitTime}"/>
                            <td class="text-left"><fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss"
                                                                  value="${submitTime}"/></td>
                            <td class="text-center">
                                <span class="badge badge-success">${record.result}</span>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </c:when>
            <c:otherwise>
                <div class="modal-body">
                    <h4 class="text-center">此题目没有提交记录</h4>
                </div>
            </c:otherwise>
        </c:choose>

    </div>

    <br>

    <div class="card">
        <h5 class="card-header">提交代码</h5>
        <div class="card-body">
            <%--<h4 class="card-title">Special title treatment</h4>--%>
            <form class="form-horizontal" action="/submit" method="post">
                <input hidden name="inputProblemID" value="${problem.problemID}">
                <div class="form-group">
                    <label>源代码</label>
                    <textarea class="form-control" name="inputCode" rows="15"></textarea>
                </div>

                <div class="form-row align-items-center">
                    <div class="col-sm-3">
                        <div class="input-group mb-2 mb-sm-0">
                            <div class="input-group-addon">语言: </div>
                            <select class="form-control" name="inputLanguage">
                                <c:forEach items="${languages}" var="lang">
                                    <option <c:if test="${lang.language == user.preferLanguage}"> selected </c:if>
                                            value="${lang.language}">${lang.language}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="col-auto">
                        <button type="submit" class="btn btn-primary">提交代码</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<jsp:include page="footer.jsp"/>
</body>
</html>
