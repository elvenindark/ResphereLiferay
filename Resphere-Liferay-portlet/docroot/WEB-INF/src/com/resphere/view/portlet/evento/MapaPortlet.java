package com.resphere.view.portlet.evento;

import java.io.IOException;
import java.util.List;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.PortletException;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;
import javax.xml.namespace.QName;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.liferay.util.bridges.mvc.MVCPortlet;
import com.resphere.server.model.Ubicacion;
import com.resphere.service.UbicacionFacadeREST;

/**
 * Portlet implementation class MapaPortlet
 */
public class MapaPortlet extends MVCPortlet {
	
	private static Log _log = LogFactory.getLog(ListEventosPortlet.class);
	@Override
	public void doView(RenderRequest renderRequest, RenderResponse renderResponse) throws IOException, PortletException {
		String url = "http://localhost:8080/respherers/webresources/com.resphere.server.model.ubicacion";
		UbicacionFacadeREST servicio = new UbicacionFacadeREST(Ubicacion.class, url);
		List<Ubicacion> ubicaciones = servicio.getAll();
		//_log.error("eventos size is> " + eventos.get(1).getIdevento());
		renderRequest.setAttribute("itemlist", ubicaciones);
		super.doView(renderRequest, renderResponse);
	}

	public void eventoDetail(ActionRequest request, ActionResponse response){
		String id = null;
		id = (String)request.getParameter("search");
		_log.error("idevento en mapa is> " + id);
		QName qName = new QName("http://liferay.com/events","ipc.pitch1");
		response.setEvent(qName, id);
		QName qName2 = new QName("http://liferay.com/events","ipc.pitch2");
		response.setEvent(qName2, id);
		
		try {
			response.sendRedirect("/web/resphere/evaluacion");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
