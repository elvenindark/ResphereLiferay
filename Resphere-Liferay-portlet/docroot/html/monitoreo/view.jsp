<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>
<%@ include file="/html/init.jsp" %>
<!--<portlet:renderURL var="linkURL">
    <portlet:param name="jspPage" value="/edit.jsp" />
</portlet:renderURL>-->
<div id="myDataTable">	
</div>
<aui:script>
	YUI().use(
  'aui-datatable',
  function(Y) {
    var columns = ['Sector',    				
    				{key:'estado',
    				formatter: '<a href="{value}">ver ...</a>',
    				allowHTML: true}];

    var data = [
      {Sector: 'Agua y Promoci�n de la Higiene', estado: './monitoreo-agua'},
      {Sector: 'Alimentaci�n y Seguridad Alimentaria', estado: './monitoreo-alimentacion'},
      {Sector: 'Alojamientos y art�culos no alimentarios', estado: './monitoreo-alojamiento'},
      {Sector: 'Salud', estado: './monitoreo-salud'}      
    ];

    new Y.DataTable.Base(
      {
        columnset: columns,
        recordset: data
      }
    ).render('#myDataTable');
  }
);
</aui:script>