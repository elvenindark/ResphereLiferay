package com.resphere.view.portlet.evento;

import java.io.IOException;
import java.util.List;

import javax.portlet.PortletException;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.liferay.util.bridges.mvc.MVCPortlet;
import com.resphere.server.model.Ubicacion;
import com.resphere.service.UbicacionFacadeREST;

/**
 * Portlet implementation class MapaPortlet2
 */
public class MapaPortlet2 extends MVCPortlet {
	private static Log _log = LogFactory.getLog(ListEventosPortlet.class);
	@Override
	public void doView(RenderRequest renderRequest, RenderResponse renderResponse) throws IOException, PortletException {
		String url = "http://hp-hp:8080/respherers/webresources/com.resphere.server.model.ubicacion";
		UbicacionFacadeREST servicio = new UbicacionFacadeREST(Ubicacion.class, url);
		List<Ubicacion> ubicaciones = servicio.getAll();
		_log.error("eventos size is> " + ubicaciones.get(1).getIdevento());
		renderRequest.setAttribute("itemlist", ubicaciones);
		super.doView(renderRequest, renderResponse);
	}

}
