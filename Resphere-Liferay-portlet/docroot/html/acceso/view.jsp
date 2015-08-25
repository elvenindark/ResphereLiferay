<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>
<%@ include file="/html/init.jsp" %>
<% 
	Acceso acceso = (Acceso)request.getAttribute("itema");
	Tipoacceso tipo = (Tipoacceso)request.getAttribute("itemta");
%>
<portlet:defineObjects />

<aui:model-context bean="<%= acceso%>" model="<%= Acceso.class %>">	
</aui:model-context>
<aui:layout>
	<aui:column columnWidth="20">
		<aui:input name="idevento" disabled="true" type="text" />
	</aui:column>
	<aui:column columnWidth="20">
		<aui:input name="transporte"  disabled="true" type="text"/>
	</aui:column>	
</aui:layout>
<aui:model-context bean="<%= tipo%>" model="<%= Tipoacceso.class %>">	
</aui:model-context>
<aui:layout>
	<aui:column columnWidth="20">
		<aui:input name="tipoacceso" disabled="true" type="text" />
	</aui:column>	
</aui:layout>



