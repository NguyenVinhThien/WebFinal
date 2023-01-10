<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 1/10/2023
  Time: 2:04 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="listSearchByCat" scope="request" type="java.util.List<Model.Articles>"/>

<t:main>
    <jsp:body>
        <div class="new-views">
            <div class="left">
                <div class="newPost">
                    <div class="largeTitle">Tin mới</div>
                    <c:choose>
                        <c:when test="${listSearchByCat.size() eq 0}">
                            <tr>
                                <td>Không có kết quả phù hợp</td>
                            </tr>
                        </c:when>
                        <c:otherwise>
                            <c:forEach items="${listSearchByCat}" var="la">
                                <div class="horizontalCard">
                                    <img src="https://image.vtc.vn/resize/th/upload/2022/12/27/chua-koh-kas-hieu-hieu-vi-vu-14410460.jpg" alt="" class="cardHorizontalImg">
                                    <div class="cardHorizontal-Body">
                                        <h5 >
                                            <a class="card-title card-title-custom card-link" href="${pageContext.request.contextPath}/ChiTietBao?articleId=${la.id_article}">${la.title}</a>
                                        </h5>
                                        <c:choose>
                                            <c:when test="${la.parent_id eq 0}">
                                                <span class="cardCategory">${la.cat_name}</span>
                                            </c:when>
                                            <c:otherwise>
                                                <c:forEach items="${listCat}" var="c">
                                                    <c:if test="${c.id eq la.parent_id}">
                                                        <span class="cardCategory">${c.name}</span>
                                                    </c:if>
                                                </c:forEach>
                                            </c:otherwise>
                                        </c:choose>

                                        <p class="card-text"><small class="text-muted">Ngày đăng: ${la.publish_date }</small></p>
                                    </div>
                                </div>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>

                    <c:forEach items="${listSearchByCat}" var="la">
                        <div class="horizontalCard">
                            <img src="https://image.vtc.vn/resize/th/upload/2022/12/27/chua-koh-kas-hieu-hieu-vi-vu-14410460.jpg" alt="" class="cardHorizontalImg">
                            <div class="cardHorizontal-Body">
                                <h5 >
                                    <a class="card-title card-title-custom card-link" href="${pageContext.request.contextPath}/ChiTietBao?articleId=${la.id_article}">${la.title}</a>
                                </h5>
                                <c:choose>
                                    <c:when test="${la.parent_id eq 0}">
                                        <span class="cardCategory">${la.cat_name}</span>
                                    </c:when>
                                    <c:otherwise>
                                        <c:forEach items="${listCat}" var="c">
                                            <c:if test="${c.id eq la.parent_id}">
                                                <span class="cardCategory">${c.name}</span>
                                            </c:if>
                                        </c:forEach>
                                    </c:otherwise>
                                </c:choose>

                                <p class="card-text"><small class="text-muted">Ngày đăng: ${la.publish_date }</small></p>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>

            <div class="topViews">
                <img class="topViewBg" src="https://image.vtc.vn/resize/th/upload/2022/12/27/chua-koh-kas-hieu-hieu-vi-vu-14410460.jpg" alt="Card image cap">

<%--                <div class="largeTitle smallTitle">Tin xem nhiều nhất</div>--%>
<%--                <c:forEach items="${lArtByView}" var="la">--%>
<%--                    <div class="horizontalCard smallCard">--%>
<%--                        <img src="https://image.vtc.vn/resize/th/upload/2022/12/27/chua-koh-kas-hieu-hieu-vi-vu-14410460.jpg" alt="" class="cardHorizontalImg">--%>
<%--                        <div class="cardHorizontal-Body">--%>
<%--                            <h5 >--%>
<%--                                <a class="card-title card-title-custom card-link" href="${pageContext.request.contextPath}/ChiTietBao?articleId=${la.id_article}">${la.title}</a>--%>
<%--                            </h5>--%>
<%--                            <c:choose>--%>
<%--                                <c:when test="${la.parent_id eq 0}">--%>
<%--                                    <span class="cardCategory">${la.cat_name}</span>--%>
<%--                                </c:when>--%>
<%--                                <c:otherwise>--%>
<%--                                    <c:forEach items="${listCat}" var="c">--%>
<%--                                        <c:if test="${c.id eq la.parent_id}">--%>
<%--                                            <span class="cardCategory">${c.name}</span>--%>
<%--                                        </c:if>--%>
<%--                                    </c:forEach>--%>
<%--                                </c:otherwise>--%>
<%--                            </c:choose>--%>

<%--                            <p class="card-text"><small class="text-muted">Ngày đăng: ${la.publish_date }</small></p>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </c:forEach>--%>
            </div>
        </div>
    </jsp:body>
</t:main>
