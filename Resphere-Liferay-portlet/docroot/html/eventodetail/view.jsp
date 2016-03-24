<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>
<%@ include file="/html/init.jsp" %>
<% 
	Evento evento = (Evento)request.getAttribute("evento");
%>
<portlet:defineObjects />

<aui:model-context bean="<%= evento%>" model="<%= Evento.class %>">
	
</aui:model-context>
<aui:layout>
<aui:column columnWidth="20">
		<aui:input name="fecha" disabled="true" type="text" />
	</aui:column>
	<aui:column columnWidth="20">
		<aui:input name="hora"  disabled="true" type="text"/>
	</aui:column>
	<aui:column columnWidth="20">
		<aui:input name="descripcion" disabled="true" type="text" />
	</aui:column>
	<aui:column columnWidth="20">
		<aui:input name="amenazas" disabled="true" type="text" />
	</aui:column>
</aui:layout>



