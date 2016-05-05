
package com.ccf.smrz.servieclient.base;

import java.net.MalformedURLException;
import java.net.URL;
import javax.xml.namespace.QName;
import javax.xml.ws.Service;
import javax.xml.ws.WebEndpoint;
import javax.xml.ws.WebServiceClient;
import javax.xml.ws.WebServiceException;
import javax.xml.ws.WebServiceFeature;


/**
 * This class was generated by the JAX-WS RI.
 * JAX-WS RI 2.2.7-b01 
 * Generated source version: 2.2
 * 
 */
@WebServiceClient(name = "SmrzServiceService", targetNamespace = "main.smart.llj.webservice", wsdlLocation = "http://123.206.60.110:8080/smrz_webservice/service/smrz?wsdl")
public class SmrzServiceService
    extends Service
{

    private final static URL SMRZSERVICESERVICE_WSDL_LOCATION;
    private final static WebServiceException SMRZSERVICESERVICE_EXCEPTION;
    private final static QName SMRZSERVICESERVICE_QNAME = new QName("main.smart.llj.webservice", "SmrzServiceService");

    static {
        URL url = null;
        WebServiceException e = null;
        try {
            url = new URL("http://123.206.60.110:8080/smrz_webservice/service/smrz?wsdl");
        } catch (MalformedURLException ex) {
            e = new WebServiceException(ex);
        }
        SMRZSERVICESERVICE_WSDL_LOCATION = url;
        SMRZSERVICESERVICE_EXCEPTION = e;
    }

    public SmrzServiceService() {
        super(__getWsdlLocation(), SMRZSERVICESERVICE_QNAME);
    }

    public SmrzServiceService(WebServiceFeature... features) {
        super(__getWsdlLocation(), SMRZSERVICESERVICE_QNAME, features);
    }

    public SmrzServiceService(URL wsdlLocation) {
        super(wsdlLocation, SMRZSERVICESERVICE_QNAME);
    }

    public SmrzServiceService(URL wsdlLocation, WebServiceFeature... features) {
        super(wsdlLocation, SMRZSERVICESERVICE_QNAME, features);
    }

    public SmrzServiceService(URL wsdlLocation, QName serviceName) {
        super(wsdlLocation, serviceName);
    }

    public SmrzServiceService(URL wsdlLocation, QName serviceName, WebServiceFeature... features) {
        super(wsdlLocation, serviceName, features);
    }

    /**
     * 
     * @return
     *     returns SmrzService
     */
    @WebEndpoint(name = "SmrzServicePort")
    public SmrzService getSmrzServicePort() {
        return super.getPort(new QName("main.smart.llj.webservice", "SmrzServicePort"), SmrzService.class);
    }

    /**
     * 
     * @param features
     *     A list of {@link WebServiceFeature} to configure on the proxy.  Supported features not in the <code>features</code> parameter will have their default values.
     * @return
     *     returns SmrzService
     */
    @WebEndpoint(name = "SmrzServicePort")
    public SmrzService getSmrzServicePort(WebServiceFeature... features) {
        return super.getPort(new QName("main.smart.llj.webservice", "SmrzServicePort"), SmrzService.class, features);
    }

    private static URL __getWsdlLocation() {
        if (SMRZSERVICESERVICE_EXCEPTION!= null) {
            throw SMRZSERVICESERVICE_EXCEPTION;
        }
        return SMRZSERVICESERVICE_WSDL_LOCATION;
    }

}
