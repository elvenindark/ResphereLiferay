<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>
<%@ include file="/html/init.jsp" %>
<portlet:renderURL var="linkURL">
    <portlet:param name="jspPage" value="/edit.jsp" />
</portlet:renderURL>
<div id="myDataTable">	
</div>
<aui:script>
	YUI().use(
  'aui-datatable',
  function(Y) {
    var columns = ['Sector',
    				'descripcion',
    				{key:'estado',
    				formatter: '<a href="{value}">mas ...</a>',
    				allowHTML: true}];

    var data = [
      {Sector: 'Agua y Promoci�n de la Higiene', descripcion: 'El principal objetivo de los programas de abastecimiento de agua, saneamiento y promoci�n de la higiene en casos de desastre es reducir la transmisi�n de las enfermedades propagadas por v�a fecal-oral y la exposici�n a los vectores de enfermedades', sector: 'John A. Smith', estado: './agua-y-promocion-de-la-higiene'},
      {Sector: 'Alimentaci�n y Seguridad Alimentaria', descripcion: 'El acceso a los alimentos y el mantenimiento de un estado nutricional adecuado resultan cruciales para la supervivencia de las personas en casos de desastre. Las personas afectadas por un desastre suelen estar ya en un estado de desnutrici�n cr�nica. La desnutrici�n es un grave problema de salud p�blica y una de las principales causas de muerte, sea directa o indirecta.', sector: 'Joan B. Jones', estado: './alimentacion-y-seguridad-alimentaria'},
      {Sector: 'Alojamientos y art�culos no alimentarios', descripcion: 'El alojamiento es un factor determinante indispensable para la supervivencia en las fases iniciales de un desastre. M�s de all� de la supervivencia, el alojamiento es necesario para garantizar la seguridad personal y la protecci�n contra las condiciones clim�ticas, as� como para fomentar la resistencia ante los problemas de salud y las enfermedades. Es importante tambi�n para la dignidad humana, para mantener la vida familiar y comunitaria y permitir a la poblaci�n afectada recuperarse de las consecuencias del desastre. Las respuestas relacionadas con el alojamiento y las respuestas asociadas a ellas en materia de asentamientos y art�culos no alimentarios deben apoyar las estrategias para superar la adversidad y promover la autosuficiencia y la autogesti�n entre la poblaci�n afectada por el desastre. Es necesario sacar aprovechar al m�ximo las competencias y recursos locales siempre y cuando ello no vaya en menoscabo de la poblaci�n afectada o de la econom�a local. Toda respuesta debe tener en cuenta los riesgos de desastre conocidos y minimizar los efectos negativos a largo plazo en el medio ambiente, optimizando al mismo tiempo las oportunidades para que la poblaci�n afectada mantenga o establezca actividades de apoyo a los medios de subsistencia.', sector: 'Bob C. Uncle', estado: './alojamientos-y-articulos-no-alimentarios'},
      {Sector: 'Salud', descripcion: 'El acceso a la atenci�n de salud es un factor crucial para la supervivencia en las etapas iniciales de un desastre. Los desastres tienen casi siempre efectos significativos en la salud p�blica y en el bienestar de las poblaciones afectadas. Esos efectos pueden ser directos (por ejemplo, muerte a causa de la violencia o lesiones) o indirectos (como el aumento de las tasas de enfermedades infecciosas y/o la malnutrici�n). Estos efectos indirectos suelen estar relacionados con factores como la cantidad y calidad inadecuados del agua, la destrucci�n de las instalaciones de evacuaci�n sanitaria, la interrupci�n o reducci�n del acceso a los servicios de salud y el deterioro de la situaci�n de seguridad alimentaria. La falta de seguridad, las restricciones al movimiento, los desplazamientos forzosos y el deterioro de las condiciones de vida (hacinamiento y alojamiento inadecuado) tambi�n pueden constituir amenazas a la salud p�blica. El cambio clim�tico puede aumentar la vulnerabilidad y el riesgo.', sector: 'John D. Smith', estado: './salud'}      
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