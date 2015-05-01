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
      {Sector: 'Agua y Promoción de la Higiene', descripcion: 'El principal objetivo de los programas de abastecimiento de agua, saneamiento y promoción de la higiene en casos de desastre es reducir la transmisión de las enfermedades propagadas por vía fecal-oral y la exposición a los vectores de enfermedades', sector: 'John A. Smith', estado: './agua-y-promocion-de-la-higiene'},
      {Sector: 'Alimentación y Seguridad Alimentaria', descripcion: 'El acceso a los alimentos y el mantenimiento de un estado nutricional adecuado resultan cruciales para la supervivencia de las personas en casos de desastre. Las personas afectadas por un desastre suelen estar ya en un estado de desnutrición crónica. La desnutrición es un grave problema de salud pública y una de las principales causas de muerte, sea directa o indirecta.', sector: 'Joan B. Jones', estado: './alimentacion-y-seguridad-alimentaria'},
      {Sector: 'Alojamientos y artículos no alimentarios', descripcion: 'El alojamiento es un factor determinante indispensable para la supervivencia en las fases iniciales de un desastre. Más de allá de la supervivencia, el alojamiento es necesario para garantizar la seguridad personal y la protección contra las condiciones climáticas, así como para fomentar la resistencia ante los problemas de salud y las enfermedades. Es importante también para la dignidad humana, para mantener la vida familiar y comunitaria y permitir a la población afectada recuperarse de las consecuencias del desastre. Las respuestas relacionadas con el alojamiento y las respuestas asociadas a ellas en materia de asentamientos y artículos no alimentarios deben apoyar las estrategias para superar la adversidad y promover la autosuficiencia y la autogestión entre la población afectada por el desastre. Es necesario sacar aprovechar al máximo las competencias y recursos locales siempre y cuando ello no vaya en menoscabo de la población afectada o de la economía local. Toda respuesta debe tener en cuenta los riesgos de desastre conocidos y minimizar los efectos negativos a largo plazo en el medio ambiente, optimizando al mismo tiempo las oportunidades para que la población afectada mantenga o establezca actividades de apoyo a los medios de subsistencia.', sector: 'Bob C. Uncle', estado: './alojamientos-y-articulos-no-alimentarios'},
      {Sector: 'Salud', descripcion: 'El acceso a la atención de salud es un factor crucial para la supervivencia en las etapas iniciales de un desastre. Los desastres tienen casi siempre efectos significativos en la salud pública y en el bienestar de las poblaciones afectadas. Esos efectos pueden ser directos (por ejemplo, muerte a causa de la violencia o lesiones) o indirectos (como el aumento de las tasas de enfermedades infecciosas y/o la malnutrición). Estos efectos indirectos suelen estar relacionados con factores como la cantidad y calidad inadecuados del agua, la destrucción de las instalaciones de evacuación sanitaria, la interrupción o reducción del acceso a los servicios de salud y el deterioro de la situación de seguridad alimentaria. La falta de seguridad, las restricciones al movimiento, los desplazamientos forzosos y el deterioro de las condiciones de vida (hacinamiento y alojamiento inadecuado) también pueden constituir amenazas a la salud pública. El cambio climático puede aumentar la vulnerabilidad y el riesgo.', sector: 'John D. Smith', estado: './salud'}      
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