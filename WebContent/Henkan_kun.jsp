<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="WEB-INF/layout/app.jsp">
	<c:param name="content">
		<p>小数から分数に変換します。フォームに小数を入力してください。</p>
		<form method="GET" action="/HenkanServlet/calculate">
			<input id="junkan" type="checkbox" name="junkan" onclick=unlock() value="1"/>循環小数<br />
			<input type="text" name="shosu"/>
			<input type="text" id="junkansetsu" name="junkansetsu" placeholder="循環節" disabled/>
			<button type="submit">計算</button>
		</form>
		<h2>使い方</h2>
		<p>左側の入力フォームに小数を入力してください。循環小数（0.333…のような途中から同じ数字の羅列が続く小数）の場合は「循環小数」とかかれたチェックボックスにチェックを入れて、右側の「循環節」と書かれたフォームに循環する数字の列を入力してください。入力が終えたら計算ボタンを押していただくと分数を返します。</p>

		<br /><br />
		<p>例:</p>
		<ul>
			<li>0.37</li>
			<li>左側のフォーム:0.37</li>
			<li>循環小数チェックなし</li>
		</ul>
		<ul>
			<li>0.333…</li>
			<li>左側のフォーム:0</li>
			<li>右側のフォーム:3 (ここに入力するために「循環小数」にチェックをする　以下略)</li>
		</ul>
		<ul>
			<li>0.51212…</li>
			<li>左側のフォーム:0.5</li>
			<li>右側のフォーム:12</li>
		</ul>
		<ul>
			<li>12.0363636…</li>
			<li>左側のフォーム:12.0</li>
			<li>右側のフォーム:36</li>
		</ul>
		<script type="text/javascript">
		function unlock() {
			if(junkan.checked==false)document.getElementById("junkansetsu").disabled = true;
			else document.getElementById("junkansetsu").disabled = false;
		}
		</script>
	</c:param>
</c:import>