<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>
<%@ include file="/html/init.jsp" %>
<% 
	Evento evento = (Evento)request.getAttribute("evento");
%>
<portlet:defineObjects />

<aui:model-context bean="<%= evento%>" model="<%= Evento.class %>">
	
</aui:model-context>
<aui:layout>
<aui:column columnWidth="15">
		<aui:input name="fecha" label="Fecha" disabled="true" type="text" />
	</aui:column>
	<aui:column columnWidth="15">
		<aui:input name="hora" label="Hora" disabled="true" type="text" />
	</aui:column>
	<aui:column columnWidth="35">
		<aui:input name="descripcion" label="Descripción" disabled="true" type="textarea" rows="2" />
	</aui:column>
	<aui:column columnWidth="35">
		<aui:input name="amenazas" label="Amenazas" disabled="true" type="textarea" rows="2" />
	</aui:column>
</aui:layout>



