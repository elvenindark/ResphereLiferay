package com.resphere.view.portlet.monitoreo;

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
import com.resphere.server.model.Monitoreorespuesta;
import com.resphere.server.model.Normaesencial;
import com.resphere.server.model.Normaminima;
import com.resphere.server.model.Respuestabysectorv;
import com.resphere.service.EventosvFacadeREST;
import com.resphere.service.IClaveFacadeREST;
import com.resphere.service.MonitoreoFacadeREST;
import com.resphere.service.NEsencialFacadeREST;
import com.resphere.service.NMinimaFacadeREST;
import com.resphere.service.RespuestabysectorvFacadeREST;

/**
 * Portlet implementation class MonitoreoAgua
 */
public class MonitoreoAgua extends MVCPortlet {
 
	private static Log _log = LogFactory.getLog(MonitoreoAgua.class);	
	@Override
	public void doView(RenderRequest renderRequest, RenderResponse renderResponse) throws IOException, PortletException{
		String request, request1;
		request = renderRequest.getParameter("jspPage");
		request1 = ParamUtil.getString(renderRequest, "jspPage");
		String url = "http://localhost:8080/respherers/webresources/com.resphere.server.model.eventosv";
		EventosvFacadeREST servicio = new EventosvFacadeREST(Eventosv.class, url);
		List<Eventosv> eventos = servicio.getAllById("monitoreo");
		
		/*if(request!=null && request1!=null)
			_log.error("eventosv are> " + eventos.get(0).getEvento() + " jspPage:" + request);
		else
			_log.error("eventosv null " + eventos.get(0).getEvento() +" render is null");*/
		renderRequest.setAttribute("itemlist", eventos);
		super.doView(renderRequest, renderResponse);
	}
	
	 public void monitoreoDetails(ActionRequest actionRequest, ActionResponse actionResponse)throws IOException, PortletException, PortalException, SystemException{
		   
			String id, action = null;
			
			id = (String)actionRequest.getParameter("id");		
			action = (String)actionRequest.getParameter("action");
			
			if(id !=null && action != null)
				_log.info("we are in action > " + id + ": " + action);
			else
				_log.error("problems in action");
		

			String urlm = "http://localhost:8080/respherers/webresources/com.resphere.server.model.monitoreorespuesta";
			
			MonitoreoFacadeREST serviciom = new MonitoreoFacadeREST(Monitoreorespuesta.class, urlm);

			List<Monitoreorespuesta> monitoreos = serviciom.getAllByIds(id, 1);

			if(monitoreos != null && monitoreos.size()>0){				
				actionRequest.setAttribute("monitoreos", monitoreos);				
				_log.info("monitoreo > " + monitoreos.get(0).getCumple() + " idevento> " + id);
			}else{
				
				_log.error("error al traer monitoreo + id > " + id);
			}

			String urlr = "http://localhost:8080/respherers/webresources/com.resphere.server.model.respuestabysectorv";
			RespuestabysectorvFacadeREST servicior = new RespuestabysectorvFacadeREST(Respuestabysectorv.class, urlr);
			List<Respuestabysectorv> respuestav = servicior.getAllByIds(id, "1");
			if(respuestav != null && respuestav.size()>0){				
				actionRequest.setAttribute("respuestas", respuestav);				
				_log.info("respuesta> " + respuestav.get(0).getIdrespuesta());
			}else{
				
				_log.error("error al traer respuesta");
			}
								
			actionRequest.setAttribute("idevento", id);
			actionResponse.setRenderParameter("jspPage", "/html/monitoreoagua/edit.jsp");
		  
		 } 
}
