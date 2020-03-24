<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="layout/app.jsp">
<c:param name="content">
	<c:choose>
		<c:when test="${error==1}">
			<p>error:小数を入力してください。</p>
		</c:when>
		<c:when test="${bunbo==1 && junkansetsu==null}">
			<p>$<c:out value="${shosu}"/>$は整数。</p>
		</c:when>
		<c:otherwise>
			<c:choose>
				<c:when test="${junkansetsu==null}">
					<p>$<c:out value="${shosu}"/>$を分数に変換すると$\frac{<c:out value="${bunshi}"/>}{<c:out value="${bunbo}"/>}$です。</p>
				</c:when>
				<c:when test="${first==null}">
					<p>$<c:out value="${shosu}"/>\dot{<c:out value="${junkansetsu}"/>}$を分数に変換すると$\frac{<c:out value="${bunshi}"/>}{<c:out value="${bunbo}"/>}$です。</p>
				</c:when>
				<c:otherwise>
					<p>$<c:out value="${shosu}"/>\dot{<c:out value="${first}"/>}<c:out value="${junkansetsu}"/>\dot{<c:out value="${last}"/>}$を分数に変換すると$\frac{<c:out value="${bunshi}"/>}{<c:out value="${bunbo}"/>}$です。</p>
				</c:otherwise>
			</c:choose>
		</c:otherwise>
	</c:choose>
	<a href="/HenkanServlet/Henkan_kun.jsp">TOPへ</a>
</c:param>
</c:import>