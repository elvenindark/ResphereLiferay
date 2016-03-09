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

import com.liferay.util.bridges.mvc.MVCPortlet;
import com.resphere.server.model.Serviciov;
import com.resphere.service.ServiciovFacadeREST;

/**
 * Portlet implementation class ServiciosPortlet
 */
public class ServiciosPortlet extends MVCPortlet {
 
	private static Log _log = LogFactory.getLog(ServiciosPortlet.class);
	private String id;
	
	@Override
	public void doView(RenderRequest renderRequest, RenderResponse renderResponse) throws IOException, PortletException {
		renderRequest.setAttribute("idevento", id);
		if(this.id != null){
			String url = "http://localhost:8080/respherers/webresources/com.resphere.server.model.serviciov";
			ServiciovFacadeREST servicio = new ServiciovFacadeREST(Serviciov.class, url);
			List<Serviciov> servicios = servicio.getAllById(id);
			if(servicios!=null){
				for(Serviciov item: servicios)
					System.out.println(item.getIdtipodano());
				renderRequest.setAttribute("itemlists", servicios);
				super.doView(renderRequest, renderResponse);
			}else{
				_log.error("servicios es null");
				super.doView(renderRequest, renderResponse);
			}
		}else{
			_log.error("servicios ERROR CONEXION");
		}
	}
	
	@ProcessEvent(qname="{http://liferay.com/events}ipc.pitch4")
	public void serviciosDetails(EventRequest request, EventResponse response){
		Event event = request.getEvent();
		String idevento = (String)event.getValue();
		if(idevento != null){		
			_log.info("idevento en servicios es " + idevento);
			response.setRenderParameter("idevento", idevento);
			this.id = idevento;		
		}else
			_log.error("idevento es null");			
	}
}
