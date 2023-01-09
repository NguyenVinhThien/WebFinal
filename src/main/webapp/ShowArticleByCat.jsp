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
<jsp:useBean id="lArtByView" scope="request" type="java.util.List<Model.ArticleHasCategories>"/>
<jsp:useBean id="lNewArt" scope="request" type="java.util.List<Model.ArticleHasCategories>"/>
<jsp:useBean id="lTopByCat" scope="request" type="java.util.List<Model.ArticleHasCategories>"/>
<t:main>
    <jsp:body>
    <div>lglalfkk</div>
<%--        <div class="new-views">--%>
<%--            <div class="left">--%>
<%--                <div class="newPost">--%>
<%--                    <div class="largeTitle">Tin mới</div>--%>
<%--                    <c:forEach items="${lNewArt}" var="ln">--%>
<%--                        <div class="horizontalCard">--%>
<%--                            <img src="https://image.vtc.vn/resize/th/upload/2022/12/27/chua-koh-kas-hieu-hieu-vi-vu-14410460.jpg" alt="" class="cardHorizontalImg">--%>
<%--                            <div class="cardHorizontal-Body">--%>
<%--                                <h5 >--%>
<%--                                    <a class="card-title card-title-custom card-link" href="${pageContext.request.contextPath}/ChiTietBao?articleId=${ln.id_article}">${ln.title}</a>--%>
<%--                                </h5>--%>
<%--                                <c:choose>--%>
<%--                                    <c:when test="${ln.parent_id eq 0}">--%>
<%--                                        <span class="cardCategory">${ln.cat_name}</span>--%>
<%--                                    </c:when>--%>
<%--                                    <c:otherwise>--%>
<%--                                        <c:forEach items="${listCat}" var="c">--%>
<%--                                            <c:if test="${c.id eq ln.parent_id}">--%>
<%--                                                <span class="cardCategory">${c.name}</span>--%>
<%--                                            </c:if>--%>
<%--                                        </c:forEach>--%>
<%--                                    </c:otherwise>--%>
<%--                                </c:choose>--%>

<%--                                <p class="card-text"><small class="text-muted">Ngày đăng: ${ln.publish_date }</small></p>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </c:forEach>--%>
<%--                </div>--%>
<%--                <div class="top10">--%>
<%--                    <div class="largeTitle">Top 10 chuyên mục</div>--%>
<%--                    <c:forEach items="${lTopByCat}" var="ltc">--%>
<%--                        <div class="horizontalCard">--%>
<%--                            <img src="https://image.vtc.vn/resize/th/upload/2022/12/27/chua-koh-kas-hieu-hieu-vi-vu-14410460.jpg" alt="" class="cardHorizontalImg">--%>
<%--                            <div class="cardHorizontal-Body">--%>
<%--                                <h5 >--%>
<%--                                    <a class="card-title card-title-custom card-link" href="${pageContext.request.contextPath}/ChiTietBao?articleId=${ltc.id_article}">${ltc.title}</a>--%>
<%--                                </h5>--%>
<%--                                <c:choose>--%>
<%--                                    <c:when test="${ltc.parent_id eq 0}">--%>
<%--                                        <span class="cardCategory">${ltc.cat_name}</span>--%>
<%--                                    </c:when>--%>
<%--                                    <c:otherwise>--%>
<%--                                        <c:forEach items="${listCat}" var="c">--%>
<%--                                            <c:if test="${c.id eq ltc.parent_id}">--%>
<%--                                                <span class="cardCategory">${c.name}</span>--%>
<%--                                            </c:if>--%>
<%--                                        </c:forEach>--%>
<%--                                    </c:otherwise>--%>
<%--                                </c:choose>--%>
<%--                                <p class="card-text"><small class="text-muted">Ngày đăng: ${ltc.publish_date }</small></p>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </c:forEach>--%>
<%--                </div>--%>

<%--            </div>--%>

<%--            <div class="topViews">--%>
<%--                <img class="topViewBg" src="https://image.vtc.vn/resize/th/upload/2022/12/27/chua-koh-kas-hieu-hieu-vi-vu-14410460.jpg" alt="Card image cap">--%>

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


<%--                    &lt;%&ndash;    <c:forEach items="${listArtByView.keySet()}" var="lv">&ndash;%&gt;--%>
<%--                    &lt;%&ndash;      <div class="horizontalCard smallCard">&ndash;%&gt;--%>
<%--                    &lt;%&ndash;        <img src="https://image.vtc.vn/resize/th/upload/2022/12/27/chua-koh-kas-hieu-hieu-vi-vu-14410460.jpg" alt="" class="cardHorizontalImg">&ndash;%&gt;--%>
<%--                    &lt;%&ndash;        <div class="cardHorizontal-Body">&ndash;%&gt;--%>
<%--                    &lt;%&ndash;          <h5 class="card-title custom-card-title">${lv.title}</h5>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;          <span class="cardCategory">${listArtByView.get(lv)}</span>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;          <p class="card-text"><small class="text-muted">Ngày đăng: ${lv.publish_date}</small></p>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;        </div>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;      </div>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;    </c:forEach>&ndash;%&gt;--%>

<%--                    &lt;%&ndash;    <div class="horizontalCard smallCard">&ndash;%&gt;--%>
<%--                    &lt;%&ndash;      <img src="https://image.vtc.vn/resize/th/upload/2022/12/27/chua-koh-kas-hieu-hieu-vi-vu-14410460.jpg" alt="" class="cardHorizontalImg">&ndash;%&gt;--%>
<%--                    &lt;%&ndash;      <div class="cardHorizontal-Body">&ndash;%&gt;--%>
<%--                    &lt;%&ndash;        <h5 class="card-title custom-card-title">‘Cổng trời An Giang’, tọa độ check-in cực chất ở vùng đất Thất Sơn</h5>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;        <span class="cardCategory">Kinh doanh</span>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;        <p class="card-text"><small class="text-muted">Ngày đăng: 29/12/2022</small></p>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;      </div>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;    </div>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;    <div class="horizontalCard smallCard">&ndash;%&gt;--%>
<%--                    &lt;%&ndash;      <img src="https://image.vtc.vn/resize/th/upload/2022/12/27/chua-koh-kas-hieu-hieu-vi-vu-14410460.jpg" alt="" class="cardHorizontalImg">&ndash;%&gt;--%>
<%--                    &lt;%&ndash;      <div class="cardHorizontal-Body">&ndash;%&gt;--%>
<%--                    &lt;%&ndash;        <h5 class="card-title custom-card-title">‘Cổng trời An Giang’, tọa độ check-in cực chất ở vùng đất Thất Sơn</h5>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;        <span class="cardCategory">Kinh doanh</span>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;        <p class="card-text"><small class="text-muted">Ngày đăng: 29/12/2022</small></p>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;      </div>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;    </div>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;    <div class="horizontalCard smallCard">&ndash;%&gt;--%>
<%--                    &lt;%&ndash;      <img src="https://image.vtc.vn/resize/th/upload/2022/12/27/chua-koh-kas-hieu-hieu-vi-vu-14410460.jpg" alt="" class="cardHorizontalImg">&ndash;%&gt;--%>
<%--                    &lt;%&ndash;      <div class="cardHorizontal-Body">&ndash;%&gt;--%>
<%--                    &lt;%&ndash;        <h5 class="card-title custom-card-title">‘Cổng trời An Giang’, tọa độ check-in cực chất ở vùng đất Thất Sơn</h5>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;        <span class="cardCategory">Kinh doanh</span>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;        <p class="card-text"><small class="text-muted">Ngày đăng: 29/12/2022</small></p>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;      </div>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;    </div>&ndash;%&gt;--%>

<%--            </div>--%>

<%--        </div>--%>
    </jsp:body>
</t:main>
