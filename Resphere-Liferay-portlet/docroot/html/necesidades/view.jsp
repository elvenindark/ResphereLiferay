<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>
<%@ include file="/html/init.jsp" %>
<portlet:defineObjects />
<liferay-ui:search-container emptyResultsMessage="No existen datos" delta="5">	
	<liferay-ui:search-container-results>
	<% 	List<Nurgentev> tempResults = (List<Nurgentev>)request.getAttribute("itemlistnu"); 
		results = ListUtil.subList(tempResults, searchContainer.getStart(),searchContainer.getEnd());
		total = tempResults.size();
		pageContext.setAttribute("results", results);
		pageContext.setAttribute("total", total);
	%>
	</liferay-ui:search-container-results>
		<liferay-ui:search-container-row className="com.resphere.server.model.Nurgentev" keyProperty="idevento" modelVar="nurgente">
			<portlet:actionURL name="viewDetails" var="leaveApplicationURL">            
	            <portlet:param name="search" value='<%=String.valueOf(nurgente.getIdevento())%>'/>
	        </portlet:actionURL>
			<liferay-ui:search-container-column-text name="Sector" property="tiponurgente" />
			<liferay-ui:search-container-column-text name="Hogares" property="numero" />
			<liferay-ui:search-container-column-text name="Especificacion" property="especificacion" />
	</liferay-ui:search-container-row>
	<liferay-ui:search-iterator />
</liferay-ui:search-container>

<liferay-ui:search-container emptyResultsMessage="No existen datos" delta="5">	
	<liferay-ui:search-container-results >
	<% 	List<Nrecuperacionv> tempResults = (List<Nrecuperacionv>)request.getAttribute("itemlistnru"); 
		results = ListUtil.subList(tempResults, searchContainer.getStart(),searchContainer.getEnd());
		total = tempResults.size();
		pageContext.setAttribute("results", results);
		pageContext.setAttribute("total", total);
	%>
	</liferay-ui:search-container-results >
		<liferay-ui:search-container-row className="com.resphere.server.model.Nrecuperacionv" keyProperty="idevento" modelVar="nrecuperacion">
			<portlet:actionURL name="viewDetails" var="leaveApplicationURL">            
	            <portlet:param name="search" value='<%=String.valueOf(nrecuperacion.getIdevento())%>'/>
	        </portlet:actionURL>
			<liferay-ui:search-container-column-text name="Tipo Sector" property="tiposector" />
			<liferay-ui:search-container-column-text name="Aplica" property="aplica" />
			<liferay-ui:search-container-column-text name="Observacion" property="observacion" />
	</liferay-ui:search-container-row>
	<liferay-ui:search-iterator />
</liferay-ui:search-container>

<liferay-ui:search-container emptyResultsMessage="No existen datos" delta="5">	
	<liferay-ui:search-container-results>
	<% 	List<Nrrhhv> tempResults = (List<Nrrhhv>)request.getAttribute("itemlistnrh"); 
		results = ListUtil.subList(tempResults, searchContainer.getStart(),searchContainer.getEnd());
		total = tempResults.size();
		pageContext.setAttribute("results", results);
		pageContext.setAttribute("total", total);
	%>
	</liferay-ui:search-container-results >
		<liferay-ui:search-container-row className="com.resphere.server.model.Nrrhhv" keyProperty="idevento" modelVar="nrrhh">
			<portlet:actionURL name="viewDetails" var="leaveApplicationURL">            
	            <portlet:param name="search" value='<%=String.valueOf(nrrhh.getIdevento())%>'/>
	            <liferay-ui:search-container-column-text name="Tipo RRHH" property="tiponrrhh" />
				<liferay-ui:search-container-column-text name="Aplica" property="aplica" />
				<liferay-ui:search-container-column-text name="Requerimiento" property="requerimiento" />
	        </portlet:actionURL>
			
	</liferay-ui:search-container-row>
	<liferay-ui:search-iterator />
</liferay-ui:search-container>