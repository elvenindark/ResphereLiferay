<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>
<%@ include file="/html/init.jsp" %>
<% 
	Vivienda vivienda = (Vivienda)request.getAttribute("vivienda");
%>
<portlet:defineObjects />

<aui:model-context bean="<%= vivienda%>" model="<%= Vivienda.class %>">
	
</aui:model-context>
<aui:layout>
<aui:column columnWidth="20">
		<aui:input name="danoparcialh" disabled="true" label="Dano parcial habitable" type="text" />
	</aui:column>
	<aui:column columnWidth="20">
		<aui:input name="danototalnh" label="Dano total no habitable" disabled="true" type="text"/>
	</aui:column>
	<aui:column columnWidth="20">
		<aui:input name="temporalnh" disabled="true" label="Temporal no habitable" type="text" />
	</aui:column>
	<aui:column columnWidth="20">
		<aui:input name="totalv" disabled="true" label="Total Viviendas" type="text" />
	</aui:column>
</aui:layout>
<aui:layout>	
	<aui:column columnWidth="60">
		<aui:input name="observacion"  label="Observacion" disabled="true" type="text"/>
	</aui:column>	
</aui:layout>



