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
<%--<jsp:useBean id="listSearchByCat" scope="request" type="java.util.List<Model.ArticleHasCategories>"/>--%>
<jsp:useBean id="listArtAll" scope="request" type="java.util.List<Model.ArticleHasTag>"/>

<t:main>
    <jsp:body>
        <div class="new-views" style="border-top: none; margin-top: 0">
            <div class="left">
                <div class="newPost">
                    <div class="largeTitle">Kết quả</div>
                    <c:choose>
                        <c:when test="${listArtAll.size() eq 0}">
                            <div>Không có kết quả phù hợp</div>
                        </c:when>
                        <c:otherwise>
                            <c:forEach items="${listArtAll}" var="laa">
                                <div class="horizontalCard">
                                    <img src="${laa.headline_image}" alt="" class="cardHorizontalImg">
                                    <div class="cardHorizontal-Body">
                                        <h5 >
                                            <a class="card-title card-title-custom card-link" href="${pageContext.request.contextPath}/ChiTietBao?articleId=${laa.id_article}">${laa.title}</a>
                                        </h5>
                                        <span class="cardCategory">${laa.cat_name}</span>
                                        <span class="cardCategory">#${laa.tags}</span>
                                        <p class="card-text"><small class="text-muted">Ngày đăng: ${laa.publish_date }</small></p>
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
<%--                                        <span class="cardCategory">#${la.tags}</span>--%>
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
        <div class="col-sm-12 col-md-7">
            <div class="dataTables_paginate paging_simple_numbers" id="dataTable_paginate">
                <ul class="pagination">
                    <c:if test="${page != 1}">
                        <li class="paginate_button page-item" id="dataTable_previous">
                            <a href="${pageContext.request.contextPath}/TrangChu/ShowAricleByCat?catId=${catId}&page=${page - 1 }" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link">Previous</a>
                        </li>
                    </c:if>
                    <c:forEach var="i" begin="1" end ="${totalpage}" >
                        <c:choose>
                            <c:when test="${ page == i}">
                                <li class="paginate_button page-item active">
                                    <a href="${pageContext.request.contextPath}/TrangChu/ShowAricleByCat?catId=${catId}%>&page=${i}" aria-controls="dataTable"  tabindex="0" class="page-link">${ i}</a>
                                </li>
                            </c:when>
                            <c:otherwise>
                                <li class="paginate_button page-item">
                                    <a href="${pageContext.request.contextPath}/TrangChu/ShowAricleByCat?catId=${catId}&page=${i}" aria-controls="dataTable"  tabindex="0" class="page-link">${ i}</a>
                                </li>
                            </c:otherwise>
                        </c:choose >
                    </c:forEach>
                    <c:if test="${page < totalpage}">
                        <li class="paginate_button page-item next" id="dataTable_next">
                            <a href="${pageContext.request.contextPath}/TrangChu/ShowAricleByCat?catId=${catId}&page=${page + 1}" aria-controls="dataTable"  tabindex="0" class="page-link">Next</a>
                        </li>
                    </c:if>
                </ul>
            </div>
        </div>
    </jsp:body>
</t:main>
