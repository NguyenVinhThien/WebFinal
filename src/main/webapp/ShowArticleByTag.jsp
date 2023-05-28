<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="listArtByTag" scope="request" type="java.util.List<Model.ArticleHasTag>"/>

<t:main>
    <jsp:body>
        <div class="new-views" style="border-top: none; margin-top: 0">
            <div class="left">
                <div class="newPost">
                    <div class="largeTitle">Kết quả</div>
                    <c:choose>
                        <c:when test="${listArtByTag.size() eq 0}">
                            <tr>
                                <td>Không có kết quả phù hợp</td>
                            </tr>
                        </c:when>
                        <c:otherwise>
                            <c:forEach items="${listArtByTag}" var="lat">
                                <div class="horizontalCard">
                                    <img src="${lat.headline_image}" alt="" class="cardHorizontalImg">
                                    <div class="cardHorizontal-Body">
                                        <h5 >
                                            <a class="card-title card-title-custom card-link" href="${pageContext.request.contextPath}/ChiTietBao?articleId=${lat.id_article}">${lat.title}</a>
                                        </h5>
                                        <span class="cardCategory">${lat.cat_name}</span>
                                        <span class="cardCategory">${lat.tags}</span>
                                        <p class="card-text"><small class="text-muted">Ngày đăng: ${lat.publish_date }</small></p>
                                    </div>
                                </div>
<%--                                <div class="card mb-3">--%>
<%--                                    <img class="card-img-top" style="height: 150px;" src="${pageContext.request.contextPath}/public/HinhAnh/${la.id_article}/tieude.png" alt="Card image cap">--%>
<%--                                    <div class="card-body">--%>
<%--                                        <h5 class="card-title">--%>
<%--                                            <a class="card-title card-title-custom card-link" href="${pageContext.request.contextPath}/ChiTietBao?articleId=${la.id_article}">${la.title}</a>--%>

<%--                                        </h5>--%>
<%--                                        <p class="card-text">${la.abstract_article}</p>--%>
<%--                                        <p class="card-text"><small class="text-muted">Ngày đăng: ${la.publish_date}</small></p>--%>
<%--                                        <span class="cardCategory">${la.cat_name}</span>--%>
<%--                                        <span class="cardCategory">${la.tags}</span>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
            <div class="topViews">
                    <%--                <img class="topViewBg" src="https://image.vtc.vn/resize/th/upload/2022/12/27/chua-koh-kas-hieu-hieu-vi-vu-14410460.jpg" alt="Card image cap">--%>

            </div>
        </div>
    </jsp:body>
</t:main>