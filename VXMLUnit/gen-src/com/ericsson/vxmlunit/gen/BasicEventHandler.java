//
// This file was generated by the JavaTM Architecture for XML Binding(JAXB) Reference Implementation, vhudson-jaxb-ri-2.2-147 
// See <a href="http://java.sun.com/xml/jaxb">http://java.sun.com/xml/jaxb</a> 
// Any modifications to this file will be lost upon recompilation of the source schema. 
// Generated on: 2011.04.27 at 07:22:26 PM IST 
//


package com.ericsson.vxmlunit.gen;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;
import javax.xml.bind.JAXBElement;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlElementRef;
import javax.xml.bind.annotation.XmlElementRefs;
import javax.xml.bind.annotation.XmlMixed;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for basic.event.handler complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="basic.event.handler">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;group ref="{http://www.w3.org/2001/vxml}executable.content" maxOccurs="unbounded" minOccurs="0"/>
 *       &lt;attGroup ref="{http://www.w3.org/2001/vxml}EventHandler.attribs"/>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "basic.event.handler", propOrder = {
    "content"
})
public class BasicEventHandler {

    @XmlElementRefs({
        @XmlElementRef(name = "value", namespace = "http://www.w3.org/2001/vxml", type = JAXBElement.class),
        @XmlElementRef(name = "if", namespace = "http://www.w3.org/2001/vxml", type = If.class),
        @XmlElementRef(name = "enumerate", namespace = "http://www.w3.org/2001/vxml", type = JAXBElement.class),
        @XmlElementRef(name = "audio", namespace = "http://www.w3.org/2001/vxml", type = JAXBElement.class),
        @XmlElementRef(name = "return", namespace = "http://www.w3.org/2001/vxml", type = Return.class),
        @XmlElementRef(name = "clear", namespace = "http://www.w3.org/2001/vxml", type = Clear.class),
        @XmlElementRef(name = "log", namespace = "http://www.w3.org/2001/vxml", type = Log.class),
        @XmlElementRef(name = "reprompt", namespace = "http://www.w3.org/2001/vxml", type = Reprompt.class),
        @XmlElementRef(name = "goto", namespace = "http://www.w3.org/2001/vxml", type = Goto.class),
        @XmlElementRef(name = "exit", namespace = "http://www.w3.org/2001/vxml", type = Exit.class),
        @XmlElementRef(name = "submit", namespace = "http://www.w3.org/2001/vxml", type = Submit.class),
        @XmlElementRef(name = "data", namespace = "http://www.w3.org/2001/vxml", type = Data.class),
        @XmlElementRef(name = "disconnect", namespace = "http://www.w3.org/2001/vxml", type = Disconnect.class),
        @XmlElementRef(name = "var", namespace = "http://www.w3.org/2001/vxml", type = Var.class),
        @XmlElementRef(name = "foreach", namespace = "http://www.w3.org/2001/vxml", type = JAXBElement.class),
        @XmlElementRef(name = "prompt", namespace = "http://www.w3.org/2001/vxml", type = JAXBElement.class),
        @XmlElementRef(name = "script", namespace = "http://www.w3.org/2001/vxml", type = Script.class),
        @XmlElementRef(name = "throw", namespace = "http://www.w3.org/2001/vxml", type = Throw.class),
        @XmlElementRef(name = "assign", namespace = "http://www.w3.org/2001/vxml", type = Assign.class)
    })
    @XmlMixed
    protected List<java.lang.Object> content;
    @XmlAttribute(name = "count")
    protected BigInteger count;
    @XmlAttribute(name = "cond")
    protected String cond;

    /**
     * Gets the value of the content property.
     * 
     * <p>
     * This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the content property.
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * <pre>
     *    getContent().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link JAXBElement }{@code <}{@link Value }{@code >}
     * {@link If }
     * {@link JAXBElement }{@code <}{@link Enumerate }{@code >}
     * {@link String }
     * {@link Return }
     * {@link JAXBElement }{@code <}{@link Audio }{@code >}
     * {@link Log }
     * {@link Clear }
     * {@link Reprompt }
     * {@link Goto }
     * {@link Submit }
     * {@link Exit }
     * {@link Data }
     * {@link Var }
     * {@link Disconnect }
     * {@link JAXBElement }{@code <}{@link ForeachNotInPromptType }{@code >}
     * {@link JAXBElement }{@code <}{@link VxmlSpeak }{@code >}
     * {@link Script }
     * {@link Assign }
     * {@link Throw }
     * 
     * 
     */
    public List<java.lang.Object> getContent() {
        if (content == null) {
            content = new ArrayList<java.lang.Object>();
        }
        return this.content;
    }

    /**
     * Gets the value of the count property.
     * 
     * @return
     *     possible object is
     *     {@link BigInteger }
     *     
     */
    public BigInteger getCount() {
        return count;
    }

    /**
     * Sets the value of the count property.
     * 
     * @param value
     *     allowed object is
     *     {@link BigInteger }
     *     
     */
    public void setCount(BigInteger value) {
        this.count = value;
    }

    /**
     * Gets the value of the cond property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getCond() {
        return cond;
    }

    /**
     * Sets the value of the cond property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setCond(String value) {
        this.cond = value;
    }

}
