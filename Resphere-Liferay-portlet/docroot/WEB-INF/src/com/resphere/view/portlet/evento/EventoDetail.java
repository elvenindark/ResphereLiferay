package com.resphere.view.portlet.evento;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.resphere.server.model.Evento;
import com.resphere.service.EventoFacadeREST;


/**
 * Portlet implementation class EventoDetail
 */
public class EventoDetail extends MVCPortlet {
 
	private static Log _log = LogFactory.getLog(ListEventosPortlet.class);
	private String id;
	
	@ProcessEvent(qname="{http://liferay.com/events}ipc.pitch")
	public void listDetails(EventRequest request, EventResponse response){
		Event event = request.getEvent();
		String idevento = (String)event.getValue();				
		this.id = idevento;
		_log.error("idevento en evento action phase is> " + idevento);
		response.setRenderParameter("idevento", idevento);		
	}
	
	@ProcessEvent(qname="{http://liferay.com/events}ipc.pitch1")
	public void listDetails1(EventRequest request, EventResponse response){
		Event event = request.getEvent();
		String idevento = (String)event.getValue();		
		this.id = idevento;
		_log.error("idevento en evento from map is> " + idevento);
		response.setRenderParameter("idevento", idevento);
		
	}
	
		//Default Render Method.
		@Override
		public void doView(RenderRequest renderRequest, RenderResponse renderResponse) throws IOException, PortletException {	
			renderRequest.setAttribute("idevento", id);
			if(this.id != null){
				String url = "http://localhost:8080/respherers/webresources/com.resphere.server.model.evento";
				EventoFacadeREST servicio = new EventoFacadeREST(Evento.class, url);
				Evento evento = new Evento();
				evento = servicio.get(id);				
				_log.error("idevento en Evento render phase is> " + evento.getIdevento());
				renderRequest.setAttribute("evento", evento);
			}else
				renderRequest.setAttribute("descripcion", "waiting for response");
			super.doView(renderRequest, renderResponse);
		}
}
