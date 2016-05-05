
package com.ccf.smrz.servieclient.base;

import javax.xml.bind.annotation.XmlRegistry;


/**
 * This object contains factory methods for each 
 * Java content interface and Java element interface 
 * generated in the mypackage package. 
 * <p>An ObjectFactory allows you to programatically 
 * construct new instances of the Java representation 
 * for XML content. The Java representation of XML 
 * content can consist of schema derived interfaces 
 * and classes representing the binding of schema 
 * type definitions, element declarations and model 
 * groups.  Factory methods for each of these are 
 * provided in this class.
 * 
 */
@XmlRegistry
public class ObjectFactory {


    /**
     * Create a new ObjectFactory that can be used to create new instances of schema derived classes for package: mypackage
     * 
     */
    public ObjectFactory() {
    }

    /**
     * Create an instance of {@link LoginRequestBean }
     * 
     */
    public LoginRequestBean createLoginRequestBean() {
        return new LoginRequestBean();
    }

    /**
     * Create an instance of {@link LogInfoRequestBean }
     * 
     */
    public LogInfoRequestBean createLogInfoRequestBean() {
        return new LogInfoRequestBean();
    }

    /**
     * Create an instance of {@link UserInfoServiceImpl }
     * 
     */
    public UserInfoServiceImpl createUserInfoServiceImpl() {
        return new UserInfoServiceImpl();
    }

    /**
     * Create an instance of {@link RegisterRequestBean }
     * 
     */
    public RegisterRequestBean createRegisterRequestBean() {
        return new RegisterRequestBean();
    }

}
