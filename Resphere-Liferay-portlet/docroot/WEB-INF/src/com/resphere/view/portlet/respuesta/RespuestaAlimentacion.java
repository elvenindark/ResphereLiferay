package com.resphere.view.portlet.respuesta;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.PortletException;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;
import javax.portlet.ResourceRequest;
import javax.portlet.ResourceResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.json.JSONException;

import com.liferay.portal.kernel.exception.PortalException;
import com.liferay.portal.kernel.exception.SystemException;
import com.liferay.portal.kernel.util.ParamUtil;
import com.liferay.util.bridges.mvc.MVCPortlet;
import com.resphere.server.model.Eventosv;
import com.resphere.server.model.Indicadorclave;
import com.resphere.server.model.Normaesencial;
import com.resphere.server.model.Normaminima;
import com.resphere.server.model.Respuestahumanitaria;
import com.resphere.server.model.Respuestahumanitariav;
import com.resphere.service.EventosvFacadeREST;
import com.resphere.service.IClaveFacadeREST;
import com.resphere.service.NEsencialFacadeREST;
import com.resphere.service.NMinimaFacadeREST;
import com.resphere.service.RespuestahumanitariaFacadeREST;
import com.resphere.service.RespuestahumanitariavFacadeREST;

/**
 * Portlet implementation class RespuestaAlimentacion
 */
public class RespuestaAlimentacion extends MVCPortlet {
 
	private static Log _log = LogFactory.getLog(RespuestaAlimentacion.class);
	@Override
	public void doView(RenderRequest renderRequest, RenderResponse renderResponse) throws IOException, PortletException{
		String request, request1;
		request = renderRequest.getParameter("jspPage");
		request1 = ParamUtil.getString(renderRequest, "jspPage");
		String url = "http://localhost:8080/respherers/webresources/com.resphere.server.model.eventosv";
		EventosvFacadeREST servicio = new EventosvFacadeREST(Eventosv.class, url);
		List<Eventosv> ubicaciones = servicio.getAll();
		if(request!=null && request1!=null)
			_log.error("eventosv are> " + ubicaciones.get(2).getEvento() + " jspPage:" + request1);
		else
			_log.error("eventosv are> " + ubicaciones.get(3).getEvento() +" render is null");
		renderRequest.setAttribute("itemlist", ubicaciones);
		super.doView(renderRequest, renderResponse);
	}

	@Override
	public void doEdit(RenderRequest renderRequest, RenderResponse renderResponse) throws IOException, PortletException{
		String request;
		request = renderRequest.getParameter("jspPage");
		String url = "http://localhost:8080/respherers/webresources/com.resphere.server.model.eventosv";
		EventosvFacadeREST servicio = new EventosvFacadeREST(Eventosv.class, url);
		List<Eventosv> ubicaciones = servicio.getAll();
		if(request!=null)
			_log.error("eventosv are> " + ubicaciones.get(2).getEvento() + " jspPage:" + request);
		else
			_log.error("request null");
		renderRequest.setAttribute("itemlist", ubicaciones);
		super.doEdit(renderRequest, renderResponse);
	}
	
	/*@Override
	public void render(RenderRequest request, RenderResponse response)
			throws PortletException, IOException{
		String renderPageName = ParamUtil.get(request, "renderPage", "respuestaAguaList-jsp");
		String renderPagePath = getInitParameter(renderPageName);
		include(renderPagePath, request, response);
		_log.debug("we are in render" + renderPageName.toString());
		super.render(request, response);
	}*/

	@Override
	public void  serveResource(ResourceRequest resourceRequest,
            ResourceResponse resourceResponse) throws IOException,
            PortletException {
 
        /**
         * Read form data sent by AJAX
         */
		/*String namespace = "<portlet:namespace />site:";
		String fid = (String) ParamUtil.getString(resourceRequest, "fid");		
		String cantidad = "fcantidad"+fid;
		String aplica = "faplica"+fid;*/
		String fid = (String) ParamUtil.getString(resourceRequest, "fid");
		String fidevento = (String) ParamUtil.getString(resourceRequest, "idevento");
		String fhid = (String) ParamUtil.getString(resourceRequest, "idindicadorclave");
		String fcantidad = (String) ParamUtil.getString(resourceRequest,"observacion");
		String faplica = (String) ParamUtil.getString(resourceRequest,"aplica");
		if(faplica.equals("true"))
			faplica = "1";
		else
			faplica = "0";
		
		_log.info("idiclave:" + fhid + ", observaciones:" + fcantidad + ", aplica:" + faplica + ", idevento:" + fidevento + ", idindicador:" + fhid);
		
		if(fcantidad != null && faplica != null && fidevento != null && fid != null){
			Respuestahumanitaria respuesta = new Respuestahumanitaria();
			respuesta.setAplica(faplica);
			respuesta.setIdevento(fidevento);
			respuesta.setIdindicadorclave(fhid);
			respuesta.setObservacion(fcantidad);

			String url = "http://localhost:8080/respherers/webresources/com.resphere.server.model.respuestahumanitaria";
			RespuestahumanitariaFacadeREST servicio = new RespuestahumanitariaFacadeREST(Respuestahumanitaria.class, url);
			if(servicio!=null)
				try {
					_log.info("idiclave:" + fhid + ", observaciones:" + fcantidad + ", aplica:" + faplica);
					servicio.post(respuesta);
					//resourceRequest.setAttribute("responseAjax", "Respuesta humanitaria guardada satisfactoriamente");
				} catch (JSONException e) {
					// TODO Auto-generated catch block
					//resourceRequest.setAttribute("responseAjax", "Respuesta humanitaria no guardada");
					e.printStackTrace();
				}			
		}
		super.serveResource(resourceRequest, resourceResponse);
		
	}

	public void respuestaAccion(ActionRequest actionRequest, ActionResponse actionResponse)throws IOException, PortletException, PortalException, SystemException{
		String idevento, idindicadorclave, action, backUrl = null;
		idevento = (String)actionRequest.getParameter("idevento");
		idindicadorclave = (String)actionRequest.getParameter("idindicadorclave");
		action = (String)actionRequest.getParameter("action");
		backUrl = (String)actionRequest.getParameter("backURL");		
		
		if(idevento != null && idindicadorclave != null && action != null){
			_log.info("we are in respuesta edit.jsp > " + idevento + ", " + idindicadorclave );
		}else
			_log.error("problems in respuesta action");
		
		String urlresp = "http://localhost:8080/respherers/webresources/com.resphere.server.model.respuestahumanitariav";
		RespuestahumanitariavFacadeREST servicioresp = new RespuestahumanitariavFacadeREST(Respuestahumanitariav.class, urlresp);
		
		Respuestahumanitariav respuesta;
		if(servicioresp.getAllByIds(idevento, idindicadorclave)!=null && servicioresp.getAllByIds(idevento, idindicadorclave).size()>0){
			respuesta = servicioresp.getAllByIds(idevento, idindicadorclave).get(0);
			//respuesta.setAplica("A");
		}else{
			respuesta = servicioresp.get(idindicadorclave);
			respuesta.setObservacion("");
			respuesta.setAplica("P");
		}
		respuesta.setIdevento(idevento);
		respuesta.setIdindicadorclave(idindicadorclave);
		if(respuesta.getAplica()!=null){			
			if(respuesta.getAplica().equals("1") || respuesta.getAplica().equals("on")){				
				respuesta.setAplica("true");				
			}else
				respuesta.setAplica("false");
		}else{
			respuesta.setAplica("false");
			System.out.println(respuesta.getAplica() + ", " + Boolean.valueOf(respuesta.getAplica()));
		}		
		
		if(respuesta != null){
			actionRequest.setAttribute("respuestav", respuesta);
			actionRequest.setAttribute("backURL", backUrl );
			_log.info("indicador>" + respuesta.getIdindicadorclave());			
		}else{
			_log.error("error respuesta");
		}
		
		actionResponse.setRenderParameter("jspPage", "/html/respuestaalimentacion/dialog.jsp");
	}

	 public void respuestaDetails(ActionRequest actionRequest, ActionResponse actionResponse)throws IOException, PortletException, PortalException, SystemException{
		   
		 String id, action, evento, lugar = null;		
			id = (String)actionRequest.getParameter("id");		
			action = (String)actionRequest.getParameter("action");
			evento = (String)actionRequest.getParameter("evento");
			lugar = (String)actionRequest.getParameter("lugar");
			
			if(id !=null && action != null)
				_log.info("we are in respuesta view.jsp> " + id );
			else
				_log.error("problems in action");	
				
			String urlresp = "http://localhost:8080/respherers/webresources/com.resphere.server.model.respuestahumanitariav";
			
			RespuestahumanitariavFacadeREST servicioresp = new RespuestahumanitariavFacadeREST(Respuestahumanitariav.class, urlresp);
			List<Respuestahumanitariav> respuestasv = servicioresp.getAllByIds(id, "02");
			
			//TODO AQUI CORREGIR LOS VALORES DE LA LISTA PARA QUE ENVIE P O A Y EL IDEVENTO
			for(Respuestahumanitariav item: respuestasv){			
				if(item.getIdevento()!=null){
					if(!item.getIdevento().equals(id)){					
						item.setObservacion("");
						item.setAplica("false");
					}				
				}else{
					item.setObservacion("");
					item.setAplica("false");
				}			
				item.setIdevento(id);			
			}
			
			if(respuestasv != null)
				actionRequest.setAttribute("respuestasAgua", respuestasv);		
			actionRequest.setAttribute("idevento", id);	
			actionRequest.setAttribute("evento", evento);
			actionRequest.setAttribute("lugar", lugar);
			actionResponse.setRenderParameter("jspPage", "/html/respuestaalimentacion/edit.jsp");	  
		 } 
	
	 public void respuestaDetailsOld(ActionRequest actionRequest, ActionResponse actionResponse)throws IOException, PortletException, PortalException, SystemException{
		   
			String id, action = null;
			
			id = (String)actionRequest.getParameter("id");		
			action = (String)actionRequest.getParameter("action");
			
			if(id !=null && action != null)
				_log.error("we are in action> " + id + ":" + action);
			else
				_log.error("problems in action");
		
			String urlnm = "http://localhost:8080/respherers/webresources/com.resphere.server.model.normaminima";
			String urlne = "http://localhost:8080/respherers/webresources/com.resphere.server.model.normaesencial";
			String urlic = "http://localhost:8080/respherers/webresources/com.resphere.server.model.indicadorclave";	
			String urlresp = "http://localhost:8080/respherers/webresources/com.resphere.server.model.respuestahumanitariav";
			
			RespuestahumanitariavFacadeREST servicioresp = new RespuestahumanitariavFacadeREST(Respuestahumanitariav.class, urlresp);
			//List<Respuestahumanitariav> respuestasv = servicioresp.getAllById("1");
			List<Respuestahumanitariav> respuestasv = servicioresp.getAllByIds(id, "01");
			
			if(respuestasv != null)
				actionRequest.setAttribute("respuestasv", respuestasv);
			_log.info("size respuestas is >" + respuestasv.size());
			
			NMinimaFacadeREST servicionm = new NMinimaFacadeREST(Normaminima.class, urlnm);
			List<Normaminima> nminimas = servicionm.getAllByIdSH("1");
			if(nminimas != null && nminimas != null){
				ArrayList<List<Normaesencial>> nesenciales = new ArrayList<List<Normaesencial>>();
				for(int i = 0; i < nminimas.size(); i ++){
					NEsencialFacadeREST servicione = new NEsencialFacadeREST(Normaesencial.class, urlne);
					if(servicione != null){
						nesenciales.add(servicione.getAllByIdNM(nminimas.get(i).getIdnormaminima().toString()));										
					}				
				}			
				
				ArrayList<List<Indicadorclave>> iclaves = new ArrayList<List<Indicadorclave>>();
				IClaveFacadeREST servicioic = new IClaveFacadeREST(Indicadorclave.class, urlic);
				if(servicioic != null){	
					int totalic = 0;
					for(int i = 0; i < nesenciales.size(); i++)
						for(int j = 0; j < nesenciales.get(i).size(); j++){						
							iclaves.add(servicioic.getAllByIdNE(nesenciales.get(i).get(j).getIdnormaesencial().toString()));
							totalic += iclaves.get(i).size();						
						}				
				}
					
				actionRequest.setAttribute("idevento", id);
				actionRequest.setAttribute("nesenciales", nesenciales);
				actionRequest.setAttribute("nminimas", nminimas);
				actionRequest.setAttribute("iclaves", iclaves);
			}
			else
				_log.error("error al traer normas");		
			
			actionResponse.setRenderParameter("jspPage", "/html/respuestaalimentacion/edit.jsp");
		  
		 } 

	
	public void viewDetails(ActionRequest request, ActionResponse response){
		
	}

}
