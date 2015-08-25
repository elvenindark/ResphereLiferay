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
import com.resphere.server.model.Poblacion;
import com.resphere.service.PoblacionFacadeREST;

/**
 * Portlet implementation class PoblacionPortlet
 */
public class PoblacionPortlet extends MVCPortlet {
 
	private static Log _log = LogFactory.getLog(PoblacionPortlet.class);
	private String id;
	//Default Render Method.
	@Override
	public void doView(RenderRequest renderRequest, RenderResponse renderResponse) throws IOException, PortletException {
		renderRequest.setAttribute("idevento", id);
		if(this.id != null){
			String url = "http://localhost:8080/respherers/webresources/com.resphere.server.model.poblacion";
			PoblacionFacadeREST servicio = new PoblacionFacadeREST(Poblacion.class, url);
			List<Poblacion> poblaciones = servicio.getAllById(id);
			if(poblaciones!=null){
				//_log.error("poblaciones are> " + poblaciones.get(2).getIdtipoafectacion());
				for(Poblacion item: poblaciones)
					System.out.println(item.getNumero());
				renderRequest.setAttribute("itemlistp", poblaciones);
				super.doView(renderRequest, renderResponse);
			}else{
				_log.error("poblaciones es null");
				super.doView(renderRequest, renderResponse);
			}
		}else{
			_log.error("poblaciones ERROR CONEXION");
		}
		
	}
	
	@ProcessEvent(qname="{http://liferay.com/events}ipc.pitch3")
	public void poblacionDetails(EventRequest request, EventResponse response){
		Event event = request.getEvent();
		String idevento = (String)event.getValue();
		_log.error("idevento en Poblacion lanzamiento 3 is> " + idevento);
		response.setRenderParameter("idevento", idevento);
		this.id = idevento;
		
	}

}
