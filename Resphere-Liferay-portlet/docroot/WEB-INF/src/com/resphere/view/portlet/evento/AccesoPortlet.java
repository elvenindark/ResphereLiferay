package com.resphere.view.portlet.evento;

import java.io.IOException;
import java.util.List;

import javax.portlet.Event;
import javax.portlet.EventRequest;
import javax.portlet.EventResponse;
import javax.portlet.PortletException;
import javax.portlet.ProcessEvent;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.liferay.portal.kernel.json.JSONException;
import com.liferay.util.bridges.mvc.MVCPortlet;
import com.resphere.server.model.Acceso;
import com.resphere.server.model.Accesov;
import com.resphere.server.model.Tipoacceso;
import com.resphere.service.AccesovFacadeREST;
import com.resphere.service.TipoaccesoFacadeREST;

/**
 * Portlet implementation class AccesoPortlet
 */
public class AccesoPortlet extends MVCPortlet {
 
	private static Log _log = LogFactory.getLog(AccesoPortlet.class);
	private String id;
	
	@Override
	public void doView(RenderRequest renderRequest, RenderResponse renderResponse) throws IOException, PortletException {
		renderRequest.setAttribute("idevento", id);
		if(this.id != null){
			String url = "http://localhost:8080/respherers/webresources/com.resphere.server.model.accesov";			
			AccesovFacadeREST servicio = new AccesovFacadeREST(Accesov.class, url);
			
			if(servicio != null){
				List<Accesov> accesos = servicio.getAllById(id);
				if(accesos!=null && accesos.size()>0){
					renderRequest.setAttribute("itemlista", accesos);
					super.doView(renderRequest, renderResponse);
				}
			}else{
				_log.error("acceso es null");
				super.doView(renderRequest, renderResponse);
			}
				
			
		}else{
			_log.error("acceso ERROR CONEXION");
		}
	}
	
	@ProcessEvent(qname="{http://liferay.com/events}ipc.pitch4")
	public void accesoDetails(EventRequest request, EventResponse response){
		Event event = request.getEvent();
		String idevento = (String)event.getValue();
		if(idevento != null){		
			_log.info("idevento en acceso es " + idevento);
			response.setRenderParameter("idevento", idevento);
			this.id = idevento;		
		}else
			_log.error("idevento es null");			
	}
}
