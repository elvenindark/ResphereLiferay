package com.resphere.view.portlet.reporte;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.PortletException;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.liferay.portal.kernel.exception.PortalException;
import com.liferay.portal.kernel.exception.SystemException;
import com.liferay.portal.kernel.util.ParamUtil;
import com.liferay.util.bridges.mvc.MVCPortlet;
import com.resphere.server.model.Eventosv;
import com.resphere.server.model.Indicadorclave;
import com.resphere.server.model.Normaesencial;
import com.resphere.server.model.Normaminima;
import com.resphere.service.EventosvFacadeREST;
import com.resphere.service.IClaveFacadeREST;
import com.resphere.service.NEsencialFacadeREST;
import com.resphere.service.NMinimaFacadeREST;

/**
 * Portlet implementation class ReportesPortlet
 */
public class ReportesPortlet extends MVCPortlet {
 
	private static Log _log = LogFactory.getLog(ReportesPortlet.class);
	@Override
	public void doView(RenderRequest renderRequest, RenderResponse renderResponse) throws IOException, PortletException{
		String request, request1;
		request = renderRequest.getParameter("jspPage");
		request1 = ParamUtil.getString(renderRequest, "jspPage");
		String url = "http://localhost:8080/respherers/webresources/com.resphere.server.model.eventosv";
		EventosvFacadeREST servicio = new EventosvFacadeREST(Eventosv.class, url);
		List<Eventosv> ubicaciones = servicio.getAll();
		if(request!=null && request1!=null)
			_log.error("eventosv are> " + ubicaciones.get(0).getEvento() + " jspPage:" + request1);
		else
			_log.error("eventosv are> " + ubicaciones.get(0).getEvento() +" render is null");
		renderRequest.setAttribute("itemlist", ubicaciones);
		super.doView(renderRequest, renderResponse);
	}
	
	public void reporteDetails(ActionRequest actionRequest, ActionResponse actionResponse)throws IOException, PortletException, PortalException, SystemException{
		   
		String id, action = null;
		
		id = (String)actionRequest.getParameter("id");		
		action = (String)actionRequest.getParameter("action");
		
		if(id !=null && action != null)
			_log.error("we are in action> " + id + ":" + action);
		else
			_log.error("problems in action");
			
			actionRequest.setAttribute("idevento", id);
		
					
		actionResponse.setRenderParameter("jspPage", "/html/reportes/edit.jsp");
	  
	 } 

}
