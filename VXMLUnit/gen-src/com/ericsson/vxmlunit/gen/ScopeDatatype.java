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
 * <p>Java class for Scope.datatype.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * <p>
 * <pre>
 * &lt;simpleType name="Scope.datatype">
 *   &lt;restriction base="{http://www.w3.org/2001/XMLSchema}NMTOKEN">
 *     &lt;enumeration value="private"/>
 *     &lt;enumeration value="public"/>
 *   &lt;/restriction>
 * &lt;/simpleType>
 * </pre>
 * 
 */
@XmlType(name = "Scope.datatype")
@XmlEnum
public enum ScopeDatatype {

    @XmlEnumValue("private")
    PRIVATE("private"),
    @XmlEnumValue("public")
    PUBLIC("public");
    private final String value;

    ScopeDatatype(String v) {
        value = v;
    }

    public String value() {
        return value;
    }

    public static ScopeDatatype fromValue(String v) {
        for (ScopeDatatype c: ScopeDatatype.values()) {
            if (c.value.equals(v)) {
                return c;
            }
        }
        throw new IllegalArgumentException(v);
    }

}
