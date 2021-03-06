<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>

<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<%@ taglib uri="http://liferay.com/tld/aui" prefix="aui" %>
<%@ taglib uri="http://liferay.com/tld/portlet" prefix="liferay-portlet" %>
<%@ taglib uri="http://liferay.com/tld/security" prefix="liferay-security" %>
<%@ taglib uri="http://liferay.com/tld/theme" prefix="liferay-theme" %>
<%@ taglib uri="http://liferay.com/tld/ui" prefix="liferay-ui" %>
<%@ taglib uri="http://liferay.com/tld/util" prefix="liferay-util" %>

<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.Collections" %>
<%@ page import="javax.portlet.PortletURL" %>
<%@ page import="javax.portlet.PortletPreferences" %>
<%@ page import="com.liferay.portal.kernel.util.HtmlUtil" %>
<%@ page import="com.liferay.portal.kernel.util.ParamUtil" %>
<%@ page import="com.liferay.portal.kernel.util.CalendarFactoryUtil" %>
<%@ page import="com.liferay.portal.kernel.dao.search.ResultRow" %>
<%@ page import="com.liferay.portal.kernel.dao.search.SearchEntry" %>
<%@ page import="com.liferay.portal.kernel.exception.SystemException" %>
<%@ page import="com.liferay.portal.kernel.util.WebKeys" %>
<%@ page import="com.liferay.portal.security.permission.ActionKeys" %>
<%@ page import="com.liferay.portal.kernel.util.ListUtil" %>
<%@ page import="com.liferay.portal.service.permission.PortalPermissionUtil" %>
<%@ page import="com.liferay.portal.service.permission.PortletPermissionUtil" %>
<%@ page import="com.liferay.portal.theme.ThemeDisplay" %>

<%@ page import="com.resphere.server.model.Eventosv"%>
<%@ page import="com.resphere.server.model.Eventov"%>
<%@ page import="com.resphere.server.model.Ubicacion"%>
<%@ page import="com.resphere.server.model.Evento"%>
<%@ page import="com.resphere.server.model.Normaminima" %>
<%@ page import="com.resphere.server.model.Normaesencial" %>
<%@ page import="com.resphere.server.model.Indicadorclave" %>
<%@ page import="com.resphere.server.model.Poblacion" %>
<%@ page import="com.resphere.server.model.Poblacionv" %>
<%@ page import="com.resphere.server.model.Mediovida" %>
<%@ page import="com.resphere.server.model.Mediovidav" %>
<%@ page import="com.resphere.server.model.Vivienda" %>
<%@ page import="com.resphere.server.model.Servicio" %>
<%@ page import="com.resphere.server.model.Serviciov" %>
<%@ page import="com.resphere.server.model.Salud" %>
<%@ page import="com.resphere.server.model.Saludv" %>
<%@ page import="com.resphere.server.model.Acceso" %>
<%@ page import="com.resphere.server.model.Accesov" %>
<%@ page import="com.resphere.server.model.Tipoacceso" %>
<%@ page import="com.resphere.server.model.Organizacion" %>
<%@ page import="com.resphere.server.model.Accion" %>
<%@ page import="com.resphere.server.model.Impacto" %>
<%@ page import="com.resphere.server.model.Impactov" %>
<%@ page import="com.resphere.server.model.Nurgente" %>
<%@ page import="com.resphere.server.model.Nurgentev" %>
<%@ page import="com.resphere.server.model.Nrecuperacion" %>
<%@ page import="com.resphere.server.model.Nrecuperacionv" %>
<%@ page import="com.resphere.server.model.Nrrhh" %>
<%@ page import="com.resphere.server.model.Nrrhhv" %>
<%@ page import="com.resphere.server.model.Equipo" %>
<%@ page import="com.resphere.server.model.Comentario" %>
<%@ page import="com.resphere.server.model.Equipov" %>
<%@ page import="com.resphere.server.model.Respuestabysectorv" %>
<%@ page import="com.resphere.server.model.Respuestahumanitariav" %>
<%@ page import="com.resphere.server.model.Monitoreorespuesta" %>
<%@ page import="com.resphere.view.portlet.reporte.Conexion" %>
<%@ page import="com.resphere.server.model.Indicadorclave" %>
<%@page import="com.liferay.portal.util.PortalUtil"%>


<liferay-theme:defineObjects/>
<portlet:defineObjects/>

