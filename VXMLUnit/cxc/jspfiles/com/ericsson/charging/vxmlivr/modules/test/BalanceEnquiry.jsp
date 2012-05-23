<%@ taglib  uri="http://struts.apache.org/tags-bean" prefix="bean" %><?xml version="1.0" ?>
<%@ taglib  uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="/WEB-INF/custom-tag.tld" prefix="ivr" %>
<%@ page import="com.ericsson.charging.vxmlivr.modules.balanceenquiry.common.BalanceEnquiryParams" %>
<%@ page import="com.ericsson.charging.vxmlivr.core.sve.MicroflowConstants" %>
<!--  -->
<!-- Dynamic Balance Enquiry.vxml -->
<vxml xmlns="http://www.w3.org/2001/vxml"
      xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
      xsi:schemaLocation="http://www.w3.org/2001/vxml http://www.w3.org/TR/voicexml20/vxml.xsd"
      version="2.0" 
      application="/VXMLIVR/applicationRootAction.do?versionId=<%=request.getParameter("versionId")%>">
  <meta name="Author" content=""/>
  <meta name="Date" content=""/>
  <meta name="Description" content="BalanceEnquiryChargeable"/>
  <meta name="Support" content=""/>
  <!--  -->
  <bean:define id="vxmlComplianceLevel" name="BalanceEnquiryActionForm" property="vxmlComplianceLevel"/>
  <bean:define id="vxmlsetId" name="BalanceEnquiryActionForm" property="vxmlsetId"/>
  <%-- US-273 Starts Here --%>
  <bean:define id="OptionalConfigurationId" name="BalanceEnquiryActionForm" property="configurationId" />
  <bean:define id="OptionalPromptSetId" name="BalanceEnquiryActionForm" property="promptSetId" />
  <bean:define id="OptionalParametersString" name="BalanceEnquiryActionForm" property="optionalParametersString" />
  <%-- US-273 Ends Here --%>
  <bean:define id="isCreditClearanceDateToBeAnnounced" name="BalanceEnquiryActionForm" property="isCreditClearanceDateToBeAnnounced" type="java.lang.Boolean"/>
  <bean:define id="chargingRequired" name="BalanceEnquiryActionForm" property="chargingRequired" type="java.lang.Boolean"/>
  <bean:define id="chargeConfirmationRequired" name="BalanceEnquiryActionForm" property="chargeConfirmationRequired" type="java.lang.Boolean"/>
  <bean:define id="chargeAnnouncementRequired" name="BalanceEnquiryActionForm" property="chargeAnnouncementRequired" type="java.lang.Boolean"/>
  <bean:define id="noInputTimeout" name="BalanceEnquiryActionForm" property="noInputTimeout" type="java.lang.String"/>
  <bean:define id="maxConfirmationRetries" name="BalanceEnquiryActionForm" property="maxConfirmationRetries" type="java.lang.Integer"/>
  <bean:define id="maxTimeoutRetries" name="BalanceEnquiryActionForm" property="maxTimeoutRetries" type="java.lang.Integer"/>
  <bean:define id="maxInvalidRetries" name="BalanceEnquiryActionForm" property="maxInvalidRetries" type="java.lang.Integer"/>
  <bean:define id="minThresholdBalAmount" name="BalanceEnquiryActionForm" property="minThresholdBalAmount"/>
  <bean:define id="minThresholdServiceExpiryDuration" name="BalanceEnquiryActionForm" property="minThresholdServiceExpiryDuration"/>
  <bean:define id="daAnnnouncementOrder" name="BalanceEnquiryActionForm" property="daAnnnouncementOrder"/>
  <bean:define id="playSubDAEnabled" name="BalanceEnquiryActionForm" property="playSubDAEnabled"/>
  <bean:define id="announcementForms" name="BalanceEnquiryActionForm" property="announcementForms" type="java.util.List"/>
  <%-- PC = WATA-015 Starts --%>
  <bean:define id="mainBalanceAccountType" name="BalanceEnquiryActionForm" property="mainBalanceAccountType" type="java.lang.String"/>
  <bean:define id="referenceDAForMasterBalance" name="BalanceEnquiryActionForm" property="referenceDAForMasterBalance" type="java.lang.Integer"/>
  <%-- PC = WATA-015 Ends --%>
  <%-- For PC Cable and Wireless Starts here--%>
    <bean:define id="daList" name="BalanceEnquiryActionForm" property="DAList" type="java.lang.String"/>
	<bean:define id="includeMasterBalanceFlag" name="BalanceEnquiryActionForm" property="includeMasterBalanceFlag" type="java.lang.Boolean"/>
    <%-- For PC Cable and Wireless Ends Here--%>
	<%-- pmr 854, remote stats logging Starts here --%>
	<bean:define id="moduleWiseStatisticsLoggingEnable" name="BalanceEnquiryActionForm" property="moduleWiseStatisticsLoggingEnable" type="java.lang.Boolean"/>
	<%-- pmr 854, remote stats logging Ends here --%>

    <%
      response.setContentType("text/xml;charset=UTF-8");
      response.setHeader("Cache-Control", "max-age=31536000");
		int i=0;
      String vxmlPath="/vxmlFiles/com/ericsson/charging/vxmlivr/" + vxmlsetId + "/modules/balanceenquiry/";
      String vxmlFileSuffix=".vxml.part";

      String jspPath="/jspFiles/com/ericsson/charging/vxmlivr/modules/balanceenquiry/" + vxmlComplianceLevel + "/";
      String announcementJspPath="/jspFiles/com/ericsson/charging/vxmlivr/modules/balanceenquiry/";
      String jspFileSuffix=".jsp.part";
    %>
  <!--  -->
  <property name="documentfetchhint" value="prefetch"/>
  <property name="documentmaxage" value="31536000"/>
  <property name="audiomaxage" value="31536000"/>
  <property name="grammarmaxage" value="31536000"/>
  <property name="scriptmaxage" value="31536000"/>
  <property name="timeout" value="10s"/>
  <!--  -->
  <!--Utility comman script -->
  <script src="/VXMLIVR/ECMAScripts/com/ericsson/charging/vxmlivr/core/common/scripts/UtilityScripts.es?versionId=<%=request.getParameter("versionId")%>" maxage="31536000" fetchhint="prefetch"/>	
  <!--BalanceEnquiry ECMA script -->
  <script src="/VXMLIVR/ECMAScripts/com/ericsson/charging/vxmlivr/modules/balEnquiry/BalanceEnquiryScripts.es?versionId=<%=request.getParameter("versionId")%>" maxage="31536000" fetchhint="prefetch"/>	
  <!--BalanceEnquiry Static VXML script -->
  <!-- Customer Editable Scripts -->
  <script maxage="31536000" fetchhint="prefetch">
	  <ivr:include page="<%=vxmlPath + "BalanceEnquiryScripts" + vxmlFileSuffix%>"/>
  </script>
  <!--  -->
  <var name="masterAccountBalanceInFirstCurrency" expr="''"/>
  <var name="absAccountBalanceInFirstCurrency" expr="''"/>
  <var name="masterAccountBalanceInSecondCurrency" expr="''"/>
  <var name="absAccountBalanceInSecondCurrency" expr="''"/>
  <var name="serviceFeeExpiryDate" expr="''"/>
  <var name="servExpDateVsTodayDate" expr="''"/>
  <var name="supervisionFeeExpiryDate" expr="''"/>
  <var name="supervExpDateVsTodayDate" expr="''"/>
  <var name="creditClearanceDate" expr="''"/>
  <var name="creditClearanceDateVsTodayDate" expr="''"/>
  <var name="creditClearanceDateAnnFlag" expr="'<%=isCreditClearanceDateToBeAnnounced%>'"/>
  <var name="serviceRemovalDate" expr="''"/>
  <var name="serviceRemovalDateVsTodayDate" expr="''"/>
  <var name="supervExpDateVsServExpDate" expr="''"/>
  <var name="firstCurrencyName" expr="''"/>
  <var name="secondCurrencyName" expr="''"/>
  <var name="daDetails" expr="''"/>
  <var name="presentationId" expr="application.presentationId"/>
  <var name="versionId" expr="application.versionId"/>
  <%-- US-273 Starts Here --%>
  <var name="promptsetId" expr="'<%=OptionalPromptSetId%>'"/>
  <var name="OptionalParametersString" expr="'<%=OptionalParametersString %>'"/>
  <%-- US-273 Ends Here --%>
  <var name="vxmlsetId" expr="application.vxmlsetId"/>
  <var name="dateFormat" expr="application.dateFormat"/>
  <var name="currencyFormat" expr="application.defaultCurrencyFormat"/>
  <var name="subscriberLanguage" expr="application.subscriberLanguage"/>
  <var name="voiceBaseLanguage" expr="application.voiceBaseLanguage"/>
  <var name="callingNumber" expr="application.callingNumber"/>
  <var name="masterAccountNumber" expr="application.masterAccountNumber"/>
  <var name="gender" expr="application.gender"/>
  <%-- TR-HK52079 -Start --%> 
  <var name="enableStatisticsLoggingGlobal" expr="application.enableStatisticsLoggingGlobal"/>
  <%-- TR-HK52079 -End --%>
  <var name="debug" expr="application.debug"/>
  <var name="nextFormId" expr="''"/>
  <var name="exitStatus" expr="'SUCCESS'"/>
  <var name="playCurrencySubdialogName" expr="'playCurrency'"/>
  <var name="playDateSubdialogName" expr="'playDate'"/>

  <%-- TR No. - HL18437 Starts Here --%>
  <var name="speaker" expr="promptsetId"/>
  <%-- TR No. - HL18437 Ends Here --%>
  <var name="promptId" expr=""/>
  <var name="subscriberNAI" expr="application.subscriberNAI"/>
  <var name="SUCCESSCODE" expr="0"/>
  <var name="expiryDatePlayed" expr="'false'"/>
  <var name="balanceEnquiryHelperVxml" expr="'../VXMLIVR/PlayBalanceVXML.do?debug='+debug+'&amp;versionId='+versionId+OptionalParametersString"/>
  <var name="NO_DEBUG_LEVEL" expr="0"/>
  <var name="voiceBaseURL" expr="application.voiceBaseURL"/>
  <var name="playMasterAccountBalanceInFirstCurrency" expr="'false'"/>
  <var name="playMasterAccountBalanceInSecondCurrency" expr="'false'"/>
  <var name="playServiceFeeExpiryDate" expr="'false'"/>
  <var name="playSupervisionFeeExpiryDate" expr="'false' "/>
  <var name="playServiceRemovalDate" expr="'false' "/>
  <var name="sumOfAllAccounts" expr="''"/>
  <%-- TR-HI59399-Start --%>
  <var name="bothServAndSupervDatesConfigured" expr="false"/>
  <%-- TR-HI59399-End --%>
  <%-- As of US:197.Adding DA Announcement Order to Balance Enquiry --%>
  <var name="playDA" expr="'false'"/>
  <!--  -->
  
  <%--HP-CELTELD-V001 STARTS--%>
  <var name="serviceClass" expr="''"/>
  <var name="playServiceClass" expr="'false'"/>
  <var name="serviceClassPrompt" expr="''" />
  <var name="playCreditClearanceDate" expr="'false'"/>
  
  <%--HP-CELTELD-V001 ENDS --%>
  <%-- FOR PMR 477 --%>
  <var name="playMUIOAnnouncementFlag" expr="'false'"/>
  <!--  -->
  <!-- For Chargeable Balance Enquiry Starts -->
  <!-- Generic input configuration variables -->
  <var name="chargingRequired" expr="'<%=chargingRequired%>'"/>
  <var name="chargeConfirmationRequired" expr="'<%=chargeConfirmationRequired%>'"/>
  <var name="chargeAnnouncementRequired" expr="'<%=chargeAnnouncementRequired%>'"/>
  <var name="noInputTimeout" expr="'<%=noInputTimeout%>'"/>
  <var name="maxConfirmationRetries" expr="<%=maxConfirmationRetries%>"/>
  <var name="maxTimeoutRetries" expr="<%=maxTimeoutRetries%>"/>
  <var name="maxInvalidRetries" expr="<%=maxInvalidRetries%>"/>
  <var name="configurationId" expr="'<%=OptionalConfigurationId%>'"/>
  <%--  WATA-015 Starts --%>
  <var name="mainBalanceAccountType" expr="'<%=mainBalanceAccountType%>'"/>
  <var name="referenceDAForMasterBalance" expr="'<%=referenceDAForMasterBalance%>'"/>
  <%--  WATA-015 Ends --%>
  <var name="currencyForPercentage" expr="''"/>

  <!--  Changes done for PMR 826 -->
  <var name="referenceDA1" expr="''"/>
  <var name="referenceDA2" expr="''"/>
  <var name="referenceDA" expr="'NULL'"/>
 
  <%--  WATA US-1339 ENDS --%>
  <%-- US-273 Starts Here --%>

  <var name="promptsetId" expr="'<%=OptionalPromptSetId%>'"/>
  <var name="OptionalParametersString" expr="'<%=OptionalParametersString %>'"/>
  <%-- US-273 Ends Here --%>
  <!-- Fast Adjustment Starts -->
  <var name="chargingMethod" expr="'<bean:write name="BalanceEnquiryActionForm" property="chargingMethod"/>'"/>
  <var name="adjustmentAmount" expr="'<bean:write name="BalanceEnquiryActionForm" property="adjustmentAmount"/>'"/>
  <var name="adjustmentAmountabs" expr="'<bean:write name="BalanceEnquiryActionForm" property="adjustmentAmountabs"/>'"/>
  <var name="adjustmentAmount2" expr="'<bean:write name="BalanceEnquiryActionForm" property="adjustmentAmount2"/>'"/>
  <var name="adjustmentAmount2abs" expr="'<bean:write name="BalanceEnquiryActionForm" property="adjustmentAmount2abs"/>'"/>
  <var name="transactionCurrency" expr="'<bean:write name="BalanceEnquiryActionForm" property="transactionCurrency"/>'"/>
  <var name="transactionCurrency2" expr="'<bean:write name="BalanceEnquiryActionForm" property="transactionCurrency2"/>'"/>
  <var name="transactionType" expr="'<bean:write name="BalanceEnquiryActionForm" property="transactionType"/>'"/>
  <var name="transactionCode" expr="'<bean:write name="BalanceEnquiryActionForm" property="transactionCode"/>'"/>
  <!-- Fast Adjustment Ends -->
  <!--  Status variables  -->
  <var name="STATUS_SUCCESS" expr="'SUCCESS'"/>
  <var name="STATUS_SYSTEM_FAILURE" expr="'SYSTEM_FAILURE'"/>
  <var name="STATUS_FAILURE_RETRY" expr="'FAILURE_RETRY'"/>
  <var name="STATUS_FAILURE_TIMEOUT" expr="'FAILURE_TIMEOUT'"/>
  <var name="STATUS_FAILURE_INVALID_RETRY" expr="'FAILURE_INVALID_RETRY'"/>
  <var name="STATUS_CHARGES_REJECTED" expr="'CHARGES_REJECTED'"/>
  <var name="STATUS_CHARGES_REVERTED" expr="'CHARGES_REVERTED'"/>
  <var name="STATUS_FAILURE_ROLLBACK" expr="'FAILURE_ROLLBACK'"/>
  <var name="STATUS_FAILURE_MAXALLOWEDBALENQDONE" expr="'FAILURE_MAXALLOWEDBALENQDONE'"/>
  <!-- Fast Adjustment Starts -->
  <var name="STATUS_FAILURE_TEMPORARY_BLOCKED" expr="'TEMPORARY_BLOCKED'"/>
  <var name="STATUS_FAILURE_DEDICATED_ACCOUNT_NOT_ALLOWED" expr="'FAILURE_DEDICATED_ACCOUNT_NOT_ALLOWED'"/>
  <var name="STATUS_FAILURE_DATE_ADJUSTMENT_ERROR" expr="'FAILURE_DATE_ADJUSTMENT_ERROR'"/>
  <!-- Fast Adjustment Ends -->
  <!--  -->
  <!-- Counter variables -->
  <var name="counterConfirmRetry" expr="0"/>
  <var name="counterConfirmTimeout" expr="0"/>
  <var name="counterConfirmInvalidRetry" expr="0"/>
  <!-- Other Constants -->
  <var name="NULL_STRING" expr="'NULL'"/>
  <var name="TRUE_STRING" expr="'true'"/>
  <var name="FALSE_STRING" expr="'false'"/>
  <var name="NOCHARGE" expr="-1"/>
  <var name="RESERVE" expr="1"/>
  <var name="DEDUCT" expr="2"/>
  <var name="COMMIT" expr="3"/>
  <var name="ROLLBACK" expr="4"/>
  <var name="CHARGING_STANDARD" expr="'<%=BalanceEnquiryParams.CHARGING_STANDARD%>'"/> 
  <var name="CHARGING_FASTADJUST" expr="'<%=BalanceEnquiryParams.CHARGING_FASTADJUST%>'"/> 
  <!-- Other variables -->
  <var name="chargingType" expr="NOCHARGE"/>
  <var name="locationNumber" expr="application.locationNumber"/>
  <var name="reservationCorrelationID" expr="-1"/>
  <var name="UpdateRollback" expr="'false'"/>
  <!-- GetBalanceDetails Response Variables -->
  <var name="responseCode" expr="''"/> 
  <var name="resultCurrency1" expr="NULL_STRING"/>
  <var name="resultCurrency2" expr="NULL_STRING"/>
  <var name="cost1" expr="''"/>
  <var name="cost1abs" expr="''"/>
  <var name="cost2" expr="''"/>
  <var name="cost2abs" expr="''"/>
  <var name="chargingResultCode" expr="-1"/>
  <!-- For Chargeable balance Enquiry Ends -->
  <var name="costRepromptEnabled" expr="application.repromptEnabled"/>
  <%-- TR HJ54325 starts  --%>
  <var name="unitThresholdBalance" expr="''"/>
  <var name="unitThresholdBalanceInteger" expr="0"/>
  <var name="minThresholdBalAmount" expr="<%=minThresholdBalAmount%>"/>
  <var name="minThresholdServiceExpiryDuration" expr="<%=minThresholdServiceExpiryDuration%>"/>
  <var name="enableStatisticsLogging" expr="'<%= moduleWiseStatisticsLoggingEnable%>'"/>

   <%-- TR HJ54325 ends  --%>
  <%-- PC HP-STC-V002(LANA) STARTS --%>
  <!-- Added DASelectionList to send as a parameter to GetBalance Request -->
  <var name="DASelectionList" expr="NULL_STRING"/>
    
  <!-- AIR 3.3 Optional parameter -->
  <var name="dedicatedAccountID" expr="NULL_STRING"/>
  <var name="adjustmentAmountRelative" expr="NULL_STRING"/>
  <var name="dedicatedAccountValueNew" expr="NULL_STRING"/>
  <var name="adjustmentDateRelative" expr="NULL_STRING"/>
  <var name="expiryDate" expr="NULL_STRING"/>
  <var name="relativeDateAdjustmentSupervision" expr="NULL_STRING"/>
  <var name="relativeDateAdjustmentServiceFee" expr="NULL_STRING"/>
  <var name="supervisionExpiryDate" expr="NULL_STRING"/>
  <var name="creditClearancePeriod" expr="NULL_STRING"/>
  <var name="serviceRemovalPeriod" expr="NULL_STRING"/>
  <var name="transactionType" expr="NULL_STRING"/>
  <var name="transactionCode" expr="NULL_STRING"/>
  <var name="externalData1" expr="NULL_STRING"/>
  <var name="externalData2" expr="NULL_STRING"/>    

  <var name="play_AccountBalance" expr="'playAccountBalance'"/>
  <var name="play_ServiceFeeExpiryDate" expr="'playServiceFeeExpiryDate'"/>
  <var name="play_Currency" expr="'playCurrency'"/>
  <var name="play_CreditClearanceDate" expr="'playCreditClearanceDate'"/>	
  <var name="play_SameServiceAndSupervisionExpiryDates" expr="'playSameServiceAndSupervisionExpiryDates'"/>
  <var name="play_ServiceRemovalDate" expr="'playServiceRemovalDate'"/>
  <var name="play_ServiceClass" expr="'playServiceClass'"/>
  <var name="play_SupervisionFeeExpiryDate" expr="'playSupervisionFeeExpiryDate'"/> 
      
  <%-- PC HP-STC-V002(LANA) ENDS --%>
  <!--  -->
  <!-- Handling for EcmaScript call :FC 154 VXML Compliance Starts.-->
  <!-- Make the VoiceBaseInterface file selection dynamic based upon the compliance. -->
  <var name="vxmlComplianceLevel" expr="'<%=vxmlComplianceLevel%>'"/>
  <var name="voiceBaseInterfaceVxml" expr="'/VXMLIVR/vxmlFiles/com/ericsson/charging/vxmlivr/core/languagehandling/VoiceBaseInterface_'+vxmlComplianceLevel+'.vxml?presentationId=' + presentationId + '&amp;versionId='+versionId"/> 
  <!-- Handling for EcmaScript call :FC 154 VXML Compliance Ends-->
  <%-- As of US:197.Adding DA Announcement Order to Balance Enquiry --%>
  <var name="daAnnnouncementOrder" expr="'<%=daAnnnouncementOrder%>'"/>
  
  <%-- Airip 4.0 Offer Support --%>
  <var name="playOffers" expr="'false'"/>
  <var name="playOfferStatus" expr="'false'"/>
  <var name="unknownSubscriberNAI" expr="'-1'"/>
  <%-- PMR 477 Start  --%>
  <var name="playMUIOAnnouncementFlag" expr="'false'"/>
  <var name="masterSubscriberFlag" expr="application.masterSubscriberFlag"/>
  <var name="masterDAErrorPromptId" expr="''"/>
  <var name="requestFirstAccessibleAndExpiredBalanceAndDateFlag" expr="'<%= playSubDAEnabled %>'"/>
  <var name="requestSubDedicatedAccountDetailsFlag" expr="NULL_STRING"/>
  <%
  if(announcementForms.contains("MUIOAnnouncementOrder")) {
  %>
  <var name="MUIOOfferId" expr="application.MUIOOfferId"/>
  <%
  } else {
  %>
  <var name="MUIOOfferId" expr="'NULL'"/>
  <%
  }
  %>
  <var name="isOffersDAFound" expr="'false'"/>
  <var name="MUIODADetails" expr="''"/>
  <var name="PlayMUDA" expr="'false'"/>
  <%-- PMR 477 End  --%>

<%-- TELMA V001 Start --%>
<var name ="announcementRepetitionTimes" expr="0"/>
<var name ="maxAnnouncementRepetitionTimes" expr="0"/>
<var name ="listenAgainDTMF" expr = "'2'"/>


<%-- TELMA V001 End --%>

  <%-- For PC Cable and Wireless Starts here--%>
	<var name="daList" expr="'<%=daList%>'"/>
	<var name="includeMasterBalanceFlag" expr="'<%=includeMasterBalanceFlag%>'"/>		
	<var name="play_TotalBalance" expr="'playTotalBalance'"/>
	<var name="playTotalBalanceInFirstCurrency" expr="'false'"/>
	<var name="playTotalBalanceInSecondCurrency" expr="'false'"/>	
	<var name="playDASuccessIntro" expr="'false'"/>
	<var name="totalBalanceAnnouncement" expr="'Total Balance'"/>
	<var name="masterBalanceAnnouncement" expr="'Master Balance'"/>
  <%-- For CWP EP Starts --%>
  <var name="daTotalBalanceCurrency1" expr="NULL_STRING"/>
  <var name="daTotalBalanceCurrency2" expr="NULL_STRING"/>
  <var name="daTotalBalanceAbsCurrency1" expr="NULL_STRING"/>
  <var name="daTotalBalanceAbsCurrency2" expr="NULL_STRING"/>  
  <%-- For CWP EP Ends --%>
  <%-- For PC Cable and Wireless Ends Here--%>

  <!--  -->
  <ivr:include page="<%=vxmlPath + "BalanceEnquiryVariables" + vxmlFileSuffix%>"/>
  <!--  -->
  <!-- Check For Charges -->
  <!--  -->
  <!--  Form Names restored to previous one  -->
  <form id="form_BalanceEnquiry">
    <block name="block_form_BalanceEnquiry">
      <goto next="#<%=MicroflowConstants.GENERAL_FORM_PREFIX%>form_BalanceEnquiry"/>
    </block>
  </form>
  <!--  -->
  <form id="<%=MicroflowConstants.GENERAL_FORM_PREFIX%>form_BalanceEnquiry" scope="document">
    <block name="block_BalanceEnquiry">
        <ivr:log label="BalanceEnquiry" expr="'Starting'">Balance Enquiry Main Starts   ||   
        Prompt Set Id = <value expr="promptsetId"/>   ||   
        Version Id = <value expr="versionId"/>   ||   
        Balance Equiry Done Counter = <value expr="application.counter_BalEnq"/>   ||   
        ChargingRequired is <value expr="chargingRequired"/>   ||   
        ChargeConfirmationRequired is <value expr="chargeConfirmationRequired"/>   ||   
        ChargeAnnouncementRequired is <value expr="chargeAnnouncementRequired"/>   ||   
		Vxml Compliance Level is <value expr="vxmlComplianceLevel"/>   ||   
		VoiceBaseInterfaceVxml is <value expr="voiceBaseInterfaceVxml"/>   ||   
		masterSubscriberFlag is <value expr="masterSubscriberFlag"/>   ||   
		MUIOOfferId is <value expr="MUIOOfferId"/> || 
                daList is = <value expr="daList"/> || 
                includeMasterBalanceFlag is = <value expr="includeMasterBalanceFlag"/> || 
                referenceDAForMasterBalance = <value expr="referenceDAForMasterBalance"/> || 
                mainBalanceAccountType = <value expr="mainBalanceAccountType"/> </ivr:log>
      <!--  -->
       <ivr:include page="<%=vxmlPath + "BalanceEnquiryStart" + vxmlFileSuffix%>"/>
      <!--  -->
      <if cond="chargingRequired == 'true'">
        <if cond="chargeConfirmationRequired == 'true'">
          <if cond="chargeAnnouncementRequired == 'true'">
            <assign name="chargingType" expr="RESERVE"/>
              <ivr:log label="BalanceEnquiry">Going to Get Balance Details - Reserve</ivr:log>

            <!--  -->
            <ivr:include page="<%=vxmlPath + "BalanceEnquiryIntroPreReserveAnn" + vxmlFileSuffix%>"/>
            <goto next="#<%=MicroflowConstants.GENERAL_FORM_PREFIX%>form_checkChargingMethod"/>
          <!-- Else No Charges Announcement -->
          <else/>
            <!--  -->
            <ivr:include page="<%=vxmlPath + "BalanceEnquiryIntroPreCommitAnn" + vxmlFileSuffix%>"/>
            <goto next="#<%=MicroflowConstants.GENERAL_FORM_PREFIX%>form_ConfirmCharges"/>
          </if>
        <!-- Else No Charges Confirmation -->
        <else/>
          <assign name="chargingType" expr="DEDUCT"/>
            <ivr:log label="BalanceEnquiry">Going to Get Balance Details - Deduct</ivr:log>
          <!--  -->
          <ivr:include page="<%=vxmlPath + "BalanceEnquiryIntroPreDeductAnn" + vxmlFileSuffix%>"/>
          <goto next="#<%=MicroflowConstants.GENERAL_FORM_PREFIX%>form_checkChargingMethod"/>
        </if>
      <!--  Else No Charges -->
      <else/>
        <assign name="chargingType" expr="NOCHARGE"/>
        <!--  -->
        <ivr:include page="<%=vxmlPath + "BalanceEnquiryIntro" + vxmlFileSuffix%>"/>
        <!--  -->
          <ivr:log label="BalanceEnquiry">Prompt Id = <value expr="promptId"/>  ||  
		  Going to Get Balance Details - NoCharge</ivr:log>
        <goto next="#<%=MicroflowConstants.GENERAL_FORM_PREFIX%>form_GetBalanceDetails"/>
      </if>
    </block>
  </form>
  <%--  For PMR 477 GChanges in Balance Enquiry
  If MUIO Announcement Offer is added in the configuration file, an extra request for 
  balance Enquiry will be made to get the Dedicated Account of subscriber's master.
  --%>
  <!--  Form Names restored to previous one  -->
  <form id="form_GetBalanceDetails">
    <block name="block_form_GetBalanceDetails">
      <goto next="#<%=MicroflowConstants.GENERAL_FORM_PREFIX%>form_GetBalanceDetails"/>
    </block>
  </form>
  <!--  -->
  <form id="<%=MicroflowConstants.GENERAL_FORM_PREFIX%>form_GetBalanceDetails">
    <var name="origChargingType" expr="chargingType"/>
	<var name="origSubscriberNAI" expr="subscriberNAI"/>
    <block name="block_GetBalanceDetailsAnn">

        <ivr:log label="BalanceEnquiry" expr="'Starting'">BalanceEnquiry GetMUIOBalanceDetails Starts  ||  
		MUIOOfferId is = <value expr="MUIOOfferId"/></ivr:log>

	   <if cond="masterSubscriberFlag == 'true' || MUIOOfferId == 'NULL'">
        <goto next="#<%=MicroflowConstants.GENERAL_FORM_PREFIX%>form_GetNormalBalanceDetails"/>
      </if>
      <!-- overriding the original calling number with its master Subscriber Number,charging type, unknownSubscriberNAI (-1) -->
	  <assign name="callingNumber" expr="masterAccountNumber"/>
      <assign name="chargingType" expr="NOCHARGE"/>
	  <assign name="subscriberNAI" expr="unknownSubscriberNAI"/>
      <!--  -->
  	  <ivr:include page="<%=vxmlPath + "BalanceEnquiryMUIOBeforeRequest" + vxmlFileSuffix%>"/>      
    </block> 
    <!--  -->
    <block name="block_GetBalanceDetails">
        <ivr:log label="BalanceEnquiry">Input parameters to GetMUIOBalanceDetails   ||   
        masterAccountNumber = <value expr="callingNumber"/>   ||   
        debug is = <value expr="debug"/>   ||   
        presentationId is = <value expr="presentationId"/>   ||   
        versionId is = <value expr="versionId"/>   ||   
        chargingType is = <value expr="chargingType"/>   ||   
        Sending Get Balance Request</ivr:log>
    </block>      
    <!--  -->
    <!-- Call to GetBalanceAndDate Request -->
    <ivr:include page="<%=jspPath + "GetBalanceAndDate" + jspFileSuffix%>"/>
    <!--  -->
    <block name="dataBlock_balanceDetails">

		<assign name="responseCode" expr="balanceDetails.responseCode"/>
		<ivr:log label="BalanceEnquiry">Response Code = <value expr="responseCode"/></ivr:log>
        <if cond="responseCode==SUCCESSCODE">
		  <assign name="isOffersDAFound" expr="balanceDetails.isOffersDAFound"/>
          <assign name="daDetails" expr="balanceDetails.daDetailsString"/>
   	      <assign name="MUIODADetails" expr="daDetails"/>
			<if cond="isOffersDAFound == FALSE_STRING">
				<assign name="masterDAErrorPromptId" expr="'BAL_MASTER_NO_DA_DEFINE_MSG'"/>
        </if>
		<elseif cond ="responseCode == 102"/>	<!-- Subscriber Not Found -->
				<assign name="masterDAErrorPromptId" expr="'BAL_MASTER_NOT_FOUND_MSG'"/>
		<elseif cond ="responseCode == 123"/>		<!-- Max credit limit exceeded -->
			 	<assign name="masterDAErrorPromptId" expr="'BAL_MASTER_CREDIT_LIMIT_EXCEED_MSG'"/>
		<elseif cond ="responseCode == 124"/>	   <!-- Below minimum balance -->
				<assign name="masterDAErrorPromptId" expr="'BAL_MASTER_BELOW_MINIMUM_BALANCE_MSG'"/>	
		<elseif cond ="responseCode == 126"/>		<!-- Account not active -->
				<assign name="masterDAErrorPromptId" expr="'BAL_MASTER_ACCOUNT_NOT_ACTIVE_MSG'"/>
		<elseif cond ="responseCode == 137"/>		  <!-- Get balance and date not allowed -->
			<assign name="masterDAErrorPromptId" expr="'BAL_MASTER_REQUEST_NOT_ALLOWED_MSG'"/>
		<elseif cond ="responseCode == 139"/>		<!-- Dedicated account not defined -->
			<assign name="masterDAErrorPromptId" expr="'BAL_MASTER_NO_DA_DEFINE_MSG'"/>
		<else/>									 <!-- Other Error No Retry -->
			<assign name="masterDAErrorPromptId" expr="'BAL_MASTER_OTHER_ERROR_IN_REQUEST_MSG'"/>
		</if>

          <ivr:log label="BalanceEnquiry">MUIODADetails = <value expr="daDetails"/>  ||  
		  isOffersDAFound = <value expr="isOffersDAFound"/></ivr:log>

			
		<!-- restoring the original calling number,charging type,SubscriberNAI  -->
        <assign name="callingNumber" expr="application.callingNumber"/>
        <assign name="chargingType" expr="origChargingType"/>
		 <assign name="subscriberNAI" expr="origSubscriberNAI"/>
        <!--  -->
        <ivr:include page="<%=vxmlPath + "BalanceEnquiryMUIOAfterRequest" + vxmlFileSuffix%>"/>
        <!--  -->

          <ivr:log label="BalanceEnquiry" expr="'Ending'">BalanceEnquiry GetMUIOBalanceDetails Ends</ivr:log>
        <!--  -->
        <goto next="#<%=MicroflowConstants.GENERAL_FORM_PREFIX%>form_GetNormalBalanceDetails"/>
    </block>
  </form>
  <!--  -->
<!-- Normal Balance Enquiry Starts Here -->
  <!--  Form Names restored to previous one  -->
  <form id="form_GetNormalBalanceDetails">
    <block name="block_form_GetBalanceDetails">
      <goto next="#<%=MicroflowConstants.GENERAL_FORM_PREFIX%>form_GetNormalBalanceDetails"/>
    </block>
  </form>
  <!--  -->
  <form id="<%=MicroflowConstants.GENERAL_FORM_PREFIX%>form_GetNormalBalanceDetails">
    <block name="block_GetBalanceDetailsAnn">   
        <%-- Added for TR HK60320 --%>
    	<ivr:include page="<%=vxmlPath + "BalanceEnquiryBeforeRequest" + vxmlFileSuffix%>"/>      
    	<!--  -->    
    </block> 
    <block name="block_GetBalanceDetails">
        <ivr:log label="BalanceEnquiry" expr="'Starting'">BalanceEnquiry GetBalanceDetails Starts   ||   
        Input parameters to GetBalanceDetails   ||   
        callingNumber is = <value expr="callingNumber"/>   ||   
        subscriberNAI is = <value expr="subscriberNAI"/>   ||   
        debug is = <value expr="debug"/>   ||   
        presentationId is = <value expr="presentationId"/>   ||   
        versionId is = <value expr="versionId"/>   ||   
        chargingType is = <value expr="chargingType"/>   ||   
        locationNumber is = <value expr="locationNumber"/>   ||   
        reservationCorrelationID is = <value expr="reservationCorrelationID"/>   ||   
        minThresholdBalAmount is = <value expr="minThresholdBalAmount"/>   ||    
        minThresholdServiceExpiryDuration is = <value expr="minThresholdServiceExpiryDuration"/>   ||   
        Sending Get Balance Request</ivr:log>

    </block>      
    <!--  -->
    <!-- Call to GetBalanceAndDate Request -->
    <ivr:include page="<%=jspPath + "GetBalanceAndDate" + jspFileSuffix%>"/>
    <!--  -->
    <block name="dataBlock_balanceDetails">
        <assign name="responseCode" expr="balanceDetails.responseCode"/>
        <assign name="nextFormId" expr="balanceDetails.nextFormId"/>
        <assign name="document.exitStatus" expr="balanceDetails.status"/>
        <!--  -->
		<if cond="responseCode!=SUCCESSCODE">
			<if cond="enableStatisticsLoggingGlobal == 'true' &amp;&amp; enableStatisticsLogging == 'true'">
				<if cond="responseCode == '100' || responseCode == '120' || responseCode == '125' || responseCode == '126'">
					<var name="dummy_statType" expr="setStatType('BalanceEnquiryFail')"/>
    				<var name="dummy_voucherNumber" expr="setVoucherNumber('')"/>
    				<var name="dummy_statusCode" expr="setStatusCode(responseCode)"/>
				<else/>
				    <var name="dummy_statType" expr="setStatType('BalanceEnquiryFail')"/>
    				<var name="dummy_voucherNumber" expr="setVoucherNumber('')"/>
    				<var name="dummy_statusCode" expr="setStatusCode(responseCode)"/>
				</if>
			</if>
		</if>
        <!--  -->
        <if cond="responseCode==SUCCESSCODE">
            <if cond="enableStatisticsLoggingGlobal == 'true' &amp;&amp; enableStatisticsLogging == 'true'">
		    	<var name="dummy_statType" expr="setStatType('BalanceEnquiry')"/>
		    	<var name="dummy_voucherNumber" expr="setVoucherNumber('')"/>
		    	<var name="dummy_statusCode" expr="setStatusCode(responseCode)"/>   	
		    </if>
          <assign name="masterAccountBalanceInFirstCurrency" expr="balanceDetails.accountValue1"/>
          <assign name="absAccountBalanceInFirstCurrency" expr="balanceDetails.accountValue1abs"/>
          <assign name="firstCurrencyName" expr="balanceDetails.currency1"/>
          <assign name="masterAccountBalanceInSecondCurrency" expr="balanceDetails.accountValue2"/>
          <assign name="absAccountBalanceInSecondCurrency" expr="balanceDetails.accountValue2abs"/>
          <assign name="secondCurrencyName" expr="balanceDetails.currency2"/>
          <assign name="serviceFeeExpiryDate" expr="balanceDetails.serviceFeeExpiryDate"/>
          <assign name="servExpDateVsTodayDate" expr="balanceDetails.servExpDateVsTodayDate"/>
          <assign name="supervisionFeeExpiryDate" expr="balanceDetails.supervisionFeeExpiryDate"/>
          <assign name="supervExpDateVsTodayDate" expr="balanceDetails.supervExpDateVsTodayDate"/>
          <assign name="supervExpDateVsServExpDate" expr="balanceDetails.supervExpDateVsServExpDate"/>
          <assign name="serviceRemovalDate" expr="balanceDetails.serviceRemovalDate"/>
          <assign name="serviceRemovalDateVsTodayDate" expr="balanceDetails.serviceRemovalDateVsTodayDate"/>        
          <assign name="creditClearanceDate" expr="balanceDetails.creditClearanceDate"/>
          <assign name="creditClearanceDateVsTodayDate" expr="balanceDetails.creditClearanceDateVsTodayDate"/>
          <assign name="daDetails" expr="balanceDetails.daDetailsString"/>
          <%-- TR-HI56490-Start --%>
          <assign name="application.accountValue1" expr="masterAccountBalanceInFirstCurrency"/>
       	  <assign name="application.accountValue2" expr="masterAccountBalanceInSecondCurrency"/>
       	  <assign name="application.creditClearanceDate" expr="creditClearanceDate"/>
       	  <assign name="application.serviceRemovalDate" expr="serviceRemovalDate"/>
       	  <assign name="application.serviceExpiryDate" expr="serviceFeeExpiryDate"/>
       	  <assign name="application.airtimeExpiryDate" expr="supervisionFeeExpiryDate"/>
       	  <assign name="application.currency1" expr="firstCurrencyName"/>
       	  <assign name="application.currency2" expr="secondCurrencyName"/>
          <assign name="application.servExpDateVsTodayDate" expr="servExpDateVsTodayDate"/>
          <%-- TR-HI56490-End --%>
          <!-- For Chargeable Balance Enquiry Starts -->
          <assign name="resultCurrency1" expr="balanceDetails.resultCurrency1"/>
          <assign name="resultCurrency2" expr="balanceDetails.resultCurrency2"/>
          <assign name="cost1" expr="balanceDetails.cost1"/>
          <assign name="cost1abs" expr="balanceDetails.cost1abs"/>
          <assign name="cost2" expr="balanceDetails.cost2"/>
          <assign name="cost2abs" expr="balanceDetails.cost2abs"/>
          <assign name="chargingResultCode" expr="balanceDetails.chargingResultCode"/>
          <assign name="reservationCorrelationID" expr="balanceDetails.reservationCorrelationID"/>
          <assign name="nextFormId" expr="balanceDetails.nextFormId"/>
          <%--HP-CELTELD-V001 STARTS--%>
          <assign name="serviceClass" expr="balanceDetails.serviceClass"/>
          <assign name="serviceClassPrompt" expr="balanceDetails.serviceClassPrompt"/>
          <%--HP-CELTELD-V001 ENDS--%>
          <%-- For Chargeable Balance Enquiry Ends --%>
 	      <%-- TR HJ54325  Starts --%>
          <%--For MinThresholdAmount Start --%>
          <assign name="unitThresholdBalance" expr="balanceDetails.minThresholdBalAmt"/> 
          <assign name="unitThresholdBalanceInteger" expr="convertStringToFloat(unitThresholdBalance)"/> 
          <assign name="application.MinThresholdBalAmount" expr="balanceDetails.minThresholdBalAmt"/>
          <assign name="application.MinThresholdServiceExpiryDuration" expr="minThresholdServiceExpiryDuration"/>
		  
		    <%-- For CWP EP Starts --%>
			<assign name="daTotalBalanceCurrency1" expr="balanceDetails.daTotalBalanceCurrency1"/>
			<assign name="daTotalBalanceCurrency2" expr="balanceDetails.daTotalBalanceCurrency2"/>
			<assign name="daTotalBalanceAbsCurrency1" expr="balanceDetails.daTotalBalanceAbsCurrency1"/>
			<assign name="daTotalBalanceAbsCurrency2" expr="balanceDetails.daTotalBalanceAbsCurrency2"/>			
			<%-- For CWP EP Ends --%>

          <ivr:log label="BalanceEnquiry">unitThresholdBalance = <value expr="unitThresholdBalance"/>   ||   
          application.MinThresholdBalAmount = <value expr="application.MinThresholdBalAmount"/>   ||   
          application.MinThresholdServiceExpiryDuration = <value expr="application.MinThresholdServiceExpiryDuration"/></ivr:log>

          <!--For MinThresholdAmount End -->
          <!-- Moved to response code 0 case only for TR HK26891 Start-->
          <if cond="daDetails!=NULL_STRING &amp;&amp; masterAccountBalanceInFirstCurrency!=NULL_STRING &amp;&amp; masterAccountBalanceInFirstCurrency!=''">            
          	<assign name="sumOfAllAccounts" expr="totalBalance(masterAccountBalanceInFirstCurrency, daDetails)"/>    
		   <elseif cond="daDetails==NULL_STRING &amp;&amp; masterAccountBalanceInFirstCurrency!=NULL_STRING &amp;&amp; masterAccountBalanceInFirstCurrency!=''"/>
			<assign name="sumOfAllAccounts" expr="masterAccountBalanceInFirstCurrency"/>
			<elseif cond="daDetails!=NULL_STRING &amp;&amp; masterAccountBalanceInFirstCurrency==NULL_STRING &amp;&amp; masterAccountBalanceInFirstCurrency!=''"/>
			  <assign name="sumOfAllAccounts" expr="totalDAABalance(daDetails)"/>
       	  </if>
       	  <if cond="servExpDateVsTodayDate &lt; minThresholdServiceExpiryDuration || sumOfAllAccounts &lt; unitThresholdBalanceInteger">
 
          	<assign name="application.offerCreditRefillFlag" expr="'true'"/>
          </if>
          <%-- TR HK26891 End--%>
		  <%-- US 1339 WATA-015 Starts--%>
		  <if cond="daDetails!=NULL_STRING &amp;&amp; masterAccountBalanceInFirstCurrency!=NULL_STRING &amp;&amp; masterAccountBalanceInFirstCurrency!='' &amp;&amp; referenceDAForMasterBalance!=NULL_STRING &amp;&amp; referenceDAForMasterBalance!=''
		   &amp;&amp; referenceDAForMasterBalance!=0">  
 			 <ivr:log label="BalanceEnquiry">masterAccountBalanceInFirstCurrency = <value expr="masterAccountBalanceInFirstCurrency"/></ivr:log>
 			  <assign name="currencyForPercentage" expr="'currency1'"/>
			  <assign name="referenceDA" expr="getRefDABalanceAmount(balanceDetails.daDetailsString,referenceDAForMasterBalance,currencyForPercentage)"/>
			  
		  <elseif cond="daDetails!=NULL_STRING &amp;&amp; masterAccountBalanceInSecondCurrency!=NULL_STRING &amp;&amp; masterAccountBalanceInSecondCurrency!='' &amp;&amp; referenceDAForMasterBalance!=NULL_STRING &amp;&amp; referenceDAForMasterBalance!=''
			   &amp;&amp; referenceDAForMasterBalance!=0"/>    
			   <ivr:log label="BalanceEnquiry">masterAccountBalanceInSecondCurrency = <value expr="masterAccountBalanceInFirstCurrency"/></ivr:log>
			      <assign name="currencyForPercentage" expr="'currency2'"/>
				  <assign name="referenceDA" expr="getRefDABalanceAmount(balanceDetails.daDetailsString,referenceDAForMasterBalance,currencyForPercentage)"/>

		  </if>
		  <assign name="referenceDA1" expr="getRefDABalanceAmount(balanceDetails.daDetailsString,referenceDAForMasterBalance,'currency1')"/>
		  <assign name="referenceDA2" expr="getRefDABalanceAmount(balanceDetails.daDetailsString,referenceDAForMasterBalance,'currency2')"/>

		 <%-- US 1339 WATA-015 Ends--%>

		<!--  -->      
        </if>
         <%-- TR HJ54325 End  --%>

          <ivr:log label="BalanceEnquiry">offerCreditRefillFlag = <value expr="application.offerCreditRefillFlag"/>   ||   
          sumOfAllAccounts = <value expr="sumOfAllAccounts"/>   ||   
          balanceDetails.masterAccountBalanceInFirstCurrency = <value expr="masterAccountBalanceInFirstCurrency"/>   ||   
          balanceDetails.absAccountBalanceInFirstCurrency = <value expr="absAccountBalanceInFirstCurrency"/>   ||   
          balanceDetails.firstCurrencyName = <value expr="firstCurrencyName"/>   ||   
          balanceDetails.masterAccountBalanceInSecondCurrency = <value expr="masterAccountBalanceInSecondCurrency"/>   ||   
          balanceDetails.absAccountBalanceInSecondCurrency = <value expr="absAccountBalanceInSecondCurrency"/>   ||   
          balanceDetails.secondCurrencyName = <value expr="secondCurrencyName"/>   ||   
          balanceDetails.serviceRemovalDate = <value expr="serviceRemovalDate"/>   ||   
          balanceDetails.serviceRemovalDateVsTodayDate = <value expr="serviceRemovalDateVsTodayDate"/>   ||            
          balanceDetails.serviceFeeExpiryDate = <value expr="serviceFeeExpiryDate"/>   ||   
          balanceDetails.servExpDateVsTodayDate = <value expr="servExpDateVsTodayDate"/>   ||   
          balanceDetails.supervisionFeeExpiryDate = <value expr="supervisionFeeExpiryDate"/>   ||   
          balanceDetails.supervExpDateVsTodayDate = <value expr="supervExpDateVsTodayDate"/>   ||   
          balanceDetails.supervExpDateVsServExpDate = <value expr="supervExpDateVsServExpDate"/>   ||   
          balanceDetails.creditClearanceDate = <value expr="creditClearanceDate"/>   ||   
          balanceDetails.creditClearanceDateVsTodayDate = <value expr="creditClearanceDateVsTodayDate"/>   ||   
          balanceDetails.exitStatus = <value expr="document.exitStatus"/>   ||   
          balanceDetails.daDetails = <value expr="daDetails"/>   ||   
          <!--  -->
          <!-- For Chargeable Balance Enquiry Starts -->
          balanceDetails.resultCurrency1 = <value expr="resultCurrency1"/>   ||   
          balanceDetails.resultCurrency2 = <value expr="resultCurrency2"/>   ||   
          balanceDetails.cost1 = <value expr="cost1"/>   ||   
          balanceDetails.cost1abs = <value expr="cost1abs"/>   ||   
          balanceDetails.cost2 = <value expr="cost2"/>   ||   
          balanceDetails.cost2abs = <value expr="cost2abs"/>   ||   
          balanceDetails.chargingResultCode = <value expr="chargingResultCode"/>   ||   
          balanceDetails.reservationCorrelationID = <value expr="reservationCorrelationID"/>   ||   
          balanceDetails.nextFormId is = <value expr="nextFormId"/>   ||   
          <!--  -->
          balanceDetails.serviceClass = <value expr="serviceClass"/>   ||   
          balanceDetails.serviceClassPrompt = <value expr="serviceClassPrompt"/>   ||   
          <!-- For Chargeable Balance Enquiry Ends -->
          <!--  -->
          <%-- TR-HI56490-Start --%>
          application.accountValue1 is = <value expr="application.accountValue1"/>   ||   
		  application.accountValue2 is = <value expr="application.accountValue2"/>   ||   
		  application.creditClearanceDate is = <value expr="application.creditClearanceDate"/>   ||   
		  application.serviceRemovalDate is = <value expr="application.serviceRemovalDate"/>   ||   
		  application.serviceExpiryDate is = <value expr="application.serviceExpiryDate"/>   ||   
		  application.airtimeExpiryDate is = <value expr="application.airtimeExpiryDate"/>   ||   
		  application.currency1 is = <value expr="application.currency1"/>   ||   
		  application.currency2 is = <value expr="application.currency2"/>   ||   
		  application.offerCreditRefillFlag is = <value expr="application.offerCreditRefillFlag"/>   ||   
		  application.servExpDateVsTodayDate is = <value expr="application.servExpDateVsTodayDate"/>   ||   
		  sumOfAllAccounts = <value expr="sumOfAllAccounts"/> || 
		  referenceDA.balanceAmount = <value expr="referenceDA.balanceAmount"/> || 
		  referenceDA.dedicatedAccountUnit = <value expr="referenceDA.dedicatedAccountUnit"/></ivr:log>
          <%-- TR-HI56490-End --%>
	 	 
        <!--  -->
        <assign name="UpdateRollback" expr="'false'"/>
        <if cond="responseCode != SUCCESSCODE">
          <if cond="chargingType == COMMIT">
            <assign name="UpdateRollback" expr="'true'"/>
          </if>
        </if>
        <!--  -->
          <ivr:log label="BalanceEnquiry" expr="'Ending'">BalanceEnquiry GetBalanceDetails Ends</ivr:log>

        <!--  -->
        <ivr:include page="<%=vxmlPath + "BalanceEnquiryAfterRequest" + vxmlFileSuffix%>"/>
        <goto expr="nextFormId"/>
    </block>
  </form>
  <!--  -->
  <!--  Play Charges  -->
  <!--  -->
  <!--  Form Names restored to previous one  -->
  <form id="form_PlayCharges">
    <block name="block_form_PlayCharges">
      <goto next="#<%=MicroflowConstants.PLAY_FORM_PREFIX%>form_PlayCharges"/>
    </block>
  </form>
  <!--  -->
  <form id="<%=MicroflowConstants.PLAY_FORM_PREFIX%>form_PlayCharges">
    <block name="block_PlayCharges">
      <ivr:include page="<%=vxmlPath + "BalanceEnquiryPlayChargesPreAnn" + vxmlFileSuffix%>"/>
      <!--  -->

        <ivr:log label="BalanceEnquiry" expr="'Starting'">BalanceEnquiry PlayCharges Starts   ||   
        resultCurrency1 is = <value expr="resultCurrency1"/>   ||   
        resultCurrency2 is = <value expr="resultCurrency2"/>   ||   
        cost1 is = <value expr="cost1"/>   ||   
        cost1abs is = <value expr="cost1abs"/>   ||   
        cost2 is = <value expr="cost2"/>   ||   
        cost2abs is = <value expr="cost2abs"/></ivr:log>

    </block>
    <!--  -->
    <block name="block_PlayOneTimeChargesPre1" cond="cost1abs!=0 &amp;&amp; cost1abs!=NULL_STRING &amp;&amp; resultCurrency1 != NULL_STRING">
      <ivr:include page="<%=vxmlPath + "BalanceEnquiryOneTimeChargesPreAnn1" + vxmlFileSuffix%>"/>
      <!--  -->
      <if cond="cost1 &lt; 0 &amp;&amp; resultCurrency1 != NULL_STRING">
        <assign name="promptId" expr="'BAL_MINUS_MSG'"/>
        <audio expr="returnAudioPath(promptsetId, subscriberLanguage, promptId, versionId, debug)"/>
      </if>
    </block>
    <!--  -->
    <subdialog name="<%=MicroflowConstants.SUBDIALOG_PLAY_HELPER_CALL_PREFIX%>sub_PlayOneTimeCharges1" srcexpr="voiceBaseInterfaceVxml + '#' + play_Currency" cond="cost1abs!=0 &amp;&amp; cost1abs!=NULL_STRING &amp;&amp; resultCurrency1 != NULL_STRING">
      <param name="arg" expr="cost1abs"/>
      <param name="type" expr="resultCurrency1"/>
      <param name="format" expr="currencyFormat"/>
      <param name="lang" expr="voiceBaseLanguage"/>
      <param name="speaker" expr="speaker"/>
      <param name="gender" expr="gender"/>
      <param name="debug" expr="debug"></param>
      <param name="versionId" expr="versionId"></param>
	  <param name="ivrlanguage" expr="subscriberLanguage"></param>
      <param name="voiceBaseURL" expr="voiceBaseURL"/>
    </subdialog>
    <!--  -->
    <!--  -->
    <block name="block_PlayOneTimeChargesPost1" cond="cost1abs!=0 &amp;&amp; cost1abs!=NULL_STRING &amp;&amp; resultCurrency1 != NULL_STRING">
      <ivr:include page="<%=vxmlPath + "BalanceEnquiryOneTimeChargesPostAnn1" + vxmlFileSuffix%>"/>
    </block>
    <!--  -->
    <block name="block_PlayOneTimeChargesPre2" cond="cost2abs!=0 &amp;&amp; cost2abs!=NULL_STRING &amp;&amp; resultCurrency2 != NULL_STRING">
      <ivr:include page="<%=vxmlPath + "BalanceEnquiryOneTimeChargesPreAnn2" + vxmlFileSuffix%>"/>
      <!--  -->
      <if cond="cost2 &lt; 0 &amp;&amp; resultCurrency2 != NULL_STRING">
        <assign name="promptId" expr="'BAL_MINUS_MSG'"/>
        <audio expr="returnAudioPath(promptsetId, subscriberLanguage, promptId, versionId, debug)"/>
      </if>
    </block>
    <!--  -->
    <subdialog name="<%=MicroflowConstants.SUBDIALOG_PLAY_HELPER_CALL_PREFIX%>sub_PlayOneTimeCharges2" srcexpr="voiceBaseInterfaceVxml + '#' + play_Currency" cond="cost2abs!=0 &amp;&amp; cost2abs!=NULL_STRING &amp;&amp; resultCurrency2 != NULL_STRING">
      <param name="arg" expr="cost2abs"/>
      <param name="type" expr="resultCurrency2"/>
      <param name="format" expr="currencyFormat"/>
      <param name="lang" expr="voiceBaseLanguage"/>
      <param name="speaker" expr="speaker"/>
      <param name="gender" expr="gender"/>
      <param name="debug" expr="debug"></param>
      <param name="versionId" expr="versionId"></param>
	  <param name="ivrlanguage" expr="subscriberLanguage"></param>
      <param name="voiceBaseURL" expr="voiceBaseURL"/>
    </subdialog>
    <!--  -->
    <!--  -->
    <block name="block_PlayOneTimeChargesPost2" cond="cost2abs!=0 &amp;&amp; cost2abs!=NULL_STRING &amp;&amp; resultCurrency2 != NULL_STRING">
      <ivr:include page="<%=vxmlPath + "BalanceEnquiryOneTimeChargesPostAnn2" + vxmlFileSuffix%>"/>
    </block>
    <!--  -->
    <block name="block_PlayNoCharges" cond="(cost1abs==0 || cost1abs==NULL_STRING) &amp;&amp; (cost2abs==0 || cost2abs==NULL_STRING)">
      <ivr:include page="<%=vxmlPath + "BalanceEnquiryNoChargesAnn" + vxmlFileSuffix%>"/>
    </block>
    <!--  -->
    <block name="block_PlayChargesEnds">
      <ivr:include page="<%=vxmlPath + "BalanceEnquiryPlayChargesPostAnn" + vxmlFileSuffix%>"/>
      <!--  -->
      <if cond="chargingMethod == CHARGING_FASTADJUST">
        <assign name="chargingType" expr="NOCHARGE"/>
		<ivr:log label="BalanceEnquiry">Going to GetBalanceDetails - NoCharge
		</ivr:log>
      <else/>
		<ivr:log label="BalanceEnquiry">Going to GetBalanceDetails - Commit
		</ivr:log>
      </if>
      <%-- TR HK77840 :In case of Zero or NULL charges the flow should continue with no charge confirmation.--%>
      <%-- This fix would override chages done for TR: HK59418 --%>
      <if cond="(cost1==0 || cost1 == NULL_STRING) &amp;&amp; (cost2==0 || cost2 == NULL_STRING)">
        <if cond="chargingType == RESERVE &amp;&amp; chargingMethod == CHARGING_STANDARD">
          <assign name="chargingType" expr="COMMIT"/>
        </if>
		<ivr:log label="BalanceEnquiry">ChargingType = <value expr="chargingType"/>
		|| BalanceEnquiry PlayCharges Ends
		</ivr:log>
        <goto next="#<%=MicroflowConstants.GENERAL_FORM_PREFIX%>form_GetBalanceDetails"/>
      </if>
      <%-- TR HK77840 : Ends --%>
      <%-- TR HK59418 , BalanceEnquiryNullCharges added for going to SystemFailure because charges are null for chargeable balance enquiry --%>
       <ivr:include page="<%=vxmlPath + "BalanceEnquiryNullCharges" + vxmlFileSuffix%>"/>
      <!--  -->
      <!--  -->
      <if cond="chargeConfirmationRequired == 'true'">
		<ivr:log label="BalanceEnquiry">Going to Confirm Charges
		|| BalanceEnquiry PlayCharges Ends
		</ivr:log>
        <goto next="#<%=MicroflowConstants.GENERAL_FORM_PREFIX%>form_ConfirmCharges"/>
      <else/>
        <if cond="chargingType == RESERVE &amp;&amp; chargingMethod == CHARGING_STANDARD">
          <assign name="chargingType" expr="COMMIT"/>
        </if>
		<ivr:log label="BalanceEnquiry">Going to Get Balance Details
		|| ChargingType = <value expr="chargingType"/>
		|| BalanceEnquiry PlayCharges Ends
		</ivr:log>
		<goto next="#<%=MicroflowConstants.GENERAL_FORM_PREFIX%>form_GetBalanceDetails"/>
      </if>
    </block>
  </form>
  <!--  -->
  <!--  Confirm Charges  -->
  <!--  -->
  <!--  Form Names restored to previous one  -->
  <form id="form_ConfirmCharges">
    <block name="block_form_ConfirmCharges">
      <goto next="#<%=MicroflowConstants.GENERAL_FORM_PREFIX%>form_ConfirmCharges"/>
    </block>
  </form>
  <!--  -->
  <form id="<%=MicroflowConstants.GENERAL_FORM_PREFIX%>form_ConfirmCharges">
    <block name="block_ConfirmCharges">
		<ivr:log label="BalanceEnquiry">BalanceEnquiry ConfirmCharges Starts
		</ivr:log>
      <!--  -->
      <logic:equal value="true" name="BalanceEnquiryActionForm" property="chargeAnnouncementRequired">
        <ivr:include page="<%=vxmlPath + "BalanceEnquiryChargeConfirmationWithPlayChargeAnn" + vxmlFileSuffix%>"/>
      </logic:equal>
      <logic:notEqual value="true" name="BalanceEnquiryActionForm" property="chargeAnnouncementRequired">
        <ivr:include page="<%=vxmlPath + "BalanceEnquiryChargeConfirmationWithoutPlayChargeAnn" + vxmlFileSuffix%>"/>
      </logic:notEqual>
      <!--  -->
		<ivr:log label="BalanceEnquiry">Prompt Id = <value expr="promptId"/>
		</ivr:log>
    </block>
    <!--  -->
    <property name="timeout" value="<%=noInputTimeout%>"/>
    <property name="interdigittimeout" value="<%=noInputTimeout%>"/>
    <!--  -->
    <field name="field_ChargeConfirmation">
      <grammar version="1.0" src="<%= "/VXMLIVR/grammarFiles/local/Confirmation.grxml"+"?versionId="+request.getParameter("versionId") %>" mode="dtmf"/>
      <!--  -->
      <filled>
		<ivr:log label="BalanceEnquiry">DTMF used for Charges Confirmation = <value expr="field_ChargeConfirmation"/>
		</ivr:log>
        <!--  confirm DTMF  -->
        <if cond="field_ChargeConfirmation == costConfirmDTMF">
          <if cond="chargingType == RESERVE">
            <assign name="chargingType" expr="COMMIT"/>
			<ivr:log label="BalanceEnquiry">Going to Get Balance Details - Commit
			|| ChargingType = <value expr="chargingType"/>
			</ivr:log>
          <else/>
            <assign name="chargingType" expr="DEDUCT"/>
			<ivr:log label="BalanceEnquiry">Going to Get Balance Details - Deduct
			|| ChargingType = <value expr="chargingType"/>
			</ivr:log>
          </if>
          <goto next="#<%=MicroflowConstants.GENERAL_FORM_PREFIX%>form_PostConfirmCharges"/>
        <!--  negate DTMF  -->
        <elseif cond="field_ChargeConfirmation == costNegateDTMF"/>
          <if cond="chargingType == RESERVE &amp;&amp; chargingMethod == CHARGING_STANDARD">
            <assign name="exitStatus" expr="STATUS_CHARGES_REVERTED"/>
            <assign name="chargingType" expr="ROLLBACK"/>
			<ivr:log label="BalanceEnquiry">Going to Get Balance Details - Rollback
			|| ChargingType = <value expr="chargingType"/>
			</ivr:log>
            <goto next="#<%=MicroflowConstants.GENERAL_FORM_PREFIX%>form_PostConfirmCharges"/>
          <else/>
            <assign name="exitStatus" expr="STATUS_CHARGES_REJECTED"/>
            <!--  -->
            <ivr:include page="<%=vxmlPath + "BalanceEnquiryChargesRejectedAnn" + vxmlFileSuffix%>"/>
            <!--  -->
            <goto next="#<%=MicroflowConstants.GENERAL_FORM_PREFIX%>exitModule"/>
          </if>
        <!--  reprompt DTMF  -->
        <elseif cond="field_ChargeConfirmation == costRepromptDTMF &amp;&amp; costRepromptEnabled == 'true'"/>
          <if cond="counterConfirmRetry &lt; maxConfirmationRetries">
            <assign name="counterConfirmRetry" expr="counterConfirmRetry + 1"/>
			<ivr:log label="BalanceEnquiry">ChargeConfirmation Reprompting
			|| counterConfirmRetry = <value expr="counterConfirmRetry"/>
			|| maxConfirmationRetries = <value expr="maxConfirmationRetries"/>
			</ivr:log>
            <if cond="costRepromptEnabled == 'true'">
              <if cond="chargeAnnouncementRequired == 'true'">
                <goto next="#<%=MicroflowConstants.PLAY_FORM_PREFIX%>form_PlayCharges"/>
              </if>
              <!--  -->
              <clear namelist="field_ChargeConfirmation"/>
              <clear namelist="block_ConfirmCharges"/>
            <else/>
              <throw event="nomatch"/>
            </if>
          <else/>
            <goto next="#<%=MicroflowConstants.ERROR_FORM_PREFIX%>form_MaxRetryCountExceeded"/>
          </if>
        <else/>
          <throw event="nomatch"/>
        </if>
      </filled>
      <!--  -->
      <error>
        <goto next="#handle_SystemFailure"/>
      </error>
      <!--  -->
      <noinput cond="counterConfirmTimeout &lt; maxTimeoutRetries">
        <ivr:include page="<%=vxmlPath + "NoInputAnn" + vxmlFileSuffix%>"/>
        <!--  -->
        <assign name="counterConfirmTimeout" expr="counterConfirmTimeout + 1"/>
		<ivr:log label="BalanceEnquiry">counterConfirmTimeout = <value expr="counterConfirmTimeout"/>
		|| maxTimeoutRetries = <value expr="maxTimeoutRetries"/>
		</ivr:log>
        <clear namelist="block_ConfirmCharges"/>
      </noinput>
      <noinput cond="counterConfirmTimeout >= maxTimeoutRetries">
        <goto next="#<%=MicroflowConstants.ERROR_FORM_PREFIX%>form_MaxTimeoutCountExceeded"/>
      </noinput>
      <!--  -->
      <nomatch cond="counterConfirmInvalidRetry &lt; maxInvalidRetries">
        <ivr:include page="<%=vxmlPath + "NoMatchAnn" + vxmlFileSuffix%>"/>
        <!--  -->
        <assign name="counterConfirmInvalidRetry" expr="counterConfirmInvalidRetry + 1"/>
		<ivr:log label="BalanceEnquiry">counterConfirmInvalidRetry = <value expr="counterConfirmInvalidRetry"/>
		|| maxInvalidRetries = <value expr="maxInvalidRetries"/>
		</ivr:log>
        <clear namelist="field_ChargeConfirmation"/>
        <clear namelist="block_ConfirmCharges"/>
      </nomatch>
      <nomatch cond="counterConfirmInvalidRetry >= maxInvalidRetries">
        <goto next="#<%=MicroflowConstants.ERROR_FORM_PREFIX%>form_MaxInvalidRetryCountExceeded"/>
      </nomatch>
    </field>
  </form>
  <!--  -->
  <!--  Play Rollback Details  -->
  <!--  -->
  <!--  Form Names restored to previous one  -->
  <form id="form_PlayRollbackDetails">
    <block name="block_form_PlayRollbackDetails">
      <goto next="#<%=MicroflowConstants.PLAY_FORM_PREFIX%>form_PlayRollbackDetails"/>
    </block>
  </form>
  <!--  -->
  <form id="<%=MicroflowConstants.PLAY_FORM_PREFIX%>form_PlayRollbackDetails">
    <block name="block_PlayRollbackDetails">
		<ivr:log label="BalanceEnquiry">BalanceEnquiry PlayRollbackDetails Starts
		</ivr:log>
      <!--  -->
      <ivr:include page="<%=vxmlPath + "BalanceEnquiryRollbackDetailsAnn" + vxmlFileSuffix%>"/>
      <!--  -->
      <if cond="responseCode != SUCCESSCODE">
        <assign name="exitStatus" expr="STATUS_FAILURE_ROLLBACK"/>
      <else/>
        <assign name="exitStatus" expr="STATUS_CHARGES_REVERTED"/>
      </if>
<ivr:log label="BalanceEnquiry">Prompt Id = <value expr="promptId"/>
|| BalanceEnquiry PlayRollbackDetails Exits with status = <value expr="exitStatus"/>
</ivr:log>
      <!--  -->
      <goto next="#<%=MicroflowConstants.GENERAL_FORM_PREFIX%>exitModule"/>
    </block>
  </form>
  <!--  -->
  <!-- Successful form -->
  <!--  -->
  <!--  Form Names restored to previous one  -->
  <form id="form_Successful">
    <block name="block_form_Successful">
      <goto next="#<%=MicroflowConstants.GENERAL_FORM_PREFIX%>form_Successful"/>
    </block>
  </form>
  <!--  -->
  <form id="<%=MicroflowConstants.GENERAL_FORM_PREFIX%>form_Successful">
    <var name="skipToWorkflow" expr="'false'"/>
    <var name="daPlayStatus" expr=""/>
    <block name="block_Successful">
<ivr:log label="BalanceEnquiry">BalanceEnquiry Successful Starts
</ivr:log>
      <!--  -->

      <assign name="application.currency1" expr="firstCurrencyName"/>
      <assign name="application.currency2" expr="secondCurrencyName"/>
      <assign name="application.BALANCE_ENQUIRY_DA_INFO_STR" expr="daDetails"/>
      <assign name="application.LAST_MODULE_TO_UPDATE_DA_INFO" expr="'BalanceEnquiry'"/>
      <assign name="application.BALANCE_ENQUIRY_DA_ANNOUNCEMENT_ORDER" expr="daAnnnouncementOrder"/>
	  <!-- AirIp 4.0 Offers Support Start -->
	  <assign name="application.LAST_MODULE_TO_UPDATE_OFFERS_INFO" expr="'BalanceEnquiry'"/>
	  <!-- AirIp 4.0 Offers Support End -->
     <!--  -->
     
		<ivr:log label="BalanceEnquiry">Setting Data Required for DA
		|| application.currency1 = <value expr="application.currency1"/>
		|| application.currency2 = <value expr="application.currency2"/>
		|| application.BALANCE_ENQUIRY_DA_INFO_STR = <value expr="application.BALANCE_ENQUIRY_DA_INFO_STR"/>
		|| application.LAST_MODULE_TO_UPDATE_DA_INFO = <value expr="application.LAST_MODULE_TO_UPDATE_DA_INFO"/>
		|| application.BALANCE_ENQUIRY_DA_ANNOUNCEMENT_ORDER =  <value expr="daAnnnouncementOrder"/>
		</ivr:log>
    </block>
    
    <%-- TR-HI59399-Start --%>
    <bean:define id="announcementForms" name="BalanceEnquiryActionForm" property="announcementForms" type="java.util.List"/>
    <%
		boolean bothDatesConfigured =false;
		if (announcementForms.contains("SupervisionFeeExpiryDate") && announcementForms.contains("ServiceFeeExpiryDate"))
			bothDatesConfigured = true;
	%>
	<block>
	   <% 
         if (bothDatesConfigured) { 
	   %>
    	    <assign name="bothServAndSupervDatesConfigured" expr="true"/>
	   <%  
	     } 
	   %>
<ivr:log label="BalanceEnquiry">BothServAndSupervDatesConfigured = <value expr="bothServAndSupervDatesConfigured"/>
</ivr:log>
    </block>
    <%-- TR-HI59399-End --%>
    
    <!-- Modified -->

   <%-- PC Cable and wireless starts here--%>
     <jsp:include page="<%=announcementJspPath+"Announcement_TotalBalance.jsp"%>"/>	
   <%-- PC Cable and wireless Ends here--%>
	

 <%-- WATA 015 Playing the Account Balance in First Currency and if percentage configured then percentage --%>
    <subdialog name="<%=MicroflowConstants.SUBDIALOG_PLAY_HELPER_CALL_PREFIX%>sub_AccountBalanceInFirstCurrency" srcexpr="balanceEnquiryHelperVxml + '#' + play_AccountBalance" cond="firstCurrencyName != 'NULL' &amp;&amp; masterAccountBalanceInFirstCurrency != 'NULL' &amp;&amp; playMasterAccountBalanceInFirstCurrency == 'true'">

      <param name="amount" expr="masterAccountBalanceInFirstCurrency"/>
      <param name="absAmount" expr="absAccountBalanceInFirstCurrency"/>
      <param name="currency" expr="firstCurrencyName"/>
      <param name="currencyFormat" expr="currencyFormat"/>
      <param name="subscriberLanguage" expr="subscriberLanguage"/>
      <param name="voiceBaseLanguage" expr="voiceBaseLanguage"/>
      <param name="speaker" expr="speaker"/>
      <param name="gender" expr="gender"/>
      <param name="versionId" expr="versionId"/>
      <param name="promptsetId" expr="promptsetId"/>
      <param name="debug" expr="debug"/>
      <param name="voiceBaseURL" expr="voiceBaseURL"/>
      <%-- Account Type Parameters Start --%>
      <param name="mainBalanceAccountType" expr="mainBalanceAccountType"/>
      <param name="appRoot" expr="application"/>
      <param name="presentationId" expr="presentationId"/>
      <param name="referenceDA1" expr="referenceDA1"/>
      <param name="referenceDA2" expr="NULL_STRING"/>
      <%-- Account Type Parameters End --%>
      <param name="announcementType" expr="masterBalanceAnnouncement"/>

	  <!-- Handling for EcmaScript call :FC 154-->
      <param name="voiceBaseInterfaceVxml" expr="voiceBaseInterfaceVxml"/>
    </subdialog>
    <!--  -->
    <!-- Playing the Account Balance in Second Currency -->
    <subdialog name="<%=MicroflowConstants.SUBDIALOG_PLAY_HELPER_CALL_PREFIX%>sub_AccountBalanceInSecondCurrency" srcexpr="balanceEnquiryHelperVxml + '#' + play_AccountBalance" cond="secondCurrencyName != 'NULL' &amp;&amp; masterAccountBalanceInSecondCurrency != 'NULL' &amp;&amp; playMasterAccountBalanceInSecondCurrency == 'true'">
      <param name="amount" expr="masterAccountBalanceInSecondCurrency"/>
      <param name="absAmount" expr="absAccountBalanceInSecondCurrency"/>
      <param name="currency" expr="secondCurrencyName"/>
      <param name="currencyFormat" expr="currencyFormat"/>
      <param name="subscriberLanguage" expr="subscriberLanguage"/>
      <param name="voiceBaseLanguage" expr="voiceBaseLanguage"/>
      <param name="speaker" expr="speaker"/>
      <param name="gender" expr="gender"/>
      <param name="versionId" expr="versionId"/>
      <param name="promptsetId" expr="promptsetId"/>
      <param name="debug" expr="debug"/>
      <param name="voiceBaseURL" expr="voiceBaseURL"/>
      <%-- Account Type Parameters Start --%>
      <param name="mainBalanceAccountType" expr="mainBalanceAccountType"/>
      <param name="appRoot" expr="application"/>
      <param name="presentationId" expr="presentationId"/>
      <param name="referenceDA1" expr="NULL_STRING"/>
      <param name="referenceDA2" expr="referenceDA2"/>
      <%-- Account Type Parameters End --%>
	  <param name="announcementType" expr="masterBalanceAnnouncement"/>
	 
	  <!-- Handling for EcmaScript call :FC 154-->
      <param name="voiceBaseInterfaceVxml" expr="voiceBaseInterfaceVxml"/>
    </subdialog>
    <!--  -->
    <%-- TR-HI59399-ConditionModified --%>
    <!-- Playing the Service Fee Expiry Date -->
    <subdialog name="<%=MicroflowConstants.SUBDIALOG_PLAY_HELPER_CALL_PREFIX%>sub_ServiceFeeExpiryDate" srcexpr="balanceEnquiryHelperVxml + '#' + play_ServiceFeeExpiryDate" cond="bothServAndSupervDatesConfigured==false &amp;&amp; playServiceFeeExpiryDate == 'true' || bothServAndSupervDatesConfigured==true &amp;&amp; supervExpDateVsServExpDate != 0 &amp;&amp; playServiceFeeExpiryDate == 'true' ">
      <param name="serviceFeeExpiryDate" expr="serviceFeeExpiryDate"/>
      <param name="servExpDateVsTodayDate" expr="servExpDateVsTodayDate"/>
      <param name="subscriberLanguage" expr="subscriberLanguage"/>
      <param name="voiceBaseLanguage" expr="voiceBaseLanguage"/>
      <param name="speaker" expr="speaker"/>
      <param name="gender" expr="gender"/>
      <param name="versionId" expr="versionId"/>
      <param name="promptsetId" expr="promptsetId"/>
      <param name="dateFormat" expr="dateFormat"/>
      <param name="debug" expr="debug"/>
      <param name="voiceBaseURL" expr="voiceBaseURL"/>
      <param name="lifeTimeValidDate" expr="application.lifeTimeValidDate"/>
	  <!-- Handling for EcmaScript call :FC 154-->
      <param name="voiceBaseInterfaceVxml" expr="voiceBaseInterfaceVxml"/>
    </subdialog>
    
     <!-- Playing the Credit Clearance Date -->
     <%-- TR-HL26180-Start --%>
    <subdialog name="<%=MicroflowConstants.SUBDIALOG_PLAY_HELPER_CALL_PREFIX%>sub_creditClearanceDate" srcexpr="balanceEnquiryHelperVxml + '#' + play_CreditClearanceDate" cond="playCreditClearanceDate == 'true' &amp;&amp; creditClearanceDateAnnFlag == 'true'">
      <%-- TR-HL26180-END --%>
      <param name="creditClearanceDate" expr="creditClearanceDate"/>
      <param name="creditClearanceDateVsTodayDate" expr="creditClearanceDateVsTodayDate"/>
      <param name="subscriberLanguage" expr="subscriberLanguage"/>
      <param name="voiceBaseLanguage" expr="voiceBaseLanguage"/>
      <param name="speaker" expr="speaker"/>
      <param name="gender" expr="gender"/>
      <param name="versionId" expr="versionId"/>
      <param name="promptsetId" expr="promptsetId"/>
      <param name="dateFormat" expr="dateFormat"/>
      <param name="debug" expr="debug"/>
      <param name="voiceBaseURL" expr="voiceBaseURL"/>
      <param name="lifeTimeValidDate" expr="application.lifeTimeValidDate"/>
	  <!-- Handling for EcmaScript call :FC 154-->
      <param name="voiceBaseInterfaceVxml" expr="voiceBaseInterfaceVxml"/>
      <%-- TR-HL32919-Start --%>
	  <filled>
	  <ivr:log label="BalanceEnquiry">Credit clearance Date set to  False</ivr:log>
	  <assign name="creditClearanceDateAnnFlag" expr="'false'"/>
	  </filled>
	  <%-- TR-HL32919-END --%>
    </subdialog>
    <!--  -->
    <%-- TR-HI59399-ConditionModified --%>
    <!-- Playing the Supervision Fee Expiry Date -->
    <subdialog name="<%=MicroflowConstants.SUBDIALOG_PLAY_HELPER_CALL_PREFIX%>sub_SupervisionFeeExpiryDate" srcexpr="balanceEnquiryHelperVxml + '#' + play_SupervisionFeeExpiryDate" cond="bothServAndSupervDatesConfigured==false &amp;&amp; playSupervisionFeeExpiryDate == 'true' || bothServAndSupervDatesConfigured==true &amp;&amp; supervExpDateVsServExpDate != 0 &amp;&amp; playSupervisionFeeExpiryDate == 'true' ">
      <param name="supervisionFeeExpiryDate" expr="supervisionFeeExpiryDate"/>
      <param name="supervExpDateVsTodayDate" expr="supervExpDateVsTodayDate"/>
      <param name="subscriberLanguage" expr="subscriberLanguage"/>
      <param name="voiceBaseLanguage" expr="voiceBaseLanguage"/>
      <param name="speaker" expr="speaker"/>
      <param name="gender" expr="gender"/>
      <param name="versionId" expr="versionId"/>
      <param name="promptsetId" expr="promptsetId"/>
      <param name="dateFormat" expr="dateFormat"/>
      <param name="creditClearanceDate" expr="creditClearanceDate"/>
      <param name="creditClearanceDateVsTodayDate" expr="creditClearanceDateVsTodayDate"/>
      <param name="creditClearanceDateAnnFlag" expr="creditClearanceDateAnnFlag"/>
      <param name="debug" expr="debug"/>
      <param name="voiceBaseURL" expr="voiceBaseURL"/>
      <param name="lifeTimeValidDate" expr="application.lifeTimeValidDate"/>
	  <%-- Handling for EcmaScript call :FC 154--%>
      <param name="voiceBaseInterfaceVxml" expr="voiceBaseInterfaceVxml"/>
	  <%-- TR-HL32919-Start --%>	
	  <filled>
	  <if cond="supervExpDateVsTodayDate &lt; 0">
	  <assign name="creditClearanceDateAnnFlag" expr="'false'"/>
	  <ivr:log label="BalanceEnquiry">Credit clearance Date set to  False</ivr:log>
	  </if>
	  </filled>
	  <%-- TR-HL32919-END --%>
    </subdialog>
    <!--  -->
    <%-- TR-HI59399-ConditionModified --%>
    <!-- Playing the Service and Supervision Fee Expiry Dates when both are same -->
    <subdialog name="<%=MicroflowConstants.SUBDIALOG_PLAY_HELPER_CALL_PREFIX%>sub_SameSupervisionAndServiceExpiryDates" srcexpr="balanceEnquiryHelperVxml + '#' + play_SameServiceAndSupervisionExpiryDates" cond="bothServAndSupervDatesConfigured==true &amp;&amp; supervExpDateVsServExpDate == 0 &amp;&amp; playSupervisionFeeExpiryDate == 'true' || bothServAndSupervDatesConfigured==true &amp;&amp; supervExpDateVsServExpDate == 0 &amp;&amp; playServiceFeeExpiryDate == 'true' ">
      <param name="expiryDate" expr="serviceFeeExpiryDate"/>
      <param name="expiryDateVsTodayDate" expr="supervExpDateVsTodayDate"/>
      <param name="subscriberLanguage" expr="subscriberLanguage"/>
      <param name="voiceBaseLanguage" expr="voiceBaseLanguage"/>
      <param name="speaker" expr="speaker"/>
      <param name="gender" expr="gender"/>
      <param name="versionId" expr="versionId"/>
      <param name="promptsetId" expr="promptsetId"/>
      <param name="dateFormat" expr="dateFormat"/>
      <param name="creditClearanceDate" expr="creditClearanceDate"/>
      <param name="creditClearanceDateVsTodayDate" expr="creditClearanceDateVsTodayDate"/>
      <param name="creditClearanceDateAnnFlag" expr="creditClearanceDateAnnFlag"/>
      <param name="debug" expr="debug"/>
      <param name="voiceBaseURL" expr="voiceBaseURL"/>
      <param name="lifeTimeValidDate" expr="application.lifeTimeValidDate"/>
	  <!-- Handling for EcmaScript call :FC 154-->
      <param name="voiceBaseInterfaceVxml" expr="voiceBaseInterfaceVxml"/>
      <%-- TR-HL32919-Start --%>
	  <filled>
	  <if cond="supervExpDateVsTodayDate &lt; 0">
	  <assign name="creditClearanceDateAnnFlag" expr="'false'"/>
	  <ivr:log label="BalanceEnquiry">Credit clearance Date set to  False</ivr:log>
	  </if>
	  </filled>
	  <%-- TR-HL32919-END --%>
    </subdialog>
    
        <!-- Playing the Service Removal Date -->
    <subdialog name="<%=MicroflowConstants.SUBDIALOG_PLAY_HELPER_CALL_PREFIX%>sub_ServiceRemovalDate" srcexpr="balanceEnquiryHelperVxml + '#' + play_ServiceRemovalDate" cond="playServiceRemovalDate == 'true'">
      <param name="serviceRemovalDate" expr="serviceRemovalDate"/>
      <param name="serviceRemovalDateVsTodayDate" expr="serviceRemovalDateVsTodayDate"/>
      <param name="subscriberLanguage" expr="subscriberLanguage"/>
      <param name="voiceBaseLanguage" expr="voiceBaseLanguage"/>
      <param name="speaker" expr="speaker"/>
      <param name="gender" expr="gender"/>
      <param name="versionId" expr="versionId"/>
      <param name="promptsetId" expr="promptsetId"/>
      <param name="dateFormat" expr="dateFormat"/>
      <param name="debug" expr="debug"/>
      <param name="voiceBaseURL" expr="voiceBaseURL"/>
      <param name="lifeTimeValidDate" expr="application.lifeTimeValidDate"/>
	  <%-- Handling for EcmaScript call :FC 154--%>
      <param name="voiceBaseInterfaceVxml" expr="voiceBaseInterfaceVxml"/>
    </subdialog>
    
    <!-- Playing the Service Class  -->
    <subdialog name="<%=MicroflowConstants.SUBDIALOG_PLAY_HELPER_CALL_PREFIX%>sub_ServiceClass" srcexpr="balanceEnquiryHelperVxml + '#' + play_ServiceClass" cond="playServiceClass == 'true'">
      <param name="serviceClass" expr="serviceClass"/>
      <param name="serviceClassPrompt" expr="serviceClassPrompt"/>
      <param name="subscriberLanguage" expr="subscriberLanguage"/>
      <param name="voiceBaseLanguage" expr="voiceBaseLanguage"/>
      <param name="speaker" expr="speaker"/>
      <param name="gender" expr="gender"/>
      <param name="versionId" expr="versionId"/>
      <param name="promptsetId" expr="promptsetId"/>
      <param name="debug" expr="debug"/>
      <param name="voiceBaseURL" expr="voiceBaseURL"/>
	  <!-- Handling for EcmaScript call :FC 154-->
      <param name="voiceBaseInterfaceVxml" expr="voiceBaseInterfaceVxml"/>
    </subdialog>

	<%-- PMR477 --%>
	<!-- in case of child subscriber play DA only when some DA found associated with offer id -->

	<block name="block_MUIOAnnouncementFlag" cond="PlayMUDA==TRUE_STRING">		
		<assign name="application.bal_NewDARequest" expr="FALSE_STRING"/>
		 <assign name="application.LAST_MODULE_TO_UPDATE_DA_INFO" expr="'BalanceEnquiry'"/>
		 <assign name="application.BALANCE_ENQUIRY_DA_INFO_STR" expr="MUIODADetails"/>
		<assign name="playMUIOAnnouncementFlag" expr="'true'"/>		
		<ivr:log label="BalanceEnquiry">application.makeNewRequest <value expr="application.bal_NewDARequest"/>  ||  
		application.LAST_MODULE_TO_UPDATE_DA_INFO <value expr="application.LAST_MODULE_TO_UPDATE_DA_INFO"/>  ||  
		application.BALANCE_ENQUIRY_DA_INFO_STR <value expr="application.BALANCE_ENQUIRY_DA_INFO_STR"/></ivr:log>

    </block>
    <subdialog name="sub_daPlayCall_Child" fetchtimeout="15s" srcexpr="'/VXMLIVR/DedicatedAccount.do?externalAnnouncementOrder='+daAnnnouncementOrder+'&amp;presentationId='+presentationId+'&amp;debug='+debug+'&amp;versionId='+versionId+'&amp;configurationId='+configurationId"
      cond="playMUIOAnnouncementFlag == TRUE_STRING &amp;&amp; masterSubscriberFlag==FALSE_STRING &amp;&amp; isOffersDAFound==TRUE_STRING">
      <param name="appRootFromSubdialog" expr="application"/>
      <!--  -->
      <filled>
	  <assign name="application.bal_NewDARequest" expr="TRUE_STRING"/>
          <assign name="skipToWorkflow" expr="sub_daPlayCall_Child.skipToWorkflow"/>
	  <assign name="daPlayStatus" expr="sub_daPlayCall_Child.status"/>
	          <ivr:log label="BalanceEnquiry">Playing DA for child subscriber  ||  
              After Return from DA Play, status = <value expr="daPlayStatus"/>  ||  
              After Return from DA Play, skipToWorkflow = <value expr="skipToWorkflow"/></ivr:log>
	  <if cond="skipToWorkflow == 'true'">
	      <goto nextitem="block_AnnEnd"/>
	  </if>
     </filled>
    </subdialog>
	
	<block name="block_masterSubscriberFound" cond="playMUIOAnnouncementFlag==TRUE_STRING &amp;&amp; masterSubscriberFlag==TRUE_STRING">

			<ivr:log label="block_masterSubscriberFound">Master Subscriber found </ivr:log>

		<assign name="application.bal_NewDARequest" expr="TRUE_STRING"/>
	</block>
	<block name="block_masterNoDAFound" cond="playMUIOAnnouncementFlag==TRUE_STRING &amp;&amp; masterSubscriberFlag==FALSE_STRING &amp;&amp; MUIOOfferId!=NULL_STRING &amp;&amp; isOffersDAFound==FALSE_STRING">
			 <assign name="application.bal_NewDARequest" expr="TRUE_STRING"/>

				<ivr:log label="BalanceEnquiry">playDA <value expr="playDA"/>  ||  
				masterSubscriberFlag <value expr="masterSubscriberFlag"/>  ||  
				isOffersDAFound <value expr="isOffersDAFound"/>  ||  
			    No DA is configured for MUIOOfferId <value expr="MUIOOfferId"/></ivr:log>

			<assign name="promptId" expr="masterDAErrorPromptId"/>
			<jsp:include page="<%=vxmlPath + "NoDAConfiguredForMUIO" + vxmlFileSuffix%>"/>
			<audio expr="returnAudioPath(promptsetId, subscriberLanguage, promptId, versionId, debug)"/>

	</block>
	<block name="noMUIOOfferIdConfigured" cond="playMUIOAnnouncementFlag==TRUE_STRING &amp;&amp; masterSubscriberFlag==FALSE_STRING &amp;&amp; MUIOOfferId==NULL_STRING">
			<!-- offer id not found for subscriber -->
			 <assign name="application.bal_NewDARequest" expr="TRUE_STRING"/>

				<ivr:log label="BalanceEnquiry">playDA <value expr="playDA"/>  ||  
				masterSubscriberFlag <value expr="masterSubscriberFlag"/>  ||  
				isOffersDAFound <value expr="isOffersDAFound"/>  ||  
			    MUIOOfferId is not found <value expr="MUIOOfferId"/></ivr:log>

			<assign name="promptId" expr="'BAL_NO_MUIO_FOUND_MSG'"/>
			<jsp:include page="<%=vxmlPath + "NoMUIOFound" + vxmlFileSuffix%>"/>
			<audio expr="returnAudioPath(promptsetId, subscriberLanguage, promptId, versionId, debug)"/>
	</block>
	<%--PMR477--%>


    <%-- PC = STC-V001 Ends Here --%>  
    <%-- As of US:197.The call of DA main will always be through a subdialog. --%>
    <subdialog name="<%=MicroflowConstants.SUBDIALOG_INTER_MODULE_CALL_PREFIX%>DedicatedAccounts" fetchtimeout="15s" srcexpr="'/VXMLIVR/DedicatedAccount.do?externalAnnouncementOrder='+daAnnnouncementOrder+'&amp;presentationId='+presentationId+'&amp;debug='+debug+'&amp;versionId='+versionId+'&amp;configurationId='+configurationId"
      cond="playDA == TRUE_STRING ">
      <param name="appRootFromSubdialog" expr="application"/>
      <!--  -->
      <filled>
          <assign name="skipToWorkflow" expr="<%=MicroflowConstants.SUBDIALOG_INTER_MODULE_CALL_PREFIX%>DedicatedAccounts.skipToWorkflow"/>
	  <assign name="daPlayStatus" expr="<%=MicroflowConstants.SUBDIALOG_INTER_MODULE_CALL_PREFIX%>DedicatedAccounts.status"/>

			  <ivr:log label="BalanceEnquiry">Playing DA for master subscriber  ||  
              After Return from DA Play, status = <value expr="daPlayStatus"/>  ||  
              After Return from DA Play, skipToWorkflow = <value expr="skipToWorkflow"/></ivr:log>

	  <if cond="skipToWorkflow == 'true'">
	      <goto nextitem="block_AnnEnd"/>
	  </if>
     </filled>
    </subdialog>

	<!-- AirIp 4.0: Offer Support-->
	<subdialog name="sub_offersPlayCall" fetchtimeout="15s" srcexpr="'/VXMLIVR/OffersAction.do?presentationId='+presentationId+'&amp;debug='+debug+'&amp;versionId='+versionId+OptionalParametersString" cond="playOffers == 'true'">
		<param name="appRootFromSubdialog" expr="application"/>
		<!--  -->
		<filled>
			<assign name="playOfferStatus" expr="sub_offersPlayCall.status"/>

				<ivr:log label="BalanceEnquiry">After Return from Offers Play, status = <value expr="playOfferStatus"/></ivr:log>

		</filled>
	</subdialog>
    <!--  -->

    <logic:iterate id="eachAnnouncementForm" name="BalanceEnquiryActionForm" property="announcementForms" type="java.lang.String">
    <!-- -->
    <field name="dummyField_For_Balance_<%=i%>">
		     <grammar version="1.0" src="<%= "/VXMLIVR/grammarFiles/local/Everything.grxml"+"?versionId="+request.getParameter("versionId") %>" mode="dtmf"/>
		     <prompt timeout="0s"/>
		     <catch event="noinput">
		       <!-- if no input from the user, skip this field -->
				<ivr:log label="BalanceEnquiry">Skipping dummyField_For_Balance
				|| eachAnnouncementForm <value expr="'<%=eachAnnouncementForm%>'"/>
				</ivr:log>
		       <assign name="dummyField_For_Balance_<%=i%>" expr="true"/>
		      </catch>
		      <filled>    		   
			<ivr:log label="BalanceEnquiry">DTMF Entered While Playing Successfull Balance Announcements  = <value expr="dummyField_For_Balance_<%=i%>"/>
			</ivr:log>

		        <goto nextitem="block_AnnEnd"/>
		     </filled>   
         </field>
        <%++i;%>
    <!-- -->
      <ivr:include page="<%=vxmlPath + eachAnnouncementForm + vxmlFileSuffix%>"/>
    </logic:iterate>
    <!--  -->   
    <block name="block_AnnEnd"> 


	  <%-- TELMA V001 Start: Added to invoke listen again if configured --%>
	<if cond = "maxAnnouncementRepetitionTimes &gt;0 &amp;&amp; announcementRepetitionTimes &lt; maxAnnouncementRepetitionTimes &amp;&amp; responseCode==0">
		<goto next="#ListenAgain"/>
	</if>
	<%-- TELMA V001 End --%>
      	  <%-- HM92846 Starts Here : Assigned exit status to daPlayStatus only for the case where offerCreditRefillFlag is true
	   and DAs are played if only offerCreditRefillFlag is true then exit status is set to 'SUCCESS_CREDIT_REFILL' --%>
      <if cond="application.offerCreditRefillFlag == 'true' &amp;&amp; playDA == 'true' ">
	  <ivr:log label="BalanceEnquiry">Exit status after playing DAs set to = <value expr="daPlayStatus"/></ivr:log>
		<assign name="exitStatus" expr="daPlayStatus"/>
	  <elseif cond="application.offerCreditRefillFlag == 'true' &amp;&amp; playDA == 'false' "/>
	  <ivr:log label="BalanceEnquiry">Exit status for Offer Credit Refill set to = <value expr="'SUCCESS_CREDIT_REFILL'"/></ivr:log>
		<assign name="exitStatus" expr="'SUCCESS_CREDIT_REFILL'"/>	  
		 <%-- HM92846 Ends --%>
	  <else/>
	  <ivr:log label="BalanceEnquiry">Exit status before Exit set to = <value expr="STATUS_SUCCESS"/></ivr:log>
		<assign name="exitStatus" expr="STATUS_SUCCESS"/>
	  </if>
      <%-- HL40698 Ends Here --%>


        <ivr:include page="<%=vxmlPath + "BalanceEnquiryConclusion" + vxmlFileSuffix%>"/>       

		<ivr:log label="BalanceEnquiry">Balance Enquiry Conclusion 
		|| Balance Equiry Done Counter = <value expr="application.counter_BalEnq"/>
		</ivr:log>
     
      <goto next="#<%=MicroflowConstants.GENERAL_FORM_PREFIX%>exitModule"/>
    </block>
  </form>
  <!--  -->
  <!--  Timeout Count Exceeded -->
  <!--  -->
  <!--  Form Names restored to previous one  -->
  <form id="form_MaxTimeoutCountExceeded">
    <block name="block_form_MaxTimeoutCountExceeded">
      <goto next="#<%=MicroflowConstants.ERROR_FORM_PREFIX%>form_MaxTimeoutCountExceeded"/>
    </block>
  </form>
  <!--  -->
  <form id="<%=MicroflowConstants.ERROR_FORM_PREFIX%>form_MaxTimeoutCountExceeded">
    <block name="block_MaxTimeoutRetryCountExceeded">
<ivr:log label="BalanceEnquiry">BalanceEnquiry MaxTimeoutCountExceeded Starts
</ivr:log>
      <!--  -->
      <ivr:include page="<%=vxmlPath + "MaxTimeoutCountExceededAnn" + vxmlFileSuffix%>"/>
      <!--  -->
      <assign name="exitStatus" expr="STATUS_FAILURE_TIMEOUT"/>
<ivr:log label="BalanceEnquiry">BalanceEnquiry MaxTimeoutCountExceeded Exits with exitStatus = <value expr="exitStatus"/>
|| Prompt Id = <value expr="promptId"/>
</ivr:log>
      <!--  -->
      <goto next="#<%=MicroflowConstants.GENERAL_FORM_PREFIX%>exitModule"/>
    </block>
  </form>
  <!--  -->
  <!--  Max Retry Count Exceeded -->
  <!--  -->
  <!--  Form Names restored to previous one  -->
  <form id="form_MaxRetryCountExceeded">
    <block name="block_form_MaxRetryCountExceeded">
      <goto next="#<%=MicroflowConstants.ERROR_FORM_PREFIX%>form_MaxRetryCountExceeded"/>
    </block>
  </form>
  <!--  -->
  <form id="<%=MicroflowConstants.ERROR_FORM_PREFIX%>form_MaxRetryCountExceeded">
    <block name="block_MaxRetryCountExceeded">
<ivr:log label="BalanceEnquiry">BalanceEnquiry MaxRetryCountExceeded Starts
</ivr:log>
      <!--  -->
      <ivr:include page="<%=vxmlPath + "MaxRetryCountExceededAnn" + vxmlFileSuffix%>"/>
      <!--  -->
      <assign name="exitStatus" expr="STATUS_FAILURE_RETRY"/>
<ivr:log label="BalanceEnquiry">BalanceEnquiry MaxRetryCountExceeded Exits with exitStatus = <value expr="exitStatus"/>
|| Prompt Id = <value expr="promptId"/>
</ivr:log>
      <!--  -->
      <goto next="#<%=MicroflowConstants.GENERAL_FORM_PREFIX%>exitModule"/>
    </block>
  </form>
  <!--  -->
  <!--  Max Invalid Retry Count Exceeded -->
  <!--  -->
  <!--  Form Names restored to previous one  -->
  <form id="form_MaxInvalidRetryCountExceeded">
    <block name="block_form_MaxInvalidRetryCountExceeded">
      <goto next="#<%=MicroflowConstants.ERROR_FORM_PREFIX%>form_MaxInvalidRetryCountExceeded"/>
    </block>
  </form>
  <!--  -->
  <form id="<%=MicroflowConstants.ERROR_FORM_PREFIX%>form_MaxInvalidRetryCountExceeded">
    <block name="block_MaxInvalidRetryCountExceeded">
<ivr:log label="BalanceEnquiry">BalanceEnquiry MaxInvalidRetryCountExceeded Starts
</ivr:log>
      <!--  -->
      <ivr:include page="<%=vxmlPath + "MaxInvalidRetryCountExceededAnn" + vxmlFileSuffix%>"/>
      <!--  -->
      <assign name="exitStatus" expr="STATUS_FAILURE_INVALID_RETRY"/>
<ivr:log label="BalanceEnquiry">BalanceEnquiry MaxInvalidRetryCountExceeded Exits with exitStatus = <value expr="exitStatus"/>
|| Prompt Id = <value expr="promptId"/>
</ivr:log>
      <!--  -->
      <goto next="#<%=MicroflowConstants.GENERAL_FORM_PREFIX%>exitModule"/>
    </block>
  </form>
  <!--  -->
  <!--  -->
  <!--  Form Names restored to previous one  -->
  <form id="handle_SubscriberNotFound">
    <block name="block_handle_SubscriberNotFound">
      <goto next="#<%=MicroflowConstants.ERROR_FORM_PREFIX%>handle_SubscriberNotFound"/>
    </block>
  </form>
  <!--  -->
  <form id="<%=MicroflowConstants.ERROR_FORM_PREFIX%>handle_SubscriberNotFound">
    <block>
<ivr:log label="BalanceEnquiry">Balance Enquiry - <%=MicroflowConstants.ERROR_FORM_PREFIX%>handle_SubscriberNotFound
|| Prompt Set Id = <value expr="promptsetId"/>
|| Version Id = <value expr="versionId"/>
</ivr:log>
      <!--  -->
      <ivr:include page="<%=vxmlPath + "SubscriberNotFound" + vxmlFileSuffix%>"/>
      <!--  -->
<ivr:log label="BalanceEnquiry">Prompt Id = <value expr="promptId"/>
</ivr:log>
      <!--  -->
      <goto next="#<%=MicroflowConstants.GENERAL_FORM_PREFIX%>exitModule"/>
    </block>
  </form>
  <!--  -->
  <!--  -->
  <!--  Form Names restored to previous one  -->
  <form id="handle_BalanceEnquiryNotAllowed">
    <block name="block_handle_BalanceEnquiryNotAllowed">
      <goto next="#<%=MicroflowConstants.ERROR_FORM_PREFIX%>handle_BalanceEnquiryNotAllowed"/>
    </block>
  </form>
  <!--  -->
  <form id="<%=MicroflowConstants.ERROR_FORM_PREFIX%>handle_BalanceEnquiryNotAllowed">
    <block>
<ivr:log label="BalanceEnquiry">Balance Enquiry - <%=MicroflowConstants.ERROR_FORM_PREFIX%>handle_BalanceEnquiryNotAllowed
|| Prompt Set Id = <value expr="promptsetId"/>
|| Version Id = <value expr="versionId"/>
</ivr:log>
      <!--  -->
      <ivr:include page="<%=vxmlPath + "BalanceEnquiryNotAllowed" + vxmlFileSuffix%>"/>
      <!--  -->
<ivr:log label="BalanceEnquiry">Prompt Id = <value expr="promptId"/>
</ivr:log>
      <!--  -->
      <goto next="#<%=MicroflowConstants.GENERAL_FORM_PREFIX%>exitModule"/>
    </block>
  </form>
  <!--  -->
  <!--  -->
  <!--  Form Names restored to previous one  -->
  <form id="handle_BelowMinimumBalance">
    <block name="block_handle_BelowMinimumBalance">
      <goto next="#<%=MicroflowConstants.ERROR_FORM_PREFIX%>handle_BelowMinimumBalance"/>
    </block>
  </form>
  <!--  -->
  <form id="<%=MicroflowConstants.ERROR_FORM_PREFIX%>handle_BelowMinimumBalance">
    <block>
<ivr:log label="BalanceEnquiry">Balance Enquiry - <%=MicroflowConstants.ERROR_FORM_PREFIX%>handle_BelowMinimumBalance
|| Prompt Set Id = <value expr="promptsetId"/>
|| Version Id = <value expr="versionId"/>
</ivr:log>
      <!--  -->
      <ivr:include page="<%=vxmlPath + "BelowMinimumBalance" + vxmlFileSuffix%>"/>
      <!--  -->
<ivr:log label="BalanceEnquiry">Prompt Id = <value expr="promptId"/>
</ivr:log>
      <!--  -->
      <goto next="#<%=MicroflowConstants.GENERAL_FORM_PREFIX%>exitModule"/>
    </block>
  </form>
  <!--  -->
  <!--  -->
  <!--  Form Names restored to previous one  -->
  <form id="handle_AccountNotActive">
    <block name="block_handle_AccountNotActive">
      <goto next="#<%=MicroflowConstants.ERROR_FORM_PREFIX%>handle_AccountNotActive"/>
    </block>
  </form>
  <!--  -->
  <form id="<%=MicroflowConstants.ERROR_FORM_PREFIX%>handle_AccountNotActive">
    <block>
<ivr:log label="BalanceEnquiry">Balance Enquiry - <%=MicroflowConstants.ERROR_FORM_PREFIX%>handle_AccountNotActive
|| Prompt Set Id = <value expr="promptsetId"/>
|| Version Id = <value expr="versionId"/>
</ivr:log>
      <!--  -->
      <ivr:include page="<%=vxmlPath + "AccountNotActive" + vxmlFileSuffix%>"/>
      <!--  -->
<ivr:log label="BalanceEnquiry">Prompt Id = <value expr="promptId"/>
</ivr:log>
      <!--  -->
      <goto next="#<%=MicroflowConstants.GENERAL_FORM_PREFIX%>exitModule"/>
    </block>
  </form>
  <!--  -->
  <!--  -->
  <!--  Form Names restored to previous one  -->
  <form id="handle_AccumulatorOverflow">
    <block name="block_handle_AccumulatorOverflow">
      <goto next="#<%=MicroflowConstants.ERROR_FORM_PREFIX%>handle_AccumulatorOverflow"/>
    </block>
  </form>
  <!--  -->
  <form id="<%=MicroflowConstants.ERROR_FORM_PREFIX%>handle_AccumulatorOverflow">
    <block>
<ivr:log label="BalanceEnquiry">Balance Enquiry - <%=MicroflowConstants.ERROR_FORM_PREFIX%>handle_AccumulatorOverflow
|| Prompt Set Id = <value expr="promptsetId"/>
|| Version Id = <value expr="versionId"/>
</ivr:log>
      <!--  -->
      <ivr:include page="<%=vxmlPath + "AccumulatorOverflow" + vxmlFileSuffix%>"/>
      <!--  -->
<ivr:log label="BalanceEnquiry">Prompt Id = <value expr="promptId"/>
</ivr:log>
      <!--  -->
      <goto next="#<%=MicroflowConstants.GENERAL_FORM_PREFIX%>exitModule"/>
    </block>
  </form>
  <!--  -->
  <!--  -->
  <!--  Form Names restored to previous one  -->
  <form id="handle_AccumulatorUnderflow">
    <block name="block_handle_AccumulatorUnderflow">
      <goto next="#<%=MicroflowConstants.ERROR_FORM_PREFIX%>handle_AccumulatorUnderflow"/>
    </block>
  </form>
  <!--  -->
  <form id="<%=MicroflowConstants.ERROR_FORM_PREFIX%>handle_AccumulatorUnderflow">
    <block>
<ivr:log label="BalanceEnquiry">Balance Enquiry - <%=MicroflowConstants.ERROR_FORM_PREFIX%>handle_AccumulatorUnderflow
|| Prompt Set Id = <value expr="promptsetId"/>
|| Version Id = <value expr="versionId"/>
</ivr:log>
      <!--  -->
      <ivr:include page="<%=vxmlPath + "AccumulatorUnderflow" + vxmlFileSuffix%>"/>
      <!--  -->
<ivr:log label="BalanceEnquiry">Prompt Id = <value expr="promptId"/>
</ivr:log>
      <!--  -->
      <goto next="#<%=MicroflowConstants.GENERAL_FORM_PREFIX%>exitModule"/>
    </block>
  </form>
  <!--  -->
  <!--  -->
  <!--  Form Names restored to previous one  -->
  <form id="handle_MaxCreditLimitExceeded">
    <block name="block_handle_MaxCreditLimitExceeded">
      <goto next="#<%=MicroflowConstants.ERROR_FORM_PREFIX%>handle_MaxCreditLimitExceeded"/>
    </block>
  </form>
  <!--  -->
  <form id="<%=MicroflowConstants.ERROR_FORM_PREFIX%>handle_MaxCreditLimitExceeded">
    <block>
<ivr:log label="BalanceEnquiry">Balance Enquiry - <%=MicroflowConstants.ERROR_FORM_PREFIX%>handle_MaxCreditLimitExceeded
|| Prompt Set Id = <value expr="promptsetId"/>
|| Version Id = <value expr="versionId"/>
</ivr:log>
      <!--  -->
      <ivr:include page="<%=vxmlPath + "MaxCreditLimitExceeded" + vxmlFileSuffix%>"/>
      <!--  -->
<ivr:log label="BalanceEnquiry">Prompt Id = <value expr="promptId"/>
</ivr:log>
      <!--  -->
      <goto next="#<%=MicroflowConstants.GENERAL_FORM_PREFIX%>exitModule"/>
    </block>
  </form>
  <!--  -->
  <!--  Max Allowed balance Enquiry Done -->
  <form id="handle_MaxAllowedBalEnqDone">
    <block name="block_MaxAllowedBalEnqDone">
<ivr:log label="BalanceEnquiry">BalanceEnquiry Max Allowed balance Enquiry Done Starts
|| Prompt Set Id = <value expr="promptsetId"/>
|| Version Id = <value expr="versionId"/>
</ivr:log>
      <!--  -->
      <ivr:include page="<%=vxmlPath + "MaxAllowedBalEnqDone" + vxmlFileSuffix%>"/>
      <!--  -->
      <assign name="exitStatus" expr="STATUS_FAILURE_MAXALLOWEDBALENQDONE"/>
<ivr:log label="BalanceEnquiry">BalanceEnquiry Max Allowed balance Enquiry Done Exits with exitStatus = <value expr="exitStatus"/>
|| Prompt Id = <value expr="promptId"/>
</ivr:log>
      <!--  -->
      <goto next="#<%=MicroflowConstants.GENERAL_FORM_PREFIX%>exitModule"/>
    </block>
  </form>

  <!--  -->
  <!--  System Unavailable -->
  <form id="handle_SystemFailure">
    <block name="block_SystemUnavailable">
<ivr:log label="BalanceEnquiry">BalanceEnquiry SystemUnavailable Starts
|| Prompt Set Id = <value expr="promptsetId"/>
|| Version Id = <value expr="versionId"/>
</ivr:log>
      <!--  -->
      <ivr:include page="<%=vxmlPath + "SystemFailure" + vxmlFileSuffix%>"/>
      <!--  -->
      <assign name="exitStatus" expr="STATUS_SYSTEM_FAILURE"/>
<ivr:log label="BalanceEnquiry">BalanceEnquiry SystemUnavailable Exits with exitStatus = <value expr="exitStatus"/>
|| Prompt Id = <value expr="promptId"/>
</ivr:log>
      <!--  -->
      <goto next="#<%=MicroflowConstants.GENERAL_FORM_PREFIX%>exitModule"/>
    </block>
  </form>
  <!--  -->
  <!--  TEMPORORY BLOCKED -->
  <!--  -->
  <!--  Form Names restored to previous one  -->
  <form id="handle_TemporaryBlocked">
    <block name="block_handle_TemporaryBlocked">
      <goto next="#<%=MicroflowConstants.ERROR_FORM_PREFIX%>handle_TemporaryBlocked"/>
    </block>
  </form>
  <!--  -->
  <form id="<%=MicroflowConstants.ERROR_FORM_PREFIX%>handle_TemporaryBlocked">
    <block name="block_TemporaryBlocked">
<ivr:log label="BalanceEnquiry">BalanceEnquiry TemporaryBlocked Starts
|| Prompt Set Id = <value expr="promptsetId"/>
|| Version Id = <value expr="versionId"/>
</ivr:log>
      <!--  -->
      <ivr:include page="<%=vxmlPath + "TemporaryBlocked" + vxmlFileSuffix%>"/>
      <!--  -->
      <assign name="exitStatus" expr="STATUS_FAILURE_TEMPORARY_BLOCKED"/>
<ivr:log label="BalanceEnquiry">BalanceEnquiry TemporaryBlocked Exits with exitStatus = <value expr="exitStatus"/>
|| Prompt Id = <value expr="promptId"/>
</ivr:log>
      <!--  -->
      <goto next="#<%=MicroflowConstants.GENERAL_FORM_PREFIX%>exitModule"/>
    </block>
  </form>
  <!--  -->
  <!--  Dedicated Account Not Allowed -->
  <!--  -->
  <!--  Form Names restored to previous one  -->
  <form id="handle_DedicatedAccountNotAllowed">
    <block name="block_handle_DedicatedAccountNotAllowed">
      <goto next="#<%=MicroflowConstants.ERROR_FORM_PREFIX%>handle_DedicatedAccountNotAllowed"/>
    </block>
  </form>
  <!--  -->
  <form id="<%=MicroflowConstants.ERROR_FORM_PREFIX%>handle_DedicatedAccountNotAllowed">
    <block name="block_DedicatedAccountNotAllowed">
<ivr:log label="BalanceEnquiry">BalanceEnquiry DedicatedAccountNotAllowed Starts
|| Prompt Set Id = <value expr="promptsetId"/>
|| Version Id = <value expr="versionId"/>
</ivr:log>
      <!--  -->
      <ivr:include page="<%=vxmlPath + "DedicatedAccountNotAllowed" + vxmlFileSuffix%>"/>
      <!--  -->
      <assign name="exitStatus" expr="STATUS_FAILURE_DEDICATED_ACCOUNT_NOT_ALLOWED"/>
<ivr:log label="BalanceEnquiry">BalanceEnquiry DedicatedAccountNotAllowed Exits with exitStatus = <value expr="exitStatus"/>
|| Prompt Id = <value expr="promptId"/>
</ivr:log>
      <!--  -->
      <goto next="#<%=MicroflowConstants.GENERAL_FORM_PREFIX%>exitModule"/>
    </block>
  </form>
  <!--  -->
  <!--  Dedicated Account Not Defined 139 -->
  <!--  -->
  <!--  Form Names restored to previous one  -->
  <form id="handle_DedicatedAccountNotDefined">
    <block name="block_handle_DedicatedAccountNotDefined">
      <goto next="#<%=MicroflowConstants.ERROR_FORM_PREFIX%>handle_DedicatedAccountNotDefined"/>
    </block>
  </form>
  <!--  -->
  <form id="<%=MicroflowConstants.ERROR_FORM_PREFIX%>handle_DedicatedAccountNotDefined">
    <block name="block_DedicatedAccountNotDefined">
<ivr:log label="BalanceEnquiry">BalanceEnquiry DedicatedAccountNotDefined Starts
|| Prompt Set Id = <value expr="promptsetId"/>
|| Version Id = <value expr="versionId"/>
</ivr:log>
      <!--  -->
      <ivr:include page="<%=vxmlPath + "DedicatedAccountNotDefined" + vxmlFileSuffix%>"/>
      <!--  -->
      <assign name="exitStatus" expr="'STATUS_FAILURE_DEDICATED_ACCOUNT_NOT_DEFINED'"/>
<ivr:log label="BalanceEnquiry">BalanceEnquiry DedicatedAccountNotDefined Exits with exitStatus = <value expr="exitStatus"/>
|| Prompt Id = <value expr="promptId"/>
</ivr:log>
      <!--  -->
      <goto next="#<%=MicroflowConstants.GENERAL_FORM_PREFIX%>exitModule"/>
    </block>
  </form>
  <!--  -->  
  <!--  Date Adjustment Error -->
  <!--  -->
  <!--  Form Names restored to previous one  -->
  <form id="handle_DateAdjustmentError">
    <block name="block_handle_DateAdjustmentError">
      <goto next="#<%=MicroflowConstants.ERROR_FORM_PREFIX%>handle_DateAdjustmentError"/>
    </block>
  </form>
  <!--  -->
  <form id="<%=MicroflowConstants.ERROR_FORM_PREFIX%>handle_DateAdjustmentError">
    <block name="block_DateAdjustmentError">
<ivr:log label="BalanceEnquiry">BalanceEnquiry DateAdjustmentError Starts
|| Prompt Set Id = <value expr="promptsetId"/>
|| Version Id = <value expr="versionId"/>
</ivr:log>
      <!--  -->
      <ivr:include page="<%=vxmlPath + "DateAdjustmentError" + vxmlFileSuffix%>"/>
      <!--  -->
      <assign name="exitStatus" expr="STATUS_FAILURE_DATE_ADJUSTMENT_ERROR"/>
<ivr:log label="BalanceEnquiry">BalanceEnquiry DateAdjustmentError Exits with exitStatus = <value expr="exitStatus"/>
|| Prompt Id = <value expr="promptId"/>
</ivr:log>
      <!--  -->
      <goto next="#<%=MicroflowConstants.GENERAL_FORM_PREFIX%>exitModule"/>
    </block>
  </form>
  <!--  -->
  <!--  -->
  <!--  Form Names restored to previous one  -->
  <form id="exitModule">
    <block name="block_exitModule">
      <goto next="#<%=MicroflowConstants.GENERAL_FORM_PREFIX%>exitModule"/>
    </block>
  </form>
  <!--  -->
  <form id="<%=MicroflowConstants.GENERAL_FORM_PREFIX%>exitModule">
    <var name="presentationId" expr="application.presentationId"/>
    <var name="debug" expr="application.debug"/>
    <var name="status" expr="document.exitStatus"/>
    <var name="callType" expr="application.callType"/>
    <var name="callingNumber" expr="application.callingNumber"/>
    <var name="currentModule" expr="application.currentModule"/>
    <var name="versionId" expr="application.versionId"/>
    <var name="statType" expr="''"/>
    <var name="voucherNumber" expr="''"/>
    <var name="statusCode" expr="''"/>
    <var name="calledNumber" expr="application.calledNumber"/>
	<%-- pmr 854 change starts --%>
	<var name="loggingURL" expr="''"/>
	<%-- pmr 854 change ends --%>
    <!--  -->
	

	<block>
		<if cond="enableStatisticsLoggingGlobal == 'true' &amp;&amp; enableStatisticsLogging == 'true'">
    		<assign name="statType" expr="getStatType()"/>
    		<assign name="voucherNumber" expr="getVoucherNumber()"/>
    		<assign name="statusCode" expr="getStatusCode()"/>
			<%-- PMR 854 Change Start --%>
			<if cond="application.enableRemoteStatisticsLogging=='true'">
			<assign name="loggingURL" expr="application.reportServiceURL + '/StatisticsLogger.do'"/>
			<else/>
			<assign name="loggingURL" expr="'../VXMLIVR/StatisticsLogger.do'"/>
			</if>
			<%-- PMR 854 Change Ends --%>
		</if>
	</block>
		<%-- modified for PMR 854 starts --%>
		 <subdialog name="statisticsLogger" srcexpr="loggingURL" fetchtimeout="15s" namelist="statType callingNumber calledNumber voucherNumber statusCode versionId" cond="enableStatisticsLoggingGlobal == 'true' &amp;&amp; enableStatisticsLogging == 'true'"/>
    		<%-- modified for PMR 854 ends --%>
	<catch event="error.badfetch">
			<ivr:log label="BalanceEnquiry">could not  do statistics logging</ivr:log>
			<goto nextitem="exit_Block"/>
		</catch>
<%-- PMR 854 Ends --%>
	<block name="exit_Block">
      <if cond="UpdateRollback == 'true'" >
        <assign name="exitStatus" expr="STATUS_CHARGES_REVERTED"/>
        <assign name="chargingType" expr="ROLLBACK"/>
        <goto next="#<%=MicroflowConstants.GENERAL_FORM_PREFIX%>form_GetBalanceDetails"/>
      </if>
      <!--  -->
<ivr:log label="BalanceEnquiry">Balance Enquiry Exit
|| Presentation Id = <value expr="presentationId"/>
|| Calling Number = <value expr="callingNumber"/>
|| Call Type = <value expr="callType"/>
|| Current Module = <value expr="currentModule"/>
|| Debug Level = <value expr="debug"/>
|| Exit Status = <value expr="status"/>
|| Version Id = <value expr="versionId"/>
|| Submitting Request To BalanceEnquiryExit.do
</ivr:log>
      <submit next="/VXMLIVR/BalanceEnquiryExit.do" namelist="callType currentModule callingNumber presentationId debug status versionId"/>
    </block>
  </form>
  <!--  -->
  <!--  -->
  <!--  Form Names restored to previous one  -->
  <form id="form_checkChargingMethod">
    <block name="block_form_checkChargingMethod">
      <goto next="#<%=MicroflowConstants.GENERAL_FORM_PREFIX%>form_checkChargingMethod"/>
    </block>
  </form>
  <!--  -->
  <form id="<%=MicroflowConstants.GENERAL_FORM_PREFIX%>form_checkChargingMethod">
    <block name="block_checkChargingMethodStandard" cond="chargingMethod == CHARGING_STANDARD">
<ivr:log label="BalanceEnquiry">BalanceEnquiry CheckChargingMethod Starts
|| ChargingMethod=<value expr="chargingMethod"/>
|| Going to Get Balance Details - ChargingType=<value expr="chargingType"/>
</ivr:log>
      <goto next="#<%=MicroflowConstants.GENERAL_FORM_PREFIX%>form_GetBalanceDetails"/>
    </block>
    <!--  -->
    <block name="block_checkChargingMethodFastAdjust" cond="chargingMethod == CHARGING_FASTADJUST">
<ivr:log label="BalanceEnquiry">BalanceEnquiry CheckChargingMethod Starts
|| ChargingMethod=<value expr="chargingMethod"/>
</ivr:log>
      <if cond="chargingType == RESERVE || chargeAnnouncementRequired == 'true'">
        <assign name="resultCurrency1" expr="transactionCurrency"/>
        <assign name="resultCurrency2" expr="transactionCurrency2"/>
        <assign name="cost1" expr="adjustmentAmount"/>
        <assign name="cost1abs" expr="adjustmentAmountabs"/>
        <assign name="cost2" expr="adjustmentAmount2"/>
        <assign name="cost2abs" expr="adjustmentAmount2abs"/>
        <!--  -->
        <goto next="#<%=MicroflowConstants.PLAY_FORM_PREFIX%>form_PlayCharges"/>
      </if>
      <!--  -->
      <goto next="#<%=MicroflowConstants.GENERAL_FORM_PREFIX%>form_raiseAdjustmentRequest"/>
    </block>
  </form>
  <!--  -->
  <!--  -->
  <!--  Form Names restored to previous one  -->
  <form id="form_PostConfirmCharges">
    <block name="block_form_PostConfirmCharges">
      <goto next="#<%=MicroflowConstants.GENERAL_FORM_PREFIX%>form_PostConfirmCharges"/>
    </block>
  </form>
  <!--  -->
  <form id="<%=MicroflowConstants.GENERAL_FORM_PREFIX%>form_PostConfirmCharges">
    <block name="block_PostConfirmChargesStandard" cond="chargingMethod == CHARGING_STANDARD">
<ivr:log label="BalanceEnquiry">Going to Get Balance Details - ChargingType=<value expr="chargingType"/>
</ivr:log>
      <goto next="#<%=MicroflowConstants.GENERAL_FORM_PREFIX%>form_GetBalanceDetails"/>
    </block>
    <!--  -->      
    <block name="block_PostConfirmChargesFastAdjust" cond="chargingMethod == CHARGING_FASTADJUST">
      <goto next="#<%=MicroflowConstants.GENERAL_FORM_PREFIX%>form_raiseAdjustmentRequest"/>
    </block>
  </form>
  <!--  -->
  <!--  -->
  <!--  Form Names restored to previous one  -->
  <form id="form_raiseAdjustmentRequest">
    <block name="block_form_raiseAdjustmentRequest">
      <goto next="#<%=MicroflowConstants.GENERAL_FORM_PREFIX%>form_raiseAdjustmentRequest"/>
    </block>
  </form>
  <!--  -->
  <form id="<%=MicroflowConstants.GENERAL_FORM_PREFIX%>form_raiseAdjustmentRequest">
    <block name="block_raiseAdjustmentRequest">
<ivr:log label="BalanceEnquiry">BalanceEnquiry raiseAdjustmentRequest Starts
|| Prompt Id = <value expr="promptId"/>
|| Input parameters to GetBalanceDetails
|| callingNumber is = <value expr="callingNumber"/>
|| subscriberNAI is = <value expr="subscriberNAI"/>
|| debug is = <value expr="debug"/>
|| presentationId is = <value expr="presentationId"/>
|| versionId is = <value expr="versionId"/>
|| chargingType is = <value expr="chargingType"/>
|| locationNumber is = <value expr="locationNumber"/>
|| reservationCorrelationID is = <value expr="reservationCorrelationID"/>
|| Sending Fast Adjustment Request
</ivr:log>
    	<ivr:include page="<%=vxmlPath + "DataUpdateBalanceAndDatePre" + vxmlFileSuffix%>"/>
    </block>      
    <!--  -->
    <!-- Call to UpdateBalanceAndDate Request for adjustment -->
    <ivr:include page="<%=jspPath + "UpdateBalanceAndDate" + jspFileSuffix%>"/>
    <!--  -->
    <block name="dataBlock_adjustment">
        <assign name="responseCode" expr="adjustment.responseCode"/>
        <assign name="nextFormId" expr="adjustment.nextFormId"/>
        <assign name="document.exitStatus" expr="adjustment.status"/>
        <!--  -->
        <if cond="responseCode == SUCCESSCODE">
          <!--  assign chargingType to 0 in case of fast adjustment request  -->
          <assign name="chargingType" expr="NOCHARGE"/>
          <assign name="nextFormId" expr="'#<%=MicroflowConstants.GENERAL_FORM_PREFIX%>form_GetBalanceDetails'"/>
        </if>
        <!--  -->
		<ivr:log label="BalanceEnquiry">adjustment.responseCode is = <value expr="responseCode"/>
		|| adjustment.nextFormId is = <value expr="nextFormId"/>
		|| adjustment.status is = <value expr="exitStatus"/>
		</ivr:log>
        <!--  -->
        <ivr:include page="<%=vxmlPath + "DataUpdateBalanceAndDatePost" + vxmlFileSuffix%>"/>
        <goto expr="nextFormId"/>
    </block>
  </form>

<%-- TELMA V001 Start --%>
<form id="ListenAgain">
    <block name="block_form_ListenAgain">
      <goto next="#<%=MicroflowConstants.GENERAL_FORM_PREFIX%>ListenAgain"/>
    </block>
  </form>

<form id="<%=MicroflowConstants.GENERAL_FORM_PREFIX%>ListenAgain">
	<var name="listenAgainTimeoutCounter" expr="0"/>
	<var name="listenAgainInvalidEntryCounter" expr="0"/>
	<block name="playListenAgainMsg" >
		<ivr:include page='<%=vxmlPath  + "PreListenAgain" + vxmlFileSuffix%>'/>
		<prompt>
				<audio expr="returnAudioPath(application.promptsetId,application.subscriberLanguage, 'BAL_LISTEN_AGAIN_MSG', versionId, debug)"/>
		</prompt>
	</block>
		<field name="listenAgain">
		
			
			<grammar version="1.0" src='<%= "/VXMLIVR/grammarFiles/local/Confirmation.grxml"+"?versionId="+request.getParameter("versionId") %>' mode="dtmf"/>
			<filled>
			<ivr:log label="BalanceEnquiry">Eneter in field  ||  
			DTMF used for Confirmation = <value expr="listenAgain"/></ivr:log>
				<if cond="listenAgain == listenAgainDTMF">
				<ivr:log label="BalanceEnquiry">Matched dtmf</ivr:log>
					<assign name="announcementRepetitionTimes" expr = "announcementRepetitionTimes +1"/>
					<goto next="#<%=MicroflowConstants.GENERAL_FORM_PREFIX%>form_Successful"/>
				<else/>
					<throw event="nomatch"/>
				</if>
			</filled>
			<error>
				<assign name="status" expr="'FAILURE'"/>
				<assign name= "maxAnnouncementRepetitionTimes" expr="0"/>
				<goto next="#handle_SystemFailure"/>
			</error>
			<noinput>
			
				<if cond="listenAgainTimeoutCounter &lt; maxTimeoutRetries">
				<ivr:log label="BalanceEnquiry">No input for listen again</ivr:log>
					<assign name="listenAgainTimeoutCounter" expr="listenAgainTimeoutCounter + 1"/>
					<assign name="promptId" expr="'BAL_LISTEN_AGAIN_TIMEOUT_MSG'"/>
					<audio expr="returnAudioPath(promptsetId, subscriberLanguage, promptId, versionId, debug)"/>
					<ivr:include page='<%=vxmlPath  + "ListenAgainTimeout" + vxmlFileSuffix%>'/>
					<reprompt/>
				<else/>
					<assign name= "maxAnnouncementRepetitionTimes" expr="0"/>
					<goto next="#<%=MicroflowConstants.ERROR_FORM_PREFIX%>form_MaxTimeoutCountExceeded"/>
					
				</if>
			</noinput>
			<nomatch>
				<if cond="listenAgainInvalidEntryCounter &lt; maxInvalidRetries">
				<ivr:log label="BalanceEnquiry">No match for listen again</ivr:log>
					<assign name="listenAgainInvalidEntryCounter" expr="listenAgainInvalidEntryCounter + 1"/>
					<assign name="promptId" expr="'BAL_LISTEN_AGAIN_INVALID_ENTRY_MSG'"/>
					<audio expr="returnAudioPath(promptsetId, subscriberLanguage, promptId, versionId, debug)"/>
					<ivr:include page='<%=vxmlPath + "ListenAgainInvalidInput" + vxmlFileSuffix%>'/>
					<clear namelist="listenAgain"/>
					<reprompt/>
					
				<else/>
					<assign name= "maxAnnouncementRepetitionTimes" expr="0"/>
					<goto next="#<%=MicroflowConstants.ERROR_FORM_PREFIX%>form_MaxInvalidRetryCountExceeded"/>
				</if>
			</nomatch>
		</field>
</form>
<%-- TELMA V001 End --%>

<%-- PC Change SBM 028 Added for handling AirTimeout --%>
	<catch event="error">
        <ivr:log label="BalanceEnquiry">Error:Exiting module Balance Enquiry</ivr:log>
		<goto next="#handle_SystemFailure"/>
    </catch>

<%-- End SBM 028--%>
  <catch event="connection.disconnect.hangup">
	<ivr:log label="BalanceEnquiry">After user disconnect. Exiting
	</ivr:log>
		<if cond="enableStatisticsLoggingGlobal == 'true' &amp;&amp; enableStatisticsLogging == 'true'">
    		<ivr:log label="BalanceEnquiry">going for statistics logging on disconnect</ivr:log>				
			<goto next="#StatisticsLogging"/>				
		</if>		
		<!-- calls a catch block in ApplicationRoot.jsp which logs the CDL logs -->
		<throw event="root.disconnect"/>
   		<exit/>
  </catch>

<form id="StatisticsLogging">
	<var name="loggingURL" expr="''"/>
	<var name="statType" expr="getStatType()"/>
    <var name="voucherNumber" expr="getVoucherNumber()"/>
    <var name="statusCode" expr="getStatusCode()"/>
	<var name="calledNumber" expr="application.calledNumber"/>
	<block>	
			<if cond="application.enableRemoteStatisticsLogging=='true'">
				<assign name="loggingURL" expr="application.reportServiceURL + '/StatisticsLogger.do'"/>
			<else/>
				<assign name="loggingURL" expr="'../VXMLIVR/StatisticsLogger.do'"/>
			</if>

    </block>
		 <subdialog name="statisticsLogger" srcexpr="loggingURL" fetchtimeout="15s" namelist="statType callingNumber calledNumber voucherNumber statusCode versionId"/>
	<block>
	<ivr:log label="BalanceEnquiry">Throw disconnect Event</ivr:log>
	<throw event="root.disconnect"/>
</block>
</form>
</vxml>