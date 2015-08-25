package com.resphere.view.portlet.evento;

import java.io.IOException;

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
import com.resphere.server.model.Vivienda;
import com.resphere.service.ViviendaFacadeREST;

/**
 * Portlet implementation class ViviendaPortlet
 */
public class ViviendaPortlet extends MVCPortlet {
 
	private static Log _log = LogFactory.getLog(ViviendaPortlet.class);
	private String id;
	
	@Override
	public void doView(RenderRequest renderRequest, RenderResponse renderResponse) throws IOException, PortletException {
		renderRequest.setAttribute("idevento", id);
		if(this.id != null){
			String url = "http://localhost:8080/respherers/webresources/com.resphere.server.model.vivienda";
			ViviendaFacadeREST servicio = new ViviendaFacadeREST(Vivienda.class, url);
			Vivienda item = servicio.get(id);
			if(item != null){
				renderRequest.setAttribute("vivienda", item);
				super.doView(renderRequest, renderResponse);
			}
			else{
				renderRequest.setAttribute("itemv", item);
				super.doView(renderRequest, renderResponse);
			}
		}
	}
	
	@ProcessEvent(qname="{http://liferay.com/events}ipc.pitch3")
	public void viviendaDetail(EventRequest request, EventResponse response){
		Event event = request.getEvent();
		String idevento = (String)event.getValue();
		_log.error("idevento en Vivienda is> " + idevento);
		response.setRenderParameter("idevento", idevento);
		this.id = idevento;		
	}
}
