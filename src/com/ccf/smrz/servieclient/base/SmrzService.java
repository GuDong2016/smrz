
package com.ccf.smrz.servieclient.base;

import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebResult;
import javax.jws.WebService;
import javax.jws.soap.SOAPBinding;
import javax.xml.bind.annotation.XmlSeeAlso;
import javax.xml.ws.Action;


/**
 * This class was generated by the JAX-WS RI.
 * JAX-WS RI 2.2.7-b01 
 * Generated source version: 2.2
 * 
 */
@WebService(name = "SmrzService", targetNamespace = "main.smart.llj.webservice")
@SOAPBinding(style = SOAPBinding.Style.RPC)
@XmlSeeAlso({
    ObjectFactory.class
})
public interface SmrzService {


    /**
     * 
     * @param arg0
     * @return
     *     returns java.lang.String
     */
    @WebMethod
    @WebResult(partName = "return")
    @Action(input = "main.smart.llj.webservice/SmrzService/userLoginRequest", output = "main.smart.llj.webservice/SmrzService/userLoginResponse")
    public String userLogin(
            @WebParam(name = "arg0", partName = "arg0")
                    LoginRequestBean arg0);

    /**
     * 
     * @param arg0
     * @return
     *     returns java.lang.String
     */
    @WebMethod
    @WebResult(partName = "return")
    @Action(input = "main.smart.llj.webservice/SmrzService/userRegisterRequest", output = "main.smart.llj.webservice/SmrzService/userRegisterResponse")
    public String userRegister(
            @WebParam(name = "arg0", partName = "arg0")
                    RegisterRequestBean arg0);

    /**
     * 
     * @param arg0
     * @return
     *     returns java.lang.String
     */
    @WebMethod
    @WebResult(partName = "return")
    @Action(input = "main.smart.llj.webservice/SmrzService/saveLoginfoRequest", output = "main.smart.llj.webservice/SmrzService/saveLoginfoResponse")
    public String saveLoginfo(
            @WebParam(name = "arg0", partName = "arg0")
                    LogInfoRequestBean arg0);

    /**
     * 
     * @return
     *     returns mypackage.UserInfoServiceImpl
     */
    @WebMethod
    @WebResult(partName = "return")
    @Action(input = "main.smart.llj.webservice/SmrzService/getUserinfoServiceRequest", output = "main.smart.llj.webservice/SmrzService/getUserinfoServiceResponse")
    public UserInfoServiceImpl getUserinfoService();

    /**
     * 
     * @param arg0
     */
    @WebMethod
    @Action(input = "main.smart.llj.webservice/SmrzService/setUserinfoServiceRequest", output = "main.smart.llj.webservice/SmrzService/setUserinfoServiceResponse")
    public void setUserinfoService(
            @WebParam(name = "arg0", partName = "arg0")
                    UserInfoServiceImpl arg0);

}
