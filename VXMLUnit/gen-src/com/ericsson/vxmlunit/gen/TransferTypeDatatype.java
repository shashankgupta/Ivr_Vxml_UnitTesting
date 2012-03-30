//
// This file was generated by the JavaTM Architecture for XML Binding(JAXB) Reference Implementation, vhudson-jaxb-ri-2.2-147 
// See <a href="http://java.sun.com/xml/jaxb">http://java.sun.com/xml/jaxb</a> 
// Any modifications to this file will be lost upon recompilation of the source schema. 
// Generated on: 2011.04.27 at 07:22:26 PM IST 
//


package com.ericsson.vxmlunit.gen;

import javax.xml.bind.annotation.XmlEnum;
import javax.xml.bind.annotation.XmlEnumValue;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for TransferType.datatype.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * <p>
 * <pre>
 * &lt;simpleType name="TransferType.datatype">
 *   &lt;restriction base="{http://www.w3.org/2001/XMLSchema}string">
 *     &lt;enumeration value="bridge"/>
 *     &lt;enumeration value="blind"/>
 *     &lt;enumeration value="consultation"/>
 *   &lt;/restriction>
 * &lt;/simpleType>
 * </pre>
 * 
 */
@XmlType(name = "TransferType.datatype")
@XmlEnum
public enum TransferTypeDatatype {

    @XmlEnumValue("bridge")
    BRIDGE("bridge"),
    @XmlEnumValue("blind")
    BLIND("blind"),
    @XmlEnumValue("consultation")
    CONSULTATION("consultation");
    private final String value;

    TransferTypeDatatype(String v) {
        value = v;
    }

    public String value() {
        return value;
    }

    public static TransferTypeDatatype fromValue(String v) {
        for (TransferTypeDatatype c: TransferTypeDatatype.values()) {
            if (c.value.equals(v)) {
                return c;
            }
        }
        throw new IllegalArgumentException(v);
    }

}