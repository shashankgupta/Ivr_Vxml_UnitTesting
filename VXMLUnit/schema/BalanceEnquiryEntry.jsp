<%@ taglib  uri="http://struts.apache.org/tags-bean" prefix="bean" %><?xml version="1.0" ?>
<%@ taglib uri="/WEB-INF/custom-tag.tld" prefix="ivr" %>
	
<vxml xmlns="http://www.w3.org/2001/vxml" 
      xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
      xsi:schemaLocation="http://www.w3.org/2001/vxml http://www.w3.org/TR/voicexml20/vxml.xsd" 
      version="2.0" application="/VXMLIVR/applicationRootAction.do?versionId=<%=request.getParameter("versionId")%>">
		
<% 
   response.setContentType("text/xml;charset=UTF-8");
   response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
   response.setHeader("Pragma","no-cache"); //HTTP 1.0
   response.setDateHeader ("Expires", 0); //prevents caching at the proxy server 
%>	

<bean:define id="currentModule" name="BalanceEnquiryEntryActionForm" property="currentModule" />
<bean:define id="callType" name="BalanceEnquiryEntryActionForm" property="callType" />
<%-- US-273 Starts Here --%>
<bean:define id="OptionalParametersString" name="BalanceEnquiryEntryActionForm" property="optionalParametersString" />
<%-- US-273 Ends Here --%>

 <form id="balance_enquiry_entry">

    <var name="debug" expr="application.debug"/>
    <var name="presentationId" expr="application.presentationId"/>
    <var name="versionId" expr="application.versionId"/>
    <var name="NO_DEBUG_LEVEL" expr="0"/>
    <%-- US-273 Starts Here --%>
    <var name="OptionalParametersString" expr="'<%=OptionalParametersString %>'"/>
    <%-- US-273 Ends Here --%>
    <block>
		        <assign name="application.currentModule" expr="'<%=currentModule%>'"/>
    			<assign name="application.callType" expr="'<%=callType%>'"/>
    			<assign name="application.lastModule" expr="application.lastModule + ',<%=currentModule%>'"/>
	           <ivr:log label="BalanceEnquiry">Balance Enquiry Entry  ||  
			   Presentation Id = <value expr="presentationId" />  ||  
		       Version Id = <value expr="versionId" />   ||   
		       Current Module Id = <value expr="'<%=currentModule%>'" />   ||   
		       Call Type = <value expr="'<%=callType%>'" />   ||   
		       <%-- US-273 Starts Here --%>
		       Optional Module Specific OptionalParametersString = <value expr="OptionalParametersString" /></ivr:log>
		       <%-- US-273 Ends Here --%>		       		       
		    

    		<%-- US-273 Starts Here --%>
            <submit expr="'/VXMLIVR/BalanceEnquiry.do?presentationId='+presentationId+'&amp;debug='+debug+'&amp;versionId='+versionId+OptionalParametersString"/>
            <%-- US-273 Ends Here --%>
    </block>
 </form>

</vxml>