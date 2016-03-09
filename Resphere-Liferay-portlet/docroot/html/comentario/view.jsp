<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>
<%@ include file="/html/init.jsp" %>
<portlet:defineObjects />
<liferay-ui:search-container emptyResultsMessage="No existen datos" delta="5">	
	<liferay-ui:search-container-results>
	<% 	List<Comentario> tempResults = (List<Comentario>)request.getAttribute("itemlista"); 
		results = ListUtil.subList(tempResults, searchContainer.getStart(),searchContainer.getEnd());
		total = tempResults.size();
		pageContext.setAttribute("results", results);
		pageContext.setAttribute("total", total);
	%>
	</liferay-ui:search-container-results>
		<liferay-ui:search-container-row className="com.resphere.server.model.Comentario" keyProperty="idevento" modelVar="comentario">
			<portlet:actionURL name="viewDetails" var="leaveApplicationURL">            
	            <portlet:param name="search" value='<%=String.valueOf(comentario.getIdevento())%>'/>
	        </portlet:actionURL>			
			<liferay-ui:search-container-column-text name="Comentario" property="comentario" />
	</liferay-ui:search-container-row>
	<liferay-ui:search-iterator />
</liferay-ui:search-container>