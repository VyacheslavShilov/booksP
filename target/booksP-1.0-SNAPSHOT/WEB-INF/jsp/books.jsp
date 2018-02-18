<%--
  Created by IntelliJ IDEA.
  User: sl
  Date: 10.02.2018
  Time: 14:43
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="tag" uri="/WEB-INF/taglibs/customTaglib.tld" %>
<html>
<head>
    <title>Books</title>

    <%--<style type="text/css">
        .tg {
            border-collapse: collapse;
            border-spacing: 0;
            border-color: #ccc;
        }

        .tg td {
            font-family: Arial, sans-serif;
            font-size: 14px;
            padding: 10px 5px;
            border-style: solid;
            border-width: 1px;
            overflow: hidden;
            word-break: normal;
            border-color: #ccc;
            color: #333;
            background-color: #fff;
        }

        .tg th {
            font-family: Arial, sans-serif;
            font-size: 14px;
            font-weight: normal;
            padding: 10px 5px;
            border-style: solid;
            border-width: 1px;
            overflow: hidden;
            word-break: normal;
            border-color: #ccc;
            color: #333;
            background-color: #f0f0f0;
        }

        .tg .tg-4eph {
            background-color: #f9f9f9
        }
    </style>--%>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <%--  <link rel="stylesheet" type="text/css" href="/css/bootstrap.css" />
      <link rel="stylesheet" type="text/css" href="/css/bootstrap.min.css" />
      <link rel="stylesheet" type="text/css" href="/css/font-awesome.min.css" />--%>
    <%--<link rel="stylesheet" type="text/css" href="webjars/bootstrap/4.0.0/css/bootstrap.css" />--%>
    <%--<link rel="stylesheet" type="text/css" href="webjars/bootstrap/4.0.0/css/bootstrap.min.css" />--%>
    <%--<link rel="stylesheet" type="text/css" href="webjars/bootstrap/4.0.0/css/font-awesome.min.css" />--%>
    <%--<link href="webjars/bootstrap/4.0.0/css/bootstrap-grid.min.css" rel="stylesheet"/>--%>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"/>

</head>
<body>

<div class="container">
    <a href="/books">Back to main page</a>
</div>

<br/>

<div class="container">
    <h3>Add a Book</h3>
</div>

<div class="container">
    <c:url var="addAction" value="/books/add"/>

    <form:form action="${addAction}" modelAttribute="book">
        <table>
            <c:if test="${!empty book.title}">
                <tr>
                    <td>
                        <form:label path="id">
                            <spring:message text="id"/>
                        </form:label>
                    </td>
                    <td>
                        <form:input path="id" readonly="true" disabled="true"/>
                        <form:hidden path="id"/>
                    </td>
                </tr>
            </c:if>
            <tr>
                <td>
                    <form:label path="title">
                        <spring:message text="Title"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="title"/>
                </td>
            </tr>
            <tr>
                <td>
                    <form:label path="Description">
                        <spring:message text="Description"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="description"/>
                </td>
            </tr>
            <tr>
                <c:choose>
                    <c:when test="${!empty book.title}">
                        <td>
                            <form:label path="author">
                                <spring:message text="Author"/>
                            </form:label>
                        </td>
                        <td>
                            <form:input path="author" readonly="true" disabled="true"/>
                            <form:hidden path="author"/>
                        </td>
                    </c:when>
                    <c:when test="${empty book.title}">
                        <td>
                            <form:label path="author">
                                <spring:message text="Author"/>
                            </form:label>
                        </td>
                        <td>
                            <form:input path="author"/>

                        </td>
                    </c:when>
                </c:choose>
            </tr>
            <tr>
                <td>
                    <form:label path="isbn">
                        <spring:message text="ISBN"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="isbn"/>
                </td>
            </tr>
            <tr>
                <td>
                    <form:label path="printYear">
                        <spring:message text="Year"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="printYear"/>
                </td>
            </tr>
            <tr>
                <td>
                    <form:label path="readAlready">
                        <spring:message text="The book is read?"/>
                    </form:label>
                </td>
                <td>
                    <%--<form:input path="readAlready"/>--%>
                    <form:select name="readAlready" path="readAlready">
                        <form:option value="false" label="No" />
                        <form:option value="true" label="Yes" />
                    </form:select>
                </td>
            </tr>

            <tr>
                <td colspan="2">
                    <c:if test="${!empty book.title}">
                        <input type="submit"
                               value="<spring:message text="Edit Book"/>"/>
                    </c:if>
                    <c:if test="${empty book.title}">
                        <input type="submit"
                               value="<spring:message text="Add Book"/>"/>
                    </c:if>
                </td>
            </tr>
        </table>
    </form:form>
</div>

<div class="container">
    <h3>Book List</h3>
</div>

<%--<c:url var="seartchAction" value="/books/search"/>

<div class="container">
<form:form action="${seartchAction}" commandName="book">
    <table>
        <tr>
            <td>
                <form:input path="filter"/>
            <td/>
            <td>
                <input type="submit"
                       value="<spring:message text="Find"/>"/>
            <td/>
        </tr>
    </table>
</form:form>
</div>--%>
<div class="container">
    <c:url var="searchAction" value="/search"/>

    <form:form action="${searchAction}" method="post">

        <table>
            <tr>
                <td>
                        <%--<form:input path="searchTitle"/>--%>
                    <input type="text" id="searchTitle" name="searchTitle" placeholder="Title for search"/>
                </td>
                <td>
                    <input type="submit" value="<spring:message text="Search"/>">
                </td>
            </tr>
        </table>

    </form:form>
</div>


<c:if test="${!empty listBooks}">
    <div class="container">
        <table class="table table-striped table-bordered">
            <tr>
                <th width="40">ID</th>
                <th width="120">Title</th>
                <th width="250">Description</th>
                <th width="120">Author</th>
                <th width="80">ISBN</th>
                <th width="60">Year</th>
                <th width="60">It's read?</th>
                <th width="60">Read</th>
                <th width="60">Edit</th>
                <th width="60">Delete</th>
            </tr>
            <c:forEach items="${listBooks}" var="book" varStatus="itr">
                <tr>
                    <td>${book.id}</td>
                    <td>${book.title}</td>
                    <td>${book.description}</td>
                    <td>${book.author}</td>
                    <td>${book.isbn}</td>
                    <td>${book.printYear}</td>
                    <%--<td>${book.readAlready}</td>--%>
                    <td>
                        <c:if test="${book.readAlready}">
                            Yes
                        </c:if>
                        <c:if test="${!book.readAlready}">
                            No
                        </c:if>
                    </td>
                    <td><a href="<c:url value='/read/${book.id}'/>">Read</a></td>
                    <td><a href="<c:url value='/edit/${book.id}'/>">Edit</a></td>
                    <td><a href="<c:url value='/remove/${book.id}'/>">Delete</a></td>
                </tr>
            </c:forEach>
        </table>
        <div>
            <h5>
            <tag:paginate max="10" offset="${offset}" count="${count}"
                          uri="/books" next="&raquo;" previous="&laquo;"/>
            </h5>
        </div>
    </div>
</c:if>
<script type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript" src="/js/bootstrap.min.js"></script>
<%--<script type="text/javascript" src="webjars/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="webjars/bootstrap/4.0.0/js/bootstrap.min.js"></script>--%>
</body>
</html>
