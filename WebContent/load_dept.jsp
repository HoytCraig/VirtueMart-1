<sql:query sql="select * from department" var="rs"/>
	<c:set var="flag" value="0"/>
    <c:forEach items="${rs.rows}" var="i">
		<tr><td align="center" id="dItem"><a href="deptsearch.jsp?pp=a&dept_id=${i.dept_id}" >${i.dept_name}</a></td></tr>
    </c:forEach>