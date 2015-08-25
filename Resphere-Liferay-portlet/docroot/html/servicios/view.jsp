<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>
<%@ include file="/html/init.jsp" %>
<%@ page import="com.resphere.server.model.Servicio" %>
<portlet:defineObjects />
<liferay-ui:search-container emptyResultsMessage="No existen datos" delta="5">	
	<liferay-ui:search-container-results>
	<% 	List<Servicio> tempResults = (List<Servicio>)request.getAttribute("itemlists"); 
		results = ListUtil.subList(tempResults, searchContainer.getStart(),searchContainer.getEnd());
		total = tempResults.size();
		pageContext.setAttribute("results", results);
		pageContext.setAttribute("total", total);
	%>
	</liferay-ui:search-container-results>
		<liferay-ui:search-container-row className="com.resphere.server.model.Servicio" keyProperty="idevento" modelVar="servicio">
			<portlet:actionURL name="viewDetails" var="leaveApplicationURL">            
	            <portlet:param name="search" value='<%=String.valueOf(servicio.getIdevento())%>'/>
	        </portlet:actionURL>
			<liferay-ui:search-container-column-text name="Tipo dano" property="idtipodano" />
			<liferay-ui:search-container-column-text name="Servicio" property="idtiposervicio" />
			<liferay-ui:search-container-column-text name="Aplica" property="siaplica" />
			<liferay-ui:search-container-column-text name="Funciona" property="sifunciona" />
			<liferay-ui:search-container-column-text name="Observacion" property="observacion" />
	</liferay-ui:search-container-row>
	<liferay-ui:search-iterator />
</liferay-ui:search-container>