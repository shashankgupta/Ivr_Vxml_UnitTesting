<%@ taglib  uri="http://struts.apache.org/tags-bean" prefix="bean" %><?xml version="1.0" encoding="UTF-8" ?>
<%@ taglib  uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="/WEB-INF/custom-tag.tld" prefix="ivr" %>
<%@ page import="com.ericsson.charging.vxmlivr.core.sve.MicroflowConstants" %>
  <!--  Dynamic VXML - StandardVoucherRefill.vxml  -->
  <!--  -->
  <vxml xmlns="http://www.w3.org/2001/vxml"
      xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
      xsi:schemaLocation="http://www.w3.org/2001/vxml http://www.w3.org/TR/voicexml20/vxml.xsd"
      version="2.0" application='/VXMLIVR/applicationRootAction.do?versionId=<%=request.getParameter("versionId")%>'>
  <!--  -->
  <meta name="Author" content=""/>
  <meta name="Date" content=""/>
  <meta name="Description" content=""/>
  <meta name="Support" content=""/>
  <!--  -->
  <bean:define id="vxmlsetId" name="standardRefillActionForm" property="vxmlsetId"/>
  <bean:define id="vxmlComplianceLevel " name="standardRefillActionForm" property="vxmlComplianceLevel"/>
  <%-- US-273 Starts Here --%>
  <bean:define id="OptionalPromptSetId" name="standardRefillActionForm" property="promptSetId" />
  <bean:define id="OptionalConfigurationId" name="standardRefillActionForm" property="configurationId" />
  <bean:define id="OptionalParametersString" name="standardRefillActionForm" property="optionalParametersString" />
  <%-- US-273 Ends Here --%>  
    <jsp:scriptlet>      
      response.setContentType("text/xml;charset=UTF-8");
      response.setHeader("Cache-Control","max-age=31536000");
	// TR-HJ63025-Start 
    	int i=0;
	// TR-HJ63025-End
      String baseDirectory="/vxmlFiles/com/ericsson/charging/vxmlivr/"+ vxmlsetId +"/modules/standardrefill/";
      String pathSeparator= "/";
      String vxmlFileSuffix=".vxml.part";
      String vxmlPath=baseDirectory;
      String baseJspDirectory="/jspFiles/com/ericsson/charging/vxmlivr/modules/standardrefill/";
	  String jspFileSuffix=".jsp";
	  String jspPartPath=baseJspDirectory+ vxmlComplianceLevel + "/";
      String jspPartFileSuffix=".jsp.part";
	  String announcementJspPath="/jspFiles/com/ericsson/charging/vxmlivr/modules/standardrefill/";
    </jsp:scriptlet>      
  <bean:define id="refillOptionEnable" name="standardRefillActionForm" property="refillOptionEnable" type="java.lang.Boolean"/>
  <bean:define id="optionCancelDigit" name="standardRefillActionForm" property="optionCancelDigit" type="java.lang.String"/>
  <bean:define id="optionEndDigit" name="standardRefillActionForm" property="optionEndDigit" type="java.lang.String"/>
  <bean:define id="optionConfirmationRequired" name="standardRefillActionForm" property="optionConfirmationRequired" type="java.lang.Boolean"/>
  <bean:define id="optionNoInputTimeout" name="standardRefillActionForm" property="optionNoInputTimeout" type="java.lang.String"/>
  <bean:define id="optionMaxRetries" name="standardRefillActionForm" property="optionMaxRetries" type="java.lang.Integer"/>
  <bean:define id="optionMaxTimeoutRetries" name="standardRefillActionForm" property="optionMaxTimeoutRetries" type="java.lang.Integer"/>
  <bean:define id="optionMaxInvalidRetries" name="standardRefillActionForm" property="optionMaxInvalidRetries" type="java.lang.Integer"/>
  <bean:define id="optionListSize" name="standardRefillActionForm" property="optionListSize" type="java.lang.Integer"/>
  <bean:define id="enableMultipartVoucherNumberEntry" name="standardRefillActionForm" property="enableMultipartVoucherNumberEntry" type="java.lang.Boolean"/>
  <bean:define id="segmentConfirmationMode" name="standardRefillActionForm" property="segmentConfirmationMode" type="java.lang.Integer"/>
  <bean:define id="maxRefillSegmentInvalidRetries" name="standardRefillActionForm" property="maxRefillSegmentInvalidRetries" type="java.lang.Integer"/>
  <bean:define id="maxRefillSegmentTimeoutRetries" name="standardRefillActionForm" property="maxRefillSegmentTimeoutRetries" type="java.lang.Integer"/>
  <bean:define id="refillType" name="standardRefillActionForm" property="refillType" type="java.lang.Integer"/>
  <bean:define id="refillRepromptDtmf" name="standardRefillActionForm" property="refillRepromptDtmf" type="java.lang.String"/>
  <bean:define id="refillRepromptNegateDtmf" name="standardRefillActionForm" property="refillRepromptNegateDtmf" type="java.lang.String"/>
  <bean:define id="maxReRefillsAllowed" name="standardRefillActionForm" property="maxReRefillsAllowed" type="java.lang.Integer"/>
  <bean:define id="confirmationMode" name="standardRefillActionForm" property="confirmationMode" type="java.lang.Integer"/>
  <bean:define id="stdAnnouncements" name="standardRefillActionForm" property="announcementForms" type="java.util.List"/>
  <bean:define id="vVAnnouncementForms" name="standardRefillActionForm" property="valueVoucherAnnouncementForms" type="java.util.List"/>
  <bean:define id="daAnnnouncementOrder" name="standardRefillActionForm" property="daAnnnouncementOrder" type="java.lang.String"/>
  <bean:define id="premiumAnnouncements" name="standardRefillActionForm" property="superRefillAnnouncementForms" type="java.util.List"/>
  <bean:define id="fastRefillEnabled" name="standardRefillActionForm" property="fastRefillEnabled" type="java.lang.Boolean"/>
  <bean:define id="moduleWiseStatisticsLoggingEnable" name="standardRefillActionForm" property="moduleWiseStatisticsLoggingEnable" type="java.lang.Boolean"/>
	<bean:define id="refillInfoInStatisticsLogLicenseFlag" name="standardRefillActionForm" property="refillInfoInStatisticsLogLicenseFlag" type="java.lang.Boolean"/>

  <%-- PC SBM 028 Starts--%>
  <bean:define id="maintenancePeriodStr" name="standardRefillActionForm" property="maintenancePeriodStr" type="java.lang.String"/>
  <%-- PC SBM 028 Ends--%>
  <bean:define id="refillRepromptEnabled" name="standardRefillActionForm" property="refillRepromptEnabled" type="java.lang.String"/>
  <bean:define id="refillRepromptDtmf" name="standardRefillActionForm" property="refillRepromptDtmf" type="java.lang.String"/>
  <bean:define id="refillRepromptNegateDtmf" name="standardRefillActionForm" property="refillRepromptNegateDtmf" type="java.lang.String"/>
  <bean:define id="maxReRefillsAllowed" name="standardRefillActionForm" property="maxReRefillsAllowed" type="java.lang.Integer"/>
  <%-- Starts : US 1522 - PMR826  --%>
  <bean:define id="mainBalanceAccountType" name="standardRefillActionForm" property="mainBalanceAccountType" type="java.lang.String"/>
  <bean:define id="referenceDAForMasterBalance" name="standardRefillActionForm" property="referenceDAForMasterBalance" type="java.lang.Integer"/>
  <bean:define id="mainBalAcctTypeRefill" name="standardRefillActionForm" property="mainBalAcctTypeRefill" type="java.lang.String"/>
  <%-- Ends : US 1522 - PMR826  --%>
  <!--  -->
  <property name="documentfetchhint" value="prefetch"/>
  <property name="documentmaxage" value="31536000"/>
  <property name="audiomaxage" value="31536000"/>
  <property name="grammarmaxage" value="31536000"/>
  <property name="scriptmaxage" value="31536000"/>
  <property name="interdigittimeout" value="<bean:write name='standardRefillActionForm' property='interdigitTimeout'/>"/> 
  <property name="timeout" value="<bean:write name='standardRefillActionForm' property='firstDigitTimeout'/>"/>
  
    <%-- For PC Cable and Wireless Starts here--%>
    <bean:define id="daList" name="standardRefillActionForm" property="DAList" type="java.lang.String"/>
	<bean:define id="includeMasterBalanceFlag" name="standardRefillActionForm" property="includeMasterBalanceFlag" type="java.lang.Boolean"/>
    <%-- For PC Cable and Wireless Ends Here--%>

<%
    int presentationIdFlag = 1;
	if (request.getParameter("presentationId") == null) {
		presentationIdFlag = 0;
	}

%>	
  <!--  -->
  <!-- Scritps -->
  <script src="/VXMLIVR/ECMAScripts/com/ericsson/charging/vxmlivr/core/common/scripts/UtilityScripts.es?versionId=<%=request.getParameter("versionId")%>" maxage="31536000" fetchhint="prefetch"/>
  <script src="/VXMLIVR/ECMAScripts/com/ericsson/charging/vxmlivr/modules/standardrefill/StandardRefillScripts.es?versionId=<%=request.getParameter("versionId")%>" maxage="31536000" fetchhint="prefetch"/>
  <script maxage="31536000" fetchhint="prefetch">
     <ivr:include page='<%=vxmlPath + "StandardRefillScripts" + vxmlFileSuffix %>'/>
  </script>
  <!-- End Scripts -->
  <!--  The variables being used for Balance Enquiry  -->
   <var name="balanceDetailsAvailable" expr="'false'"/>
   <var name="balanceEnquiry_masterAccountBalanceInFirstCurrency" expr="''"/>
   <var name="balanceEnquiry_absAccountBalanceInFirstCurrency" expr="''"/>  
   <var name="balanceEnquiry_firstCurrencyName" expr="''"/> 
   <var name="balanceEnquiry_masterAccountBalanceInSecondCurrency" expr="''"/>
   <var name="balanceEnquiry_absAccountBalanceInSecondCurrency" expr="''"/>
   <var name="balanceEnquiry_secondCurrencyName" expr="''"/>
   <var name="balanceEnquiry_serviceFeeExpiryDate" expr="''"/>
   <var name="balanceEnquiry_servExpDateVsTodayDate" expr="''"/>
   <var name="balanceEnquiry_supervisionFeeExpiryDate" expr="''"/>
   <var name="balanceEnquiry_supervExpDateVsTodayDate" expr="''"/>
   <var name="balanceEnquiry_supervExpDateVsServExpDate" expr="''"/>
   <var name="balanceEnquiry_creditClearanceDate" expr="''"/>
   <var name="balanceEnquiry_creditClearanceDateVsTodayDate" expr="''"/>
   <var name="balanceEnquiry_exitStatus" expr="''"/>
   <var name="balanceEnquiry_daDetails" expr="''"/>
   <%-- PMR 39 for balance enquiry --%>
    <var name="bal_enq_originTransactionID" expr="''"/>
    <var name="bal_enq_currentLanguageID" expr="''"/>
    <var name="bal_enq_temporaryBlockedFlag" expr="''"/>
	<var name="bal_enq_cost1" expr="''"/>
	<var name="bal_enq_cost2" expr="''"/>
	<var name="bal_enq_chargingResultCode" expr="''"/>
	<var name="bal_enq_reservationCorrelationID" expr="''"/>
	<var name="chargingType" expr="''"/>
    <var name="locationNumber" expr="''"/>
    <var name="reservationCorrelationID" expr="''"/>
	<var name="minThresholdBalAmount" expr="''"/>
	<var name="chargingIndicator" expr="''"/>
     <%-- PMR 39 ends for balance enquiry --%>
  <!--  -->
  <!--  The variables being used for Standard Refill  -->
  <var name="masterAccountBalanceInFirstCurrency" expr="''"/>
  <var name="absAccountBalanceInFirstCurrency" expr="''"/>
  <var name="masterAccountBalanceInSecondCurrency" expr="''"/>
  <var name="absAccountBalanceInSecondCurrency" expr="''"/>
  <var name="serviceFeeExpiryDate" expr="''"/>
  <var name="servExpDateVsTodayDate" expr="''"/>
  <var name="supervisionFeeExpiryDate" expr="''"/>
  <var name="supervExpDateVsTodayDate" expr="''"/>
  <var name="supervExpDateVsServExpDate" expr="''"/>
  <var name="firstCurrencyName" expr="''"/>
  <var name="secondCurrencyName" expr="''"/>
  <var name="rechargeAmountPromoTotal1" expr="''"/>
  <var name="rechargeAmountPromoTotal1abs" expr="''"/>
  <var name="rechargeAmountPromoTotal2" expr="''"/>
  <var name="rechargeAmountPromoTotal2abs" expr="''"/>
  <var name="rechargeAmountMainTotal1" expr="''"/>
  <var name="rechargeAmountMainTotal1abs" expr="''"/>
  <var name="rechargeAmountMainTotal2" expr="''"/>
  <var name="rechargeAmountMainTotal2abs" expr="''"/>
  <var name="supervisionDaysPromoExt" expr=""/>
  <var name="serviceFeeDaysPromoExt" expr=""/>
  <%-- PC = STC-V001 Starts Here --%>
  <var name="supervisionDaysTotalExt" expr=""/>
  <var name="serviceFeeDaysTotalExt" expr=""/>

  <%-- PC = STC-V001 Ends Here --%>
  <var name="promotionAnnCode" expr=""/>
  <var name="PromotionsFlag" expr="'false'"/>
  <var name="dedicatedAccountInfo" expr="''"/>
  
  <%-- PMR 39 starts --%>
  <var name="requestedInformationFlags" expr="'10'"/>
       <!-- Variables to hold GetAccountDetails response -->
  <var name="sub_details_responseCode" expr="''"/>
  <var name="sub_details_originTransactionID" expr="''"/>
  <var name="sub_details_firstIVRFlag" expr="''"/>
  <var name="sub_details_serviceClassOriginal" expr="''"/>
  <var name="sub_details_serviceClassTemporaryExpiryDate" expr="''"/>
  <var name="sub_details_ussdEndOfCallNotificationID" expr="''"/>
  <var name="sub_details_accountGroupID" expr="''"/>
  <var name="sub_details_serviceOfferingIDList" expr="''"/>
  <var name="sub_details_accountActivatedFlag" expr="''"/>
  <var name="sub_details_activationDate" expr="''"/>
  <var name="sub_details_accountFlags" expr="''"/>
  <var name="sub_details_masterSubscriberFlag" expr="''"/>
  <var name="sub_details_masterAccountNumber" expr="''"/>
  <var name="sub_details_refillUnbarDateTime" expr="''"/>
  <var name="sub_details_promAnnouncementCode" expr="''"/>
  <var name="sub_details_promotionPlanId" expr="''"/>
  <var name="sub_details_promotionStartDate" expr="''"/>
  <var name="sub_details_promotionEndDate" expr="''"/>
  <var name="sub_details_serviceFeePeriod" expr="''"/>
  <var name="sub_details_supervisionPeriod" expr="''"/>
  <var name="sub_details_serviceRemovalPeriod" expr="''"/>
  <var name="sub_details_creditClearancePeriod" expr="''"/>
  <var name="sub_details_accountHomeRegion" expr="''"/>
  <var name="sub_details_pinCode" expr="''"/>
  <var name="sub_details_currentLanguage" expr="''"/>
  <var name="sub_details_communityInformationCurrent" expr="''"/>

       <!-- End of Variables to hold GetAccountDetails response -->
  <var name="refill_response_segmentationID" expr="''"/>
  <var name="refill_response_transactionAmountConverted" expr="''"/>
  <var name="refill_response_transactionAmount" expr="''"/>
  <var name="refill_response_transactionCurrency" expr="''"/>
  <var name="refill_response_voucherAgent" expr="''"/>
  <var name="refill_response_promotionAnnouncementCode" expr="''"/>
  <var name="refill_response_languageIDCurrent" expr="''"/>
  <var name="refill_response_masterAccountNumber" expr="''"/>
  <var name="refill_response_originOperatorID" expr="''"/>
	   <!-- Variables for Refill request -->
  <var name="originOperatorID" expr="''"/>
  <var name="externalData1" expr="''"/>
  <var name="externalData2" expr="''"/>
  <var name="externalData3" expr="''"/>
  <var name="externalData4" expr="''"/>
  <var name="transactionType" expr="''"/>
  <var name="transactionCode" expr="''"/>
  <var name="requestRefillAccountBeforeFlag" expr="''"/>
  <var name="requestRefillAccountAfterFlag" expr="''"/>
  <var name="requestRefillDetailsFlag" expr="''"/>
  <var name="refillProfileID" expr="''"/>
  <var name="transactionCurrency" expr="''"/>
  <var name="transactionAmount" expr="''"/>
	   <!-- Variables  for Refill request  -->
	   <!-- Variables for Account Before Refill optional parameters -->
  <var name="abrServiceClassTemporaryExpiryDate" expr="''"/>
  <var name="abrServiceClassOriginal" expr="''"/>
  <var name="abrServiceClassCurrent" expr="''"/>
  <var name="abrActivationStatusFlag" expr="''"/>
  <var name="abrNegativeBarringStatusFlag" expr="''"/>
  <var name="abrSupervisionPeriodWarningActiveFlag" expr="''"/>
  <var name="abrServiceFeePeriodWarningActiveFlag" expr="''"/>
  <var name="abrSupervisionPeriodExpiryFlag" expr="''"/>
  <var name="abrServiceFeePeriodExpiryFlag" expr="''"/>
  <var name="abrUsageAccumulatorInformation" expr="''"/>
  <var name="abrServiceOfferings" expr="''"/>
  <var name="abrCommunityIdList" expr="''"/>
  <var name="abrAccountValue1" expr="''"/>
  <var name="abrAccountValue2" expr="''"/>
	   <!-- End of Variables for Account Before Refill optional parameters -->

	   	   <!-- Variables for Account After Refill optional parameters -->
  <var name="aarServiceClassTemporaryExpiryDate" expr="''"/>
  <var name="aarServiceClassOriginal" expr="''"/>
  <var name="aarServiceClassCurrent" expr="''"/>
  <var name="aarActivationStatusFlag" expr="''"/>
  <var name="aarNegativeBarringStatusFlag" expr="''"/>
  <var name="aarSupervisionPeriodWarningActiveFlag" expr="''"/>
  <var name="aarServiceFeePeriodWarningActiveFlag" expr="''"/>
  <var name="aarSupervisionPeriodExpiryFlag" expr="''"/>
  <var name="aarServiceFeePeriodExpiryFlag" expr="''"/>
  <var name="aarUsageAccumulatorInformation" expr="''"/>
  <var name="aarServiceOfferings" expr="''"/>
  <var name="aarCommunityIdList" expr="''"/>
  <var name="aarServiceFeeExpiryDate" expr="''"/>
  <var name="aarSupervisionExpiryDate" expr="''"/>
	   <!-- End of Variables for Account After Refill optional parameters -->
		<!-- Variables for Refill Information optional parameters -->
   <var name="refInfServiceClassCurrent" expr="''"/>
   <var name="refInfServiceClassTemporaryExpiryDate" expr="''"/>
	  <var name="refInfPromotionPlanProgressedFlag" expr="''"/>
	  <var name="refInfSupervisionDaysSurplus" expr="''"/>
	  <var name="refInfServiceFeeDaysSurplus" expr="''"/>
	  <var name="refInfPromotionRefillAccumulatedValue1" expr="''"/>
	  <var name="refInfPromotionRefillAccumulatedValue2" expr="''"/>
	  <var name="refInfPromotionRefillCounter" expr="''"/>
	  <var name="refInfProgressionRefillValue1" expr="''"/>
	  <var name="refInfProgressionRefillValue2" expr="''"/>
	  <var name="refInfProgressionRefillCounter" expr="''"/>
	  <var name="refInfTotalUsageAccumulatorInformation" expr="''"/>
	  <var name="refInfPromUsageAccumulatorInformation" expr="''"/>
		  <!-- End of Variables for Refill Information optional parameters -->
  <%-- PMR 39 ends --%>
  
  <!-- ocmp3.4 compliance start-->
  <var name="dedicatedAnnouncementOrder" expr="''"/>
  <var name="missmatchPromptId" expr="''"/>
  <var name="locationNumber" expr="0"/>
  <var name="locationNumberNAI" expr="0"/>
  <!-- ocmp3.4 compliance end-->
  <%-- TR-HJ53027-Start --%>
  <var name="creditClearanceDate" expr="''"/>
  <var name="creditClearanceDateVsTodayDate" expr="''"/>
  <var name="serviceRemovalDate" expr="''"/>
  <var name="serviceRemovalDateVsTodayDate" expr="''"/>
  <var name="creditClearanceDateAnnFlag" expr="'false'"/>
  <var name="serviceRemovalDateAnnFlag" expr="'false'"/>
  
  <%-- TR-HJ53027-End --%>
  <!--  -->
  <!--  To be read from application context  -->
  <var name="presentationId" expr="application.presentationId"/>
  <var name="dateFormat" expr="application.dateFormat"/>
  <var name="currencyFormat" expr="application.defaultCurrencyFormat"/>
  <var name="subscriberLanguage" expr="application.subscriberLanguage"/>
  <var name="voiceBaseLang" expr="application.voiceBaseLanguage"/>
  <var name="callingNumber" expr="application.callingNumber"/>
  <var name="currentModule" expr="application.currentModule"/>
  <var name="debug" expr="application.debug"/>
  <var name="daDetails" expr="''"/>
  <var name="callType" expr="application.callType"/>
  <var name="versionId" expr="application.versionId"/>
  <var name="vxmlsetId" expr="'<%= vxmlsetId%>'"/>
  <%-- US-273 Starts Here --%>
  <var name="promptsetId" expr="'<%=OptionalPromptSetId%>'"/>
  <var name="OptionalParametersString" expr="'<%=OptionalParametersString %>'"/>
  <%-- US-273 Ends Here --%>
  <var name="gender" expr="application.gender"/>
  <%-- TR No. - HL18437 Starts Here --%>
  <var name="speaker" expr="promptsetId"/>
  <%-- TR No. - HL18437 Ends Here --%>
  <var name="subscriberNAI" expr="application.subscriberNAI"/>
  <var name="maxNumberOfTimeout" expr="application.noOfTimeouts"/>
  <var name="maxNumberOfInvalidEntry" expr="application.invalidEntryRetries"/>
  <var name="voiceBaseURL" expr="application.voiceBaseURL"/>
  <var name="SubscriberTypeFlag" expr="application.SubscriberTypeFlag"/> 
  <var name="playRechargeAmount" expr="application.playRechargeAmount"/>
  <%-- US-273 Starts Here --%>
  <var name="configurationId" expr="'<%=OptionalConfigurationId%>'"/>
  <%-- US-273 Ends Here --%>
   <%-- TR-HK52079 -Start --%> 
  <var name="enableStatisticsLoggingGlobal" expr="application.enableStatisticsLoggingGlobal"/>
  <%-- TR-HK52079 -End --%>
  <var name="lifeTimeValidDate" expr="application.lifeTimeValidDate"/>
  
  <!--  -->
  <var name="standardRefillHelperVxml" expr="'../VXMLIVR/StandardRefillPlayBalanceVXML.do?versionId='+versionId+'&amp;debug='+debug+OptionalParametersString"/>
  <!--  -->
  <!--  To be read from configuration  -->
  <var name="confirmationMode" expr="'<bean:write name='standardRefillActionForm' format='0' property='confirmationMode'/>'"/>
  <var name="allowedRefillRetry" expr="<bean:write name='standardRefillActionForm' format='0' property='allowedRefillRetry'/>"/>
  <var name="numberOfConfirmation" expr="<bean:write name='standardRefillActionForm' format='0' property='numberOfConfirmation'/>"/>
  <var name="balancePlayBack" expr="<bean:write name='standardRefillActionForm' format='0' property='balancePlayBack'/>"/>
  <var name="voucherReadOutFormat" expr="'<bean:write name='standardRefillActionForm' property='voucherReadOutFormat'/>'"/>
  <var name="daAnnnouncementOrder" expr="'<bean:write name='standardRefillActionForm' property='daAnnnouncementOrder'/>'"/>
  <%--HMTL-077: Support for MultiPart Voucher Entry BEGINS--%>
  <var name="constantVoucherLengthList" expr="'<bean:write name='standardRefillActionForm' property='activationCodeLengthsList'/>'"/>
  <%-- voucherLengthList gets updated at runtime--%> 
  <var name="voucherLengthList" expr="constantVoucherLengthList"/>
  <%-- Flag to Enable User Confirmation After Each Voucher Number Segment is Inputted--%>
  <var name="segmentConfirmationMode" expr="'<%=segmentConfirmationMode%>'"/>
  <var name="enableMultiPartVoucherEntry" expr="'<%=enableMultipartVoucherNumberEntry%>'"/> 
  <var name="maxNumberOfInvalidSegmentEntry" expr="<%=maxRefillSegmentInvalidRetries%>"/>
  <var name="maxNumberOfSegmentEntryTimeout" expr="<%=maxRefillSegmentTimeoutRetries%>"/>
  
  <var name="segmentInputTimeoutCount" expr="0"/>
  <var name="segmentInputInvalidRetryCount" expr="0"/>
  <var name="segmentConfirmationLoopCount" expr="0"/>
  <var name="segmentPlayBackTimeoutCount" expr="0"/>
  <var name="segmentPlayBackInvalidRetryCount" expr="0"/>
  <%-- HMTL-077 ENDS--%>
  <%--  Starts : US 1522 - PMR826   --%>
  <var name="mainBalanceAccountType" expr="'<%=mainBalanceAccountType%>'"/>
  <var name="mainBalAcctTypeRefill" expr="'<%=mainBalAcctTypeRefill%>'"/>
  <var name="referenceDAForMasterBalance" expr="'<%=referenceDAForMasterBalance%>'"/>
  <var name="currencyForPercentage" expr="''"/>
  <var name="referenceDA1" expr="''"/>
  <var name="referenceDA2" expr="''"/>
  <%--  Ends : US 1522 - PMR826   --%>
  <%--  PC HP-ETI V006 Starts Here  --%>
  <var name="fastRefillEnabled" expr="'<bean:write name='standardRefillActionForm' property='fastRefillEnabled'/>'"/>
  <%--  PC HP-ETI V006 Ends Here  --%>
  <%-- TR-HJ94298-Start --%>
  <var name="maxRefillInvalidRetries" expr="'<bean:write name='standardRefillActionForm' property='maxRefillInvalidRetries'/>'"/>
  <var name="maxRefillTimeoutRetries" expr="'<bean:write name='standardRefillActionForm' property='maxRefillTimeoutRetries'/>'"/>
  <%-- TR-HJ94298-End --%>
  
  <%--BSNL 005 START --%>
  <var name="refillOptionEnable" expr="<%=refillOptionEnable%>"/>
  <var name="availableRefillOption" expr=""/>
  <var name="availableRefillOptionSize" expr="0"/>
  <var name="optionPromptIndex" expr="0"/>
  <var name="optionPrompt" expr="''"/>
  <var name="indexPlayCounter" expr="0"/>
  <var name="indexPlayStart" expr="0"/>
  <var name="optionConfirmationRequired" expr="'<%=optionConfirmationRequired%>'"/>
  <var name="optionNoInputTimeout" expr="'<%=optionNoInputTimeout%>'"/>
  <var name="optionMaxRetries" expr="'<%=optionMaxRetries%>'"/>
  <var name="optionMaxTimeoutRetries" expr="'<%=optionMaxTimeoutRetries%>'"/>
  <var name="optionMaxInvalidRetries" expr="'<%=optionMaxInvalidRetries%>'"/>
  <var name="optionCancelDigit" expr="'<%=optionCancelDigit%>'"/>
  <var name="optionEndDigit" expr="'<%=optionEndDigit%>'"/>
  <var name="SelectedOptionDtmf" expr="0"/>
  <var name="serviceClassCurrent" expr="application.serviceClass"/>
  <var name="optionListSize" expr="'<%=optionListSize%>'"/>
  <%-- PMR 39 starts --%>
  <var name="refillOptionResponseServiceClassCurrent" expr="''"/>
  <%-- PMR 39 Ends --%>
  <var name="DigitOFF" expr="'OFF'"/> 
  <var name="cancelDigitEnabled" expr="'true'"/>
  <var name="endDigitEnabled" expr="'true'"/>
  <var name = "listenAgainDTMF" expr = "'2'"/>
  <var name="retryCounter" expr="0"/>
  <var name="selectedOptionPrompt" expr="''"/>
  <var name="selectedOption" expr="''"/>
  <var name="SHORT_SILENCE_MSG" expr="'SHORT_SILENCE_MSG'"/> 
  <!--  -->
  <!-- counters -->
<var name="optionCounterTimeout" expr="0"/>  
<var name="optionInvalidEntryCounter" expr="0"/>  
<var name="optionConfirmationLoopCount" expr="0"/>  
<var name="optionConfirmationcounterTimeout" expr="0"/>  
<var name="optionConfirmationInvalidEntryCounter" expr="0"/>  
<var name ="announcementRepetitionTimes" expr="-1"/>
<var name ="maxAnnouncementRepetitionTimes" expr="0"/>
   <%--  BSNL 005 END--%>
  <!--  -->
  <!--  To be used at run time  -->
  <var name="temporaryBlockedFlag" expr="''"/>
  <var name="errorFormId" expr="''"/>
  <var name="nextFormId" expr="''"/>
  <var name="exitStatus" expr="'SUCCESS'"/>
  <var name="successCode" expr="0"/>
  <%--TR-HI56483-Start  --%>
  <var name="backendResponseCode" expr="-1"/>
  <%--TR-HI56483-End  --%>
  <var name="failureRetryCode" expr="1"/>
  <var name="failureCode" expr="2"/>
  <var name="retryCount" expr="0"/>
  <var name="timeoutCount" expr="0"/>
  <var name="reenterTimeoutCount" expr="0"/>
  <var name="playbackTimeoutCount" expr="0"/>
  <var name="invalidEntryCount" expr="0"/>
  <var name="playbackInvalidEntryCount" expr="0"/>
  <var name="reenterInvalidEntryCount" expr="0"/>
  <var name="confirmationLoopCount" expr="0"/>
  <var name="expiryDatePlayed" expr="'false'"/>
  <var name="promptId" expr=""/>
  <var name="status" expr="''"/>
  <var name="voucherNumber" expr="''"/>
 <%--  PC HP-ETI V006 Starts Here  --%>
  <var name="fastRefillVoucherNumber" expr="application.calledString"/> 
  <%--  PC HP-ETI V006 Ends Here  --%>
  <var name="enteredVoucherNumber" expr="''"/>
  <var name="reenterVoucherNumber" expr="''"/>
  <var name="reEnteredVoucherNumber" expr="''"/>
  <var name="newVoucherReadoutFormat" expr="''"/>
  <var name="playVoucherSubdialogName" expr="'playStringOfDigits'"/>
  <var name="voucherLengthValidFlag" expr="'false'"/>
  <var name="voucherLength" expr=""/>
  <var name="callTypeDirect" expr="0"/>
  <var name="refillBarredTrue" expr="'1'"/>
  <var name="NO_DEBUG_LEVEL" expr="0"/>
  <!--  -->
  <var name="responseCode_OtherError" expr="100"/>
  <var name="responseCode_SystemUnavailable" expr="125"/>
  <var name="responseCode_SubscriberNotFound" expr="102"/>
  <!--  -->
  <!-- Variable Added for Super Value Voucher-->
  <var name="newServiceClass"/>
  <var name="newServiceClassPrompt"/>
  <var name="newOriginalServiceClass"/>
  <var name="newOriginalServiceClassPrompt"/>
  <var name="serviceClassChangedFlag" expr="'N'"/>
  <var name="newExpiryDurationExt"/>
  <var name="newExpiryDate"/>
  <var name="playDuration" expr="'vb'"/>
  <var name="formatDuration" expr="'d'"/>
  <var name="playDateSubdialogName" expr="'playDate'"/>
  <var name="playExpiry" expr="'Y'"/>
  <var name="playExpiryDurationExt" expr="'N'"/>
  <var name="playVoucherSuccessMessage" expr="'Y'"/>
  <var name="returnVoucherType" expr="'STDVOUCHER'"/>
  <var name="voucherType" expr="application.voucherType"/>
  <var name="accessTypeInternal" expr="0"/>
  <var name="accessTypeExternal" expr="1"/>
  <var name="superValueVoucherFlag" expr="'<bean:write name='standardRefillActionForm' property='superValueVoucherActive'/>'"/>
  <var name="forcedNoMatch" expr="false"/>
  <var name="cancelDigitDTMF" expr="'*'"/>
  <var name="endDigitDTMF" expr="'#'"/>
  <%-- HI-BHA-GAPS Starts --%>
  <!-- Variable Added for Playing Value Voucher Details in Configurable Order-->
  <var name="valueVoucherNewExpiryDate" expr="''"/>
  <var name="ValueVoucherExpiryDurationExt" expr="''"/>
  <var name="playValueVoucherExpiryDate" expr="false"/>
  <var name="playValueVoucherDaysExtension" expr="false"/>  
  <var name="playValueVoucherDetails" expr="true"/>  
  <var name="playValueVoucherDetailsOrderConfigured" expr="false"/>
  <%-- HI-BHA-GAPS Ends --%>

<%-- PC HP-ETI V006 Starts Here --%>
<var name = "noretryFastRefillInvalidVoucherLength" expr ="'true'"/>
<%-- PC HP-ETI V006 Starts Here --%>

  <%--HP-CELTELD-V001 STARTS--%>
  <%--TR-HJ63956-Start--%>
  <%--The default value of playRefillFraudCount should be false and for a specific requirement it should be made true in StandardRefillVariables--%>
  <var name="playRefillFraudCount" expr="'<bean:write name='standardRefillActionForm' property='playFraudCount'/>'"/>
  <%--TR-HJ63956-End--%>
  <var name="refillFraudCount" expr="''"/>
  <var name="returnToMainMenuFlag" expr="'true'"/>
 
  <%--HP-CELT-V001 ENDS--%>

  <%--HP-SING-V003 STARTS--%> 
      
  <var name="voucherEntryCompleted" expr="false"/>
  <var name="voucherEntryPartWiseEnabled" expr="false"/>
  <var name="enableStatisticsLogging" expr="'<%= moduleWiseStatisticsLoggingEnable%>'"/>
  
  <%--HP-SING-V003 ENDS--%> 
   <var name="preRefillFraudAnnFlag" expr="false"/>
  <!--  -->
  <!-- Customer Editable Variables  -->
  <var name="DASelectionList" expr="'10'"/>
  <%--  HP-BHA-V001  --%>
  <var name="back2MainMenuDTMF" expr="'*'"/>
  
  <var name="abRefillSupervisionExpiryDate" expr="''"/>
  <var name="abRefillServiceFeeExpiryDate" expr="''"/>
  <var name="abRServExpDateVsTodayDate" expr="''"/>
  <var name="abRSupervExpDateVsTodayDate" expr="''"/>
  <var name="abRefillCreditClearanceDate" expr="''"/>
  <var name="abRefillserviceRemovalDate" expr="''"/>
  <var name="abRCreditClearanceDateVsTodayDate" expr="''"/>
  <var name="abRservRemovalDateVsTodayDate" expr="''"/>
  <var name="refillOptionAllowed" expr="false"/>
  <var name="reservationCorrelationID" expr="-1"/>  
  <var name="partNumber" expr="0"/>
  <var name="previousPartEntered" expr="''"/>
  <var name="previousPartEnteredLength" expr="0"/>
  <var name="hasNextAvailableFlag" expr="false"/>
  <%-- TR HK26916  --%>
  <var name="bothServAndSupervDatesConfigured" expr="false"/>
  <%-- PC = HP-MTNU-V003 Starts Here --%>
  <var name="serviceClassStandardRefill" expr="-1"/>
  <var name="serviceClassPromptStandardRefill" expr="''"/>
  <%-- PC = HP-MTNU-V003 Ends Here --%>
  <%-- Added for Soap Refill Support  --%>
  <var name="subResponseCode" expr="''"/>
  <%-- HP-TURK-V001  --%>
  <%-- HP-UNIA-V001  --%>
  <var name="voucherGroup" expr=""/>
  <var name="dedicatedAccountInfoAfterRefill" expr=""/>  
  <%-- HP-UNIA-V001  --%>
  <%-- AirIp 4.0 Offer Supprt Start --%>
  <var name="offerInfoListNew" expr=""/>
  <var name="offerInfoListModified" expr=""/>
  <%-- AirIp 4.0 Offer Supprt End --%>
  
  <var name="SubcriberInfoFlag" expr="'true'"/>
  <%-- Handling for EcmaScript call :FC 154 VXML Compliance Starts.--%>
  <%-- Make the VoiceBaseInterface file selection dynamic based upon the compliance. --%>
  <var name="vxmlComplianceLevel" expr="'<%=vxmlComplianceLevel%>'"/>
  <var name="voiceBaseInterfaceVxml" expr="'/VXMLIVR/vxmlFiles/com/ericsson/charging/vxmlivr/core/languagehandling/VoiceBaseInterface_'+vxmlComplianceLevel+'.vxml'"/>
  <%-- Handling for EcmaScript call :FC 154 VXML Compliance Ends--%>
  <%--TR HL45459 Start --%>
  <var name="promotionsDedicatedAccount" expr="'NULL'"/>
  <var name="rechargeDAPromoTotal1" expr="''"/> 
  <var name="rechargeDAPromoTotal2" expr="''"/>  
  <var name="rechargeDAPromoTotal2abs" expr="''"/>
  <var name="rechargeDAPromoTotal1abs" expr="''"/>
  <var name="rechargeMainAmountPromoTotal1" expr="''"/>
  <var name="rechargeMainAmountPromoTotal1abs" expr="''"/>
  <var name="rechargeMainAmountPromoTotal2" expr="''"/>
  <var name="rechargeMainAmountPromoTotal2abs" expr="''"/>
  <%--TR HL45459 End --%>
  
  <%--PC- eti-071 Start --%>
  <var name="voucherRefillAttempts" expr="0"/>
  <var name="numEntryTimeoutRetriesCounter" expr="0"/>
  <var name="numEntryInvalidRetriesCounter" expr="0"/>
  <var name="timeoutPrompt" expr="'STANDARDREFILL_GET_SUBSCRIBER_CHOICE_TIMEOUT_MSG'"/>
  <var name="invalidEntryPrompt" expr="'STANDARDREFILL_GET_SUBSCRIBER_CHOICE_INVALID_ENTRY_MSG'"/>
  <var name="refillRepromptEnabled" expr="'<%=refillRepromptEnabled%>'"/>
  <var name="refillRepromptDtmf" expr="'<%=refillRepromptDtmf%>'"/>
  <var name="refillRepromptNegateDtmf" expr="'<%=refillRepromptNegateDtmf%>'"/>
  <var name="maxReRefillsAllowed" expr="<%=maxReRefillsAllowed%>"/>
  <var name="refillRetriesExceedPromptId" expr="''"/>
  <var name="msisdnFormat" expr="'NULL'"/>  	
  <var name="repromptFlag" expr="false"/>
  <%--PC- eti-071 End --%>
  <var name="playBalanceOfAccount" expr="'<%=MicroflowConstants.PLAY_FORM_PREFIX%>playAccountBalance'"/>
  <var name="playBalanceOfAccount_refill" expr="'<%=MicroflowConstants.PLAY_FORM_PREFIX%>playAccountBalance_refill'"/>  
  <var name="play_SupervisionFeeExpiryDate" expr="'<%=MicroflowConstants.PLAY_FORM_PREFIX%>playSupervisionFeeExpiryDate'"/>
  <var name="play_ServiceFeeExpiryDate" expr="'<%=MicroflowConstants.PLAY_FORM_PREFIX%>playServiceFeeExpiryDate'"/>
  <var name="play_SameServiceAndSupervisionExpiryDates" expr="'<%=MicroflowConstants.PLAY_FORM_PREFIX%>playSameServiceAndSupervisionExpiryDates'"/>
  <var name="play_CreditClearanceDate" expr="'<%=MicroflowConstants.PLAY_FORM_PREFIX%>playCreditClearanceDate'"/>
  <var name="play_ServiceRemovalDate" expr="'<%=MicroflowConstants.PLAY_FORM_PREFIX%>playServiceRemovalDate'"/>
  <var name="play_RechargeBonus" expr="'<%=MicroflowConstants.PLAY_FORM_PREFIX%>playRechargeBonus'"/>
  <var name="play_RefillAmount" expr="'<%=MicroflowConstants.PLAY_FORM_PREFIX%>playRefillAmount'"/>
  <var name="play_ServiceFeeExtentensionMsg" expr="'<%=MicroflowConstants.PLAY_FORM_PREFIX%>playServiceFeeExtentensionMsg'"/>
  <var name="play_SupervisionFeeExtentensionMsg" expr="'<%=MicroflowConstants.PLAY_FORM_PREFIX%>playSupervisionFeeExtentensionMsg'"/>
  <var name="play_ServiceFeeDaysTotalExtentensionMsg" expr="'<%=MicroflowConstants.PLAY_FORM_PREFIX%>playServiceFeeDaysTotalExtentensionMsg'"/>
  <var name="play_ServiceClass" expr="'<%=MicroflowConstants.PLAY_FORM_PREFIX%>playServiceClass'"/>
  <var name="play_SupervisionDaysTotalExtentensionMsg" expr="'<%=MicroflowConstants.PLAY_FORM_PREFIX%>playSupervisionDaysTotalExtentensionMsg'"/>
  <var name="play_RefillFraudCount" expr="'<%=MicroflowConstants.PLAY_FORM_PREFIX%>playRefillFraudCount'"/>
  <var name="play_playMsisdn" expr="'<%=MicroflowConstants.PLAY_FORM_PREFIX%>MsisdnPlay'"/>
  
    

  <%-- HP-TURK-V006  --%>
  <var name="thirdPartyFailurePlayed" expr="0"/>
  <%-- Saving ThirdPartyNumber(B Number) in thirdPartyNumber--%>
  <var name="thirdPartyNumber" expr="application.thirdPartyNumber"/>
  <%-- HP-TURK-V006  --%>
  
  <var name="responseCode"/>
  
  <%-- AirSpecs 4.1 --%>
  <var name="cellGlobalID" expr="-1"/>
  <var name="validateSubscriberLocation" expr="-1"/>
  <%-- AirSpecs 4.1 --%>
  <%-- PC: UNIA 034 : Custom Refill Type Support--%>
  <var name="refillType" expr="<%=refillType%>"/>
  <%-- UNIA 034 Ends--%>
     <%-- For PC Cable and Wireless Starts here--%>
	<var name="daList" expr="'<%=daList%>'"/>
	<var name="includeMasterBalanceFlag" expr="'<%=includeMasterBalanceFlag%>'"/>	
	<var name="play_TotalBalance" expr="'playTotalBalance'"/>
	<var name="playTotalBalanceInFirstCurrency" expr="'false'"/>
	<var name="playTotalBalanceInSecondCurrency" expr="'false'"/>	
	<var name="playDASuccessIntro" expr="'false'"/>
	<var name="totalBalanceAnnouncement" expr="'Total Balance'"/>
	<var name="masterBalanceAnnouncement" expr="'Master Balance'"/>
 <%-- Added for Turk V-006 uplift--%>
	<var name="playNumberFlag" expr="false"/>
	<%-- For CWP EP Starts --%>
	<var name="NULL_STRING" expr="'NULL'"/>
  <var name="daTotalBalanceCurrency1" expr="NULL_STRING"/>
  <var name="daTotalBalanceCurrency2" expr="NULL_STRING"/>
  <var name="daTotalBalanceAbsCurrency1" expr="NULL_STRING"/>
  <var name="daTotalBalanceAbsCurrency2" expr="NULL_STRING"/>  
  <%-- For CWP EP Ends --%>


  <%-- For PC Cable and Wireless Ends Here--%>
  <%-- PC : SBM 028 Starts : Support for Non Availability of Refill Service during Maintenance Period--%>
  <var name="maintenancePeriodStr" expr="'<%=maintenancePeriodStr%>'"/>
  <%-- PC : SBM 028 Ends --%>
  
  <%-- For PC TURK-267 Starts Here--%>
	<var name="refillAmount1" expr="'NULL'"/>
	<var name="refillAmount2" expr="'NULL'"/>
	<var name="currency1Flag" expr="'false'"/>
	<var name="currency2Flag" expr="'false'"/>
  <%-- For PC TURK-267 Ends Here--%>

  <var name="refillInfoInStatisticsLogLicenseFlag" expr="'<%=refillInfoInStatisticsLogLicenseFlag%>'"/>
  
  <ivr:include page='<%=vxmlPath + "StandardRefillVariables" + vxmlFileSuffix%>'/>
  <!--  -->
  <!--  -->
  
  <form id="<%=MicroflowConstants.GENERAL_FORM_PREFIX%>premiumRefillCheck" scope="document"> 
    <block>
	  <%-- PC: UNIA 034 : Custom Refill Type Support--%>
	  <if cond="debug &gt; NO_DEBUG_LEVEL">
		<log label="StandardVoucherRefillJSP"> RefillType = <value expr="refillType"/>  </log>
	  </if>
	  <%-- UNIA 034 Ends--%>
     <if cond="application.voucherType=='SUPERREFILL' &amp;&amp; superValueVoucherFlag != 'true' ">
       <ivr:include page='<%=vxmlPath + "SuperValueDisabled" + vxmlFileSuffix%>'/>
       <assign name="status" expr="'FAILURE_SUPER_REFILL_NOTACTIVE'"/>
       <goto next="#<%=MicroflowConstants.GENERAL_FORM_PREFIX%>exitModule"/>
     <else/>
       <goto next="#subsInfo"/>
     </if>    
    </block>  
  </form>
  
   <!--  Form Names restored to previous one  -->
  <form id="premiumRefillCheck">
    <block name="block_premiumRefillCheck">
      <goto next="#<%=MicroflowConstants.GENERAL_FORM_PREFIX%>premiumRefillCheck"/>
    </block>
  </form>
  <!--  -->
  <!--  -->
  <!-- For Getting subscriber info and playing balance -->
  <form id="subsInfo" scope="document">  
   <var name="playInitialBalance" expr="'true'"/>  
    <!-- For Direct Dial when subscriber barred -->
    <block name="directDialAndRefillBarred" cond="application.callType==callTypeDirect &amp;&amp; application.subscriberBarredForRefillFlag==refillBarredTrue">
      <goto next="#<%=MicroflowConstants.ERROR_FORM_PREFIX%>refillBarred"/>
    </block>
	
	<block name="block_DataPreGetAccountDetails">
		<%-- Added for giving option of stopping A number validation --%>
		<ivr:include page='<%=vxmlPath + "DataPreGetAccountDetails" + vxmlFileSuffix%>'/>
	</block>

    <!--  -->
    <!--  Subdialog to fetch subscriber info -->
    <ivr:include page="<%=jspPartPath + "GetAccountDetails" + jspPartFileSuffix%>"/>
    <!--  -->
    <block name="dataBlock_subsDetails">
        <assign name="responseCode" expr="subsDetails.responseCode"/>
        <if cond="responseCode=='success'">
          <assign name="masterAccountBalanceInFirstCurrency" expr="subsDetails.accountValue1"/>
          <assign name="absAccountBalanceInFirstCurrency" expr="subsDetails.accountValue1abs"/>
          <assign name="firstCurrencyName" expr="subsDetails.currency1"/>
          <assign name="masterAccountBalanceInSecondCurrency" expr="subsDetails.accountValue2"/>
          <assign name="absAccountBalanceInSecondCurrency" expr="subsDetails.accountValue2abs"/>
          <assign name="secondCurrencyName" expr="subsDetails.currency2"/>
          <%-- TR-HI56490-Start --%>
          <assign name="application.temporaryBlockedFlag" expr="subsDetails.temporaryBlockedFlag"/>
          <assign name="application.accountValue1" expr="subsDetails.accountValue1"/>
          <assign name="application.accountValue2" expr="subsDetails.accountValue2"/>
          <assign name="application.creditClearanceDate" expr="subsDetails.creditClearanceDate"/>
          <assign name="application.serviceRemovalDate" expr="subsDetails.serviceRemovalDate"/>
          <assign name="application.serviceExpiryDate" expr="subsDetails.serviceFeeExpiryDate"/>
          <assign name="application.airtimeExpiryDate" expr="subsDetails.supervisionFeeExpiryDate"/>
          <assign name="application.currency1" expr="subsDetails.currency1"/>
          <assign name="application.currency2" expr="subsDetails.currency2"/>
          <assign name="application.serviceClassChangeUnbarDate" expr="subsDetails.serviceClassChangeUnbarDate"/>
          <assign name="application.serviceClass" expr="subsDetails.serviceClass"/>
          <assign name="application.serviceClassPrompt" expr="subsDetails.serviceClassPrompt"/>
          <assign name="application.currentDate" expr="subsDetails.currentDate"/>
          <%-- TR-HI56490-End --%>
        <else/>
          <assign name="nextFormId" expr="subsDetails.nextFormId"/>
        </if>
          <ivr:log label="StandardVoucherRefillJSP">
			  ||  application.temporaryBlockedFlag = <value expr="application.temporaryBlockedFlag"/>
			  ||  application.accountValue1 = <value expr="application.accountValue1"/>
			  ||  application.accountValue2 = <value expr="application.accountValue2"/>
			  ||  application.serviceExpiryDate = <value expr="application.serviceExpiryDate"/>
			  ||  application.airtimeExpiryDate = <value expr="application.airtimeExpiryDate"/>
			  ||  application.creditClearanceDate = <value expr="application.creditClearanceDate"/>
			  ||  application.serviceRemovalDate = <value expr="application.serviceRemovalDate"/>
			  ||  application.currency1 = <value expr="application.currency1"/>
			  ||  application.currency2 = <value expr="application.currency2"/>
			  ||  application.serviceClassChangeUnbarDate = <value expr="application.serviceClassChangeUnbarDate"/>
			  ||  application.serviceClass = <value expr="application.serviceClass"/>
			  ||  application.serviceClassPrompt = <value expr="application.serviceClassPrompt"/>
			  ||  application.currentDate = <value expr="application.currentDate"/>
		  <%-- HP-TURK-V006  --%>
			  ||  thirdPartyNumber = <value expr="thirdPartyNumber"/>
		  </ivr:log>
		  <%-- HP-TURK-V006  --%>
		<ivr:include page='<%=vxmlPath + "DataPostGetAccountDetails" + vxmlFileSuffix%>'/>
        <if cond="responseCode!='success'">
          <goto expr="nextFormId"/>
		</if>
    </block>
    <!--  -->
   
    <block name="initialPlayBalanceCheck">
    	<!-- Check for Not Playing  Initial Balance for Value Voucher -->
	  	<ivr:include page='<%=vxmlPath + "PlayInitialBalanceCheck" + vxmlFileSuffix%>'/>
      	<if cond="playInitialBalance=='false'">
	        <goto next="#<%=MicroflowConstants.GENERAL_FORM_PREFIX%>standard_refill_main"/>
    	</if>
        <!-- Play Initial Balance Message-->    
        <ivr:include page='<%=vxmlPath + "InitialPlayBalance" + vxmlFileSuffix%>'/>
    </block>
    <!--  -->
    <!--  Playing the Account Balance in First Currency  -->
    <subdialog name="<%=MicroflowConstants.SUBDIALOG_PLAY_HELPER_CALL_PREFIX%>sub_MasterAccountBalanceInFirstCurrency" srcexpr="standardRefillHelperVxml + '#' + playBalanceOfAccount" cond="firstCurrencyName != 'NULL' &amp;&amp; masterAccountBalanceInFirstCurrency != 'NULL'">
      <param name="amount" expr="masterAccountBalanceInFirstCurrency"/>
      <param name="absAmount" expr="absAccountBalanceInFirstCurrency"/>
      <param name="currency" expr="firstCurrencyName"/>
      <param name="currencyFormat" expr="currencyFormat"/>
      <param name="subscriberLanguage" expr="subscriberLanguage"/>
      <param name="voiceBaseLanguage" expr="voiceBaseLang"/>
      <param name="promptsetId" expr="promptsetId"/>
      <param name="versionId" expr="versionId"/>
      <param name="speaker" expr="speaker"/>
      <param name="gender" expr="gender"/>
      <param name="voiceBaseURL" expr="voiceBaseURL"/>
      <%-- Handling for EcmaScript call :FC 154--%>
      <param name="voiceBaseInterfaceVxml" expr="voiceBaseInterfaceVxml"/>
    </subdialog>
    <!--  -->
    <!--  Playing the Account Balance in Second Currency  -->
    <subdialog name="<%=MicroflowConstants.SUBDIALOG_PLAY_HELPER_CALL_PREFIX%>sub_MasterAccountBalanceInSecondCurrency" srcexpr="standardRefillHelperVxml + '#' + playBalanceOfAccount" cond="secondCurrencyName != 'NULL' &amp;&amp; masterAccountBalanceInSecondCurrency != 'NULL'">
      <param name="amount" expr="masterAccountBalanceInSecondCurrency"/>
      <param name="absAmount" expr="absAccountBalanceInSecondCurrency"/>
      <param name="currency" expr="secondCurrencyName"/>
      <param name="currencyFormat" expr="currencyFormat"/>
      <param name="subscriberLanguage" expr="subscriberLanguage"/>
      <param name="voiceBaseLanguage" expr="voiceBaseLang"/>
      <param name="promptsetId" expr="promptsetId"/>
      <param name="versionId" expr="versionId"/>
      <param name="speaker" expr="speaker"/>
      <param name="gender" expr="gender"/>
      <param name="voiceBaseURL" expr="voiceBaseURL"/>
      <%-- Handling for EcmaScript call :FC 154--%>
      <param name="voiceBaseInterfaceVxml" expr="voiceBaseInterfaceVxml"/>
    </subdialog>
    <!--  -->
    <block>
      <goto next="#<%=MicroflowConstants.GENERAL_FORM_PREFIX%>standard_refill_main"/>
    </block>
  </form>
  <!--  -->
  <!-- form to play voucher prompt -->
  <!--  -->
  <!--  Form Names restored to previous one  -->
  <form id="standard_refill_main">
    <block name="block_standard_refill_main">
      <goto next="#<%=MicroflowConstants.GENERAL_FORM_PREFIX%>standard_refill_main"/>
    </block>
  </form>
  <!--  -->
  <form id="<%=MicroflowConstants.GENERAL_FORM_PREFIX%>standard_refill_main" scope="document">
    <%--  PC HP-ETI V006 Starts Here  --%>
    <block>
	    <if cond=" debug &gt; NO_DEBUG_LEVEL">
	    <log label="StandardVoucherRefillJSP">voucherRefillAttempts = <value expr="voucherRefillAttempts"/></log>
        <log label="StandardVoucherRefillJSP">FastRefillEnabled :<value expr ="fastRefillEnabled"/></log>
      </if>
	  
	  <%-- HMTL-077 BEGINS--%>
	  <!-- Refresh these variables easch time the form is executed-->
	  <assign name="voucherLengthList" expr="constantVoucherLengthList"/>
	  <assign name="voucherNumber" expr="''"/>
	  <assign name="segmentInputTimeoutCount" expr="0"/>
	  <assign name="segmentInputInvalidRetryCount" expr="0"/>
	  <%-- HMTL-077 ENDS--%>
    </block>
	
    <block name="block_fastRefill" cond = "fastRefillEnabled == 'true'">
    	<ivr:log label="StandardVoucherRefillJSP">
		  ||  	fastRefillVoucherNumber :<value expr ="fastRefillVoucherNumber"/>
		  ||  	voucherLengthList :<value expr ="voucherLengthList"/>
		  ||  	calledString :<value expr ="application.calledString"/>
		</ivr:log>

	  <if cond = "fastRefillVoucherNumber.length &lt; 1">
		<goto nextitem="block_voucherNumber"/>
	  </if>

      <if cond = "fastRefillVoucherNumber != undefined &amp;&amp; fastRefillVoucherNumber != 'NULL' &amp;&amp; validateVoucherNumber(fastRefillVoucherNumber,voucherLengthList) == 'true' ">
			<assign name="voucherNumber" expr="fastRefillVoucherNumber"/>
			<goto next="#<%=MicroflowConstants.GENERAL_FORM_PREFIX%>perform_refill"/>
	  <else/>
	   <ivr:include page='<%=vxmlPath + "FastRefillVoucherLengthInvalid" + vxmlFileSuffix%>'/>
	   <assign name="invalidEntryCount" expr="invalidEntryCount + 1"/>
	   <if cond="noretryFastRefillInvalidVoucherLength == 'true'">
		  <assign name="status" expr="'FAILURE'"/>
		  <goto next="#<%=MicroflowConstants.GENERAL_FORM_PREFIX%>exitModule"/>
		</if>
	  </if>
    </block>
<%--  PC HP-ETI V006 Ends Here  --%>

    <block name="block_voucherNumber">
       <assign name="promptId" expr="'REF_FILLER_PROMPT_MSG'"/>
      <if cond="retryCount &gt; allowedRefillRetry">
        <goto next="#<%=MicroflowConstants.ERROR_FORM_PREFIX%>retry_count_exceed"/> 
      </if>
      <!--  -->
      <logic:equal value="0" name="standardRefillActionForm" property="endDigit">
        <prompt bargein="false" >
          <audio expr="returnAudioPath(promptsetId, subscriberLanguage, promptId, versionId, debug)"/>
        </prompt>
      </logic:equal>
      <!--  -->
      <logic:equal value="0" name="standardRefillActionForm" property="endDigit">
        <logic:equal value="0" name="standardRefillActionForm" property="cancelDigit">
			<if cond="enableMultiPartVoucherEntry=='false'">
			  <if cond="hasNextAvailableFlag == false ">
			    <ivr:include page='<%=vxmlPath + "GetVoucherWithoutHashAndCancelDigit" + vxmlFileSuffix%>'/>
			  <else/>
				<ivr:include page='<%=vxmlPath + "GetVoucherRemainningWithoutHashAndCancelDigit" + vxmlFileSuffix%>'/>
			  </if>
			<else />
				<assign name="promptId" expr="'REF_VOUCHER_SEGMENT_ENTER_WOHASH_WOCANCEL_MSG'"/>
			</if>  
        </logic:equal>
      </logic:equal>
      <!--  -->
      <logic:equal value="0" name="standardRefillActionForm" property="endDigit">
        <logic:equal value="1" name="standardRefillActionForm" property="cancelDigit">
		  <if cond="enableMultiPartVoucherEntry=='false'">
			  <if cond="hasNextAvailableFlag == false">
			  <ivr:include page='<%=vxmlPath + "GetVoucherWithoutHashWithCancelDigit" + vxmlFileSuffix%>'/>
			  <else/>
			   <ivr:include page='<%=vxmlPath + "GetVoucherRemainningWithoutHashWithCancelDigit" + vxmlFileSuffix%>'/>
			  </if>
		  <else/>	
			  <assign name="promptId" expr="'REF_VOUCHER_SEGMENT_ENTER_WOHASH_WCANCEL_MSG'"/>
		  </if>		
        </logic:equal>
      </logic:equal>
      <!--  -->
      <logic:equal value="1" name="standardRefillActionForm" property="endDigit">
        <logic:equal value="1" name="standardRefillActionForm" property="cancelDigit">
		  <if cond="enableMultiPartVoucherEntry=='false'">
			  <if cond="hasNextAvailableFlag == false">
			  <ivr:include page='<%=vxmlPath + "GetVoucherWithHashAndCancelDigit" + vxmlFileSuffix%>'/>
			  <else/>
				<ivr:include page='<%=vxmlPath + "GetVoucherRemainningWithHashAndCancelDigit" + vxmlFileSuffix%>'/>
			  </if>
		  <else/>	
			  <assign name="promptId" expr="'REF_VOUCHER_SEGMENT_ENTER_WHASH_WCANCEL_MSG'"/>
		  </if>		  
        </logic:equal>
      </logic:equal>
      <!--  -->
      <logic:equal value="1" name="standardRefillActionForm" property="endDigit">
        <logic:equal value="0" name="standardRefillActionForm" property="cancelDigit">
		  <if cond="enableMultiPartVoucherEntry=='false'">
			  <if cond="hasNextAvailableFlag == false">
			  <ivr:include page='<%=vxmlPath + "GetVoucherWithHashWithoutCancelDigit" + vxmlFileSuffix%>'/>
			  <else/>
			   <ivr:include page='<%=vxmlPath + "GetVoucherRemainningWithHashWithoutCancelDigit" + vxmlFileSuffix%>'/>
			  </if>
		  <else/>	
			  <assign name="promptId" expr="'REF_VOUCHER_SEGMENT_ENTER_WHASH_WOCANCEL_MSG'"/>
		  </if>		  
        </logic:equal>
      </logic:equal>
      <!--  -->
	  <%-- HMTL BEGINS--%>
	  <if cond="enableMultiPartVoucherEntry=='true'">
	    <assign name="promptId" expr="promptId+'_'+(partNumber+1)"/>
	    <audio expr="returnAudioPath(promptsetId, subscriberLanguage, promptId, versionId, debug)"/>
		<ivr:include page='<%=vxmlPath + "GetNextVoucherSegment" + vxmlFileSuffix%>'/>
	  </if>
	  <%-- HMTL ENDS--%>
        <ivr:log label="StandardVoucherRefillJSP">
		  ||  	Get Voucher Number
		  ||  	VoucherEntryPartWiseEnabled :<value expr ="voucherEntryPartWiseEnabled"/>
		  ||  	VoucherType :<value expr ="voucherType"/>
		</ivr:log>
    </block>
    <!--  -->
    <!-- getting voucher number -->
    <field name="field_voucherNumber">
      <grammar version="1.0" src='<%= "/VXMLIVR/standardRefillGrammar.do?versionId="+request.getParameter("versionId")+"&amp;debug="+request.getParameter("debug")+"&amp;presentationId="+request.getParameter("presentationId")+OptionalParametersString%>' mode="dtmf"/>
      <filled>
        <ivr:log label="StandardVoucherRefillJSP">
		  ||  	Entered Voucher Number : <value expr="field_voucherNumber"/>
		  ||  	Valid Voucher voucherLengthList : <value expr="voucherLengthList"/>
		</ivr:log>
        <!-- remove the empty spaces -->
        <assign name="enteredVoucherNumber" expr="removeSpaces(field_voucherNumber)"/>
        <assign name="voucherNumber" expr="enteredVoucherNumber"/>
		
        <if cond=" debug &gt; NO_DEBUG_LEVEL">
          <log label="StandardVoucherRefillJSP">Voucher Number After Removing Spaces : <value expr="voucherNumber"/></log>
        </if>
        <!--  -->
        <logic:equal value="1" name="standardRefillActionForm" property="cancelDigit">
          <if cond="containDigit(voucherNumber, cancelDigitDTMF) == cancelDigitDTMF">
            <assign name="forcedNoMatch" expr="true"/>
            <if cond=" debug &gt; NO_DEBUG_LEVEL">
              <log label="StandardVoucherRefillJSP">Cancel Digit Enabled: <value expr="cancelDigitDTMF"/> so reprompt</log>
            </if>
            <throw event="nomatch"/>
          </if>
        </logic:equal>
        
        <%--HP-CELTELD-V001 STARTS--%>
        <if cond="returnToMainMenuFlag == 'true'">
        <if cond="containDigit(voucherNumber, back2MainMenuDTMF) == back2MainMenuDTMF">
         <throw event="returnToMainMenu"/>
        </if>
        </if>
        <%--HP-CELTELD-V001 ENDS--%>
        
        <logic:notEqual value="1" name="standardRefillActionForm" property="cancelDigit">
          <if cond="containDigit(voucherNumber, cancelDigitDTMF) == cancelDigitDTMF">
            <if cond=" debug &gt; NO_DEBUG_LEVEL">
              <log label="StandardVoucherRefillJSP">Cancel Digit not enabled: <value expr="cancelDigitDTMF"/> so no match</log>
            </if>
            <throw event="nomatch"/>
          </if>
        </logic:notEqual>
        <!--  -->
        <logic:equal value="1" name="standardRefillActionForm" property="endDigit">
          <if cond="containDigit(voucherNumber, endDigitDTMF) != endDigitDTMF">
            <throw event="nomatch"/>
          </if>
          <assign name="voucherNumber" expr="stripEndCharacter(voucherNumber)"/>
          <if cond=" debug &gt; NO_DEBUG_LEVEL">
            <log label="StandardVoucherRefillJSP">Voucher Number After Stripping End Character : <value expr="voucherNumber"/></log>
          </if>
        </logic:equal>
        <logic:notEqual value="1" name="standardRefillActionForm" property="endDigit">
          <if cond="containDigit(voucherNumber, endDigitDTMF) == endDigitDTMF">
            <throw event="nomatch"/>
          </if>
        </logic:notEqual>
        <!--  -->
        <!--  -->
        <%--HP-SING-V003 STARTS--%> 
        <assign name="voucherLength" expr="findLength(voucherNumber)"/>	
        <assign name="voucherLengthValidFlag" expr="searchPartInList(voucherLength, voucherLengthList ,partNumber, previousPartEnteredLength)"/>
		<ivr:log label="StandardVoucherRefillJSP">
				voucherLength : <value expr="voucherLength"/>
		  ||  	voucherLengthValidFlag : <value expr="voucherLengthValidFlag"/>
		</ivr:log>
        <if cond="voucherLengthValidFlag == 'false'">
          <throw event="nomatch"/>
		<else/>  
		  <%--HMTL-077: Support for MultiPart Voucher Entry BEGINS--%>
		  <%-- Reassign segment invalid input counters to start afresh for new segment . Should  not be updated if nomatch is thrown--%>
          <assign name="segmentInputTimeoutCount" expr="0"/>
          <assign name="segmentInputInvalidRetryCount" expr="0"/>
		  <%--HMTL-077 ENDS--%>
        </if>
        <!--  -->
        <ivr:include page='<%=vxmlPath  + "VouncherNumberEntrySuccess" + vxmlFileSuffix%>'/>
        <!--  -->
		<%-- HMTL-077  : Code from this location was migrated to new block for PC --%>
       <%--HP-SING-V003 ENDS--%>
      </filled>
      <!--  -->
      <error>
        <assign name="status" expr="'FAILURE'"/>
        <goto next="#<%=MicroflowConstants.ERROR_FORM_PREFIX%>system_unavailable"/>
      </error>
      <!--  -->
      <%--HP-CELTEL-V001 STARTS--%>
      <catch event="returnToMainMenu">
        <assign name="status" expr="'RETURN_MAINMENU'"/>
        <goto next="#<%=MicroflowConstants.GENERAL_FORM_PREFIX%>exitModule"/>     
      </catch>
      <%--HP-CELTEL-V001 ENDS--%>      
      <noinput>
	    <%--HMTL-077: Support for MultiPart Voucher Entry BEGINS--%>
		<if cond="maxNumberOfSegmentEntryTimeout !==0 &amp;&amp; enableMultiPartVoucherEntry=='true'">
		  <if cond="segmentInputTimeoutCount &lt; maxNumberOfSegmentEntryTimeout">
		    <assign name="segmentInputTimeoutCount" expr="segmentInputTimeoutCount + 1"/>
		    <assign name="promptId" expr="'REF_VOUCHER_SEGMENT_ENTER_TIMEOUT_MSG'"/>
            <audio expr="returnAudioPath(promptsetId, subscriberLanguage, promptId, versionId, debug)"/>
            <ivr:include page='<%=vxmlPath  + "VoucherSegmentEnterTimeout" + vxmlFileSuffix%>'></ivr:include>
            <clear namelist="block_voucherNumber field_voucherNumber"/>
		  </if>	
		</if>	
        <!-- Complete Voucher number is requested only when timeout on individual segment is activated-->
		<if cond="block_voucherNumber!= undefined">
			<if cond="timeoutCount &lt; maxRefillTimeoutRetries">
			  <assign name="timeoutCount" expr="timeoutCount + 1"/>
			  <!-- Reassign segment Entry Retry counter to start afresh-->
			  <assign name="segmentInputTimeoutCount" expr="0"/>
			  <ivr:include page='<%=vxmlPath  + "VoucherEnterTimeout" + vxmlFileSuffix%>'></ivr:include>
			  <if cond="maxNumberOfSegmentEntryTimeout !==0 &amp;&amp; enableMultiPartVoucherEntry=='true'">
				<!--  Re-assigning these variables so as to start afresh from the first voucher part wise.-->
				<assign name="hasNextAvailableFlag" expr="false"/>
				<assign name="previousPartEntered" expr="''"/>   
				<assign name="previousPartEnteredLength" expr="0"/> 
				<assign name="partNumber" expr="0"/>
				<assign name="voucherLengthList" expr="constantVoucherLengthList"/>
				<assign name="voucherNumber" expr="''"/>
				<clear namelist="block_voucherNumber field_voucherNumber"/>
			  <else/>
				<clear namelist="block_voucherNumber"/>
			  </if>	
			<elseif cond="timeoutCount == maxRefillTimeoutRetries"/>
			  <goto next="#<%=MicroflowConstants.ERROR_FORM_PREFIX%>retry_count_exceed_timeout"/>
			</if>
		</if>	
		<%-- HMTL-077 ENDS--%>
      </noinput>
      <!--  -->
      <nomatch>
	
		<if cond="field_voucherNumber != undefined">
		  <!-- remove the empty spaces -->
		  <assign name="voucherNumber" expr="removeSpaces(voucherNumber)"/>
		  <assign name="voucherLength" expr="findLength(voucherNumber)"/>
		</if>
		<ivr:log label="StandardVoucherRefillJSP">
				Voucher Length is = <value expr="voucherLength"/>
		  ||  	Entered Voucher Number is = <value expr="voucherNumber"/>
		</ivr:log>
		<if cond="voucherNumber == back2MainMenuDTMF">
		  <assign name="status" expr="'RETURN_MAINMENU'"/>
		  <goto next="#<%=MicroflowConstants.GENERAL_FORM_PREFIX%>exitModule"/>
		</if> 
		<!--  -->
		<%--HMTL-077: Support for MultiPart Voucher Entry BEGINS--%>
		<if cond="maxNumberOfInvalidSegmentEntry !=0 &amp;&amp; enableMultiPartVoucherEntry=='true'">
		  <if cond="segmentInputInvalidRetryCount &lt; maxNumberOfInvalidSegmentEntry">
			<assign name="segmentInputInvalidRetryCount" expr="segmentInputInvalidRetryCount + 1"/>
			<assign name="promptId" expr="'REF_VOUCHER_SEGMENT_ENTER_INVALID_ENTRY_MSG'"/>
			<audio expr="returnAudioPath(promptsetId, subscriberLanguage, promptId, versionId, debug)"/>
			<ivr:include page='<%=vxmlPath  + "VoucherSegmentEnterNoMatch" + vxmlFileSuffix%>'></ivr:include>
			<clear namelist="block_voucherNumber field_voucherNumber"/>
		  </if>		
		</if>	
		<%-- HMTL-077 ENDS--%>

		
		<%-- HP-HJ94298: Condition changed. Now invalid count being compared to maxRefillInvalidRetries for voucher number --%>
		<if cond="block_voucherNumber!=undefined">
			<if cond="invalidEntryCount &lt; maxRefillInvalidRetries ">
			  <assign name="invalidEntryCount" expr="invalidEntryCount + 1"/>
			  <%--HMTL-077: Support for MultiPart Voucher Entry BEGINS--%>
			  <assign name="segmentInputInvalidRetryCount" expr="0"/>
			  <%-- HMTL-077 ENDS--%>
			  <if cond="forcedNoMatch == false">
				<if cond="voucherLength != undefined">
				  <if cond="voucherLength &lt; minInList(voucherLengthList)">
					<ivr:include page='<%=vxmlPath + "VoucherEnterNoMatchLessDigits" + vxmlFileSuffix%>'/>
				  <elseif cond="voucherLength &gt; maxInList(voucherLengthList)"/>
					<ivr:include page='<%=vxmlPath + "VoucherEnterNoMatchMoreDigits" + vxmlFileSuffix%>'/>
				  <else/>
					<ivr:include page='<%=vxmlPath + "VoucherEnterNoMatch" + vxmlFileSuffix%>'/>
				  </if>
				<else/>
				  <ivr:include page='<%=vxmlPath + "VoucherEnterNoMatch" + vxmlFileSuffix%>'/>
				</if>
			  <else/>
				<assign name="forcedNoMatch" expr="false"/>
			  </if>
			  <!--  -->
			  <%--  To Fix:HK50682 Start  --%>
			  <%--  Re-assigning these variables so as to start afresh from the first voucher part wise.--%>
			  <assign name="hasNextAvailableFlag" expr="false"/>
			  <assign name="previousPartEntered" expr="''"/>   
			  <assign name="previousPartEnteredLength" expr="0"/> 
			  <assign name="partNumber" expr="0"/>
			  <%-- HMTL-077 BEGINS--%>
			  <assign name="voucherLengthList" expr="constantVoucherLengthList"/>
			  <assign name="voucherNumber" expr="''"/>
			  <%-- HMTL-077 ENDS--%>
			  <%--  To Fix:HK50682 End  --%>
			  <!--  -->
				<ivr:log label="StandardVoucherRefillJSP">
						Invalid Entry Count is = <value expr="invalidEntryCount"/>
				  ||  	Going to Take Voucher Number Again
				</ivr:log>
			  <%--  To Fix:HJ69233 Start  --%>
			  <%-- removed variables (enteredVoucherNumber voucherNumber voucherLength) --%>
			  <clear namelist="block_voucherNumber field_voucherNumber"/>
			  <%--  To Fix:HJ69233 End  --%>
			<elseif cond="invalidEntryCount == maxRefillInvalidRetries"/>
				<if cond="enableStatisticsLoggingGlobal == 'true' &amp;&amp; enableStatisticsLogging == 'true' &amp;&amp; voucherType != 'SUPERREFILL'">
					<var name="dummy_statType" />
					<if cond="voucherType == 'VALUEVOUCHERREFILL'">
						<assign name="dummy_statType" expr="setStatType('InvalidValVoucherLength')"/>
					<else/>
						<assign name="dummy_statType" expr="setStatType('InvalidRefillVoucherLength')"/>
					</if>
					<var name="dummy_voucherNumber" expr="setVoucherNumber(voucherNumber)"/>
					<var name="dummy_statusCode" expr="setStatusCode('')"/>   	
				</if>
				<ivr:log label="StandardVoucherRefillJSP">
				  ||  	Invalid Entry Count is = <value expr="invalidEntryCount"/>
				  ||  	Max Number Invalid Entry Retry is = <value expr="maxRefillInvalidRetries"/>
				</ivr:log>
			  <goto next="#<%=MicroflowConstants.ERROR_FORM_PREFIX%>retry_count_exceed_invalidEntry"/>
			</if>
		</if>
      </nomatch>
    </field>
    <%-- end getting voucher number --%>
	<%--HMTL-077: Support for MultiPart Voucher Entry BEGINS--%>	 
	<%-- Voucher Segment Playback Block --%>
<%-- HMTL 077 selectively generate block for block_voucherSegmentPlayback starts --%>	
<%
	if (((segmentConfirmationMode == 1) && enableMultipartVoucherNumberEntry) || presentationIdFlag == 0) {
%>	        	
	
	<block name="block_voucherSegmentPlayback" cond="segmentConfirmationMode=='1' &amp;&amp; enableMultiPartVoucherEntry=='true'">
      <assign name="newVoucherReadoutFormat" expr="prepareReadoutFormat(voucherNumber,voucherReadOutFormat)"/>
      <assign name="promptId" expr="'REF_VOUCHER_SEGMENT_PLAYBACK_MSG'"/>
	  <!-- Disable bargein to support no end Digit  -->
      <logic:equal value="0" name="standardRefillActionForm" property="endDigit">        
        <prompt bargein="false" >
          <audio expr="returnAudioPath(promptsetId, subscriberLanguage, promptId, versionId, debug)"/>
        </prompt>
      </logic:equal>
      <!--  -->
      <logic:equal value="1" name="standardRefillActionForm" property="endDigit">
        <audio expr="returnAudioPath(promptsetId, subscriberLanguage, promptId, versionId, debug)"/>
      </logic:equal>
	  <ivr:include page='<%=vxmlPath  + "VoucherSegmentPlayBack" + vxmlFileSuffix%>'/>
    </block>
    <!--Play the Voucher Number Segment -->
    <subdialog name="<%=MicroflowConstants.SUBDIALOG_VB_CALL_PREFIX%>sub_VoucherNumberSegment" srcexpr="voiceBaseInterfaceVxml + '?versionId='+versionId + '#' + playVoucherSubdialogName" cond="segmentConfirmationMode=='1' &amp;&amp; enableMultiPartVoucherEntry=='true'">
      <param name="arg" expr="voucherNumber"/>
      <param name="format" expr="newVoucherReadoutFormat"/>
      <param name="lang" expr="application.voiceBaseLanguage"/>
      <param name="speaker" expr="speaker"/>
      <param name="gender" expr="application.gender"/>
      <param name="voiceBaseURL" expr="voiceBaseURL"/>
      <param name="debug" expr="application.debug"></param>
      <param name="versionId" expr="application.versionId"></param>
	  <param name="ivrlanguage" expr="application.subscriberLanguage"></param>
    </subdialog>
	<!--Voucher Segment Confirmation Input  Field-->
    <field name="choice" cond="segmentConfirmationMode=='1' &amp;&amp; enableMultiPartVoucherEntry=='true'">
      <prompt>
        <audio expr="returnAudioPath(application.promptsetId,application.subscriberLanguage, 'REF_VOUCHER_SEGMENT_CONFIRM_MSG', versionId, debug)"/>
      </prompt>
      <grammar version="1.0" src='<%= "/VXMLIVR/grammarFiles/local/Confirmation.grxml"+"?versionId="+request.getParameter("versionId") %>' mode="dtmf"/>
      <!--  -->
      <filled>
        <if cond=" debug &gt; NO_DEBUG_LEVEL">
          <log label="StandardVoucherRefillJSP">DTMF used for Confirmation = <value expr="choice"/></log>
        </if>
        <if cond="choice == confirmDTMF">
          <goto nextitem="block_validVoucherNumberSegment"/>
        <elseif cond="choice == negateDTMF"/>
          <if cond="segmentConfirmationLoopCount &lt; numberOfConfirmation">
			<assign name="segmentConfirmationLoopCount" expr="segmentConfirmationLoopCount + 1"/>
            <clear namelist="block_voucherNumber field_voucherNumber  block_voucherSegmentPlayback <%=MicroflowConstants.SUBDIALOG_VB_CALL_PREFIX%>sub_VoucherNumberSegment choice"/>
          <else/>
            <goto next="#<%=MicroflowConstants.ERROR_FORM_PREFIX%>retry_count_exceed"/>
          </if>
		<elseif cond="choice == back2MainMenuDTMF"/>
		  <assign name="status" expr="'RETURN_MAINMENU'"/>
		  <goto next="#<%=MicroflowConstants.GENERAL_FORM_PREFIX%>exitModule"/>
        <else/>
             <throw event="nomatch"/>
        </if>
      </filled>
      <!--  -->
      <error>
        <assign name="status" expr="'FAILURE'"/>
        <goto next="#<%=MicroflowConstants.ERROR_FORM_PREFIX%>system_unavailable"/>
      </error>
      <!--  -->
      <noinput>
        <if cond="segmentPlayBackTimeoutCount &lt; maxNumberOfTimeout">
		  <assign name="segmentPlayBackTimeoutCount" expr="segmentPlayBackTimeoutCount + 1"/>
		  <assign name="promptId" expr="'REF_VOUCHER_SEGMENT_CONFIRM_TIMEOUT_MSG'"/>
          <audio expr="returnAudioPath(promptsetId, subscriberLanguage, promptId, versionId, debug)"/>
          <ivr:include page='<%=vxmlPath  + "VoucherSegmentPlayBackTimeout" + vxmlFileSuffix%>'/>
		  <%-- TR:HM66692 Starts  --%>
          <clear namelist="choice block_voucherSegmentPlayback <%=MicroflowConstants.SUBDIALOG_VB_CALL_PREFIX%>sub_VoucherNumberSegment"/>
		  <%-- TR:HM66692 Ends  --%>
		  <reprompt />
        <else/>
          <goto next="#<%=MicroflowConstants.ERROR_FORM_PREFIX%>retry_count_exceed_timeout"/>
        </if>
      </noinput>
      <!--  -->
      <nomatch>
        <if cond="segmentPlayBackInvalidRetryCount &lt; maxNumberOfInvalidEntry">
		  <assign name="segmentPlayBackInvalidRetryCount" expr="segmentPlayBackInvalidRetryCount + 1"/>
		  <assign name="promptId" expr="'REF_VOUCHER_SEGMENT_CONFIRM_INVALID_ENTRY_MSG'"/>
		  <audio expr="returnAudioPath(promptsetId, subscriberLanguage, promptId, versionId, debug)"/>
          <ivr:include page='<%=vxmlPath + "VoucherSegmentPlayBackNoMatch" + vxmlFileSuffix%>'/>
		  <%-- TR:HM66692 Starts  --%>
          <clear namelist="choice block_voucherSegmentPlayback <%=MicroflowConstants.SUBDIALOG_VB_CALL_PREFIX%>sub_VoucherNumberSegment"/>
		   <%-- TR:HM66692 Ends  --%>
		  <reprompt />
        <else/>
          <goto next="#<%=MicroflowConstants.ERROR_FORM_PREFIX%>retry_count_exceed_invalidEntry"/>
        </if>
      </nomatch>
    </field>

<%
	}
%>	
<%-- HMTL 077 selectively generate block for block_voucherSegmentPlayback ends --%>	
	
	<!-- Check Voucher Number Segment for presence of more segments or proceed with Refill-->	
	<block name="block_validVoucherNumberSegment" cond="voucherLengthValidFlag=='true'">
	  <if cond="voucherLengthValidFlag == 'true'">
		  <ivr:log label="StandardVoucherRefillJSP">
				partNumber : <value expr="partNumber"/>
			  ||  previousPartEnteredLength : <value expr="previousPartEnteredLength"/>
		  </ivr:log>
		  <assign name="previousPartEnteredLength" expr="voucherLength"/>
		  <!--
		  <assign name="hasNextAvailableFlag" expr="searchRemainingPartExist(voucherLengthList, partNumber, previousPartEnteredLength)"/>
		  -->
		  <!-- Update voucherLengthList to with filltered numberlist -->
		  <assign name="voucherLengthList" expr="UpdateVoucherLengthList(voucherLengthList,partNumber,previousPartEnteredLength)"/>
		  <if cond="voucherLengthList !=''">
		    <assign name="hasNextAvailableFlag" expr="true"/>
		  <else/>
		    <assign name="hasNextAvailableFlag" expr="false"/>
		  </if>
		  <if cond=" debug &gt; NO_DEBUG_LEVEL">
		  <log label="StandardVoucherRefillJSP">hasNextAvailableFlag : <value expr="hasNextAvailableFlag"/></log>
		  </if>		  
          <!--  -->
          <ivr:include page='<%=vxmlPath  + "VouncherNumberEntryCheck" + vxmlFileSuffix%>'/>
          <!--  -->
          <if cond="hasNextAvailableFlag ==true"> 
        	<assign name="previousPartEnteredLength" expr="findLength(voucherNumber)"/> 
            <assign name="partNumber" expr="partNumber + 1"/>
			<!-- Append Voucher Segment to Previous parts-->
        	<assign name="previousPartEntered" expr="previousPartEntered+voucherNumber"/> 
            <ivr:include page='<%=vxmlPath  + "VouncherNumberNextPartEnterAnn" + vxmlFileSuffix%>'/>
        	<clear namelist="block_voucherNumber field_voucherNumber block_validVoucherNumberSegment block_voucherSegmentPlayback <%=MicroflowConstants.SUBDIALOG_VB_CALL_PREFIX%>sub_VoucherNumberSegment choice"/>
          <else/>
			<!-- Reassign variables to start afresh in case Voucher Number is required to be entered again-->
            <assign name="voucherNumber" expr="previousPartEntered + voucherNumber"/> 
            <assign name="previousPartEntered" expr="''"/>   
            <assign name="previousPartEnteredLength" expr="0"/>   
            <assign name="partNumber" expr="0"/>
            <assign name="voucherLengthValidFlag" expr="'false'"/>
            <assign name="hasNextAvailableFlag" expr="false"/>
            <goto next="#<%=MicroflowConstants.GENERAL_FORM_PREFIX%>option_confirmation"/>
          </if>
        </if>
	</block>
	<%-- HMTL-077 ENDS--%>
  </form>
  <!--  -->
  <%--HP-SING-V003 STARTS --%> 
  <!--  Form Names restored to previous one  -->
<form id="option_confirmation">
    <block name="block_option_confirmation">
      <goto next="#<%=MicroflowConstants.GENERAL_FORM_PREFIX%>option_confirmation"/>
    </block>
  </form>
  <!--  -->
<form id="<%=MicroflowConstants.GENERAL_FORM_PREFIX%>option_confirmation">
      <block>
          <ivr:log label="StandardVoucherRefillJSP">
				Confirmation DTMF Recevied from the Configuration := <value expr="confirmationMode"/> 
				Voucher Number In Confirmation to changed := <value expr="voucherNumber"/>
		  </ivr:log>
        <if cond="confirmationMode == '0'">
          <goto next="#<%=MicroflowConstants.PLAY_FORM_PREFIX%>option_reenter"/>
        <else/>
          <if cond="confirmationMode == '1'">
            <goto next="#<%=MicroflowConstants.PLAY_FORM_PREFIX%>option_playback"/>
          <else/>
            <goto next="#<%=MicroflowConstants.GENERAL_FORM_PREFIX%>getRefillOption"/>
          </if>
        </if>
      </block>      
</form>
<!-- -->
<%--HP-SING-V003 ENDS --%>
<!-- -->
<%-- HMTL-007 to selectively generate option_reenter form --%>

<% 
	if (confirmationMode.equals(0) || presentationIdFlag == 0) {
%>

  <!-- form for voucher reenter option -->
  <!--  -->
  <!--  Form Names restored to previous one  -->
  <form id="option_reenter">
    <block name="block_option_reenter">
      <goto next="#<%=MicroflowConstants.PLAY_FORM_PREFIX%>option_reenter"/>
	  
    </block>
  </form>
  <!--  -->
  <form id="<%=MicroflowConstants.PLAY_FORM_PREFIX%>option_reenter" scope="document">
	 <%--HMTL-077: Support for MultiPart Voucher Entry BEGINS--%>
	<block name="block_option_reenter">
	  <!-- Reassign variables to start afresh whenver this form is executed-->
	  <assign name="reenterVoucherNumber" expr="''"/>
	  <assign name="voucherLengthList" expr="constantVoucherLengthList"/>
	</block>
    <%-- HMTL-077 ENDS--%>
    <%-- Reeneter Logic--%>
    <block name="reblock_voucherNumber">
      <assign name="promptId" expr="'REF_FILLER_PROMPT_MSG'"/>
      <logic:equal value="0" name="standardRefillActionForm" property="endDigit">
        <prompt bargein="false" >
          <audio expr="returnAudioPath(promptsetId, subscriberLanguage, promptId, versionId, debug)"/>
        </prompt>
      </logic:equal>
      <!--  -->
      <logic:equal value="0" name="standardRefillActionForm" property="endDigit">
        <logic:equal value="0" name="standardRefillActionForm" property="cancelDigit">
		  <if cond="hasNextAvailableFlag == false">
          <ivr:include page='<%=vxmlPath + "ReenterVoucherWithoutHashAndCancelDigit" + vxmlFileSuffix%>'/>
		  <else/>
			<ivr:include page='<%=vxmlPath + "ReenterVoucherRemainningWithoutHashAndCancelDigit" + vxmlFileSuffix%>'/>
		  </if>
        </logic:equal>
      </logic:equal>
      <!--  -->
      <logic:equal value="0" name="standardRefillActionForm" property="endDigit">
        <logic:equal value="1" name="standardRefillActionForm" property="cancelDigit">
		  <if cond="hasNextAvailableFlag == false">
          <ivr:include page='<%=vxmlPath + "ReenterVoucherWithoutHashWithCancelDigit" + vxmlFileSuffix%>'/>
		  <else/>
			<ivr:include page='<%=vxmlPath + "ReenterVoucherRemainningWithoutHashWithCancelDigit" + vxmlFileSuffix%>'/>
		  </if>
        </logic:equal>
      </logic:equal>
      <!--  -->
      <logic:equal value="1" name="standardRefillActionForm" property="endDigit">
        <logic:equal value="1" name="standardRefillActionForm" property="cancelDigit">
		  <if cond="hasNextAvailableFlag == false">
          <ivr:include page='<%=vxmlPath + "ReenterVoucherWithHashAndCancelDigit" + vxmlFileSuffix%>'/>
          <else/>
			<ivr:include page='<%=vxmlPath + "ReenterVoucherRemainningWithHashAndCancelDigit" + vxmlFileSuffix%>'/>
		  </if>
        </logic:equal>
      </logic:equal>
      <!--  -->
      <logic:equal value="1" name="standardRefillActionForm" property="endDigit">
        <logic:equal value="0" name="standardRefillActionForm" property="cancelDigit">
        <%-- TR-Start-HJ73713--%>
		  <if cond="hasNextAvailableFlag == false">
          <ivr:include page='<%=vxmlPath + "ReenterVoucherWithHashWithoutCancelDigit" + vxmlFileSuffix%>'/>
		  <else/>
			<ivr:include page='<%=vxmlPath + "ReenterVoucherRemainningWithHashWithoutCancelDigit" + vxmlFileSuffix%>'/>
		  </if>
        <%-- TR-End-HJ73713--%>  
        </logic:equal>
      </logic:equal>
     <%--HMTL-077: Support for MultiPart Voucher Entry BEGINS--%>
	  <!--
      <logic:equal value="0" name="standardRefillActionForm" property="endDigit">
        <prompt bargein="false" >
          <audio expr="returnAudioPath(promptsetId, subscriberLanguage, promptId, versionId, debug)"/>
        </prompt>
      </logic:equal>
	  -->
	<%-- HMTL-077 ENDS--%>
    </block>
    <!--  -->
    <!-- getting voucher number -->
    <field name="field_reenterVoucherNumber">
      <grammar version="1.0" src='<%= "/VXMLIVR/standardRefillGrammar.do?versionId="+request.getParameter("versionId")+"&amp;debug="+request.getParameter("debug")+"&amp;presentationId="+request.getParameter("presentationId")+OptionalParametersString%>' mode="dtmf"/>
      <filled>
        <if cond=" debug &gt; NO_DEBUG_LEVEL">
          <log label="StandardVoucherRefillJSP">Re-entered Voucher Number : <value expr="field_reenterVoucherNumber"/></log>
        </if>
        <assign name="reEnteredVoucherNumber" expr="removeSpaces(field_reenterVoucherNumber)"/>
        <assign name="reenterVoucherNumber" expr="reEnteredVoucherNumber"/>
        <!--  -->
        <logic:equal value="1" name="standardRefillActionForm" property="cancelDigit">
          <if cond="containDigit(reenterVoucherNumber, cancelDigitDTMF) == cancelDigitDTMF">
            <%-- TR-HK86166-Start: If cancel digit enabled, then infinite loop removed while re-entering --%>
			<assign name="forcedNoMatch" expr="true"/>
            <if cond=" debug &gt; NO_DEBUG_LEVEL">
              <log label="StandardVoucherRefillJSP">Cancel Digit Enabled for reenter: <value expr="cancelDigitDTMF"/> so reprompt</log>
            </if>
            <throw event="nomatch"/>
          </if>
        </logic:equal>
        <logic:notEqual value="1" name="standardRefillActionForm" property="cancelDigit">
          <if cond="containDigit(reenterVoucherNumber, cancelDigitDTMF) == cancelDigitDTMF">
            <throw event="nomatch"/>
          </if>
        </logic:notEqual>
        <!--  -->
        <logic:equal value="1" name="standardRefillActionForm" property="endDigit">
          <assign name="reenterVoucherNumber" expr="stripEndCharacter(reenterVoucherNumber)"/>
        </logic:equal>
        <!--  -->
        <!--  -->
        <logic:equal value="0" name="standardRefillActionForm" property="endDigit">
          <assign name="voucherLength" expr="findLength(reenterVoucherNumber)"/>
          <assign name="voucherLengthValidFlag" expr="searchPartInList(voucherLength, voucherLengthList ,partNumber, previousPartEnteredLength)"/>
          <if cond="voucherLengthValidFlag=='false'">
            <throw event="nomatch"/>
          </if>
        </logic:equal>
        <!--  -->
         <%--HP-SING-V003 STARTS --%> 
         <assign name="voucherLength" expr="findLength(reenterVoucherNumber)"/>
         <if cond=" debug &gt; NO_DEBUG_LEVEL">
		<ivr:log label="StandardVoucherRefillJSP">
				reenterVoucherNumber : <value expr="reenterVoucherNumber"/>
			  ||  	reEntered voucherLength : <value expr="voucherLength"/>
		</ivr:log>
		</if>
         <assign name="voucherLengthValidFlag" expr="searchPartInList(voucherLength, voucherLengthList ,partNumber, previousPartEnteredLength)"/>
		 <ivr:log label="StandardVoucherRefillJSP">voucherLengthValidFlag : <value expr="voucherLengthValidFlag"/></ivr:log>
        <if cond="voucherLengthValidFlag == 'false'">
          <throw event="nomatch"/>
        </if>        
        <!--  -->
                 <ivr:include page='<%=vxmlPath  + "VouncherNumberReEntrySuccess" + vxmlFileSuffix%>'/>
        <!--  -->       
        <if cond="voucherLengthValidFlag == 'true'">
		   <ivr:log label="StandardVoucherRefillJSP">
				partNumber <value expr="partNumber"/>
			  ||  voucherLengthList <value expr="voucherLengthList"/>
			</ivr:log>
		   <assign name="previousPartEnteredLength" expr="voucherLength"/>
		   <ivr:log label="StandardVoucherRefillJSP">
				re enter partNumber <value expr="partNumber"/>
		   <%--HMTL-077: Support for MultiPart Voucher Entry BEGINS--%>
		    <!--
			  <assign name="hasNextAvailableFlag" expr="searchRemainingPartExist(voucherLengthList, partNumber, previousPartEnteredLength)"/>
			-->
				||  Voucherlengthlist is <value expr="voucherLengthList"/>
			</ivr:log>
		  <!-- Update voucherLengthList with filltered numberlist  -->
		  <assign name="voucherLengthList" expr="UpdateVoucherLengthList(voucherLengthList,partNumber,previousPartEnteredLength)"/>
		  <if cond="voucherLengthList !=''">
		    <assign name="hasNextAvailableFlag" expr="true"/>
		  <else/>
		    <assign name="hasNextAvailableFlag" expr="false"/>
		  </if>
		  <ivr:log label="StandardVoucherRefillJSP">
				Updated voucherLengthList is <value expr="voucherLengthList"/>
				<%-- HMTL-077 ENDS--%>			
				  ||  hasNextAvailableFlag <value expr="hasNextAvailableFlag"/>
		   </ivr:log>
           <!--  -->
                <ivr:include page='<%=vxmlPath  + "VouncherNumberReEntryCheck" + vxmlFileSuffix%>'/>
           <!--  -->
          <if cond="hasNextAvailableFlag == true">        	 
        	<assign name="partNumber" expr="partNumber + 1"/>
			<assign name="previousPartEntered" expr="previousPartEntered+reenterVoucherNumber"/> 
        	<assign name="previousPartEnteredLength" expr="findLength(reenterVoucherNumber)"/> 
        	<!--  -->        	     	         
                     <ivr:include page='<%=vxmlPath  + "VouncherNumberNextPartReEnterAnn" + vxmlFileSuffix%>'/>
			<!--  -->
        	<clear namelist="reblock_voucherNumber field_reenterVoucherNumber"/>        	
          <else/>
            <assign name="reenterVoucherNumber" expr="previousPartEntered + reenterVoucherNumber"/> 
            <assign name="previousPartEntered" expr="''"/>   
            <assign name="previousPartEnteredLength" expr="0"/>   
            <assign name="partNumber" expr="0"/>
            <assign name="voucherLengthValidFlag" expr="'false'"/>
			<assign name="hasNextAvailableFlag" expr="false"/>
            <if cond=" debug &gt; NO_DEBUG_LEVEL">
			<log label="StandardVoucherRefillJSP">reenterVoucherNumber <value expr="reenterVoucherNumber"/></log>
 			</if>
			  <goto next="#<%=MicroflowConstants.GENERAL_FORM_PREFIX%>check_ReEnteredVoucherNumber"/>  
                </if>
         </if> 
         <%--HP-SING-V003 ENDS --%>       
      </filled>
      <error>
        <assign name="status" expr="'FAILURE'"/>
        <goto next="#<%=MicroflowConstants.ERROR_FORM_PREFIX%>system_unavailable"/>
      </error>
      <noinput>
        <%-- HP-HJ94298: Condition changed. Now timeout retry count being compared to maxRefillTimeoutRetries for voucher number re-enter --%>
        <if cond="reenterTimeoutCount &lt; maxRefillTimeoutRetries">
		  <assign name="reenterTimeoutCount" expr="reenterTimeoutCount + 1"/>
          <ivr:include page='<%=vxmlPath  + "VoucherReEnterTimeout" + vxmlFileSuffix%>'></ivr:include>
          <clear namelist="reblock_voucherNumber"/>
        <else/>
          <goto next="#<%=MicroflowConstants.ERROR_FORM_PREFIX%>retry_count_exceed_timeout"/>
        </if>
      </noinput>
      <nomatch>
          <ivr:log label="StandardVoucherRefillJSP">
				Voucher Length is = <value expr="voucherLength"/>
			   ||  Re-entered Voucher Number is = <value expr="reenterVoucherNumber"/>
		   </ivr:log>
        <!--  -->
        <assign name="reenterVoucherNumber" expr="removeSpaces(reenterVoucherNumber)"/>
        <if cond="reenterVoucherNumber == back2MainMenuDTMF">
          <assign name="status" expr="'RETURN_MAINMENU'"/>
          <goto next="#<%=MicroflowConstants.GENERAL_FORM_PREFIX%>exitModule"/>
        </if> 
        <!--  -->
        <%-- HP-HJ94298: Condition changed. Now invalid count being compared to maxRefillInvalidRetries for voucher number reenter --%>
        <if cond="reenterInvalidEntryCount &lt; maxRefillInvalidRetries">
          <assign name="reenterInvalidEntryCount" expr="reenterInvalidEntryCount + 1"/>
          <if cond="forcedNoMatch == false">
            <ivr:include page='<%=vxmlPath + "VoucherReEnterNoMatch" + vxmlFileSuffix%>'/>
          <else/>
            <assign name="forcedNoMatch" expr="false"/>
          </if>
          <!--  -->
		<ivr:log label="StandardVoucherRefillJSP">
			Invalid Entry Count is = <value expr="invalidEntryCount"/>
			  ||  Going to Take Voucher Number Again
		</ivr:log>
          <%-- To Fix:HK51182 Start --%>
          <assign name="hasNextAvailableFlag" expr="false"/>
          <assign name="previousPartEntered" expr="''"/>   
          <assign name="previousPartEnteredLength" expr="0"/>   
          <assign name="partNumber" expr="0"/>
		  <%--HMTL-077: Support for MultiPart Voucher Entry BEGINS--%>
		  <assign name="reenterVoucherNumber" expr="''"/>
	      <assign name="voucherLengthList" expr="constantVoucherLengthList"/>
	      <%--HMTL-077 ENDS--%>
          <%-- To Fix:HK51182 End --%>
          <%-- To Fix:HJ69233 Start --%>
          <%-- removed variables - (reenterVoucherNumber reEnteredVoucherNumber voucherLength) --%>
          <clear namelist="reblock_voucherNumber field_reenterVoucherNumber"/>
          <%-- To Fix:HJ69233 End --%>
        <else/>
		<ivr:log label="StandardVoucherRefillJSP">
				Re-Invalid Entry Count is = <value expr="reenterInvalidEntryCount"/>
			  ||  	Max Number Invalid Entry Retry is = <value expr="maxRefillInvalidRetries"/>
		</ivr:log>
          <goto next="#<%=MicroflowConstants.ERROR_FORM_PREFIX%>retry_count_exceed_invalidEntry"/>
        </if>
      </nomatch>
    </field>
  </form>
  <!--  -->
<%--HP-SING-V003 STARTS --%>       
<!-- Form to check wheather enter voucher Number and Re-enter Voucher number equal or not -->
  <!--  -->
  <!--  Form Names restored to previous one  -->
  <form id="check_ReEnteredVoucherNumber">
    <block name="block_check_ReEnteredVoucherNumber">
      <goto next="#<%=MicroflowConstants.GENERAL_FORM_PREFIX%>check_ReEnteredVoucherNumber"/>
    </block>
  </form>
  <!--  -->
  <form id="<%=MicroflowConstants.GENERAL_FORM_PREFIX%>check_ReEnteredVoucherNumber">
    <block>
           <ivr:log label="StandardVoucherRefillJSP">
				Vouncher Number is  = <value expr="voucherNumber"/>
			    ||  ReEnterVouncher Number  is = <value expr="reenterVoucherNumber"/>
			</ivr:log>
    <!-- To check for equality of both entererd and re entered voucher numbers -->
    <if cond="voucherNumber==reenterVoucherNumber">
          <goto next="#<%=MicroflowConstants.GENERAL_FORM_PREFIX%>getRefillOption"/>
    <else/>
          <if cond="confirmationLoopCount &lt; numberOfConfirmation">
			<assign name="confirmationLoopCount" expr="confirmationLoopCount + 1"/>
            <ivr:include page='<%=vxmlPath + "ReenterVoucherMismatch" + vxmlFileSuffix%>'/>   
             <assign name="hasNextAvailableFlag" expr="false"/>
             <assign name="previousPartEntered" expr="''"/>   
             <assign name="previousPartEnteredLength" expr="0"/>   
             <assign name="partNumber" expr="0"/>
			 <assign name="reenterVoucherNumber" expr="''"/>
			 <assign name="voucherNumber" expr="''"/>
			 <assign name="voucherLengthList" expr="constantVoucherLengthList"/>	
            <goto next="#<%=MicroflowConstants.GENERAL_FORM_PREFIX%>standard_refill_main"/>
          <else/>
            <goto next="#<%=MicroflowConstants.ERROR_FORM_PREFIX%>retry_count_exceed"/>
          </if>
    </if>        
 </block>    
</form>
<% 
	} 
%>
<%-- HMTL-007 block closes --%>
<!-- -->  

<%-- HMTL-077 to selectively generate option_playback form --%>

<% 
	if (confirmationMode.equals(1) || presentationIdFlag == 0) {
%>

  <%--HP-SING-V003 ENDS --%>       
  <!-- form for voucher confirmation-->
  <!--  -->
  <!--  Form Names restored to previous one  -->
  <form id="option_playback">
    <block name="block_option_playback">
      <goto next="#<%=MicroflowConstants.PLAY_FORM_PREFIX%>option_playback"/>
    </block>
  </form>
  <!--  -->
  <form id="<%=MicroflowConstants.PLAY_FORM_PREFIX%>option_playback" scope="document">
    <block name="voucher_playback">
      <assign name="newVoucherReadoutFormat" expr="prepareReadoutFormat(voucherNumber,voucherReadOutFormat)"/>
      <assign name="promptId" expr="'REF_VOUCHER_PLAYBACK_MSG'"/>
      <logic:equal value="0" name="standardRefillActionForm" property="endDigit">        
        <prompt bargein="false" >
          <audio expr="returnAudioPath(promptsetId, subscriberLanguage, promptId, versionId, debug)"/>
        </prompt>
      </logic:equal>
      <!--  -->
      <logic:equal value="1" name="standardRefillActionForm" property="endDigit">
        <audio expr="returnAudioPath(promptsetId, subscriberLanguage, promptId, versionId, debug)"/>
      </logic:equal>
    </block>
    <!--  -->
    <subdialog name="<%=MicroflowConstants.SUBDIALOG_VB_CALL_PREFIX%>sub_VoucherNumber" srcexpr="voiceBaseInterfaceVxml + '?versionId='+versionId + '#' + playVoucherSubdialogName">
      <param name="arg" expr="voucherNumber"/>
      <param name="format" expr="newVoucherReadoutFormat"/>
      <param name="lang" expr="application.voiceBaseLanguage"/>
      <param name="speaker" expr="speaker"/>
      <param name="gender" expr="application.gender"/>
      <param name="voiceBaseURL" expr="voiceBaseURL"/>
      <param name="debug" expr="application.debug"></param>
      <param name="versionId" expr="application.versionId"></param>
	  <param name="ivrlanguage" expr="application.subscriberLanguage"></param>
    </subdialog>
    <!--  -->
    <field name="choice">
      <prompt>
        <audio expr="returnAudioPath(application.promptsetId,application.subscriberLanguage, 'REF_VOUCHER_CONFIRM_MSG', versionId, debug)"/>
      </prompt>
      <grammar version="1.0" src='<%= "/VXMLIVR/grammarFiles/local/Confirmation.grxml"+"?versionId="+request.getParameter("versionId") %>' mode="dtmf"/>
      <!--  -->
      <filled>
        <if cond=" debug &gt; NO_DEBUG_LEVEL">
          <log label="StandardVoucherRefillJSP">DTMF used for Confirmation = <value expr="choice"/></log>
        </if>
        <if cond="choice == confirmDTMF">
          <goto next="#<%=MicroflowConstants.GENERAL_FORM_PREFIX%>getRefillOption"/>
        <elseif cond="choice == negateDTMF"/>
          <if cond="confirmationLoopCount &lt; numberOfConfirmation">
			 <assign name="confirmationLoopCount" expr="confirmationLoopCount + 1"/>			
			  <if cond=" debug &gt; NO_DEBUG_LEVEL">
				<log label="StandardVoucherRefillJSP">On negate DTMF, decrementing voucherRefillAttempts = <value expr="voucherRefillAttempts"/></log>
			  </if>
            <goto next="#<%=MicroflowConstants.GENERAL_FORM_PREFIX%>standard_refill_main"/>
          <else/>
            <goto next="#<%=MicroflowConstants.ERROR_FORM_PREFIX%>retry_count_exceed"/>
          </if>
        <elseif cond="choice == repromptDTMF"/>
          <if cond="confirmationLoopCount &lt; numberOfConfirmation">
			<assign name="confirmationLoopCount" expr="confirmationLoopCount + 1"/>
            <if cond=" application.repromptEnabled == 'true'">
              <clear namelist="choice"/>
              <reprompt/>
            <else/>
              <throw event="nomatch"/>
            </if>
          <else/>
            <goto next="#<%=MicroflowConstants.ERROR_FORM_PREFIX%>retry_count_exceed"/>
          </if>
        <else/>
             <throw event="nomatch"/>
        </if>
      </filled>
      <!--  -->
      <error>
        <assign name="status" expr="'FAILURE'"/>
        <goto next="#<%=MicroflowConstants.ERROR_FORM_PREFIX%>system_unavailable"/>
      </error>
      <!--  -->
      <noinput>
        <if cond="playbackTimeoutCount &lt; maxNumberOfTimeout">
		  <assign name="playbackTimeoutCount" expr="playbackTimeoutCount + 1"/>
          <ivr:include page='<%=vxmlPath  + "VoucherPlayBackTimeout" + vxmlFileSuffix%>'/>
          <clear namelist="<%=MicroflowConstants.SUBDIALOG_VB_CALL_PREFIX%>sub_VoucherNumber voucher_playback"/>
        <else/>
          <goto next="#<%=MicroflowConstants.ERROR_FORM_PREFIX%>retry_count_exceed_timeout"/>
        </if>
      </noinput>
      <!--  -->
      <nomatch>
        <if cond="playbackInvalidEntryCount &lt; maxNumberOfInvalidEntry">
		  <assign name="playbackInvalidEntryCount" expr="playbackInvalidEntryCount + 1"/>
          <ivr:include page='<%=vxmlPath + "VoucherPlayBackNoMatch" + vxmlFileSuffix%>'/>
          <clear namelist="<%=MicroflowConstants.SUBDIALOG_VB_CALL_PREFIX%>sub_VoucherNumber voucher_playback choice"/>
        <else/>
          <goto next="#<%=MicroflowConstants.ERROR_FORM_PREFIX%>retry_count_exceed_invalidEntry"/>
        </if>
      </nomatch>
    </field>
  </form>
  
<% 
	} 
%>

<%-- HMTL-007 block closes --%>
  <!--  -->
 	 <%-- BSNL005 Start --%>
  <!--  -->
  <!--  Form Names restored to previous one  -->
  <form id="getRefillOption">
    <block name="block_getRefillOption">
      <goto next="#<%=MicroflowConstants.GENERAL_FORM_PREFIX%>getRefillOption"/>
    </block>
  </form>
  <!--  -->
  <form id="<%=MicroflowConstants.GENERAL_FORM_PREFIX%>getRefillOption">
    <!--  -->  
  	<!--  -->
   <block>
   		<%-- HK37176 Start New Static Vxml Opened--%>
   		<ivr:include page='<%=vxmlPath + "RefillOptionAllowedConditions" + vxmlFileSuffix%>'/>
   		<%-- HK37176 End--%>
   		<if cond="refillOptionEnable==true &amp;&amp; optionListSize &gt; 0 &amp;&amp; refillOptionAllowed==true">
    		<%-- HK38518 Start following assign is commented--%>
   			<!--<assign name="voucherNumber" expr="enteredVoucherNumber"/> -->
   			<%-- HK38518 End --%>
 			<if cond=" debug &gt; NO_DEBUG_LEVEL">
  				<log label="StandardVoucherRefillJSP">Sending RefillOption Request with Voucher = <value expr="voucherNumber"/></log>
  			</if>
        <%-- Commenting this goto as we now need to fall back to the GetRefillOptions in the ivr:include. According to the changes for FC 154-->
        <!--    <goto nextitem="optionDetails"/> --%>

    	<else/>
    		<goto next="#<%=MicroflowConstants.GENERAL_FORM_PREFIX%>perform_refill"/>
    	</if>
   </block>  
 	<!--  -->

<%-- HMTL 077 selectively generate block for refill Option Details starts --%>
  <%
	if (refillOptionEnable || presentationIdFlag == 0) {
  %>	
    <ivr:include page="<%=jspPartPath + "GetRefillOptions" + jspPartFileSuffix%>"/>
    <!--  -->
    <block name="blockData_optionDetails">    
        <var name="optionResponseCode"/>
        <assign name="optionResponseCode" expr="optionDetails.responseCode"/>   
        <assign name="availableRefillOption" expr="optionDetails.optionsList"/>  
        <assign name="availableRefillOptionSize" expr="optionDetails.availableOptionListSize"/>  
        <if cond="optionResponseCode==successCode">
         	<if cond="availableRefillOptionSize &gt; 0">
				<ivr:log label="StandardVoucherRefillJSP">
						optionResponseCode  = <value expr="optionResponseCode"/>
					  ||  availableRefillOption  = <value expr="availableRefillOption"/>
					  ||  availableRefillOptionSize  = <value expr="availableRefillOptionSize"/>
					  ||  optionConfirmationRequired  = <value expr="optionConfirmationRequired"/>
					  ||  optionNoInputTimeout  = <value expr="optionNoInputTimeout"/>
					  ||  optionMaxRetries  = <value expr="optionMaxRetries"/>
					  ||  optionMaxTimeoutRetries  = <value expr="optionMaxTimeoutRetries"/>
					  ||  optionMaxInvalidRetries  = <value expr="optionMaxInvalidRetries"/>
					  ||  optionCancelDigit  = <value expr="optionCancelDigit"/>
					  ||  optionEndDigit  = <value expr="optionEndDigit"/>
					  ||  serviceClass  = <value expr="serviceClassCurrent"/>
				</ivr:log>
				<assign name = "nextFormId" expr ="'#<%=MicroflowConstants.GENERAL_FORM_PREFIX%>RefillOptionIntro'"/>
       		<else/>
			<assign name = "nextFormId" expr ="'#<%=MicroflowConstants.GENERAL_FORM_PREFIX%>perform_refill'"/>
         	</if>
        <else/>
           <assign name="errorFormId" expr="optionDetails.errorFormId"/>
			<ivr:log label="StandardVoucherRefillJSP">
					Error Form ID=<value expr="errorFormId"/> 
					Response Code=<value expr="optionResponseCode"/>
			</ivr:log>  
				<assign name = "nextFormId" expr ="'#'+ errorFormId"/>
        </if>  
		<ivr:include page='<%=vxmlPath + "PostDataGetRefillOptions" + vxmlFileSuffix%>'/>
		<goto expr = "nextFormId"/>
    </block>
  <%
	}
  %>
<%-- HMTL 077 selectively generate block for refill Option Details ends --%>
  
  </form>
  <!--  -->
  
  <!--  -->
  <!--  Form Names restored to previous one  -->

<%-- HMTL 077 selectively generate block for refill Option Details starts --%>
  <%
	if (refillOptionEnable || presentationIdFlag == 0) {
  %>	
  
  <form id="RefillOptionIntro">
    <block name="block_RefillOptionIntro">
      <goto next="#<%=MicroflowConstants.GENERAL_FORM_PREFIX%>RefillOptionIntro"/>
    </block>
  </form>
  <!--  -->
  <form id="<%=MicroflowConstants.GENERAL_FORM_PREFIX%>RefillOptionIntro">
   <block>
 		<!-- @staticVxmlName:: RefillOptionIndexPlayPreAnn -->
		<!-- @Comments:: Used to play TO option message prompts. --> 
	   <ivr:include page="<%=vxmlPath + "RefillOptionIntroAnn" + vxmlFileSuffix%>"/>
	   <goto next="#<%=MicroflowConstants.PLAY_FORM_PREFIX%>play_RefillOption"/>
   </block>
   
  </form>
  
  <!--  -->
  <!--  Form Names restored to previous one  -->
  <form id="play_RefillOption">
    <block name="block_play_RefillOption">
      <goto next="#<%=MicroflowConstants.PLAY_FORM_PREFIX%>play_RefillOption"/>
    </block>
  </form>
  <!--  -->
  <form id="<%=MicroflowConstants.PLAY_FORM_PREFIX%>play_RefillOption">
 	<property name="timeout" value="<%=optionNoInputTimeout%>"/>
  <block>
  	<assign name="indexPlayCounter" expr="indexPlayStart"/>
  		<if cond="optionEndDigit == DigitOFF">
			<assign name="endDigitEnabled" expr="'false'"/>
		</if>
		<if cond="optionCancelDigit == DigitOFF">
			<assign name="cancelDigitEnabled" expr="'false'"/>
		</if>
  </block>
  		<!--  -->
  <block name="block_PlayOptions" cond="optionPromptIndex &lt; availableRefillOptionSize">
   <assign name="optionPrompt" expr="availableRefillOption[optionPromptIndex].promptId"/>	
  		<!-- @staticVxmlName:: RefillOptionIndexPlayPreAnn -->
		<!-- @Comments:: Used to play TO option message prompts. --> 
	   <ivr:include page="<%=vxmlPath + "RefillOptionIndexPlayPreAnn" + vxmlFileSuffix%>"/>
  </block>
  		<!--  -->
    <subdialog name="<%=MicroflowConstants.SUBDIALOG_VB_CALL_PREFIX%>sub_playIndex" srcexpr="voiceBaseInterfaceVxml + '#' + playDuration" cond="optionPromptIndex &lt; availableRefillOptionSize">
	       <param name="arg" expr="indexPlayCounter"></param>
	       <param name="type" expr="'number'"></param>
	       <param name="lang" expr="voiceBaseLanguage"></param>
	       <param name="speaker" expr="speaker"></param>
	       <param name="gender" expr="gender"></param>
	       <param name="voiceBaseURL" expr="voiceBaseURL"/>
	</subdialog>
  		<!--  -->
	<field name="dummyField_For_Refill_<%=i%>">
      <grammar version="1.0" src="<%= "/VXMLIVR/grammarFiles/local/Everything.grxml"+"?versionId="+request.getParameter("versionId") %>" mode="dtmf"/>
		     <prompt timeout="0s"/>
		     <catch event="noinput">
		       <!-- if no input from the user, skip this field -->
		       <if cond="debug &gt; NO_DEBUG_LEVEL">
		         <log label="StandardVoucherRefillJSP">Skipping dummyField_For_Refill</log>
		       </if>
		       <assign name="dummyField_For_Refill_<%=i%>" expr="true"/>
		      </catch>
		      <filled>
		        <if cond="debug &gt; NO_DEBUG_LEVEL">
				  <log label="StandardVoucherRefillJSP">DTMF Entered While Playing Successfull Refill Announcements  = <value expr="dummyField_For_Refill_<%=i%>"/></log>
		        </if>
		     </filled>   
         </field>
		 <%++i;%>
   <block name="block_Iterator" cond="optionPromptIndex &lt; availableRefillOptionSize">
			<!-- @staticVxmlName:: RefillOptionIndexPlayPostAnn.vxml.part -->
			<!-- @Comments:: Open vxml for changing order of playing option's prompts --> 
		  <ivr:include page="<%=vxmlPath + "RefillOptionIndexPlayPostAnn" + vxmlFileSuffix%>"/>
		    <!--  -->
		    <assign name="optionPromptIndex" expr="optionPromptIndex +1"/>
		    <assign name="indexPlayCounter" expr="indexPlayCounter +1"/>
		    <if cond="debug &gt; NO_DEBUG_LEVEL">
       	    	 <log label="StandardVoucherRefillJSP">Incremented optionPromptIndex = <value expr="optionPromptIndex"/></log>
		 	</if>
        	<clear namelist="block_PlayOptions <%=MicroflowConstants.SUBDIALOG_VB_CALL_PREFIX%>sub_playIndex block_Iterator"/>        		
	</block>
		<!--  -->
	 <field name="userInput">
	 	<!--  -->
	 	 <prompt>
       		 <audio expr="returnAudioPath(promptsetId, subscriberLanguage, SHORT_SILENCE_MSG, versionId, debug)"/>
     	 </prompt>
	 	<property name="timeout" value="<%=optionNoInputTimeout%>"/>
		<!--  -->
      <grammar version="1.0" src="<%= "/VXMLIVR/refillOptionGrammar.do?versionId="+request.getParameter("versionId")+"&amp;debug="+request.getParameter("debug")+"&amp;presentationId="+request.getParameter("presentationId")+OptionalParametersString%>" mode="dtmf"/>
		<filled>
			<if cond=" debug &gt; NO_DEBUG_LEVEL">
					<log label="StandardVoucherRefillJSP">OPTION DTMF Received = <value expr="userInput"/></log>	
			</if>
			<assign name="SelectedOptionDtmf" expr="removeSpaces(userInput)"/>
			<if cond="cancelDigitEnabled == 'true' &amp;&amp; containDigit(SelectedOptionDtmf, optionCancelDigit) == optionCancelDigit">
				<if cond="retryCounter &lt; optionMaxRetries">
						<!-- @staticVxmlName:: RefillOptionRetry.vxml.part -->
						<!-- @Comments:: This Vxml is increasing retryCounter counter and open for playing some when end user retry  -->				 		
				 		<ivr:include page="<%=vxmlPath + "RefillOptionRetry" + vxmlFileSuffix%>"/>
				 		<if cond="debug &gt; NO_DEBUG_LEVEL">
             				<log label="StandardVoucherRefillJSP">Cancel Digit Entered Retry Counter = <value expr="retryCounter"/></log>
						</if>
				 		<assign name="optionPromptIndex" expr="0"/>
				 		<assign name="indexPlayCounter" expr="indexPlayStart"/>
				 		<clear namelist="block_PlayOptions <%=MicroflowConstants.SUBDIALOG_VB_CALL_PREFIX%>sub_playIndex block_Iterator userInput"/>		
            	<else/>
            			<if cond="debug &gt; NO_DEBUG_LEVEL">
            				<log label="StandardVoucherRefillJSP">Counter Selection Retry Max Reached = <value expr="retryCounter"/></log>
           				</if>
           				<ivr:include page="<%=vxmlPath + "RefillOptionMaxRetryExceed" + vxmlFileSuffix%>"/>
	    			  <!--  -->
		    			<assign name="status" expr="'FAILURE_RETRY'"/>
		    	  		<goto next="#<%=MicroflowConstants.GENERAL_FORM_PREFIX%>exitModule"/>
           
       			</if>
			<else/>
					<ivr:log label="StandardVoucherRefillJSP">
						OPTION DTMF Received = <value expr="SelectedOptionDtmf"/>
					  ||  	cancel digit not pressed
					</ivr:log>
         		 	<assign name="SelectedOptionDtmf" expr="stripEndCharacter(SelectedOptionDtmf)"/>
         		 	
         		<if cond="SelectedOptionDtmf &lt; indexPlayStart">
         		 	<throw event="nomatch"/>
          		</if>
          			
         		<if cond="indexPlayStart &gt; 0">
            			<assign name="SelectedOptionDtmf" expr="SelectedOptionDtmf - indexPlayStart"/>       			
          		</if>
          			
          		<if cond="SelectedOptionDtmf &gt; availableRefillOptionSize-1">
          			<if cond="debug &gt; NO_DEBUG_LEVEL">
            				<log label="StandardVoucherRefillJSP">Selected dtmf is outof Array Index <value expr="SelectedOptionDtmf + indexPlayStart"/></log>
           			</if>
          			 	<throw event="nomatch"/>			            
          		<else/>
            			<assign name="selectedOptionPrompt" expr="availableRefillOption[SelectedOptionDtmf].promptId"/>
            			<assign name="selectedOption" expr="availableRefillOption[SelectedOptionDtmf].selectedOption"/>
            			
					   <ivr:log label="StandardVoucherRefillJSP">
							SelectedOptionDtmf = <value expr="SelectedOptionDtmf"/>
						  ||   SelectedOption = <value expr="selectedOption"/>
					  </ivr:log>
					
						<if cond="optionConfirmationRequired == 'true'">
						<goto next="#<%=MicroflowConstants.PLAY_FORM_PREFIX%>form_RefillOptionConfirmation"/>
						<else/>
             			<goto next="#<%=MicroflowConstants.GENERAL_FORM_PREFIX%>perform_refill"/>
             			</if>
          		</if>
			</if>
	</filled>
	
			<error>
    			<goto next="#<%=MicroflowConstants.ERROR_FORM_PREFIX%>form_SystemFailure"/>
    		</error>
		 	<!--  -->
		 	<noinput cond="optionCounterTimeout &lt; optionMaxTimeoutRetries">
		 		<!-- @staticVxmlName:: RefillOptionSelectionTimeout.vxml.part -->
				<!-- @Comments:: Used to play Option Selection TimeOut message  -->
        		<ivr:include page="<%=vxmlPath + "RefillOptionSelectionTimeout" + vxmlFileSuffix%>"/>
				<assign name="optionPromptIndex" expr="0"/>
				<assign name="indexPlayCounter" expr="indexPlayStart"/>	
				<assign name="optionCounterTimeout" expr="optionCounterTimeout + 1"/>
       			<clear namelist="block_PlayOptions <%=MicroflowConstants.SUBDIALOG_VB_CALL_PREFIX%>sub_playIndex block_Iterator userInput"/> 
      	 	</noinput>
      		<!--  -->
      	 	<noinput cond="optionCounterTimeout == optionMaxTimeoutRetries">
      			<if cond="debug &gt; NO_DEBUG_LEVEL">
                	<log label="StandardVoucherRefillJSP">In noinput block max couneter reached counterTimeout = <value expr="optionCounterTimeout"/></log>
        		</if>
        		 <ivr:include page="<%=vxmlPath + "RefillOptionMaxTimeoutCountExceededAnn" + vxmlFileSuffix%>"/>
	    			  <!--  -->
		    	  <assign name="status" expr="'FAILURE_TIMEOUT'"/>
		    	  <goto next="#<%=MicroflowConstants.GENERAL_FORM_PREFIX%>exitModule"/>
      	 	</noinput>
      		<!--  -->
		 	<nomatch cond="optionInvalidEntryCounter &lt;  optionMaxInvalidRetries">    
		 		<!-- @staticVxmlName:: RefillOptionInvalidEntry.vxml.part -->
				<!-- @Comments:: Used to play Option Invalid Entry message  -->
          		<ivr:include page="<%=vxmlPath + "RefillOptionInvalidEntry" + vxmlFileSuffix%>"/>
          		<assign name="optionPromptIndex" expr="0"/>
          		<assign name="indexPlayCounter" expr="indexPlayStart"/>	
          		<assign name="optionInvalidEntryCounter" expr="optionInvalidEntryCounter + 1"/>	
          		<clear namelist="block_PlayOptions <%=MicroflowConstants.SUBDIALOG_VB_CALL_PREFIX%>sub_playIndex block_Iterator userInput"/>        
     	 	</nomatch>
     	 	<nomatch cond="optionInvalidEntryCounter == optionMaxInvalidRetries">
          		<if cond="debug &gt; NO_DEBUG_LEVEL">
                	<log label="StandardVoucherRefillJSP">In nomatch block max couneter reached counterTimeout = <value expr="optionInvalidEntryCounter"/></log>
          		</if>
        		<ivr:include page="<%=vxmlPath + "RefillOptionMaxInvalidEntryCountExceededAnn" + vxmlFileSuffix%>"/>
	    			  <!--  -->
		    	  <assign name="status" expr="'FAILURE_INVALID_ENTRY_RETRY'"/>
		    	  <goto next="#<%=MicroflowConstants.GENERAL_FORM_PREFIX%>exitModule"/>
         	</nomatch>    
	 </field>
	 
  </form>
  
  <!--  -->
  <!--  Form Names restored to previous one  -->
  <form id="form_RefillOptionConfirmation">
    <block name="block_form_RefillOptionConfirmation">
      <goto next="#<%=MicroflowConstants.PLAY_FORM_PREFIX%>form_RefillOptionConfirmation"/>
    </block>
  </form>
  <!--  -->
  <form id="<%=MicroflowConstants.PLAY_FORM_PREFIX%>form_RefillOptionConfirmation">
  <property name="timeout" value="<%=optionNoInputTimeout%>"/>
	<!--  -->
		<block name="block_PlayConfirmation">
			<if cond="debug &gt; NO_DEBUG_LEVEL">
        		<log label="StandardVoucherRefillJSP" expr="'Starting'">PSOffering Confirmation Starts</log>
      		</if>
      		<!-- @staticVxmlName:: RefillOptionConfirmationAnn.vxml.part -->
			<!-- @Comments:: Used to play confirmation message -->
	 		<ivr:include page="<%=vxmlPath + "RefillOptionConfirmationAnn" + vxmlFileSuffix%>"/>	 
		</block>
		<!--  -->
		
		<field name="choice">
      <grammar version="1.0" src="<%= "/VXMLIVR/grammarFiles/local/Confirmation.grxml"+"?versionId="+request.getParameter("versionId") %>" mode="dtmf"/>
    			 <filled>
    	 			<if cond=" debug &gt; NO_DEBUG_LEVEL">
          				<log label="StandardVoucherRefillJSP">DTMF used for Confirmation = <value expr="choice"/></log>
        			</if>
        			<if cond="choice == confirmDTMF">
          				<goto next="#<%=MicroflowConstants.GENERAL_FORM_PREFIX%>perform_refill"/>
			        <elseif cond="choice == negateDTMF"/>
						<if cond=" debug &gt; NO_DEBUG_LEVEL">
        		  			<log label="StandardVoucherRefillJSP">negate DTMF selected = <value expr="choice"/></log>
       		 			</if>
       		 			<!--ReSet Counters  -->
       		 			<assign name="retryCounter" expr="0"/>
       		 			<assign name="optionCounterTimeout" expr="0"/>
       		 			<assign name="optionInvalidEntryCounter" expr="0"/>
       		 			<!--  -->
        				<if cond="optionConfirmationLoopCount &lt; optionMaxRetries">
	        				<assign name="optionConfirmationLoopCount" expr="optionConfirmationLoopCount + 1"/>
        					<assign name="optionPromptIndex" expr="0"/>
							<assign name="indexPlayCounter" expr="indexPlayStart"/>
        					<clear namelist="block_PlayOptions <%=MicroflowConstants.SUBDIALOG_VB_CALL_PREFIX%>sub_playIndex block_Iterator userInput  block_PlayConfirmation  choice"/> 
            				<goto next="#<%=MicroflowConstants.PLAY_FORM_PREFIX%>play_RefillOption"/>
          				<else/>
          					<!-- @staticVxmlName:: RefillOptionConfirmMaxRetryExceed.vxml.part -->
							<!-- @Comments:: Used to play maximum Confimation retry message -->
	 		
          					<ivr:include page="<%=vxmlPath + "RefillOptionConfirmMaxRetryExceed" + vxmlFileSuffix%>"/>
   	        	 			<assign name="status" expr="'FAILURE_RETRY'"/>
			     			<if cond="debug &gt; NO_DEBUG_LEVEL">
     	  			 			<log label="StandardVoucherRefillJSP" expr="'Ending'">StandardVoucherRefillJSP MaxRetryCountExceeded Exits with status = <value expr="status"/></log>
			     	 		</if>
     				 		<goto next="#<%=MicroflowConstants.GENERAL_FORM_PREFIX%>exitModule"/>
          				</if>
         			<else/>
          				<throw event="nomatch"/>
        			</if>
    	 		</filled>
    	 	<error>
        		<goto next="#<%=MicroflowConstants.ERROR_FORM_PREFIX%>form_SystemFailure"/>
      	 	</error>
      	 
      	 	<!--  -->
		 	<noinput cond="optionConfirmationcounterTimeout &lt; optionMaxTimeoutRetries">
		 	<assign name="optionConfirmationcounterTimeout" expr="optionConfirmationcounterTimeout + 1"/>	
		 		<!-- @staticVxmlName:: RefillOptionConfirmationTimeout.vxml.part -->
				<!-- @Comments:: Used to play TimeOut message for confirmation -->
        		<ivr:include page="<%=vxmlPath + "RefillOptionConfirmationTimeout" + vxmlFileSuffix%>"/>        	
				<clear namelist="block_PlayConfirmation choice"/> 
      	 	</noinput>
      		<!--  -->
      	 	<noinput cond="optionConfirmationcounterTimeout == optionMaxTimeoutRetries">
      	 		<!-- @staticVxmlName:: RefillOptionConfirmTimeoutMaxCountExceededAnn.vxml.part -->
				<!-- @Comments:: Used to Maximum Confirmation timeout exceed message -->
      	  		<ivr:include page="<%=vxmlPath + "RefillOptionConfirmTimeoutMaxCountExceededAnn" + vxmlFileSuffix%>"/>
	      		<!--  -->
    	  		<assign name="status" expr="'FAILURE_TIMEOUT'"/>
 	     		<if cond="debug &gt; NO_DEBUG_LEVEL">
    	    		<log label="StandardVoucherRefillJSP" expr="'Ending'">StandardVoucherRefillJSP MaxTimeoutCountExceeded Exits with status = <value expr="status"/></log>
	      		</if>
    	  		<!--  -->
    	  		<goto next="#<%=MicroflowConstants.GENERAL_FORM_PREFIX%>exitModule"/>
      		</noinput>
      			<!--  -->
		 	<nomatch cond="optionConfirmationInvalidEntryCounter &lt; optionMaxInvalidRetries">
		 	<assign name="optionConfirmationInvalidEntryCounter" expr="optionConfirmationInvalidEntryCounter + 1"/>	
		 		<!-- @staticVxmlName:: RefillOptionConfirmationInvalidEntry.vxml.part -->
				<!-- @Comments:: Used to play Confirmation invalid retry message -->
          		<ivr:include page="<%=vxmlPath + "RefillOptionConfirmationInvalidEntry" + vxmlFileSuffix%>"/>
				<clear namelist="block_PlayConfirmation choice"/> 
	    	</nomatch>
     	    
     	    <nomatch cond="optionConfirmationInvalidEntryCounter == optionMaxInvalidRetries">
     	    	<!-- @staticVxmlName:: RefillOptionConfirmInvaidEntryMaxCountExceed.vxml.part -->
				<!-- @Comments:: Used to play Max Confirmation retry message -->
		    	<ivr:include page="<%=vxmlPath + "RefillOptionConfirmInvaidEntryMaxCountExceed" + vxmlFileSuffix%>"/>
   	        	<assign name="status" expr="'FAILURE_INVALID_RETRY'"/>
     			<if cond="debug &gt; NO_DEBUG_LEVEL">
     	  			<log label="StandardVoucherRefillJSP" expr="'Ending'">StandardVoucherRefillJSP MaxRetryCountExceeded Exits with status = <value expr="status"/></log>
     	 		</if>
     	 		<goto next="#<%=MicroflowConstants.GENERAL_FORM_PREFIX%>exitModule"/>
         	</nomatch>    
    	</field>
	</form>
  <%
	}
  %>	
<%-- HMTL 077 selectively generate forms for refill Option enabled ends --%>
	
	<%--BSNL 005 END --%>
  <!--Call subdialog perform refill to get refill information-->
  <!--  -->
  <!--  Form Names restored to previous one  -->
  <form id="perform_refill">
    <block name="block_perform_refill">
      <goto next="#<%=MicroflowConstants.GENERAL_FORM_PREFIX%>perform_refill"/>
    </block>
  </form>
  <!--  -->
  <form id="<%=MicroflowConstants.GENERAL_FORM_PREFIX%>perform_refill" scope="document">
	
    <block name="performRefill">
      <ivr:include page='<%=vxmlPath  + "BeforePerformRefill" + vxmlFileSuffix%>'/>
      <assign name="promptId" expr="'REF_FILLER_PROMPT_MSG'"/>
	  <logic:equal value="0" name="standardRefillActionForm" property="endDigit">
        <prompt bargein="false" >
            <audio expr="returnAudioPath(promptsetId, subscriberLanguage, promptId, versionId, debug)"/>
        </prompt>
      </logic:equal>
        <!--  -->
      <assign name="callType" expr="application.callType"/>
      <assign name="locationNumber" expr="application.locationNumber"/>
      <assign name="locationNumberNAI" expr="application.locationNumberNAI"/>
    </block>
    
    <ivr:include page="<%=jspPartPath + "Refill" + jspPartFileSuffix%>"/>
    <block name="blockData_refillDetails">
    <!--<var name="responseCode"/>  Removed this declaration as the same variable is declared at the global level-->     
        <assign name="responseCode" expr="refillDetails.responseCode"/>   
        <%--TR-HI56483-Start  --%>
        <assign name="backendResponseCode" expr="refillDetails.backendResponseCode"/>
        <if cond="debug &gt; NO_DEBUG_LEVEL">
            <log label="StandardVoucherRefillJSP">BackendResponseCode = <value expr="backendResponseCode"/></log>
        </if>
        <!-- logging module statistics -->
        <if cond="responseCode!=successCode">
	        <if cond="enableStatisticsLoggingGlobal == 'true' &amp;&amp; enableStatisticsLogging == 'true' &amp;&amp; voucherType != 'SUPERREFILL'">
				<if cond="backendResponseCode == '100' || backendResponseCode == '120' || backendResponseCode == '125' || backendResponseCode == '126'">
					<var name="dummy_statType" expr="setStatType('RefillFail')"/>
	    			<var name="dummy_voucherNumber" expr="setVoucherNumber(voucherNumber)"/>
	    			<var name="dummy_statusCode" expr="setStatusCode(backendResponseCode)"/>
				<else/>
					<if cond="backendResponseCode != '103'">
					    <var name="dummy_statType" />
		            	<if cond="voucherType == 'VALUEVOUCHERREFILL'">
		            		<assign name="dummy_statType" expr="setStatType('InvalidValVoucherNumber')"/>
		            	<else/>
		            		<assign name="dummy_statType" expr="setStatType('InvalidRefillVoucherNumber')"/>
		            	</if>
		    			<var name="dummy_voucherNumber" expr="setVoucherNumber(voucherNumber)"/>
		    			<var name="dummy_statusCode" expr="setStatusCode(backendResponseCode)"/>
	    			</if>
				</if>
			</if>
		<else/>
		  <if cond="enableStatisticsLoggingGlobal == 'true' &amp;&amp; enableStatisticsLogging == 'true' &amp;&amp; voucherType != 'SUPERREFILL'">			
		  	<var name="dummy_statType" />
	        <if cond="voucherType == 'VALUEVOUCHERREFILL'">
	            <assign name="dummy_statType" expr="setStatType('ValueVoucherRefill')"/>
	        <else/>
				<if cond="application.callingNumber != application.orig_callingNumber &amp;&amp; application.orig_callingNumber != ''">
					<assign name="dummy_statType" expr="setStatType('ThirdPartyRefill')"/>
				<else/>
		            <assign name="dummy_statType" expr="setStatType('Refill')"/>
				</if>
	        </if>
			
		    <var name="dummy_voucherNumber" expr="setVoucherNumber(voucherNumber)"/>
		    <var name="dummy_statusCode" expr="setStatusCode(backendResponseCode)"/>   	
		  </if>
		</if>
        <%--TR-HI56483-End  --%>
        <if cond="responseCode==successCode &amp;&amp; playRechargeAmount == 'false'">
          <assign name="returnVoucherType" expr="refillDetails.voucherType"/> 
          <assign name="masterAccountBalanceInFirstCurrency" expr="refillDetails.accountValue1"/>
          <assign name="absAccountBalanceInFirstCurrency" expr="refillDetails.accountValue1abs"/>
          <assign name="firstCurrencyName" expr="refillDetails.currency1"/>
          <assign name="masterAccountBalanceInSecondCurrency" expr="refillDetails.accountValue2"/>
          <assign name="absAccountBalanceInSecondCurrency" expr="refillDetails.accountValue2abs"/>
          <assign name="secondCurrencyName" expr="refillDetails.currency2"/>
          <assign name="serviceFeeExpiryDate" expr="refillDetails.serviceFeeExpiryDate"/>
          <assign name="servExpDateVsTodayDate" expr="refillDetails.servExpDateVsTodayDate"/>
          <assign name="supervisionFeeExpiryDate" expr="refillDetails.supervisionFeeExpiryDate"/>
          <assign name="supervExpDateVsTodayDate" expr="refillDetails.supervExpDateVsTodayDate"/>
          <assign name="supervExpDateVsServExpDate" expr="refillDetails.supervExpDateVsServExpDate"/>
          <assign name="rechargeAmountPromoTotal1" expr="refillDetails.rechargeAmountPromoTotal1"/>
          <assign name="rechargeAmountPromoTotal1abs" expr="refillDetails.rechargeAmountPromoTotal1abs"/>
          <assign name="rechargeAmountPromoTotal2" expr="refillDetails.rechargeAmountPromoTotal2"/>
          <assign name="rechargeAmountPromoTotal2abs" expr="refillDetails.rechargeAmountPromoTotal2abs"/>
		  <%-- For CWP EP Starts --%>
			<assign name="daTotalBalanceCurrency1" expr="refillDetails.daTotalBalanceCurrency1"/>
			<assign name="daTotalBalanceCurrency2" expr="refillDetails.daTotalBalanceCurrency2"/>
			<assign name="daTotalBalanceAbsCurrency1" expr="refillDetails.daTotalBalanceAbsCurrency1"/>
			<assign name="daTotalBalanceAbsCurrency2" expr="refillDetails.daTotalBalanceAbsCurrency2"/>			
			<%-- For CWP EP Ends --%>
          <%--TR HL45459 Start --%>
          <assign name="rechargeMainAmountPromoTotal1" expr="rechargeAmountPromoTotal1"/>
  		  <assign name="rechargeMainAmountPromoTotal1abs" expr="rechargeAmountPromoTotal1abs"/>
  		  <assign name="rechargeMainAmountPromoTotal2" expr="rechargeAmountPromoTotal2"/>
  		  <assign name="rechargeMainAmountPromoTotal2abs" expr="rechargeAmountPromoTotal2abs"/>
		  <%--TR HL45459 End --%>
          <assign name="rechargeAmountMainTotal1" expr="refillDetails.rechargeAmountMainTotal1"/>         
          <assign name="rechargeAmountMainTotal1abs"  expr="refillDetails.rechargeAmountMainTotal1abs"/>
          <assign name="rechargeAmountMainTotal2" expr="refillDetails.rechargeAmountMainTotal2"/>
          <assign name="rechargeAmountMainTotal2abs"  expr="refillDetails.rechargeAmountMainTotal2abs"/> 
          <!--  -->
          <assign name="supervisionDaysPromoExt" expr="refillDetails.supervisionDaysPromoExt"/>
          <assign name="serviceFeeDaysPromoExt" expr="refillDetails.serviceFeeDaysPromoExt"/>
          <%-- PC = STC-V001 Starts Here --%>
          <assign name="supervisionDaysTotalExt" expr="refillDetails.supervisionDaysTotalExt"/>
          <assign name="serviceFeeDaysTotalExt" expr="refillDetails.serviceFeeDaysTotalExt"/>
          <%-- PC = STC-V001 Ends Here --%>
          <assign name="promotionAnnCode" expr="refillDetails.promotionAnnCode"/>
          <%-- TR-HJ53027-Start --%>
          <assign name="creditClearanceDate" expr="refillDetails.creditClearanceDate"/>
          <assign name="creditClearanceDateVsTodayDate" expr="refillDetails.creditClearanceDateVsTodayDate"/>
          <assign name="serviceRemovalDate" expr="refillDetails.serviceRemovalDate"/>
          <assign name="serviceRemovalDateVsTodayDate" expr="refillDetails.servRemovalDateVsTodayDate"/>
          <%-- TR-HJ53027-End --%>
          <%-- value voucher data --%>
          <assign name="newServiceClass" expr="refillDetails.newServiceClass"/>
          <assign name="newServiceClassPrompt" expr="refillDetails.newServiceClassPrompt"/>
          <assign name="newOriginalServiceClass" expr="refillDetails.newOriginalServiceClass"/>
          <assign name="newOriginalServiceClassPrompt" expr="refillDetails.newOriginalServiceClassPrompt"/>
            <assign name="newExpiryDurationExt" expr="refillDetails.newExpiryDurationExt"/>
          <assign name="newExpiryDate" expr="refillDetails.newExpiryDate"/>
          
          <assign name="abRefillSupervisionExpiryDate" expr="refillDetails.abRefillSupervisionExpiryDate"/>
          <assign name="abRefillServiceFeeExpiryDate" expr="refillDetails.abRefillServiceFeeExpiryDate"/>
          <assign name="abRServExpDateVsTodayDate" expr="refillDetails.abRServExpDateVsTodayDate"/>
          <assign name="abRSupervExpDateVsTodayDate" expr="refillDetails.abRSupervExpDateVsTodayDate"/>
          <assign name="abRefillCreditClearanceDate" expr="refillDetails.abRefillCreditClearanceDate"/>
          <assign name="abRefillserviceRemovalDate" expr="refillDetails.abRefillserviceRemovalDate"/>
          <assign name="abRCreditClearanceDateVsTodayDate" expr="refillDetails.abRCreditClearanceDateVsTodayDate"/>
          <assign name="abRservRemovalDateVsTodayDate" expr="refillDetails.abRservRemovalDateVsTodayDate"/>
          <if cond="refillDetails.serviceClass != -1">
	          <assign name="serviceClassStandardRefill" expr="refillDetails.serviceClass"/>
	          <assign name="serviceClassPromptStandardRefill" expr="refillDetails.serviceClassPrompt"/>
          <else />
          	  <assign name="serviceClassStandardRefill" expr="application.serviceClass"/>
	          <assign name="serviceClassPromptStandardRefill" expr="application.serviceClassPrompt"/>
	      </if>
          <assign name="subResponseCode" expr="refillDetails.subResponseCode"/>
           <%-- PC Unia Start--%>
          <assign name="voucherGroup" expr="refillDetails.voucherGroup"/>
          <%--PC Unia End --%>
          
          <!--  Dedicated Accounts Information  -->
          <assign name="dedicatedAccountInfo" expr="refillDetails.dedicatedAccountInfo"/>
          <assign name="dedicatedAnnouncementOrder" expr="refillDetails.dedicatedAnnouncementOrder"/>
          <assign name="application.currency1" expr="firstCurrencyName"/>
          <assign name="application.currency2" expr="secondCurrencyName"/>
          <assign name="application.LAST_MODULE_TO_UPDATE_DA_INFO" expr="'Refill'"/>
          <assign name="application.REFILL_DA_INFO_STR" expr="dedicatedAccountInfo"/>
          <assign name="application.REFILL_DA_ANNOUNCEMENT_ORDER" expr="daAnnnouncementOrder"/>
          <assign name="application.REFILLINFO_DA_STR" expr="refillDetails.rechargeDABonusInfo"/>
          <!--  -->
          
		  <!--  Offers Information List  -->
	  <assign name="offerInfoListNew" expr="refillDetails.offerInfoListNew"/>
          <assign name="offerInfoListModified" expr="refillDetails.offerInfoListModified"/>
	  <assign name="application.LAST_MODULE_TO_UPDATE_OFFERS_INFO" expr="'Refill'"/>
          <assign name="application.OFFERS_NEW_STR" expr="offerInfoListNew"/>
	  <assign name="application.OFFERS_MODIFIED_STR" expr="offerInfoListModified"/>
          
          <%--UNIA Start--%>
          <assign name="dedicatedAccountInfoAfterRefill" expr="refillDetails.dedicatedAccountInfoAfterRefill"/>
          <%-- UNIA End--%>
          
          <%-- TR-HI56490-Start --%>
          <if cond="refillDetails.accountValue1 != 'NULL'">
             <assign name="application.accountValue1" expr="refillDetails.accountValue1"/>
          </if>
          <if cond="refillDetails.accountValue2 != 'NULL'">
       	     <assign name="application.accountValue2" expr="refillDetails.accountValue2"/>
       	  </if>
       	  <if cond="refillDetails.serviceFeeExpiryDate != 'NULL'">
       	     <assign name="application.serviceExpiryDate" expr="refillDetails.serviceFeeExpiryDate"/>
       	  </if>
       	  <if cond="refillDetails.supervisionFeeExpiryDate != 'NULL'">
       	     <assign name="application.airtimeExpiryDate" expr="refillDetails.supervisionFeeExpiryDate"/>
       	  </if>
       	  <if cond="refillDetails.creditClearanceDate != 'NULL'">
       	     <assign name="application.creditClearanceDate" expr="refillDetails.creditClearanceDate"/>
       	  </if>
       	  <if cond="refillDetails.serviceRemovalDate != 'NULL'">
       	     <assign name="application.serviceRemovalDate" expr="refillDetails.serviceRemovalDate"/>
       	  </if>
            <ivr:log label="StandardVoucherRefillJSP">
					Application ServiceClass = <value expr="application.serviceClass"/>
				  ||  	New Service Class = <value expr="refillDetails.newServiceClass"/>
			</ivr:log>
       	  <if cond="refillDetails.abRefillSupervisionExpiryDate != 'NULL'">
       	     <assign name="application.abRefillSupervisionExpiryDate" expr="refillDetails.abRefillSupervisionExpiryDate"/>
       	  </if>
       	  <if cond="refillDetails.abRefillServiceFeeExpiryDate != 'NULL'">
       	     <assign name="application.abRefillServiceFeeExpiryDate" expr="refillDetails.abRefillServiceFeeExpiryDate"/>
       	  </if>
       	  <if cond="refillDetails.abRefillCreditClearanceDate != 'NULL'">
       	     <assign name="application.abRefillCreditClearanceDate" expr="refillDetails.abRefillCreditClearanceDate"/>
       	  </if>
       	  <if cond="refillDetails.abRefillserviceRemovalDate != 'NULL'">
       	     <assign name="application.abRefillserviceRemovalDate" expr="refillDetails.abRefillserviceRemovalDate"/>
       	  </if>
       	  
       	  <if cond="refillDetails.serviceFeeExpiryDate == 'NULL' &amp;&amp; refillDetails.abRefillServiceFeeExpiryDate!= 'NULL'">
       	     <assign name="serviceFeeExpiryDate" expr="refillDetails.abRefillServiceFeeExpiryDate"/>
       	     <assign name="servExpDateVsTodayDate" expr="refillDetails.abRServExpDateVsTodayDate"/>       	    
       	  </if>
       	  
       	   <if cond="refillDetails.supervisionFeeExpiryDate == 'NULL' &amp;&amp; refillDetails.abRefillSupervisionExpiryDate!= 'NULL'">
       	     <assign name="supervisionFeeExpiryDate" expr="refillDetails.abRefillSupervisionExpiryDate"/>
       	     <assign name="supervExpDateVsTodayDate" expr="refillDetails.abRSupervExpDateVsTodayDate"/>       	    
       	  </if>
       	  
       	   <if cond="refillDetails.creditClearanceDate == 'NULL' &amp;&amp; refillDetails.abRefillCreditClearanceDate!= 'NULL'">
       	     <assign name="creditClearanceDate" expr="refillDetails.abRefillCreditClearanceDate"/>
       	     <assign name="creditClearanceDateVsTodayDate" expr="refillDetails.abRCreditClearanceDateVsTodayDate"/>       	    
       	  </if>
       	  
       	  <if cond="refillDetails.serviceRemovalDate == 'NULL' &amp;&amp; refillDetails.abRefillserviceRemovalDate!= 'NULL'">
       	     <assign name="serviceRemovalDate" expr="refillDetails.abRefillserviceRemovalDate"/>
       	     <assign name="serviceRemovalDateVsTodayDate" expr="refillDetails.abRservRemovalDateVsTodayDate"/>       	    
       	  </if>
       	  
       	  <%--  Commented for TR HK24445
       	  <if cond="refillDetails.newServiceClass != -1">
       	     <assign name="application.serviceClass" expr="refillDetails.newServiceClass"/>
       	  </if>
       	  --%>       	  
       	  <if cond="refillDetails.newServiceClassPrompt != 'NULL'">
       	     <assign name="application.serviceClassPrompt" expr="refillDetails.newServiceClassPrompt"/>
       	  </if>
       	  <!--  -->
          <%--  PC HP-IDEA-V002  Start  --%>
          <!--  Only moved up from the form #playValueVoucher  -->
          <if cond="application.serviceClass != newServiceClass &amp;&amp; newServiceClass!='-1'">
              <assign name="application.serviceClass" expr="newServiceClass"/>
              <assign name="serviceClassChangedFlag" expr="'Y'"/>
          </if> 
          <%--  PC HP-IDEA-V002  End  --%>
          <!--  -->
          <if cond="refillDetails.promotionsDedicatedAccount != 'NULL'">          	
       	  	<assign name="promotionsDedicatedAccount" expr="refillDetails.promotionsDedicatedAccount"/>
       	  	<assign name="rechargeDAPromoTotal1" expr="getDAPromotion_Curr1(promotionsDedicatedAccount)"/>
       	  	<assign name="rechargeDAPromoTotal1abs" expr="getDAPromotionAbs_Curr1(promotionsDedicatedAccount)"/>
       	  	<assign name="rechargeDAPromoTotal2" expr="getDAPromotion_Curr2(promotionsDedicatedAccount)"/>
       	  	<assign name="rechargeDAPromoTotal2abs" expr="getDAPromotionAbs_Curr2(promotionsDedicatedAccount)"/>
		<%-- TR : JTRAC XMEN-432 : NaN Issue if accountAfterRefill structure is not recieved in Refill Response --%>
		<%--  NULL check applied on rechargeAmountPromoTotal1 --%>
       	  	<if cond="rechargeDAPromoTotal1!= 'NULL' &amp;&amp; rechargeDAPromoTotal1!='' &amp;&amp; rechargeAmountPromoTotal1 !='NULL' &amp;&amp; rechargeAmountPromoTotal1!=''">
       	  	<assign name="rechargeAmountPromoTotal1" expr="addFloatStrings(rechargeAmountPromoTotal1,rechargeDAPromoTotal1)"/>       	  	
       	  	<assign name="rechargeAmountPromoTotal1abs" expr="addFloatStrings(rechargeAmountPromoTotal1abs,rechargeDAPromoTotal1abs)"/>     	  	
       	  	<if cond="rechargeAmountPromoTotal2!= 'NULL' &amp;&amp; rechargeAmountPromoTotal2!='' &amp;&amp; rechargeDAPromoTotal2!= 'NULL' &amp;&amp; rechargeDAPromoTotal2!=''">
				<assign name="rechargeAmountPromoTotal2" expr="addFloatStrings(rechargeAmountPromoTotal2,rechargeDAPromoTotal2)"/>
	       	  	<assign name="rechargeAmountPromoTotal2abs" expr="addFloatStrings(rechargeAmountPromoTotal2abs,rechargeDAPromoTotal2abs)"/>
       	  	</if>
			</if>
       	  </if>
       	  
       	  <%-- Starts : US 1522 - PMR826  --%>
       	  	<ivr:log label="StandardVoucherRefillJSP">Getting ReferenceDABalanceAmount
			 		masterAccountBalanceInFirstCurrency = <value expr="masterAccountBalanceInFirstCurrency"/>
			 		masterAccountBalanceInSecondCurrency = <value expr="masterAccountBalanceInSecondCurrency"/>
			 		|| dedicatedAccountInfoAfterRefill = <value expr="dedicatedAccountInfoAfterRefill"/> 
			 		|| referenceDAForMasterBalance = <value expr="referenceDAForMasterBalance"/>
			 		|| mainBalanceAccountType = <value expr="mainBalanceAccountType"/> 
			 		|| mainBalAcctTypeRefill = <value expr="mainBalAcctTypeRefill"/> 
			 </ivr:log>
 			 <assign name="currencyForPercentage" expr="'currency1'"/>
			 <assign name="referenceDA1" expr="getRefDABalanceAmount(dedicatedAccountInfoAfterRefill,referenceDAForMasterBalance,currencyForPercentage)"/>
			 <ivr:log label="StandardVoucherRefillJSP">referenceDA1 = <value expr="referenceDA1.balanceAmount"/></ivr:log>
			 <assign name="currencyForPercentage" expr="'currency2'"/>
			 <assign name="referenceDA2" expr="getRefDABalanceAmount(dedicatedAccountInfoAfterRefill,referenceDAForMasterBalance,currencyForPercentage)"/>
			 <ivr:log label="StandardVoucherRefillJSP">referenceDA2 = <value expr="referenceDA2.balanceAmount"/></ivr:log>
		 <%-- Ends : US 1522 - PMR826  --%>
          
            <ivr:log label="StandardVoucherRefillJSP">
				  ||  Setting Data Required for Refill DA
				  ||  application.currency1 = <value expr="application.currency1"/>
				  ||  application.currency2 = <value expr="application.currency2"/>
				  ||  application.REFILL_DA_INFO_STR = <value expr="application.REFILL_DA_INFO_STR"/>
				  ||  application.LAST_MODULE_TO_UPDATE_DA_INFO = <value expr="application.LAST_MODULE_TO_UPDATE_DA_INFO"/>
				  ||  application.REFILL_DA_ANNOUNCEMENT_ORDER = <value expr="application.REFILL_DA_ANNOUNCEMENT_ORDER"/>
				  ||  supervisionFeeExpiryDate = <value expr="supervisionFeeExpiryDate"/>
				  ||  creditClearanceDate = <value expr="creditClearanceDate"/>
				  ||  creditClearanceDateVsTodayDate = <value expr="creditClearanceDateVsTodayDate"/>
				  ||  serviceRemovalDate = <value expr="serviceRemovalDate"/>
				  ||  serviceRemovalDateVsTodayDate = <value expr="serviceRemovalDateVsTodayDate"/>
				  ||  application.accountValue1 = <value expr="application.accountValue1"/>
				  ||  application.accountValue2 = <value expr="application.accountValue2"/>
				  ||  application.serviceExpiryDate = <value expr="application.serviceExpiryDate"/>
				  ||  application.airtimeExpiryDate = <value expr="application.airtimeExpiryDate"/>
				  ||  application.creditClearanceDate = <value expr="application.creditClearanceDate"/>
				  ||  application.serviceRemovalDate = <value expr="application.serviceRemovalDate"/>
				  ||  application.serviceClassPrompt = <value expr="application.serviceClassPrompt"/>
				  ||  application.serviceClass = <value expr="application.serviceClass"/>
				  ||  application.abRefillSupervisionExpiryDate = <value expr="application.abRefillSupervisionExpiryDate"/>
				  ||  application.abRefillServiceFeeExpiryDate = <value expr="application.abRefillServiceFeeExpiryDate"/>
				  ||  application.abRefillCreditClearanceDate = <value expr="application.abRefillCreditClearanceDate"/>
				  ||  application.abRefillserviceRemovalDate = <value expr="application.abRefillserviceRemovalDate"/>
				  ||  newServiceClass = <value expr="newServiceClass"/>
				  ||  serviceClassChangedFlag = <value expr="serviceClassChangedFlag"/> 
				  ||  subResponseCode = <value expr="subResponseCode"/>
				  ||  voucherGroup = <value expr="voucherGroup"/>
				  ||  rechargeAmountPromoTotal1 = <value expr="rechargeAmountPromoTotal1"/>
				  ||  rechargeAmountPromoTotal1abs = <value expr="rechargeAmountPromoTotal1abs"/>
				  ||  rechargeAmountPromoTotal2 = <value expr="rechargeAmountPromoTotal2"/>
				  ||  rechargeAmountPromoTotal2abs = <value expr="rechargeAmountPromoTotal2abs"/>
				  ||  application.REFILLINFO_DA_STR = <value expr="application.REFILLINFO_DA_STR"/>
			</ivr:log>           
          <!--  -->          
            
		<ivr:include page="<%=vxmlPath + "DataPostPerformRefill" + vxmlFileSuffix%>"/>
 
          <if cond="returnVoucherType == 'VALVOUCHER' || returnVoucherType == 'SUPVALVOUCHER' || returnVoucherType == 'ERRSUPVALVOUCHER'">     
             <goto next="#<%=MicroflowConstants.GENERAL_FORM_PREFIX%>form_PostRefillAnnouncement"/>
          <elseif cond="playCompleteDADetailsFlag=='true'"/>  
             <goto next="#<%=MicroflowConstants.GENERAL_FORM_PREFIX%>form_GetBalance"/>
          <else/>
			 <goto next="#<%=MicroflowConstants.GENERAL_FORM_PREFIX%>form_PostRefillAnnouncement"/>
          </if>
          
        <elseif cond="responseCode==successCode &amp;&amp; playRechargeAmount == 'true' "/>
          <if cond="debug &gt; NO_DEBUG_LEVEL">
            <log label="StandardVoucherRefillJSP">PostPaid Successfull play :</log>
          </if>
          	   <ivr:include page="<%=vxmlPath + "StandardRefillThirdPartySuccessIntro" + vxmlFileSuffix%>"/>
        <else/>
			<if cond="debug &gt; NO_DEBUG_LEVEL">
				<log label="StandardVoucherRefillJSP">Refill response code = <value expr="responseCode"/></log>
		    </if>
          <assign name="nextFormId" expr="refillDetails.nextFormId"/>
          <assign name="subResponseCode" expr="refillDetails.subResponseCode"/>
          <if cond="responseCode==failureRetryCode">
            <assign name="retryCount" expr="retryCount + 1"/>
            <%--HP-CEL-V001 STARTS--%>
			  <assign name="refillFraudCount" expr="refillDetails.refillFraudCount"/>
  			<%--HP-CEL-V001 ENDS--%>
          </if>
		  <%-- Added for PC SBM 028--%>
		  <ivr:include page="<%=vxmlPath + "StandardRefillFailed" + vxmlFileSuffix%>"/>
          <goto expr="nextFormId"/>
        </if>
      </block>
  </form>
  <!--  -->
  <!-- -->
  <!--  -->
  <!--  Form Names restored to previous one  -->
  <form id="form_PostRefillAnnouncement">
    <block name="block_form_PostRefillAnnouncement">
      <goto next="#<%=MicroflowConstants.GENERAL_FORM_PREFIX%>form_PostRefillAnnouncement"/>
    </block>
  </form>
  <!--  -->
  <form id="<%=MicroflowConstants.GENERAL_FORM_PREFIX%>form_PostRefillAnnouncement" scope="document">
    <block>
     <if cond=" debug &gt; NO_DEBUG_LEVEL">
           	<log label="StandardVoucherRefillJSP">Return Voucher Type Is <value expr="returnVoucherType"/></log>
   	 </if>
     <if cond="returnVoucherType == 'VALVOUCHER'">
    	    <if cond=" debug &gt; NO_DEBUG_LEVEL">
           		<log label="StandardVoucherRefillJSP">Going to Play the Announcements Configured for Value Voucher Refill</log>
	   	    </if>
            <goto next="#<%=MicroflowConstants.PLAY_FORM_PREFIX%>form_PostValueVoucherAnn"/>
     <elseif cond="returnVoucherType == 'SUPVALVOUCHER' ||returnVoucherType == 'ERRSUPVALVOUCHER'"/>
			<ivr:log label="StandardVoucherRefillJSP">Going to Play the Announcements Configured for Premium Refill</ivr:log>
            <goto next="#<%=MicroflowConstants.PLAY_FORM_PREFIX%>form_PostSuperValueVoucherAnn"/>
     <else/>
			<ivr:log label="StandardVoucherRefillJSP">Going to Play the Announcements Configured for Standard Voucher Refill</ivr:log>
            <goto next="#<%=MicroflowConstants.PLAY_FORM_PREFIX%>form_PostStandardVoucherAnn"/>
     </if>     
	</block>
   </form>
  <!--  -->

  <%-- TR HL90154 starts --%>
  <form id="next_module">
	  <block name="block_gotoExitModule">
	  	 <goto next="#<%=MicroflowConstants.GENERAL_FORM_PREFIX%>exitModule"/> 
	  </block>
  </form>
  <%-- TR HL90154 Ends--%>

  <!-- Submits to next session -->
  <form id="<%=MicroflowConstants.GENERAL_FORM_PREFIX%>exitModule">
  	 <var name="statType" expr="''"/>
     <var name="voucherNumber" expr="''"/>
     <var name="statusCode" expr="''"/>
	 <var name="calledNumber" expr="application.calledNumber"/>  
	 <%-- pmr 854 change starts --%>
	<var name="loggingURL" expr="''"/>
	<%-- pmr 854 change ends --%>
	 
	 <block cond = "maxAnnouncementRepetitionTimes &gt;0 &amp;&amp; announcementRepetitionTimes &lt; maxAnnouncementRepetitionTimes &amp;&amp; announcementRepetitionTimes != -1 &amp;&amp; responseCode==successCode">
		<goto next="#<%=MicroflowConstants.GENERAL_FORM_PREFIX%>ListenAgain"/>
	 </block>
  	<block>
		<if cond="enableStatisticsLoggingGlobal == 'true' &amp;&amp; enableStatisticsLogging == 'true' &amp;&amp; voucherType != 'SUPERREFILL'">
    		<assign name="statType" expr="getStatType()"/>
    		<assign name="voucherNumber" expr="getVoucherNumber()"/>
    		<assign name="statusCode" expr="getStatusCode()"/>
			<assign name="calledNumber" expr="application.calledNumber"/>
			

			<%-- Turk 267 starts--%>
			<if cond="application.orig_callingNumber == ''">
				<log label="StandardVoucherRefillJSP">Inside StandardRefill in EXIT MODULE</log>
			</if>
			<if cond="application.callingNumber != application.orig_callingNumber &amp;&amp; application.orig_callingNumber != ''">
				<assign name="callingNumber" expr="application.orig_callingNumber"/>
			</if>
				<!-- In case of Third Party Refill, thirdparty number gets copied to callingNumber. So a new variable aCallingNumber will
				be used to keep the calling number-->
			<%-- Turk 267 ends--%> 
		</if>		
		<assign name="refillAmount1" expr="getRefillAmountResult(currency1Flag,rechargeAmountMainTotal1,rechargeAmountPromoTotal1)"/>	
		<assign name="refillAmount2" expr="getRefillAmountResult(currency2Flag,rechargeAmountMainTotal2,rechargeAmountPromoTotal2)"/>		
		<%-- PMR 854 Change Start --%>
			<if cond="application.enableRemoteStatisticsLogging=='true'">
			<assign name="loggingURL" expr="application.reportServiceURL + '/StatisticsLogger.do'"/>
			<else/>
			<assign name="loggingURL" expr="'../VXMLIVR/StatisticsLogger.do'"/>
			</if>
			<if cond="refillInfoInStatisticsLogLicenseFlag == 'false'">
				<assign name="refillAmount1" expr="''"/>
				<assign name="refillAmount2" expr="''"/>
				<assign name="thirdPartyNumber" expr="''"/>
			</if>
		<%-- PMR 854 Change Ends --%>
	</block>
	<%-- modified for PMR 854 starts --%>
		 <subdialog name="statisticsLogger" srcexpr="loggingURL" fetchtimeout="15s" namelist="statType callingNumber calledNumber voucherNumber statusCode versionId refillAmount1 refillAmount2 currentModule thirdPartyNumber" cond="enableStatisticsLoggingGlobal == 'true' &amp;&amp; enableStatisticsLogging == 'true' &amp;&amp; voucherType != 'SUPERREFILL'"/>
    <%-- modified for PMR 854 ends --%>
	<%-- Turk 267 - In above URL refillAmount1 and 2,currentmodule TPN added--%> 
	<catch event="error.badfetch">
			<ivr:log label="StandardVoucherRefillJSP">could not  do statistics logging</ivr:log>
			<goto nextitem="exit_Block"/>
		</catch>
    <block name="exit_Block">
      <if cond="status == 'SUCCESS' || status == 'SUCCESSVALUEVOUCHER' || status == 'SUCCESSSUPERVALUEVOUCHER'">
       <%-- TR HK13462 Start --%>

	   <assign name="promptId" expr="'REF_FLEXIBLE_CONC_MSG'"/>
   	   <audio expr="returnAudioPath(promptsetId, subscriberLanguage, promptId, versionId, debug)"/>

       <%-- TR HK13462 End --%>    
      </if>
      <ivr:include page='<%=vxmlPath + "NextModule" + vxmlFileSuffix%>'/>
      <!--  -->
      <if cond="debug &gt; NO_DEBUG_LEVEL">
        <log label="StandardVoucherRefillJSP">Next Module Called!!! with status=<value expr="status"/> and debug=<value expr="debug"/></log>
      </if>
      <submit next="/VXMLIVR/standardRefillExitAction.do" namelist="callType currentModule callingNumber presentationId debug status versionId"/>
    </block>
  </form>
  <!--  -->
  <!--  -->
  <!--  Form Names restored to previous one  -->
  <form id="form_GetBalance">
    <block name="block_form_GetBalance">
      <goto next="#<%=MicroflowConstants.GENERAL_FORM_PREFIX%>form_GetBalance"/>
    </block>
  </form>
  <!--  -->
  <form id="<%=MicroflowConstants.GENERAL_FORM_PREFIX%>form_GetBalance" scope="document">
    <block>
        <ivr:log label="StandardVoucherRefillJSP.form_GetBalance">
				Going to make Balance Enquiry
				  || callingNumber=<value expr="callingNumber"/>
				  ||  subscriberNAI=<value expr="subscriberNAI"/>
				  ||  debug=<value expr="debug"/>
		</ivr:log>
	  <ivr:include page="<%=vxmlPath + "DataPreGetBalanceAndDate" + vxmlFileSuffix%>"/>
    </block>  
    <ivr:include page="<%=jspPartPath + "GetBalanceAndDate" + jspPartFileSuffix%>"/>
    <!--  -->
    <block name="dataBlock_balanceDetails">
        <var name="balanceEnquiry_responseCode"/> 
        <assign name="balanceEnquiry_responseCode" expr="balanceDetails.responseCode"/>
        <if cond="balanceEnquiry_responseCode==successCode" >
            <assign name="balanceEnquiry_masterAccountBalanceInFirstCurrency" expr="balanceDetails.accountValue1"/>
            <assign name="balanceEnquiry_absAccountBalanceInFirstCurrency" expr="balanceDetails.accountValue1abs"/>  
            <assign name="balanceEnquiry_firstCurrencyName" expr="balanceDetails.currency1"/> 
            <assign name="balanceEnquiry_masterAccountBalanceInSecondCurrency" expr="balanceDetails.accountValue2"/>
            <assign name="balanceEnquiry_absAccountBalanceInSecondCurrency" expr="balanceDetails.accountValue2abs"/>
            <assign name="balanceEnquiry_secondCurrencyName" expr="balanceDetails.currency2"/>
            <assign name="balanceEnquiry_serviceFeeExpiryDate" expr="balanceDetails.serviceFeeExpiryDate"/>
            <assign name="balanceEnquiry_servExpDateVsTodayDate" expr="balanceDetails.servExpDateVsTodayDate"/>
            <assign name="balanceEnquiry_supervisionFeeExpiryDate" expr="balanceDetails.supervisionFeeExpiryDate"/>
            <assign name="balanceEnquiry_supervExpDateVsTodayDate" expr="balanceDetails.supervExpDateVsTodayDate"/>
            <assign name="balanceEnquiry_supervExpDateVsServExpDate" expr="balanceDetails.supervExpDateVsServExpDate"/>
            <assign name="balanceEnquiry_creditClearanceDate" expr="balanceDetails.creditClearanceDate"/>
            <assign name="balanceEnquiry_creditClearanceDateVsTodayDate" expr="balanceDetails.creditClearanceDateVsTodayDate"/>
            <assign name="balanceEnquiry_exitStatus" expr="balanceDetails.status"/>
            <assign name="balanceEnquiry_daDetails" expr="balanceDetails.daDetailsString"/>
            <assign name="balanceDetailsAvailable" expr="'true'"/>
        <else/>
            <if cond=" debug &gt; NO_DEBUG_LEVEL">
                <log label="StandardVoucherRefillJSP.form_GetBalance">Balance Details Not Retrievable with responseCode=<value expr="balanceEnquiry_responseCode"/></log>
            </if>
        </if>
            <ivr:log label="StandardVoucherRefillJSP.form_GetBalance">
						balanceDetailsAvailable=<value expr="balanceDetailsAvailable"/>
						  ||  Refill continuing with BalanceEnquiryTRequest responseCode=<value expr="balanceEnquiry_responseCode"/>
		    </ivr:log>
		<ivr:include page="<%=vxmlPath + "DataPostGetBalanceAndDate" + vxmlFileSuffix%>"/>
        <goto next="#<%=MicroflowConstants.GENERAL_FORM_PREFIX%>form_PostRefillAnnouncement"/>
      </block>
      <error>
		<ivr:log label="StandardVoucherRefillJSP.form_GetBalance">
			GetBalance Threw Exception
			  ||  Refill continuing with BalanceEnquiryTRequest failing due to:<value expr="_event"/>
	    </ivr:log>
        <goto next="#<%=MicroflowConstants.GENERAL_FORM_PREFIX%>form_PostRefillAnnouncement"/>
      </error>
    
  </form>
  <!--  -->
  <!--  -->
  <!--  -->
  <!--  Form Names restored to previous one  -->
  <form id="form_PostStandardVoucherAnn">
    <block name="block_form_PostStandardVoucherAnn">
      <goto next="#<%=MicroflowConstants.PLAY_FORM_PREFIX%>form_PostStandardVoucherAnn"/>
    </block>
  </form>
  <!--  -->
  <form id="<%=MicroflowConstants.PLAY_FORM_PREFIX%>form_PostStandardVoucherAnn" scope="document">
    <!--  Variables to control the sequence  of playing  -->
    <var name="playMasterAccountBalanceInFirstCurrency" expr="'false'"/>
    <var name="playMasterAccountBalanceInSecondCurrency" expr="'false'"/>
    <var name="playRefillAmountInFirstCurrency" expr="'false'"/>
    <var name="playRefillAmountInSecondCurrency" expr="'false'"/>
    <var name="playSupervisionFeeExpiryDate" expr="'false'"/>
    <var name="playServiceFeeExpiryDate" expr="'false'"/>
    <var name="playSameServiceAndSupervisionExpiryDates" expr="'false'"/>
    <var name="playRechargeBonusInFirstCurrency" expr="'false'"/>
    <var name="playRechargeBonusInSecondCurrency" expr="'false'"/>
    <var name="playOfflineBonus" expr="'false'"/>
    <var name="playPromotionServiceFeeExtentension" expr="'false'"/>
    <var name="playPromotionSupervisionExtentension" expr="'false'"/>
    <%-- PC = STC-V001 Starts Here --%>
    <var name="playSupervisionDaysTotalExtentension" expr="'false'"/>
    <var name="playServiceFeeDaysTotalExtentension" expr="'false'"/>
    <%-- PC = STC-V001 Ends Here --%>
    
    <%-- PC = HP-MTNU-V003 Starts Here --%>
    <var name="serviceClassStandard" expr="serviceClassStandardRefill"/>
  	<var name="playServiceClass" expr="'false'"/>
  	<var name="serviceClassPromptStandard" expr="serviceClassPromptStandardRefill" />
  	<%-- PC = HP-MTNU-V003 Ends Here --%>
    
    <var name="playServiceRemovalDate" expr="'false'"/>
    <var name="playCreditClearanceDate" expr="'false'"/>
    <var name="playStandardRefillDetails" expr="'true'"/>
    <var name="playDA" expr="'false'"/>
    <var name="skipToWorkflow" expr="'false'"/>
    <var name="daPlayStatus" expr=""/>
    <%-- Airip 4.0 Offer Support --%>
    <var name="playOffers" expr="'false'"/>
    <var name="playOfferStatus" expr="'false'"/>
    <!-- -->
    <!--  Standard Refill Success Intro Message  -->
    <block name="standard_voucher_success_intro">
      <if cond="accessType==accessTypeExternal">
		<assign name="playStandardRefillDetails" expr="'false'"/>
      </if>
      <ivr:include page='<%=vxmlPath + "StandardRefillSuccessIntro" + vxmlFileSuffix%>'/>
      <if cond="playStandardRefillDetails == 'false'">
        <goto nextitem="block_SetStatusAndExit"/>
      </if>
      <%
		boolean bothDateConfigured =false;
		if (stdAnnouncements.contains("SupervisionExpiry") && stdAnnouncements.contains("ServiceExpiry"))
			bothDateConfigured = true;
	  %>
	
	  <% 
        if (bothDateConfigured) { 
	  %>
    	   <assign name="bothServAndSupervDatesConfigured" expr="true"/>
	  <%  
	    } 
	  %>
      <if cond="debug &gt; NO_DEBUG_LEVEL">
        <log label="BalanceEnquiry">BothServAndSupervDatesConfigured = <value expr="bothServAndSupervDatesConfigured"/></log>
      </if>
    </block>
    
    <%-- PC Cable and wireless starts here--%>
     <jsp:include page="<%=announcementJspPath+"Announcement_TotalBalance.jsp"%>"/>	
    <%-- PC Cable and wireless Ends here--%>
	
	<%-- HMTL 077 selectively generate subdialog for Main Balance starts --%>
      <%
		if (stdAnnouncements.contains("MainBalance") || presentationIdFlag == 0) {
	  %>	
	
    <!--  Playing the Account Balance in First Currency  -->
    <subdialog name="<%=MicroflowConstants.SUBDIALOG_PLAY_HELPER_CALL_PREFIX%>sub_MasterAccountBalanceInFirstCurrency" srcexpr="standardRefillHelperVxml + '#' + playBalanceOfAccount_refill" cond="firstCurrencyName != 'NULL' &amp;&amp; masterAccountBalanceInFirstCurrency != 'NULL' &amp;&amp; playMasterAccountBalanceInFirstCurrency == 'true'">
      <param name="amount" expr="masterAccountBalanceInFirstCurrency"/>
      <param name="absAmount" expr="absAccountBalanceInFirstCurrency"/>
      <param name="currency" expr="firstCurrencyName"/>
      <param name="currencyFormat" expr="currencyFormat"/>
      <param name="subscriberLanguage" expr="subscriberLanguage"/>
      <param name="voiceBaseLanguage" expr="voiceBaseLang"/>
      <param name="promptsetId" expr="promptsetId"/>
      <param name="versionId" expr="versionId"/>
      <param name="speaker" expr="speaker"/>
      <param name="gender" expr="gender"/>
      <param name="voiceBaseURL" expr="voiceBaseURL"/>
      <param name="debug" expr="debug"/>
	  <param name="announcementType" expr="masterBalanceAnnouncement"/>
	  <%-- Starts : US 1522 - PMR826  --%>
	  <%-- Account Type Parameters Start --%>
      <param name="mainBalanceAccountType" expr="mainBalanceAccountType"/>
      <param name="appRoot" expr="application"/>
      <param name="presentationId" expr="presentationId"/>
      <param name="referenceDA1" expr="referenceDA1"/>
      <param name="referenceDA2" expr="'NULL'"/>
      <%-- Account Type Parameters End --%>
      <%-- Ends : US 1522 - PMR826  --%>
<!-- Handling for EcmaScript call :FC 154-->
      <param name="voiceBaseInterfaceVxml" expr="voiceBaseInterfaceVxml"/>
    </subdialog>
    <!--  -->
    <!--  Playing the Account Balance in Second Currency  -->
    <subdialog name="<%=MicroflowConstants.SUBDIALOG_PLAY_HELPER_CALL_PREFIX%>sub_MasterAccountBalanceInSecondCurrency" srcexpr="standardRefillHelperVxml + '#' + playBalanceOfAccount_refill" cond="secondCurrencyName != 'NULL' &amp;&amp; masterAccountBalanceInSecondCurrency != 'NULL' &amp;&amp; playMasterAccountBalanceInSecondCurrency == 'true'">
      <param name="amount" expr="masterAccountBalanceInSecondCurrency"/>
      <param name="absAmount" expr="absAccountBalanceInSecondCurrency"/>
      <param name="currency" expr="secondCurrencyName"/>
      <param name="currencyFormat" expr="currencyFormat"/>
      <param name="subscriberLanguage" expr="subscriberLanguage"/>
      <param name="voiceBaseLanguage" expr="voiceBaseLang"/>
      <param name="promptsetId" expr="promptsetId"/>
      <param name="versionId" expr="versionId"/>
      <param name="speaker" expr="speaker"/>
      <param name="gender" expr="gender"/>
      <param name="voiceBaseURL" expr="voiceBaseURL"/>
      <param name="debug" expr="debug"/>
	  <param name="announcementType" expr="masterBalanceAnnouncement"/>
	  <%-- Starts : US 1522 - PMR826  --%>
	  <%-- Account Type Parameters Start --%>
      <param name="mainBalanceAccountType" expr="mainBalanceAccountType"/>
      <param name="appRoot" expr="application"/>
      <param name="presentationId" expr="presentationId"/>
       <param name="referenceDA1" expr="'NULL'"/>
	  <param name="referenceDA2" expr="referenceDA2"/>
      <%-- Account Type Parameters End --%>
      <%-- Ends : US 1522 - PMR826  --%>
<!-- Handling for EcmaScript call :FC 154-->
      <param name="voiceBaseInterfaceVxml" expr="voiceBaseInterfaceVxml"/>
    </subdialog>
	<%  
		} 
	%>
	<%-- HMTL 077 selectively generate subdialog for Main Balance ends --%>
    <!--  -->
	
	<%-- HMTL 077 selectively generate subdialog for Supervision Fee Expiry Date starts --%>
      <%
		if (stdAnnouncements.contains("SupervisionExpiry") || presentationIdFlag == 0) {
	  %>	
	
    <!--  Playing the Supervision Fee Expiry Date  -->
    <subdialog name="<%=MicroflowConstants.SUBDIALOG_PLAY_HELPER_CALL_PREFIX%>sub_SupervisionFeeExpiryDate" srcexpr="standardRefillHelperVxml + '#' + play_SupervisionFeeExpiryDate" cond="bothServAndSupervDatesConfigured==true &amp;&amp; supervExpDateVsServExpDate != 0 &amp;&amp; playSupervisionFeeExpiryDate == 'true' || bothServAndSupervDatesConfigured==false &amp;&amp; playSupervisionFeeExpiryDate == 'true'">
      <param name="supervisionFeeExpiryDate" expr="supervisionFeeExpiryDate"/>
      <param name="supervExpDateVsTodayDate" expr="supervExpDateVsTodayDate"/>
      <param name="dateFormat" expr="dateFormat"/>
      <param name="subscriberLanguage" expr="subscriberLanguage"/>
      <param name="voiceBaseLanguage" expr="voiceBaseLang"/>
      <param name="promptsetId" expr="promptsetId"/>
      <param name="versionId" expr="versionId"/>
      <param name="speaker" expr="speaker"/>
      <param name="gender" expr="gender"/>
      <param name="creditClearanceDate" expr="creditClearanceDate"/>
      <param name="creditClearanceDateVsTodayDate" expr="creditClearanceDateVsTodayDate"/>
      <param name="serviceRemovalDate" expr="serviceRemovalDate"/>
      <param name="serviceRemovalDateVsTodayDate" expr="serviceRemovalDateVsTodayDate"/>
      <param name="creditClearanceDateAnnFlag" expr="creditClearanceDateAnnFlag"/>
      <param name="serviceRemovalDateAnnFlag" expr="serviceRemovalDateAnnFlag"/> 
      <param name="voiceBaseURL" expr="voiceBaseURL"/>
      <param name="lifeTimeValidDate" expr="lifeTimeValidDate"/>
      <param name="debug" expr="debug"/>
      <%-- Handling for EcmaScript call :FC 154--%>
      <param name="voiceBaseInterfaceVxml" expr="voiceBaseInterfaceVxml"/>
    </subdialog>
	<%  
		} 
	%>
	<%-- HMTL 077 selectively generate subdialog for Supervision Fee Expiry Date ends --%>
    <!--  -->

	<%-- HMTL 077 selectively generate subdialog for Service Fee Expiry Date starts --%>
      <%
		if (stdAnnouncements.contains("ServiceExpiry") || presentationIdFlag == 0) {
	  %>	
	
    <!--  Playing the Service Fee Expiry Date  -->
    <subdialog name="<%=MicroflowConstants.SUBDIALOG_PLAY_HELPER_CALL_PREFIX%>sub_ServiceFeeExpiryDate" srcexpr="standardRefillHelperVxml + '#' + play_ServiceFeeExpiryDate" cond="bothServAndSupervDatesConfigured==true &amp;&amp; supervExpDateVsServExpDate != 0 &amp;&amp; playServiceFeeExpiryDate == 'true' || bothServAndSupervDatesConfigured==false &amp;&amp; playServiceFeeExpiryDate == 'true'">
      <param name="serviceFeeExpiryDate" expr="serviceFeeExpiryDate"/>
      <param name="servExpDateVsTodayDate" expr="servExpDateVsTodayDate"/>
      <param name="dateFormat" expr="dateFormat"/>
      <param name="subscriberLanguage" expr="subscriberLanguage"/>
      <param name="voiceBaseLanguage" expr="voiceBaseLang"/>
      <param name="promptsetId" expr="promptsetId"/>
      <param name="versionId" expr="versionId"/>
      <param name="speaker" expr="speaker"/>
      <param name="gender" expr="gender"/>
      <param name="voiceBaseURL" expr="voiceBaseURL"/>
      <param name="lifeTimeValidDate" expr="lifeTimeValidDate"/>
      <param name="debug" expr="debug"/>
         <%-- Handling for EcmaScript call :FC 154--%>
      <param name="voiceBaseInterfaceVxml" expr="voiceBaseInterfaceVxml"/>
    </subdialog>
	<%  
		} 
	%>
	<%-- HMTL 077 generate subdialog for Service Fee Expiry Date selectively ends --%>
    <!--  -->

	<%-- HMTL 077 selectively generate subdialog for Service and Supervision Fee Expiry Dates when both are same starts --%>
	
      <%
		if ((stdAnnouncements.contains("SupervisionExpiry") && stdAnnouncements.contains("ServiceExpiry")) || presentationIdFlag == 0) {
	  %>	
	
    <!--  Playing the Service and Supervision Fee Expiry Dates when both are same  -->
    <subdialog name="<%=MicroflowConstants.SUBDIALOG_PLAY_HELPER_CALL_PREFIX%>sub_SameServiceAndSupervisionExpiryDates" srcexpr="standardRefillHelperVxml + '#' + play_SameServiceAndSupervisionExpiryDates" cond="supervExpDateVsServExpDate == 0 &amp;&amp; playSupervisionFeeExpiryDate == 'true' &amp;&amp; bothServAndSupervDatesConfigured==true || playServiceFeeExpiryDate == 'true' &amp;&amp; supervExpDateVsServExpDate == 0 &amp;&amp; bothServAndSupervDatesConfigured==true">
      <param name="expiryDate" expr="serviceFeeExpiryDate"/>
      <param name="expiryDateVsTodayDate" expr="servExpDateVsTodayDate"/>
      <param name="dateFormat" expr="dateFormat"/>
      <param name="subscriberLanguage" expr="subscriberLanguage"/>
      <param name="voiceBaseLanguage" expr="voiceBaseLang"/>
      <param name="speaker" expr="speaker"/>
      <param name="gender" expr="gender"/>
      <param name="promptsetId" expr="promptsetId"/>
      <param name="versionId" expr="versionId"/>
      <param name="creditClearanceDate" expr="creditClearanceDate"/>
      <param name="creditClearanceDateVsTodayDate" expr="creditClearanceDateVsTodayDate"/>
      <param name="serviceRemovalDate" expr="serviceRemovalDate"/>
      <param name="serviceRemovalDateVsTodayDate" expr="serviceRemovalDateVsTodayDate"/>
      <param name="creditClearanceDateAnnFlag" expr="creditClearanceDateAnnFlag"/>
      <param name="serviceRemovalDateAnnFlag" expr="serviceRemovalDateAnnFlag"/> 
      <param name="voiceBaseURL" expr="voiceBaseURL"/>
      <param name="lifeTimeValidDate" expr="lifeTimeValidDate"/>
      <param name="debug" expr="debug"/>
       <%-- Handling for EcmaScript call :FC 154--%>
      <param name="voiceBaseInterfaceVxml" expr="voiceBaseInterfaceVxml"/>
    </subdialog>
	<%  
		} 
	%>
	<%-- HMTL 077 selectively generate subdialog for Service and Supervision Fee Expiry Dates when both are same ends --%>
    <!--  -->

    <!--  -->
    <block>
      <assign name="expiryDatePlayed" expr="'true'"/>
    </block>

	<%-- HMTL 077 selectively generate subdialog for CreditClearanceDate starts --%>
	
      <%
		if (stdAnnouncements.contains("CreditClearanceDate") || presentationIdFlag == 0) {
	  %>	

	  
    <%--HP-CELTEL-V001 STARTS--%>

    	 
    <!--  Playing the Credit Clearance Date  -->
    <subdialog name="<%=MicroflowConstants.SUBDIALOG_PLAY_HELPER_CALL_PREFIX%>sub_CreditClearanceDate" srcexpr="standardRefillHelperVxml + '#' + play_CreditClearanceDate" cond="playCreditClearanceDate == 'true'">
      <param name="creditClearanceDate" expr="creditClearanceDate"/>
      <param name="creditClearanceDateVsTodayDate" expr="creditClearanceDateVsTodayDate"/>     
      <param name="serviceRemovalDate" expr="serviceRemovalDate"/>
      <param name="serviceRemovalDateVsTodayDate" expr="serviceRemovalDateVsTodayDate"/>
      <param name="serviceRemovalDateAnnFlag" expr="serviceRemovalDateAnnFlag"/> 
      <param name="dateFormat" expr="dateFormat"/>
      <param name="subscriberLanguage" expr="subscriberLanguage"/>
      <param name="voiceBaseLanguage" expr="voiceBaseLang"/>
      <param name="promptsetId" expr="promptsetId"/>
      <param name="versionId" expr="versionId"/>
      <param name="speaker" expr="speaker"/>
      <param name="gender" expr="gender"/>
      <param name="voiceBaseURL" expr="voiceBaseURL"/>
      <param name="lifeTimeValidDate" expr="lifeTimeValidDate"/>
      <param name="debug" expr="debug"/>
      <%-- Handling for EcmaScript call :FC 154--%>
      <param name="voiceBaseInterfaceVxml" expr="voiceBaseInterfaceVxml"/>
    </subdialog>

	<%  
		} 
	%>
	<%-- HMTL 077 selectively generate subdialog for CreditClearanceDate ends --%>
    <!--  -->

	<%-- HMTL 077 selectively generate subdialog for ServiceRemovalDate starts --%>
	
      <%
		if (stdAnnouncements.contains("ServiceRemovalDate") || presentationIdFlag == 0) {
	  %>	
    
    <!--  Playing the Service Removal Date  -->
    <subdialog name="<%=MicroflowConstants.SUBDIALOG_PLAY_HELPER_CALL_PREFIX%>sub_ServiceRemovalDate" srcexpr="standardRefillHelperVxml + '#' + play_ServiceRemovalDate" cond="playServiceRemovalDate == 'true'">
      <param name="serviceRemovalDate" expr="serviceRemovalDate"/>
      <param name="serviceRemovalDateVsTodayDate" expr="serviceRemovalDateVsTodayDate"/>
      <param name="dateFormat" expr="dateFormat"/>
      <param name="subscriberLanguage" expr="subscriberLanguage"/>
      <param name="voiceBaseLanguage" expr="voiceBaseLang"/>
      <param name="promptsetId" expr="promptsetId"/>
      <param name="versionId" expr="versionId"/>
      <param name="speaker" expr="speaker"/>
      <param name="gender" expr="gender"/>
      <param name="voiceBaseURL" expr="voiceBaseURL"/>
      <param name="lifeTimeValidDate" expr="lifeTimeValidDate"/>
      <param name="debug" expr="debug"/>
      <%-- Handling for EcmaScript call :FC 154--%>
      <param name="voiceBaseInterfaceVxml" expr="voiceBaseInterfaceVxml"/>
    </subdialog>
    
    <%--HP-CELTEL-V001 ENDS --%>
    <!--  -->
	<%  
		} 
	%>
	<%-- HMTL 077 selectively generate subdialog for CreditClearanceDate ends --%>
    <!--  -->

	<%-- HMTL 077 selectively generate subdialog for RechargeBonus starts --%>
	
      <%
		if (stdAnnouncements.contains("RechargeBonus") || presentationIdFlag == 0) {
	  %>	
	
    <!--  Playing the Recharge Bonus in First Currency  -->
    <subdialog name="<%=MicroflowConstants.SUBDIALOG_PLAY_HELPER_CALL_PREFIX%>sub_RechargeBonusInFirstCurrency" srcexpr="standardRefillHelperVxml + '#' + play_RechargeBonus" cond="firstCurrencyName != 'NULL' &amp;&amp; rechargeAmountPromoTotal1abs != 'NULL' &amp;&amp; playRechargeBonusInFirstCurrency == 'true'">
      <param name="amount" expr="rechargeAmountPromoTotal1"/>
      <param name="absAmount" expr="rechargeAmountPromoTotal1abs"/>
      <param name="currency" expr="firstCurrencyName"/>
      <param name="currencyFormat" expr="currencyFormat"/>
      <param name="subscriberLanguage" expr="subscriberLanguage"/>
      <param name="voiceBaseLanguage" expr="voiceBaseLang"/>
      <param name="promptsetId" expr="promptsetId"/>
      <param name="versionId" expr="versionId"/>
      <param name="speaker" expr="speaker"/>
      <param name="gender" expr="gender"/>
      <param name="voiceBaseURL" expr="voiceBaseURL"/>
      <param name="debug" expr="debug"/>
      <%-- Handling for EcmaScript call :FC 154--%>
      <param name="voiceBaseInterfaceVxml" expr="voiceBaseInterfaceVxml"/>
		<filled>
			<if cond= "announcementRepetitionTimes==-1">
				<assign name="announcementRepetitionTimes" expr="0"/> <!-- If this variable is -1 then ListenAgain will not happen. So after playing Recharge Bonus, it is set to 0-->
			</if>
		</filled>
    </subdialog>
    <!--  -->
    <!--  Playing the Recharge Bonus in Second Currency  -->
    <subdialog name="<%=MicroflowConstants.SUBDIALOG_PLAY_HELPER_CALL_PREFIX%>sub_RechargeBonusInSecondCurrency" srcexpr="standardRefillHelperVxml + '#' + play_RechargeBonus" cond="secondCurrencyName != 'NULL' &amp;&amp; rechargeAmountPromoTotal2abs != 'NULL' &amp;&amp; rechargeAmountPromoTotal2abs!='' &amp;&amp; playRechargeBonusInSecondCurrency == 'true'">
      <param name="amount" expr="rechargeAmountPromoTotal2"/>
      <param name="absAmount" expr="rechargeAmountPromoTotal2abs"/>
      <param name="currency" expr="secondCurrencyName"/>
      <param name="currencyFormat" expr="currencyFormat"/>
      <param name="subscriberLanguage" expr="subscriberLanguage"/>
      <param name="voiceBaseLanguage" expr="voiceBaseLang"/>
      <param name="promptsetId" expr="promptsetId"/>
      <param name="versionId" expr="versionId"/>
      <param name="speaker" expr="speaker"/>
      <param name="gender" expr="gender"/>
      <param name="voiceBaseURL" expr="voiceBaseURL"/>
      <param name="debug" expr="debug"/>
      <%-- Handling for EcmaScript call :FC 154--%>
      <param name="voiceBaseInterfaceVxml" expr="voiceBaseInterfaceVxml"/>
		<filled>
			<if cond= "announcementRepetitionTimes==-1">
				<assign name="announcementRepetitionTimes" expr="0"/> <!-- If this variable is -1 then ListenAgain will not happen. So after playing Recharge Bonus, it is set to 0-->
			</if>
		</filled>
    </subdialog>

	<%  
		} 
	%>
	<%-- HMTL 077 selectively generate subdialog for RechargeBonus ends --%>
    <!--  -->

	<%-- HMTL 077 selectively generate subdialog for RefillAmount starts --%>
	
      <%
		if (stdAnnouncements.contains("RefillAmount") || presentationIdFlag == 0) {
	  %>	
	
    <!--  Playing the Refill amount of Voucher in First Currency  -->
    <subdialog name="<%=MicroflowConstants.SUBDIALOG_PLAY_HELPER_CALL_PREFIX%>sub_RefillAmountInFirstCurrency" srcexpr="standardRefillHelperVxml + '#' + play_RefillAmount" cond="firstCurrencyName != 'NULL' &amp;&amp; rechargeAmountMainTotal1abs != 'NULL' &amp;&amp; playRefillAmountInFirstCurrency == 'true'">
        <param name="amount" expr=" rechargeAmountMainTotal1 "/>
        <param name="absAmount" expr="rechargeAmountMainTotal1abs "/>
        <param name="currency" expr="firstCurrencyName"/>
        <param name="currencyFormat" expr="currencyFormat"/>
        <param name="subscriberLanguage" expr="subscriberLanguage"/>
        <param name="voiceBaseLanguage" expr="voiceBaseLang"/>
        <param name="promptsetId" expr="promptsetId"/>
        <param name="versionId" expr="versionId"/>
        <param name="speaker" expr="speaker"/>
        <param name="gender" expr="gender"/>
        <param name="voiceBaseURL" expr="voiceBaseURL"/>
        <param name="debug" expr="debug"/>
      <%-- Handling for EcmaScript call :FC 154--%>
      <param name="voiceBaseInterfaceVxml" expr="voiceBaseInterfaceVxml"/>
    </subdialog>
    <!--  -->
    <!--  Playing the Refill amount of Voucher in Second Currency  -->
    <subdialog name="<%=MicroflowConstants.SUBDIALOG_PLAY_HELPER_CALL_PREFIX%>sub_RefillAmountInSecondCurrency" srcexpr="standardRefillHelperVxml + '#' + play_RefillAmount" cond="secondCurrencyName != 'NULL' &amp;&amp; rechargeAmountMainTotal2abs != 'NULL' &amp;&amp; playRefillAmountInSecondCurrency == 'true'">
        <param name="amount" expr=" rechargeAmountMainTotal2 "/>
        <param name="absAmount" expr="rechargeAmountMainTotal2abs "/>
        <param name="currency" expr="secondCurrencyName"/>
        <param name="currencyFormat" expr="currencyFormat"/>
        <param name="subscriberLanguage" expr="subscriberLanguage"/>
        <param name="voiceBaseLanguage" expr="voiceBaseLang"/>
        <param name="promptsetId" expr="promptsetId"/>
        <param name="versionId" expr="versionId"/>
        <param name="speaker" expr="speaker"/>
        <param name="gender" expr="gender"/>
        <param name="voiceBaseURL" expr="voiceBaseURL"/>
        <param name="debug" expr="debug"/>
       <%-- Handling for EcmaScript call :FC 154--%>
      <param name="voiceBaseInterfaceVxml" expr="voiceBaseInterfaceVxml"/>
    </subdialog>
	
	<%  
		} 
	%>
	<%-- HMTL 077 selectively generate subdialog for RefillAmount ends --%>
    <!--  -->

    <block name="playAnn_OfflineBonus" cond="playOfflineBonus == 'true'">
      <if cond="debug &gt; NO_DEBUG_LEVEL">
        <log label="StandardVoucherRefillJSP">Standard Refill - playOfflineBonus</log>
      </if>
      <!--  -->
      <if cond="promotionAnnCode == '' || promotionAnnCode == '0' || promotionAnnCode == '00'">
        <assign name="PromotionsFlag" expr="'false'"/>
      <else/>
        <assign name="PromotionsFlag" expr="'true'"/>
        <assign name="promptId" expr="'REF_PROMOTION_' + promotionAnnCode"/>
        <audio expr="returnAudioPath(promptsetId, subscriberLanguage, promptId, versionId, debug)"/>
      </if>
      <!--  -->
        <ivr:log label="StandardVoucherRefillJSP">
				PromotionsFlag = <value expr="PromotionsFlag"/>
				  ||  PromptId played = <value expr="promptId"/>
	    </ivr:log>
    </block>
	
	<%-- HMTL 077 selectively generate subdialog for PromotionServiceFeeExtension starts --%>
	
      <%
		if (stdAnnouncements.contains("PromotionServiceFeeExtension") || presentationIdFlag == 0) {
	  %>	
	
    <!-- Playing the Promotion Service Fee Extension -->
        <%-- TR-HJ79885-Start condition serviceFeeDaysPromoExt != 0 changed to serviceFeeDaysPromoExt &gt; 0 --%>
    <subdialog name="<%=MicroflowConstants.SUBDIALOG_PLAY_HELPER_CALL_PREFIX%>sub_PromotionServiceFeeExtentension" srcexpr="standardRefillHelperVxml + '#' + play_ServiceFeeExtentensionMsg" cond="serviceFeeDaysPromoExt &gt; 0 &amp;&amp; playPromotionServiceFeeExtentension == 'true'">
      <param name="promoExtDays" expr="serviceFeeDaysPromoExt"/>
      <param name="subscriberLanguage" expr="subscriberLanguage"/>
      <param name="voiceBaseLanguage" expr="voiceBaseLang"/>
      <param name="promptsetId" expr="promptsetId"/>
      <param name="versionId" expr="versionId"/>
      <param name="speaker" expr="speaker"/>
      <param name="gender" expr="gender"/>
      <param name="voiceBaseURL" expr="voiceBaseURL"/>
      <param name="debug" expr="debug"/>
      <%-- Handling for EcmaScript call :FC 154--%>
      <param name="voiceBaseInterfaceVxml" expr="voiceBaseInterfaceVxml"/>
    </subdialog>
	<%  
		} 
	%>
	<%-- HMTL 077 selectively generate subdialog for PromotionServiceFeeExtension ends --%>
    <!--  -->	

	<%-- HMTL 077 selectively generate subdialog for PromotionSupervisionFeeExtension starts --%>
	
      <%
		if (stdAnnouncements.contains("PromotionSupervisionFeeExtension") || presentationIdFlag == 0) {
	  %>	
	
    <!-- Playing the Promotion Supervision Fee Extension -->
    <%-- TR-HJ79885-Start condition supervisionDaysPromoExt != 0 changed to supervisionDaysPromoExt &gt; 0 --%>
    <subdialog name="<%=MicroflowConstants.SUBDIALOG_PLAY_HELPER_CALL_PREFIX%>sub_PromotionSupervisionExtentension" srcexpr="standardRefillHelperVxml + '#' + play_SupervisionFeeExtentensionMsg" cond="supervisionDaysPromoExt &gt; 0 &amp;&amp; playPromotionSupervisionExtentension == 'true'">
      <param name="promoExtDays" expr="supervisionDaysPromoExt"/>
      <param name="subscriberLanguage" expr="subscriberLanguage"/>
      <param name="voiceBaseLanguage" expr="voiceBaseLang"/>
      <param name="promptsetId" expr="promptsetId"/>
      <param name="versionId" expr="versionId"/>
      <param name="speaker" expr="speaker"/>
      <param name="gender" expr="gender"/>
      <param name="voiceBaseURL" expr="voiceBaseURL"/>
      <param name="debug" expr="debug"/>
       <%-- Handling for EcmaScript call :FC 154--%>
      <param name="voiceBaseInterfaceVxml" expr="voiceBaseInterfaceVxml"/>
    </subdialog>
	<%  
		} 
	%>
	<%-- HMTL 077 selectively generate subdialog for PromotionSupervisionFeeExtension ends --%>
    <!--  -->	

	<%-- HMTL 077 selectively generate subdialog for SupervisionDaysTotalExtentension starts --%>
	
      <%
		if (stdAnnouncements.contains("SupervisionDaysTotalExtentension") || presentationIdFlag == 0) {
	  %>	

    <%-- PC = STC-V001 Starts Here --%>
    <subdialog name="<%=MicroflowConstants.SUBDIALOG_PLAY_HELPER_CALL_PREFIX%>sub_SupervisionDaysTotalExtentension" srcexpr="standardRefillHelperVxml + '#' + play_SupervisionDaysTotalExtentensionMsg" cond="supervisionDaysTotalExt &gt; 0 &amp;&amp; playSupervisionDaysTotalExtentension == 'true'">
      <param name="promoExtDays" expr="supervisionDaysTotalExt"/>
      <param name="subscriberLanguage" expr="subscriberLanguage"/>
      <param name="voiceBaseLanguage" expr="voiceBaseLang"/>
      <param name="promptsetId" expr="promptsetId"/>
      <param name="versionId" expr="versionId"/>
      <param name="speaker" expr="speaker"/>
      <param name="gender" expr="gender"/>
      <param name="voiceBaseURL" expr="voiceBaseURL"/>
      <param name="debug" expr="debug"/>
       <%-- Handling for EcmaScript call :FC 154--%>
      <param name="voiceBaseInterfaceVxml" expr="voiceBaseInterfaceVxml"/>
    </subdialog>

	<%  
		} 
	%>
	<%-- HMTL 077 selectively generate subdialog for SupervisionDaysTotalExtentension ends --%>
    <!--  -->	

	<%-- HMTL 077 selectively generate subdialog for ServiceFeeDaysTotalExtentension starts --%>
	
      <%
		if (stdAnnouncements.contains("ServiceFeeDaysTotalExtentension") || presentationIdFlag == 0) {
	  %>	
    
    <subdialog name="<%=MicroflowConstants.SUBDIALOG_PLAY_HELPER_CALL_PREFIX%>sub_ServiceFeeDaysTotalExtentension" srcexpr="standardRefillHelperVxml + '#' + play_ServiceFeeDaysTotalExtentensionMsg" cond="serviceFeeDaysTotalExt &gt; 0 &amp;&amp; playServiceFeeDaysTotalExtentension == 'true'">
      <param name="promoExtDays" expr="serviceFeeDaysTotalExt"/>
      <param name="subscriberLanguage" expr="subscriberLanguage"/>
      <param name="voiceBaseLanguage" expr="voiceBaseLang"/>
      <param name="promptsetId" expr="promptsetId"/>
      <param name="versionId" expr="versionId"/>
      <param name="speaker" expr="speaker"/>
      <param name="gender" expr="gender"/>
      <param name="voiceBaseURL" expr="voiceBaseURL"/>
      <param name="debug" expr="debug"/>
       <%-- Handling for EcmaScript call :FC 154--%>
      <param name="voiceBaseInterfaceVxml" expr="voiceBaseInterfaceVxml"/>
    </subdialog>
	<%  
		} 
	%>
	<%-- HMTL 077 selectively generate subdialog for ServiceFeeDaysTotalExtentension ends --%>
    <!--  -->	

    <%-- PC = STC-V001 Ends Here --%>  
	 <%
		if (stdAnnouncements.contains("DedicatedAccount") || presentationIdFlag == 0) {
	  %>	
    <%-- As of US:197.The call of DA main will always be through a subdialog. --%>
    <subdialog name="<%=MicroflowConstants.SUBDIALOG_INTER_MODULE_CALL_PREFIX%>sub_daPlayCall" fetchtimeout="15s" srcexpr="'/VXMLIVR/DedicatedAccount.do?externalAnnouncementOrder='+daAnnnouncementOrder+'&amp;presentationId='+presentationId+'&amp;debug='+debug+'&amp;versionId='+versionId+'&amp;configurationId='+configurationId"
      cond="playDA == 'true'">
      <param name="appRootFromSubdialog" expr="application"/>
      <!--  -->
      <filled>
	  <assign name="skipToWorkflow" expr="<%=MicroflowConstants.SUBDIALOG_INTER_MODULE_CALL_PREFIX%>sub_daPlayCall.skipToWorkflow"/>
	  <assign name="daPlayStatus" expr="<%=MicroflowConstants.SUBDIALOG_INTER_MODULE_CALL_PREFIX%>sub_daPlayCall.status"/>
	  <ivr:log label="StandardVoucherRefillJSP">
			After Return from DA Play, status = <value expr="daPlayStatus"/>
			  ||  After Return from DA Play, skipToWorkflow = <value expr="skipToWorkflow"/>
		</ivr:log>
	  <if cond="skipToWorkflow == 'true'">
	      <goto nextitem="block_SetStatusAndExit"/>		        
	  </if>
     </filled>
    </subdialog>
    <%  
		} 
	%>
	<subdialog name="sub_offersPlayCall" fetchtimeout="15s" srcexpr="'/VXMLIVR/OffersAction.do?presentationId='+presentationId+'&amp;debug='+debug+'&amp;versionId='+versionId+OptionalParametersString" cond="playOffers == 'true'">
		<param name="appRootFromSubdialog" expr="application"/>
		<!--  -->
		<filled>
			<assign name="playOfferStatus" expr="sub_offersPlayCall.status"/>
			<if cond="debug > NO_DEBUG_LEVEL">
				<log label="StandardVoucherRefillJSP">After Return from Offers Play, status = <value expr="playOfferStatus"/></log>
			</if>
		</filled>
	</subdialog>

	<%-- HMTL 077 selectively generate subdialog for ServiceClass starts --%>
	
      <%
		if (stdAnnouncements.contains("ServiceClass") || presentationIdFlag == 0) {
	  %>	
    
    <%-- PC = HP-MTNU-V003 Starts Here --%>
    <!-- Playing the Service Class  -->
    <subdialog name="<%=MicroflowConstants.SUBDIALOG_PLAY_HELPER_CALL_PREFIX%>sub_ServiceClass" srcexpr="standardRefillHelperVxml + '#' + play_ServiceClass" cond="playServiceClass == 'true'">
      <param name="serviceClass" expr="serviceClassStandard"/>
      <param name="serviceClassPrompt" expr="serviceClassPromptStandard"/>
      <param name="subscriberLanguage" expr="subscriberLanguage"/>
      <param name="voiceBaseLanguage" expr="voiceBaseLanguage"/>
      <param name="speaker" expr="speaker"/>
      <param name="gender" expr="gender"/>
      <param name="versionId" expr="versionId"/>
      <param name="promptsetId" expr="promptsetId"/>
      <param name="debug" expr="debug"/>
      <param name="voiceBaseURL" expr="voiceBaseURL"/>
	  <%-- Handling for EcmaScript call :FC 154--%>
      <param name="voiceBaseInterfaceVxml" expr="voiceBaseInterfaceVxml"/>
    </subdialog>
    <%-- PC = HP-MTNU-V003 Ends Here --%>
	<%  
		} 
	%>
	<%-- HMTL 077 selectively generate subdialog for ServiceClass ends --%>	
    <!--  -->
	
    <logic:iterate id="eachAnnouncementForm" name="standardRefillActionForm" property="announcementForms" type="java.lang.String">
    	<%--  TR-HJ72493-Start  --%>
    	<field name="dummyField_For_Refill_<%=i%>">
             <grammar version="1.0" src="<%= "/VXMLIVR/grammarFiles/local/Everything.grxml"+"?versionId="+request.getParameter("versionId") %>" mode="dtmf"/>
		     <prompt timeout="0s"/>
		     <catch event="noinput">
		       <!-- if no input from the user, skip this field -->
		       <if cond="debug &gt; NO_DEBUG_LEVEL">
		         <log label="StandardVoucherRefillJSP">Skipping dummyField_For_Refill</log>
		       </if>
		       <assign name="dummyField_For_Refill_<%=i%>" expr="true"/>
		      </catch>
		      <filled>
		        <if cond="debug &gt; NO_DEBUG_LEVEL">
		          <log label="StandardVoucherRefillJSP">DTMF Entered While Playing Successfull Refill Announcements  = <value expr="dummyField_For_Refill_<%=i%>"/></log>
		        </if>
		        <goto nextitem="block_SetStatusAndExit"/>
		     </filled>   
         </field>
        <%++i;%>
      <%-- TR-HJ72493-End --%>
      <ivr:include page="<%=vxmlPath + eachAnnouncementForm + vxmlFileSuffix%>"/>
    </logic:iterate>
    <block name="block_SetStatusAndExit">   
	 <%-- ETI-071 --%>
		<if cond="refillRepromptEnabled == 'true'">
			<assign name="refillRetriesExceedPromptId" expr="'REF_MAX_RE_REFILL_EXCEEDED_MSG'"/>
			<goto next="#<%=MicroflowConstants.GENERAL_FORM_PREFIX%>newPinVoucher"/>
		</if>
	   <%-- ETI-071 ends --%>
	  <assign name="status" expr="'SUCCESS'"/>      
      <!-- Play Standard refill Conclusion prompt -->   
   	   <ivr:include page='<%=vxmlPath + "playStandardRefillConclusion" + vxmlFileSuffix%>'/>
      <if cond="debug &gt; NO_DEBUG_LEVEL">
		<log label="StandardVoucherRefillJSP">Going to next module with status <value expr="status"/></log>
      </if>           
      <goto next="#<%=MicroflowConstants.GENERAL_FORM_PREFIX%>exitModule"/>
    </block>
  </form>
  <!-- -->
   <!--  -->
  <!--  -->
  <!--  Form Names restored to previous one  -->
  <form id="form_PostValueVoucherAnn">
    <block name="block_form_PostValueVoucherAnn">
      <goto next="#<%=MicroflowConstants.PLAY_FORM_PREFIX%>form_PostValueVoucherAnn"/>
    </block>
  </form>
  <!--  -->
  <form id="<%=MicroflowConstants.PLAY_FORM_PREFIX%>form_PostValueVoucherAnn" scope="document">
  	<!--  -->
  	 <var name="playValueVoucherDeatails" expr="'true'"/>
  	 <!--  -->
    <!--  Value Voucher Success Intro Message  -->
    <block name="value_voucher_success_intro">
    <!--  -->
		  <ivr:log label="StandardVoucherRefillJSP">Play Value Voucher
				 application.serviceClass = <value expr="application.serviceClass"/>
				  ||  newServiceClass = <value expr="newServiceClass"/>
		 </ivr:log>
        <%-- Commented for IDEA , place in upper side
            <if cond="application.serviceClass != newServiceClass &amp;&amp; newServiceClass!='-1'">
              <assign name="application.serviceClass" expr="newServiceClass"/>
              <assign name="serviceClassChangedFlag" expr="'Y'"/>
      	</if>  --%>
      	<!--  -->
     	<if cond="accessType==accessTypeExternal">
			<assign name="playValueVoucherDeatails" expr="'false'"/>
      	</if>
            <ivr:include page='<%=vxmlPath + "ValueVoucherSuccessIntro" + vxmlFileSuffix%>'/>
       	<if cond="playValueVoucherDeatails == 'false'">
       		<goto nextitem="block_SetStatusAndExit"/>
      	</if>
      	<%--TR HK14947 Start --%>
      	<if cond="newExpiryDurationExt == 'NULL' || newExpiryDurationExt == ''">
		  <assign name="block_ValueVoucherDurationExtension" expr="'false'"/>
		</if>   
		<%--TR HK14947 End --%>  
    </block>

	<%-- HMTL 077 selectively generate subdialog for ValueVoucherDurationExtension starts --%>
	
      <%
		if (vVAnnouncementForms.contains("ValueVoucherDurationExtension") || presentationIdFlag == 0) {
	  %>	
	
    <%-- HI-BHA-GAPS Starts --%>
    <!-- Play number  of days -->
    <subdialog name="<%=MicroflowConstants.SUBDIALOG_VB_CALL_PREFIX%>sub_PlayValueVoucherDaysExtension" srcexpr="voiceBaseInterfaceVxml + '?versionId='+versionId +'#' + playDuration" cond="ValueVoucherExpiryDurationExt != 'NULL' &amp;&amp; playValueVoucherDaysExtension == true">
      <param name="arg" expr="ValueVoucherExpiryDurationExt"/>
      <param name="format" expr="formatDuration"/>          
      <param name="lang" expr="application.voiceBaseLanguage"/>
      <param name="speaker" expr="speaker"></param>
      <param name="gender" expr="application.gender"></param>
      <param name="type"    expr="'duration'"/>
      <param name="debug" expr="application.debug"></param>
      <param name="versionId" expr="application.versionId"></param>
      <param name="ivrlanguage" expr="application.subscriberLanguage"></param>
      <param name="voiceBaseURL" expr="voiceBaseURL"/>
    </subdialog>
	<%  
		} 
	%>
	<%-- HMTL 077 selectively generate subdialog for ValueVoucherDurationExtension ends --%>	
    <!--  -->	

	<%-- HMTL 077 selectively generate subdialog for ValueVoucherExpiryDate starts --%>
	
      <%
		if (vVAnnouncementForms.contains("ValueVoucherExpiryDate") || presentationIdFlag == 0) {
	  %>	
	
    <!-- Play the expiry fees date  -->
    <subdialog name="<%=MicroflowConstants.SUBDIALOG_VB_CALL_PREFIX%>sub_PlayValueVoucherExpiryDate" srcexpr="voiceBaseInterfaceVxml + '?versionId='+versionId +'#' + playDateSubdialogName" cond="valueVoucherNewExpiryDate != 'NULL' &amp;&amp; playValueVoucherExpiryDate == true" >
      <param name="arg"     expr="valueVoucherNewExpiryDate"/>
      <param name="format"  expr="dateFormat"/>
      <param name="lang"    expr="application.voiceBaseLanguage"/>
      <param name="speaker" expr="speaker"/>
      <param name="gender"  expr="application.gender"/>
      <param name="type"    expr="'date'"/>
      <param name="debug" expr="application.debug"></param>
      <param name="versionId" expr="application.versionId"></param>
      <param name="ivrlanguage" expr="application.subscriberLanguage"></param>
      <param name="voiceBaseURL" expr="voiceBaseURL"/>
    </subdialog>
	<%  
		} 
	%>
	<%-- HMTL 077 selectively generate subdialog for ValueVoucherExpiryDate ends --%>		
	
    <%-- HI-BHA-GAPS Ends --%>
    
        
    <!--  -->
    <logic:iterate id="valueVoucherAnnouncementForms" name="standardRefillActionForm" property="valueVoucherAnnouncementForms" type="java.lang.String">
    	<%---  TR-HJ72493-Start  --%>
    	<field name="dummyField_For_Refill_<%=i%>">
             <grammar version="1.0" src="<%= "/VXMLIVR/grammarFiles/local/Everything.grxml"+"?versionId="+request.getParameter("versionId") %>" mode="dtmf"/>
		     <prompt timeout="0s"/>
		     <catch event="noinput">
		       <!-- if no input from the user, skip this field -->
		       <if cond="debug &gt; NO_DEBUG_LEVEL">
		         <log label="StandardVoucherRefillJSP">Skipping dummyField_For_Refill</log>
		       </if>
		       <assign name="dummyField_For_Refill_<%=i%>" expr="true"/>
		      </catch>
		      <filled>
				<if cond="debug &gt; NO_DEBUG_LEVEL">
		          <log label="StandardVoucherRefillJSP">DTMF Entered While Playing Successfull Refill Announcements  = <value expr="dummyField_For_Refill_<%=i%>"/></log>
		        </if>
		        <goto nextitem="block_SetStatusAndExit"/>
		     </filled>   
         </field>
        <%++i;%>
      <%-- TR-HJ72493-End --%>
      <ivr:include page="<%=vxmlPath + valueVoucherAnnouncementForms + vxmlFileSuffix%>"/>
    </logic:iterate>
    
    <block name="block_SetStatusAndExit"> 

		

		
               <assign name="status" expr="'SUCCESSVALUEVOUCHER'"/>
      <!-- Play Value Voucher refill Conclusion prompt -->  
        <ivr:include page='<%=vxmlPath + "playValueVoucherConclusion" + vxmlFileSuffix%>'/>
       <if cond="debug &gt; NO_DEBUG_LEVEL">
		<log label="StandardVoucherRefillJSP">Going to next module with status <value expr="status"/></log>
	  </if>
      <goto next="#<%=MicroflowConstants.GENERAL_FORM_PREFIX%>exitModule"/>
    </block>
  </form>
   <!--  -->
  <!--  -->
  <!--  Form Names restored to previous one  -->
  <form id="form_PostSuperValueVoucherAnn">
    <block name="block_form_PostSuperValueVoucherAnn">
      <goto next="#<%=MicroflowConstants.PLAY_FORM_PREFIX%>form_PostSuperValueVoucherAnn"/>
    </block>
  </form>
  <!--  -->
  <form id="<%=MicroflowConstants.PLAY_FORM_PREFIX%>form_PostSuperValueVoucherAnn" scope="document">
    <!--  Variables to control the sequence  of playing  -->
    <var name="playMasterAccountBalanceInFirstCurrency" expr="'false'"/>
    <var name="playMasterAccountBalanceInSecondCurrency" expr="'false'"/>
    <var name="playRefillAmountInFirstCurrency" expr="'false'"/>
    <var name="playRefillAmountInSecondCurrency" expr="'false'"/>
    <var name="playSupervisionFeeExpiryDate" expr="'false'"/>
    <var name="playServiceFeeExpiryDate" expr="'false'"/>
    <var name="playSameServiceAndSupervisionExpiryDates" expr="'false'"/>
    <var name="playRechargeBonusInFirstCurrency" expr="'false'"/>
    <var name="playRechargeBonusInSecondCurrency" expr="'false'"/>
    <var name="playOfflineBonus" expr="'false'"/>
    <var name="playPromotionServiceFeeExtentension" expr="'false'"/>
    <var name="playPromotionSupervisionExtentension" expr="'false'"/>
    <var name="playServiceRemovalDate" expr="'false'"/>
    <var name="playCreditClearanceDate" expr="'false'"/>
    <var name="playSuperRefillDetails" expr="'true'"/>
	<var name="playMsisdn" expr="'false'"/>
    
    <%-- PC = STC-V001 Starts Here --%>
    <var name="playSupervisionDaysTotalExtentension" expr="'false'"/>
    <var name="playServiceFeeDaysTotalExtentension" expr="'false'"/>
    <%-- PC = STC-V001 Ends Here --%>
    <var name="playDA" expr="'false'"/>
    <var name="skipToWorkflow" expr="'false'"/>
    <var name="daPlayStatus" expr=""/>
    <%-- Airip 4.0 Offer Support --%>
    <var name="playOffers" expr="'false'"/>
    <var name="playOfferStatus" expr="'false'"/>
   
    <!--  Premium Voucher Success Intro Message  -->
    <block name="premium_voucher_success_intro">
      <!-- -->
         <ivr:log label="StandardVoucherRefillJSP">
			Play Premium Refill
			  ||   application.serviceClass = <value expr="application.serviceClass"/>
			  ||  newServiceClass = <value expr="newServiceClass"/>
		 </ivr:log>
      <!--  -->
      <if cond="application.serviceClass != newServiceClass &amp;&amp; newServiceClass!='-1'">
         <assign name="application.serviceClass" expr="newServiceClass"/>
         <assign name="serviceClassChangedFlag" expr="'Y'"/>
      </if> 
      <!-- -->
      <if cond="returnVoucherType == 'ERRSUPVALVOUCHER'">
        	<ivr:log label="StandardVoucherRefillJSP">Going to Play Error Message</ivr:log>
			<goto next="#<%=MicroflowConstants.ERROR_FORM_PREFIX%>playSuperValueVoucherErr"/>      
         </if>      
    
	  <if cond="accessType==accessTypeExternal">
		<assign name="playSuperRefillDetails" expr="'false'"/>
      </if>
      <!-- -->
         <ivr:include page='<%=vxmlPath + "SuperValueVoucherSuccessIntro" + vxmlFileSuffix%>'/>
      <!-- -->
      <if cond="playSuperRefillDetails == 'false'">
       <goto nextitem="block_SetStatusAndExit"/>
      </if>
      <%--TR HK14947 Start --%>
      	<if cond="newExpiryDurationExt == 'NULL' || newExpiryDurationExt == ''">
		  <assign name="block_ValueVoucherDurationExtension" expr="'false'"/>
		</if>   
	  <%--TR HK14947 End --%>  
	  
      <%
		boolean bothDatesConfigured =false;
		if (premiumAnnouncements.contains("ServiceExpiry") && premiumAnnouncements.contains("SupervisionExpiry"))
			bothDatesConfigured = true;
	  %>
	
	  <% 
        if (bothDatesConfigured) { 
	  %>
    	   <assign name="bothServAndSupervDatesConfigured" expr="true"/>
	  <%  
	    } 
	  %>
		<ivr:log label="StandardRefill">BothServAndSupervDatesConfigured = <value expr="bothServAndSupervDatesConfigured"/></ivr:log>
    </block>
	
	<%-- PC Cable and wireless starts here--%>
     <jsp:include page="<%=announcementJspPath+"Announcement_TotalBalance.jsp"%>"/>	
    <%-- PC Cable and wireless Ends here--%>

	<%-- HMTL 077 selectively generate subdialog for MainBalance starts --%>
	
      <%
		if (premiumAnnouncements.contains("MainBalance") || presentationIdFlag == 0) {
	  %>	
	
    <!--  Playing the Account Balance in First Currency  -->
    <subdialog name="<%=MicroflowConstants.SUBDIALOG_PLAY_HELPER_CALL_PREFIX%>sub_MasterAccountBalanceInFirstCurrency" srcexpr="standardRefillHelperVxml + '#' + playBalanceOfAccount_refill" cond="firstCurrencyName != 'NULL' &amp;&amp; masterAccountBalanceInFirstCurrency != 'NULL' &amp;&amp; playMasterAccountBalanceInFirstCurrency == 'true'">
      <param name="amount" expr="masterAccountBalanceInFirstCurrency"/>
      <param name="absAmount" expr="absAccountBalanceInFirstCurrency"/>
      <param name="currency" expr="firstCurrencyName"/>
      <param name="currencyFormat" expr="currencyFormat"/>
      <param name="subscriberLanguage" expr="subscriberLanguage"/>
      <param name="voiceBaseLanguage" expr="voiceBaseLang"/>
      <param name="promptsetId" expr="promptsetId"/>
      <param name="versionId" expr="versionId"/>
      <param name="speaker" expr="speaker"/>
      <param name="gender" expr="gender"/>
      <param name="voiceBaseURL" expr="voiceBaseURL"/>
      <param name="debug" expr="debug"/>
	  <param name="announcementType" expr="masterBalanceAnnouncement"/>
	   <%-- Starts : US 1522 - PMR826  --%>
	   <%-- Account Type Parameters Start --%>
      <param name="mainBalanceAccountType" expr="mainBalAcctTypeRefill"/>
      <param name="appRoot" expr="application"/>
      <param name="presentationId" expr="presentationId"/>
      <param name="referenceDA1" expr="referenceDA1"/>
      <param name="referenceDA2" expr="'NULL'"/>
      <%-- Account Type Parameters End --%>
      <%-- Ends : US 1522 - PMR826  --%>
<!-- Handling for EcmaScript call :FC 154-->
      <param name="voiceBaseInterfaceVxml" expr="voiceBaseInterfaceVxml"/>
    </subdialog>
    <!--  -->
    <!--  Playing the Account Balance in Second Currency  -->
    <subdialog name="<%=MicroflowConstants.SUBDIALOG_PLAY_HELPER_CALL_PREFIX%>sub_MasterAccountBalanceInSecondCurrency" srcexpr="standardRefillHelperVxml + '#' + playBalanceOfAccount_refill" cond="secondCurrencyName != 'NULL' &amp;&amp; masterAccountBalanceInSecondCurrency != 'NULL' &amp;&amp; playMasterAccountBalanceInSecondCurrency == 'true'">
      <param name="amount" expr="masterAccountBalanceInSecondCurrency"/>
      <param name="absAmount" expr="absAccountBalanceInSecondCurrency"/>
      <param name="currency" expr="secondCurrencyName"/>
      <param name="currencyFormat" expr="currencyFormat"/>
      <param name="subscriberLanguage" expr="subscriberLanguage"/>
      <param name="voiceBaseLanguage" expr="voiceBaseLang"/>
      <param name="promptsetId" expr="promptsetId"/>
      <param name="versionId" expr="versionId"/>
      <param name="speaker" expr="speaker"/>
      <param name="gender" expr="gender"/>
      <param name="voiceBaseURL" expr="voiceBaseURL"/>
      <param name="debug" expr="debug"/>
	  <param name="announcementType" expr="masterBalanceAnnouncement"/>
	   <%-- Starts : US 1522 - PMR826  --%>
	    <%-- Account Type Parameters Start --%>
      <param name="mainBalanceAccountType" expr="mainBalanceAccountType"/>
      <param name="appRoot" expr="application"/>
      <param name="presentationId" expr="presentationId"/>
      <param name="referenceDA1" expr="'NULL'"/>
      <param name="referenceDA2" expr="referenceDA2"/>
      <%-- Account Type Parameters End --%>
       <%-- Ends : US 1522 - PMR826  --%>
<!-- Handling for EcmaScript call :FC 154-->
      <param name="voiceBaseInterfaceVxml" expr="voiceBaseInterfaceVxml"/>
    </subdialog>
	<%  
		} 
	%>
	<%-- HMTL 077 selectively generate subdialog for MainBalance ends --%>		

	<%-- HMTL 077 selectively generate subdialog for SupervisionExpiry starts --%>
	
      <%
		if (premiumAnnouncements.contains("SupervisionExpiry") || presentationIdFlag == 0) {
	  %>	


    <!--  Playing the Supervision Fee Expiry Date  -->
    <subdialog name="<%=MicroflowConstants.SUBDIALOG_PLAY_HELPER_CALL_PREFIX%>sub_SupervisionFeeExpiryDate" srcexpr="standardRefillHelperVxml + '#' + play_SupervisionFeeExpiryDate" cond="bothServAndSupervDatesConfigured==true &amp;&amp; supervExpDateVsServExpDate != 0 &amp;&amp; playSupervisionFeeExpiryDate == 'true' || bothServAndSupervDatesConfigured==false &amp;&amp; playSupervisionFeeExpiryDate == 'true'">
      <param name="supervisionFeeExpiryDate" expr="supervisionFeeExpiryDate"/>
      <param name="supervExpDateVsTodayDate" expr="supervExpDateVsTodayDate"/>
      <param name="dateFormat" expr="dateFormat"/>
      <param name="subscriberLanguage" expr="subscriberLanguage"/>
      <param name="voiceBaseLanguage" expr="voiceBaseLang"/>
      <param name="promptsetId" expr="promptsetId"/>
      <param name="versionId" expr="versionId"/>
      <param name="speaker" expr="speaker"/>
      <param name="gender" expr="gender"/>
      <param name="creditClearanceDate" expr="creditClearanceDate"/>
      <param name="creditClearanceDateVsTodayDate" expr="creditClearanceDateVsTodayDate"/>
      <param name="serviceRemovalDate" expr="serviceRemovalDate"/>
      <param name="serviceRemovalDateVsTodayDate" expr="serviceRemovalDateVsTodayDate"/>
      <param name="creditClearanceDateAnnFlag" expr="creditClearanceDateAnnFlag"/>
      <param name="serviceRemovalDateAnnFlag" expr="serviceRemovalDateAnnFlag"/> 
      <param name="voiceBaseURL" expr="voiceBaseURL"/>
      <param name="lifeTimeValidDate" expr="lifeTimeValidDate"/>
      <param name="debug" expr="debug"/>
      <%-- Handling for EcmaScript call :FC 154--%>
      <param name="voiceBaseInterfaceVxml" expr="voiceBaseInterfaceVxml"/>
    </subdialog>
	<%  
		} 
	%>
	<%-- HMTL 077 selectively generate subdialog for SupervisionExpiry ends --%>		
    <!--  -->

	<%-- HMTL 077 selectively generate subdialog for ServiceExpiry starts --%>
	
      <%
		if (premiumAnnouncements.contains("ServiceExpiry") || presentationIdFlag == 0) {
	  %>	
    <!--  Playing the Service Fee Expiry Date  -->
    <subdialog name="<%=MicroflowConstants.SUBDIALOG_PLAY_HELPER_CALL_PREFIX%>sub_ServiceFeeExpiryDate" srcexpr="standardRefillHelperVxml + '#' + play_ServiceFeeExpiryDate" cond="bothServAndSupervDatesConfigured==true &amp;&amp; supervExpDateVsServExpDate != 0 &amp;&amp; playServiceFeeExpiryDate == 'true' || bothServAndSupervDatesConfigured==false &amp;&amp; playServiceFeeExpiryDate == 'true'">
      <param name="serviceFeeExpiryDate" expr="serviceFeeExpiryDate"/>
      <param name="servExpDateVsTodayDate" expr="servExpDateVsTodayDate"/>
      <param name="dateFormat" expr="dateFormat"/>
      <param name="subscriberLanguage" expr="subscriberLanguage"/>
      <param name="voiceBaseLanguage" expr="voiceBaseLang"/>
      <param name="promptsetId" expr="promptsetId"/>
      <param name="versionId" expr="versionId"/>
      <param name="speaker" expr="speaker"/>
      <param name="gender" expr="gender"/>
      <param name="voiceBaseURL" expr="voiceBaseURL"/>
      <param name="lifeTimeValidDate" expr="lifeTimeValidDate"/>
      <param name="debug" expr="debug"/>
         <%-- Handling for EcmaScript call :FC 154--%>
      <param name="voiceBaseInterfaceVxml" expr="voiceBaseInterfaceVxml"/>
    </subdialog>
	<%  
		} 
	%>
	<%-- HMTL 077 selectively generate subdialog for ServiceExpiry ends --%>		
    <!--  -->
	
	<%-- HMTL 077 selectively generate subdialog for Service and Supervision Fee Expiry Dates when both are same starts --%>
	
      <%
		if ((premiumAnnouncements.contains("SupervisionExpiry") && premiumAnnouncements.contains("ServiceExpiry")) || presentationIdFlag == 0) {
	  %>	
	
    <!--  Playing the Service and Supervision Fee Expiry Dates when both are same  -->
    <subdialog name="<%=MicroflowConstants.SUBDIALOG_PLAY_HELPER_CALL_PREFIX%>sub_SameServiceAndSupervisionExpiryDates" srcexpr="standardRefillHelperVxml + '#' + play_SameServiceAndSupervisionExpiryDates" cond="supervExpDateVsServExpDate == 0 &amp;&amp; playSupervisionFeeExpiryDate == 'true' &amp;&amp; bothServAndSupervDatesConfigured==true || playServiceFeeExpiryDate == 'true' &amp;&amp; supervExpDateVsServExpDate == 0 &amp;&amp; bothServAndSupervDatesConfigured==true">
      <param name="expiryDate" expr="serviceFeeExpiryDate"/>
      <param name="expiryDateVsTodayDate" expr="servExpDateVsTodayDate"/>
      <param name="dateFormat" expr="dateFormat"/>
      <param name="subscriberLanguage" expr="subscriberLanguage"/>
      <param name="voiceBaseLanguage" expr="voiceBaseLang"/>
      <param name="speaker" expr="speaker"/>
      <param name="gender" expr="gender"/>
      <param name="promptsetId" expr="promptsetId"/>
      <param name="versionId" expr="versionId"/>
      <param name="creditClearanceDate" expr="creditClearanceDate"/>
      <param name="creditClearanceDateVsTodayDate" expr="creditClearanceDateVsTodayDate"/>
      <param name="serviceRemovalDate" expr="serviceRemovalDate"/>
      <param name="serviceRemovalDateVsTodayDate" expr="serviceRemovalDateVsTodayDate"/>
      <param name="creditClearanceDateAnnFlag" expr="creditClearanceDateAnnFlag"/>
      <param name="serviceRemovalDateAnnFlag" expr="serviceRemovalDateAnnFlag"/> 
      <param name="voiceBaseURL" expr="voiceBaseURL"/>
      <param name="lifeTimeValidDate" expr="lifeTimeValidDate"/>
      <param name="debug" expr="debug"/>
       <%-- Handling for EcmaScript call :FC 154--%>
      <param name="voiceBaseInterfaceVxml" expr="voiceBaseInterfaceVxml"/>
    </subdialog>
	<%  
		} 
	%>
	<%-- HMTL 077 selectively generate subdialog for Service and Supervision Fee Expiry Dates when both are same ends --%>		
    <!--  -->
    <block>
      <assign name="expiryDatePlayed" expr="'true'"/>
    </block>
    
    <%--HP-CELTEL-V001 STARTS--%>

	<%-- HMTL 077 selectively generate subdialog for CreditClearanceDate starts --%>
	
      <%
		if (premiumAnnouncements.contains("CreditClearanceDate") || presentationIdFlag == 0) {
	  %>	
    	 
    <!--  Playing the Credit Clearance Date  -->
    <subdialog name="<%=MicroflowConstants.SUBDIALOG_PLAY_HELPER_CALL_PREFIX%>sub_CreditClearanceDate" srcexpr="standardRefillHelperVxml + '#' + play_CreditClearanceDate" cond="playCreditClearanceDate == 'true'">
      <param name="creditClearanceDate" expr="creditClearanceDate"/>
      <param name="creditClearanceDateVsTodayDate" expr="creditClearanceDateVsTodayDate"/>     
      <param name="serviceRemovalDate" expr="serviceRemovalDate"/>
      <param name="serviceRemovalDateVsTodayDate" expr="serviceRemovalDateVsTodayDate"/>
      <param name="serviceRemovalDateAnnFlag" expr="serviceRemovalDateAnnFlag"/> 
      <param name="dateFormat" expr="dateFormat"/>
      <param name="subscriberLanguage" expr="subscriberLanguage"/>
      <param name="voiceBaseLanguage" expr="voiceBaseLang"/>
      <param name="promptsetId" expr="promptsetId"/>
      <param name="versionId" expr="versionId"/>
      <param name="speaker" expr="speaker"/>
      <param name="gender" expr="gender"/>
      <param name="voiceBaseURL" expr="voiceBaseURL"/>
      <param name="lifeTimeValidDate" expr="lifeTimeValidDate"/>
      <param name="debug" expr="debug"/>
      <%-- Handling for EcmaScript call :FC 154--%>
      <param name="voiceBaseInterfaceVxml" expr="voiceBaseInterfaceVxml"/>
    </subdialog>
	<%  
		} 
	%>
	<%-- HMTL 077 selectively generate subdialog for CreditClearanceDate ends --%>		
    <!--  -->
    
	<%-- HMTL 077 selectively generate subdialog for ServiceRemovalDate starts --%>
	
      <%
		if (premiumAnnouncements.contains("ServiceRemovalDate") || presentationIdFlag == 0) {
	  %>	
    <!--  Playing the Service Removal Date  -->
    <subdialog name="<%=MicroflowConstants.SUBDIALOG_PLAY_HELPER_CALL_PREFIX%>sub_ServiceRemovalDate" srcexpr="standardRefillHelperVxml + '#' + play_ServiceRemovalDate" cond="playServiceRemovalDate == 'true'">
      <param name="serviceRemovalDate" expr="serviceRemovalDate"/>
      <param name="serviceRemovalDateVsTodayDate" expr="serviceRemovalDateVsTodayDate"/>
      <param name="dateFormat" expr="dateFormat"/>
      <param name="subscriberLanguage" expr="subscriberLanguage"/>
      <param name="voiceBaseLanguage" expr="voiceBaseLang"/>
      <param name="promptsetId" expr="promptsetId"/>
      <param name="versionId" expr="versionId"/>
      <param name="speaker" expr="speaker"/>
      <param name="gender" expr="gender"/>
      <param name="voiceBaseURL" expr="voiceBaseURL"/>
      <param name="lifeTimeValidDate" expr="lifeTimeValidDate"/>
      <param name="debug" expr="debug"/>
       <%-- Handling for EcmaScript call :FC 154--%>
      <param name="voiceBaseInterfaceVxml" expr="voiceBaseInterfaceVxml"/>
    </subdialog>
    
    <%--HP-CELTEL-V001 ENDS --%>
	<%  
		} 
	%>
	<%-- HMTL 077 selectively generate subdialog for ServiceRemovalDate ends --%>		
    <!--  -->

	<%-- HMTL 077 selectively generate subdialog for RechargeBonus starts --%>
	
<%
	if (premiumAnnouncements.contains("RechargeBonus") || presentationIdFlag == 0) {
%>	
    <!--  Playing the Recharge Bonus in First Currency  -->
    <subdialog name="<%=MicroflowConstants.SUBDIALOG_PLAY_HELPER_CALL_PREFIX%>sub_RechargeBonusInFirstCurrency" srcexpr="standardRefillHelperVxml + '#' + play_RechargeBonus" cond="firstCurrencyName != 'NULL' &amp;&amp; rechargeAmountPromoTotal1abs != 'NULL' &amp;&amp; playRechargeBonusInFirstCurrency == 'true'">
      <param name="amount" expr="rechargeAmountPromoTotal1"/>
      <param name="absAmount" expr="rechargeAmountPromoTotal1abs"/>
      <param name="currency" expr="firstCurrencyName"/>
      <param name="currencyFormat" expr="currencyFormat"/>
      <param name="subscriberLanguage" expr="subscriberLanguage"/>
      <param name="voiceBaseLanguage" expr="voiceBaseLang"/>
      <param name="promptsetId" expr="promptsetId"/>
      <param name="versionId" expr="versionId"/>
      <param name="speaker" expr="speaker"/>
      <param name="gender" expr="gender"/>
      <param name="voiceBaseURL" expr="voiceBaseURL"/>
      <param name="debug" expr="debug"/>
      <%-- Handling for EcmaScript call :FC 154--%>
      <param name="voiceBaseInterfaceVxml" expr="voiceBaseInterfaceVxml"/>
    </subdialog>
    <!--  -->
    <!--  Playing the Recharge Bonus in Second Currency  -->
    <subdialog name="<%=MicroflowConstants.SUBDIALOG_PLAY_HELPER_CALL_PREFIX%>sub_RechargeBonusInSecondCurrency" srcexpr="standardRefillHelperVxml + '#' + play_RechargeBonus" cond="secondCurrencyName != 'NULL' &amp;&amp; rechargeAmountPromoTotal2abs != 'NULL' &amp;&amp; rechargeAmountPromoTotal2abs!=''  &amp;&amp; playRechargeBonusInSecondCurrency == 'true'">
      <param name="amount" expr="rechargeAmountPromoTotal2"/>
      <param name="absAmount" expr="rechargeAmountPromoTotal2abs"/>
      <param name="currency" expr="secondCurrencyName"/>
      <param name="currencyFormat" expr="currencyFormat"/>
      <param name="subscriberLanguage" expr="subscriberLanguage"/>
      <param name="voiceBaseLanguage" expr="voiceBaseLang"/>
      <param name="promptsetId" expr="promptsetId"/>
      <param name="versionId" expr="versionId"/>
      <param name="speaker" expr="speaker"/>
      <param name="gender" expr="gender"/>
      <param name="voiceBaseURL" expr="voiceBaseURL"/>
      <param name="debug" expr="debug"/>
      <%-- Handling for EcmaScript call :FC 154--%>
      <param name="voiceBaseInterfaceVxml" expr="voiceBaseInterfaceVxml"/>
    </subdialog>
<%  
	} 
%>
	<%-- HMTL 077 selectively generate subdialog for RechargeBonus ends --%>		
    <!--  -->
	<%-- HMTL 077 selectively generate subdialog for RefillAmount starts --%>
	
<%
	if (premiumAnnouncements.contains("RefillAmount") || presentationIdFlag == 0) {
%>	
    <!--  Playing the Refill amount of Voucher in First Currency  -->
    <subdialog name="<%=MicroflowConstants.SUBDIALOG_PLAY_HELPER_CALL_PREFIX%>sub_RefillAmountInFirstCurrency" srcexpr="standardRefillHelperVxml + '#' + play_RefillAmount" cond="firstCurrencyName != 'NULL' &amp;&amp; rechargeAmountMainTotal1abs != 'NULL' &amp;&amp; playRefillAmountInFirstCurrency == 'true'">
        <param name="amount" expr=" rechargeAmountMainTotal1 "/>
        <param name="absAmount" expr="rechargeAmountMainTotal1abs "/>
        <param name="currency" expr="firstCurrencyName"/>
        <param name="currencyFormat" expr="currencyFormat"/>
        <param name="subscriberLanguage" expr="subscriberLanguage"/>
        <param name="voiceBaseLanguage" expr="voiceBaseLang"/>
        <param name="promptsetId" expr="promptsetId"/>
        <param name="versionId" expr="versionId"/>
        <param name="speaker" expr="speaker"/>
        <param name="gender" expr="gender"/>
        <param name="voiceBaseURL" expr="voiceBaseURL"/>
        <param name="debug" expr="debug"/>
        <%-- Handling for EcmaScript call :FC 154--%>
        <param name="voiceBaseInterfaceVxml" expr="voiceBaseInterfaceVxml"/>
    </subdialog>
    <!--  -->
    <!--  Playing the Refill amount of Voucher in Second Currency  -->
    <subdialog name="<%=MicroflowConstants.SUBDIALOG_PLAY_HELPER_CALL_PREFIX%>sub_RefillAmountInSecondCurrency" srcexpr="standardRefillHelperVxml + '#' + play_RefillAmount" cond="secondCurrencyName != 'NULL' &amp;&amp; rechargeAmountMainTotal2abs != 'NULL' &amp;&amp; playRefillAmountInSecondCurrency == 'true'">
        <param name="amount" expr=" rechargeAmountMainTotal2 "/>
        <param name="absAmount" expr="rechargeAmountMainTotal2abs "/>
        <param name="currency" expr="secondCurrencyName"/>
        <param name="currencyFormat" expr="currencyFormat"/>
        <param name="subscriberLanguage" expr="subscriberLanguage"/>
        <param name="voiceBaseLanguage" expr="voiceBaseLang"/>
        <param name="promptsetId" expr="promptsetId"/>
        <param name="versionId" expr="versionId"/>
        <param name="speaker" expr="speaker"/>
        <param name="gender" expr="gender"/>
        <param name="voiceBaseURL" expr="voiceBaseURL"/>
        <param name="debug" expr="debug"/>
        <%-- Handling for EcmaScript call :FC 154--%>
        <param name="voiceBaseInterfaceVxml" expr="voiceBaseInterfaceVxml"/>
    </subdialog>
<%  
	} 
%>
<%-- HMTL 077 selectively generate subdialog for RefillAmount ends --%>		
<!--  -->	

<%-- HMTL 077 selectively generate subdialog for offLineBonus starts --%>		

<%
	if (premiumAnnouncements.contains("OffLineBonus") || presentationIdFlag == 0) {
%>

    <block name="playAnn_OfflineBonus" cond="playOfflineBonus == 'true'">
      <if cond="debug &gt; NO_DEBUG_LEVEL">
        <log label="StandardVoucherRefillJSP">Standard Refill - playOfflineBonus</log>
      </if>
      <!--  -->
      <if cond="promotionAnnCode == '' || promotionAnnCode == '0' || promotionAnnCode == '00'">
        <assign name="PromotionsFlag" expr="'false'"/>
      <else/>
        <assign name="PromotionsFlag" expr="'true'"/>
        <assign name="promptId" expr="'REF_PROMOTION_' + promotionAnnCode"/>
        <audio expr="returnAudioPath(promptsetId, subscriberLanguage, promptId, versionId, debug)"/>
      </if>
      <!--  -->
        <ivr:log label="StandardVoucherRefillJSP">
				PromotionsFlag = <value expr="PromotionsFlag"/>
				  ||  PromptId played = <value expr="promptId"/>
	    </ivr:log>
    </block>
<%  
	} 
%>
<%-- HMTL 077 selectively generate subdialog for RefillAmount ends --%>		
<!--  -->	

<%-- HMTL 077 selectively generate subdialog for PromotionServiceFeeExtension starts --%>

<%
if (premiumAnnouncements.contains("PromotionServiceFeeExtension") || presentationIdFlag == 0) {
%>	
    <!-- Playing the Promotion Service Fee Extension -->
        <%-- TR-HJ79885-Start condition serviceFeeDaysPromoExt != 0 changed to serviceFeeDaysPromoExt &gt; 0 --%>
    <subdialog name="<%=MicroflowConstants.SUBDIALOG_PLAY_HELPER_CALL_PREFIX%>sub_PromotionServiceFeeExtentension" srcexpr="standardRefillHelperVxml + '#' + play_ServiceFeeExtentensionMsg" cond="serviceFeeDaysPromoExt &gt; 0 &amp;&amp; playPromotionServiceFeeExtentension == 'true'">
      <param name="promoExtDays" expr="serviceFeeDaysPromoExt"/>
      <param name="subscriberLanguage" expr="subscriberLanguage"/>
      <param name="voiceBaseLanguage" expr="voiceBaseLang"/>
      <param name="promptsetId" expr="promptsetId"/>
      <param name="versionId" expr="versionId"/>
      <param name="speaker" expr="speaker"/>
      <param name="gender" expr="gender"/>
      <param name="voiceBaseURL" expr="voiceBaseURL"/>
      <param name="debug" expr="debug"/>
      <%-- Handling for EcmaScript call :FC 154--%>
      <param name="voiceBaseInterfaceVxml" expr="voiceBaseInterfaceVxml"/>
    </subdialog>
	<%  
		} 
	%>
	<%-- HMTL 077 selectively generate subdialog for PromotionServiceFeeExtension ends --%>		
    <!--  -->
	<%-- HMTL 077 selectively generate subdialog for PromotionSupervisionFeeExtension starts --%>
	
      <%
		if (premiumAnnouncements.contains("PromotionSupervisionFeeExtension") || presentationIdFlag == 0) {
	  %>	
    <!-- Playing the Promotion Supervision Fee Extension -->
    <%-- TR-HJ79885-Start condition supervisionDaysPromoExt != 0 changed to supervisionDaysPromoExt &gt; 0 --%>
    <subdialog name="<%=MicroflowConstants.SUBDIALOG_PLAY_HELPER_CALL_PREFIX%>sub_PromotionSupervisionExtentension" srcexpr="standardRefillHelperVxml + '#' + play_SupervisionFeeExtentensionMsg" cond="supervisionDaysPromoExt &gt; 0 &amp;&amp; playPromotionSupervisionExtentension == 'true'">
      <param name="promoExtDays" expr="supervisionDaysPromoExt"/>
      <param name="subscriberLanguage" expr="subscriberLanguage"/>
      <param name="voiceBaseLanguage" expr="voiceBaseLang"/>
      <param name="promptsetId" expr="promptsetId"/>
      <param name="versionId" expr="versionId"/>
      <param name="speaker" expr="speaker"/>
      <param name="gender" expr="gender"/>
      <param name="voiceBaseURL" expr="voiceBaseURL"/>
      <param name="debug" expr="debug"/>
      <%-- Handling for EcmaScript call :FC 154--%>
      <param name="voiceBaseInterfaceVxml" expr="voiceBaseInterfaceVxml"/>
    </subdialog>
	<%  
		} 
	%>
	<%-- HMTL 077 selectively generate subdialog for PromotionSupervisionFeeExtension ends --%>		
    <!--  -->

	<%-- HMTL 077 selectively generate subdialog for SupervisionDaysTotalExtentension starts --%>
	
      <%
		if (premiumAnnouncements.contains("SupervisionDaysTotalExtentension") || presentationIdFlag == 0) {
	  %>	    
     <%-- PC = STC-V001 Starts Here --%>
    <subdialog name="<%=MicroflowConstants.SUBDIALOG_PLAY_HELPER_CALL_PREFIX%>sub_SupervisionDaysTotalExtentension" srcexpr="standardRefillHelperVxml + '#' + play_SupervisionDaysTotalExtentensionMsg" cond="supervisionDaysTotalExt &gt; 0 &amp;&amp; playSupervisionDaysTotalExtentension == 'true'">
      <param name="promoExtDays" expr="supervisionDaysTotalExt"/>
      <param name="subscriberLanguage" expr="subscriberLanguage"/>
      <param name="voiceBaseLanguage" expr="voiceBaseLang"/>
      <param name="promptsetId" expr="promptsetId"/>
      <param name="versionId" expr="versionId"/>
      <param name="speaker" expr="speaker"/>
      <param name="gender" expr="gender"/>
      <param name="voiceBaseURL" expr="voiceBaseURL"/>
      <param name="debug" expr="debug"/>
      <%-- Handling for EcmaScript call :FC 154--%>
      <param name="voiceBaseInterfaceVxml" expr="voiceBaseInterfaceVxml"/>
    </subdialog>
	<%  
		} 
	%>
	<%-- HMTL 077 selectively generate subdialog for SupervisionDaysTotalExtentension ends --%>		
    <!--  -->
	
	<%-- HMTL 077 selectively generate subdialog for ServiceFeeDaysTotalExtentension starts --%>
	
      <%
		if (premiumAnnouncements.contains("ServiceFeeDaysTotalExtentension") || presentationIdFlag == 0) {
	  %>	        
    <subdialog name="<%=MicroflowConstants.SUBDIALOG_PLAY_HELPER_CALL_PREFIX%>sub_ServiceFeeDaysTotalExtentension" srcexpr="standardRefillHelperVxml + '#' + play_ServiceFeeDaysTotalExtentensionMsg" cond="serviceFeeDaysTotalExt &gt; 0 &amp;&amp; playServiceFeeDaysTotalExtentension == 'true'">
      <param name="promoExtDays" expr="serviceFeeDaysTotalExt"/>
      <param name="subscriberLanguage" expr="subscriberLanguage"/>
      <param name="voiceBaseLanguage" expr="voiceBaseLang"/>
      <param name="promptsetId" expr="promptsetId"/>
      <param name="versionId" expr="versionId"/>
      <param name="speaker" expr="speaker"/>
      <param name="gender" expr="gender"/>
      <param name="voiceBaseURL" expr="voiceBaseURL"/>
      <param name="debug" expr="debug"/>
       <%-- Handling for EcmaScript call :FC 154--%>
      <param name="voiceBaseInterfaceVxml" expr="voiceBaseInterfaceVxml"/>
    </subdialog>
    <%-- PC = STC-V001 Ends Here --%>
	<%  
		} 
	%>
	<%-- HMTL 077 selectively generate subdialog for ServiceFeeDaysTotalExtentension ends --%>		
    <!--  -->
    
	<%-- HMTL 077 selectively generate subdialog for ValueVoucherDurationExtension starts --%>
	
      <%
		if (premiumAnnouncements.contains("ValueVoucherDurationExtension") || presentationIdFlag == 0) {
	  %>	        
    <%-- HI-BHA-GAPS Starts --%>
    <%-- Play number  of days --%>
    <subdialog name="sub_PlayValueVoucherDaysExtension" srcexpr="voiceBaseInterfaceVxml + '?versionId='+versionId +'#' + playDuration" cond="ValueVoucherExpiryDurationExt != 'NULL' &amp;&amp; playValueVoucherDaysExtension == true">
      <param name="arg" expr="ValueVoucherExpiryDurationExt"/>
      <param name="format" expr="formatDuration"/>          
      <param name="lang" expr="application.voiceBaseLanguage"/>
      <param name="speaker" expr="speaker"></param>
      <param name="gender" expr="application.gender"></param>
      <param name="type"    expr="'duration'"/>
      <param name="debug" expr="application.debug"></param>
      <param name="versionId" expr="application.versionId"></param>
      <param name="ivrlanguage" expr="application.subscriberLanguage"></param>
      <param name="voiceBaseURL" expr="voiceBaseURL"/>
    </subdialog>
	<%  
		} 
	%>
	<%-- HMTL 077 selectively generate subdialog for ValueVoucherDurationExtension ends --%>		
    <!--  -->
	<%-- HMTL 077 selectively generate subdialog for ValueVoucherExpiryDate starts --%>
	
      <%
		if (premiumAnnouncements.contains("ValueVoucherExpiryDate") || presentationIdFlag == 0) {
	  %>	        
    <!-- Play the expiry fees date  -->
    <subdialog name="<%=MicroflowConstants.SUBDIALOG_PLAY_HELPER_CALL_PREFIX%>sub_PlayValueVoucherExpiryDate" srcexpr="voiceBaseInterfaceVxml + '?versionId='+versionId +'#' + playDateSubdialogName" cond="valueVoucherNewExpiryDate != 'NULL' &amp;&amp; playValueVoucherExpiryDate == true" >
      <param name="arg"     expr="valueVoucherNewExpiryDate"/>
      <param name="format"  expr="dateFormat"/>
      <param name="lang"    expr="application.voiceBaseLanguage"/>
      <param name="speaker" expr="speaker"/>
      <param name="gender"  expr="application.gender"/>
      <param name="type"    expr="'date'"/>
      <param name="debug" expr="application.debug"></param>
      <param name="versionId" expr="application.versionId"></param>
      <param name="ivrlanguage" expr="application.subscriberLanguage"></param>
      <param name="voiceBaseURL" expr="voiceBaseURL"/>
    </subdialog>
    <%-- HI-BHA-GAPS Ends --%>
	<%  
		} 
	%>
	<%-- HMTL 077 selectively generate subdialog for ValueVoucherExpiryDate ends --%>		
    <!--  -->

    <%-- As of US:197.The call of DA main will always be through a subdialog. --%>
    <subdialog name="<%=MicroflowConstants.SUBDIALOG_INTER_MODULE_CALL_PREFIX%>sub_daPlayCall" fetchtimeout="15s" srcexpr="'/VXMLIVR/DedicatedAccount.do?externalAnnouncementOrder='+daAnnnouncementOrder+'&amp;presentationId='+presentationId+'&amp;debug='+debug+'&amp;versionId='+versionId+'&amp;configurationId='+configurationId"
      cond="playDA == 'true'">
      <param name="appRootFromSubdialog" expr="application"/>
      <!--  -->
      <filled>
	  <assign name="skipToWorkflow" expr="<%=MicroflowConstants.SUBDIALOG_INTER_MODULE_CALL_PREFIX%>sub_daPlayCall.skipToWorkflow"/>
	  <assign name="daPlayStatus" expr="<%=MicroflowConstants.SUBDIALOG_INTER_MODULE_CALL_PREFIX%>sub_daPlayCall.status"/>
	  <ivr:log label="StandardVoucherRefillJSP">
			After Return from DA Play, status = <value expr="daPlayStatus"/>
		  ||  	After Return from DA Play, skipToWorkflow = <value expr="skipToWorkflow"/>
	 </ivr:log>
	  <if cond="skipToWorkflow == 'true'">
	      <goto nextitem="block_SetStatusAndExit"/>		        
	  </if>
     </filled>
    </subdialog>
    <!--  -->
	<%-- AirIp 4.0 start: --%>
	<subdialog name="sub_offersPlayCall" fetchtimeout="15s" srcexpr="'/VXMLIVR/OffersAction.do?presentationId='+presentationId+'&amp;debug='+debug+'&amp;versionId='+versionId+OptionalParametersString" cond="playOffers == 'true'">
		<param name="appRootFromSubdialog" expr="application"/>
		<!--  -->
		<filled>
			<assign name="playOfferStatus" expr="sub_offersPlayCall.status"/>
			<if cond="debug > NO_DEBUG_LEVEL">
				<log label="StandardVoucherRefillJSP">After Return from Offers Play, status = <value expr="playOfferStatus"/></log>
			</if>
		</filled>
	</subdialog>

    <%-- HI-BHA-GAPS Ends --%>
	<%-- HMTL 077 selectively generate subdialog for MsisdnAnnouncement starts --%>
	
      <%
		if ((premiumAnnouncements.contains("MsisdnAnnouncement") && refillRepromptEnabled.equals("true")) || presentationIdFlag == 0) {
	  %>	        
	<subdialog name="<%=MicroflowConstants.SUBDIALOG_PLAY_HELPER_CALL_PREFIX%>sub_PlayMsisdn" srcexpr="standardRefillHelperVxml + '?versionId='+versionId +'#' + play_playMsisdn" cond="refillRepromptEnabled == 'true' &amp;&amp; playMsisdn == 'true'" >
	  <param name="appRootFromSubdialog" expr="application"/>
	  <param name="formatToPlay" expr="msisdnFormat"/>
	  <param name="repromptFlag" expr="repromptFlag"/>	
         <param name="callingNumber" expr="callingNumber"/>
         <param name="subscriberLanguage" expr="subscriberLanguage"/>       
        <param name="promptsetId" expr="promptsetId"/>
        <param name="versionId" expr="versionId"/>         
        <param name="debug" expr="debug"/>  
	<param name="presentationId" expr="presentationId"/> 	 
	<param name="OptionalParametersString" expr="OptionalParametersString"/>
    </subdialog>
	<%  
		} 
	%>
	<%-- HMTL 077 selectively generate subdialog for MsisdnAnnouncement ends --%>		
    <!--  -->

    <logic:iterate id="eachSuperRefillAnnouncementForms" name="standardRefillActionForm" property="superRefillAnnouncementForms" type="java.lang.String">
    	<%--  TR-HJ72493-Start  --%>
    	<field name="dummyField_For_Refill_<%=i%>">
             <grammar version="1.0" src="<%= "/VXMLIVR/grammarFiles/local/Everything.grxml"+"?versionId="+request.getParameter("versionId") %>" mode="dtmf"/>
		     <prompt timeout="0s"/>
		     <catch event="noinput">
		       <!-- if no input from the user, skip this field -->
		       <if cond="debug &gt; NO_DEBUG_LEVEL">
		         <log label="StandardVoucherRefillJSP">Skipping dummyField_For_Refill</log>
		       </if>
		       <assign name="dummyField_For_Refill_<%=i%>" expr="true"/>
		      </catch>
		      <filled>
		        <if cond="debug &gt; NO_DEBUG_LEVEL">
		          <log label="StandardVoucherRefillJSP">DTMF Entered While Playing Successfull Refill Announcements  = <value expr="dummyField_For_Refill_<%=i%>"/></log>
		        </if>
		        <goto nextitem="block_SetStatusAndExit"/>		        
		     </filled>   
         </field>
        <%++i;%>
      <%-- TR-HJ72493-End --%>
      <ivr:include page="<%=vxmlPath + eachSuperRefillAnnouncementForms + vxmlFileSuffix%>"/>
    </logic:iterate>
    <block name="block_SetStatusAndExit">  
      <!-- Play Premium Refill Conclusion prompt -->  
        <ivr:include page='<%=vxmlPath + "playPremiumRefillConclusion" + vxmlFileSuffix%>'/>
		  <%-- ETI-071 --%>
		<if cond="refillRepromptEnabled == 'true'">
			<assign name="refillRetriesExceedPromptId" expr="'REF_MAX_RE_REFILL_EXCEEDED_MSG'"/>
			<goto next="#<%=MicroflowConstants.GENERAL_FORM_PREFIX%>newPinVoucher"/>
		</if>
	   <%-- ETI-071 ends --%>
	    <assign name="status" expr="'SUCCESSSUPERVALUEVOUCHER'"/>  
       <if cond="debug &gt; NO_DEBUG_LEVEL">
		<log label="StandardVoucherRefillJSP">Going to next module with status <value expr="status"/></log>
	  </if>
      <goto next="#<%=MicroflowConstants.GENERAL_FORM_PREFIX%>exitModule"/>
    </block>
  </form>
  <!-- -->
	<%-- HMTL 077 selectively generate form for newPinVoucher starts --%>
	
      <%
		if (refillRepromptEnabled.equals("true") || presentationIdFlag == 0) {
	  %>	        

 <form id="<%=MicroflowConstants.GENERAL_FORM_PREFIX%>newPinVoucher">	
	<block name="play_NewPinVoucherPrompt">
	  <ivr:log label="StandardVoucherRefillJSP">Going to enter choice for new voucher no. DTMF
		  || Refill reprompt digit received from configuration = <value expr="refillRepromptDtmf"/>
		  || Refill reprompt negate digit received from configuration = <value  expr="refillRepromptNegateDtmf"/>
		  || Maximum Re-Refills Allowed received from configuration = <value  expr="maxReRefillsAllowed"/>
	   </ivr:log>
	  <assign name="promptId" expr="'REF_NEW_PIN_VOUCHER_NUMBER_MSG'"/>
	  <audio expr="returnAudioPath(promptsetId, subscriberLanguage, promptId, versionId, debug)"/>
	  <ivr:include page='<%=vxmlPath + "NewPINVoucherNumberPrompt" + vxmlFileSuffix%>'/>
	</block>
	  
	  <field name="field_VoucherNumberRepromptDTMF">
             <grammar version="1.0" src="<%= "/VXMLIVR/grammarFiles/local/Everything.grxml"+"?versionId="+request.getParameter("versionId") %>" mode="dtmf"/>
		     <filled>
		        <ivr:log label="StandardVoucherRefillJSP">DTMF Entered for field_VoucherNumberRepromptDTMF  = <value expr="field_VoucherNumberRepromptDTMF"/>
		       .</ivr:log>
		        <if cond="field_VoucherNumberRepromptDTMF == refillRepromptDtmf">
						<ivr:log label="StandardVoucherRefillJSP">Going to input another voucher number.</ivr:log>
						<assign name="voucherRefillAttempts" expr="voucherRefillAttempts + 1"/>
						<if cond="voucherRefillAttempts &gt;= maxReRefillsAllowed+1">
								<ivr:log label="StandardVoucherRefillJSP">Voucher Refill attempts exceeded. Going to exit !!!</ivr:log>
										<audio expr="returnAudioPath(promptsetId, subscriberLanguage, refillRetriesExceedPromptId, versionId, debug)"/>
										<ivr:include page='<%=vxmlPath + "MaxNewVoucherRefillRetryExceed" + vxmlFileSuffix%>'/>
										<assign name="status" expr="'FAILURE_NEW_VOUCHER_RETRIES_EXCEED'"/>
										<goto next="#<%=MicroflowConstants.GENERAL_FORM_PREFIX%>exitModule"/>
						</if>
						<goto next="#<%=MicroflowConstants.GENERAL_FORM_PREFIX%>standard_refill_main"/>
				<elseif cond="field_VoucherNumberRepromptDTMF == refillRepromptNegateDtmf"/>
					<ivr:log label="StandardVoucherRefillJSP">Going to exit !!!	</ivr:log>
					<assign name="status" expr="'FAILURE_NEW_VOUCHER_NEGATE'"/>
					<goto next="#<%=MicroflowConstants.GENERAL_FORM_PREFIX%>exitModule"/>
				<else/>
					<throw event="nomatch"/>
				</if>
		     </filled> 
			 <noinput>
				<if cond="numEntryTimeoutRetriesCounter &lt; maxRefillTimeoutRetries">
				  <assign name="numEntryTimeoutRetriesCounter" expr="numEntryTimeoutRetriesCounter + 1"/>
				  <assign name="promptId" expr="'REF_RE_REFILL_TIMEOUT_MSG'"/>
				  <audio expr="returnAudioPath(promptsetId, subscriberLanguage, promptId, versionId, debug)"/>
				  <ivr:include page='<%=vxmlPath  + "StandardRefillGetNewVoucherNumberEntryTimeout" + vxmlFileSuffix%>'/>
				  <clear namelist="play_NewPinVoucherPrompt field_VoucherNumberRepromptDTMF"/>
				<else/>
				  <goto next="#retry_count_exceed_timeout"/>
				</if>
			</noinput>
			<nomatch>
				<if cond="numEntryInvalidRetriesCounter &lt; maxRefillInvalidRetries">
				  <assign name="numEntryInvalidRetriesCounter" expr="numEntryInvalidRetriesCounter + 1"/>
				  <assign name="promptId" expr="'REF_RE_REFILL_INVALID_ENTRY_MSG'"/>
				  <audio expr="returnAudioPath(promptsetId, subscriberLanguage, promptId, versionId, debug)"/>
				  <ivr:include page='<%=vxmlPath  + "StandardRefillGetNewVoucherNumberEntryInvalidEntry" + vxmlFileSuffix%>'></ivr:include>
				  <clear namelist="play_NewPinVoucherPrompt field_VoucherNumberRepromptDTMF"/>
				<else/>
				  <goto next="#retry_count_exceed_invalidEntry"/>
				</if>
			</nomatch>
       </field>
  </form>

  	<%  
		}
	%>
	<%-- HMTL 077 selectively generate form for newPinVoucher ends --%>		



  <%-- Added for UNIA SendSMS --%>
  <!--  -->
  <!--  Form Names restored to previous one  -->
  <form id="reusable">
    <block name="block_reusable">
      <goto next="#<%=MicroflowConstants.GENERAL_FORM_PREFIX%>reusable"/>
    </block>
  </form>
  <!--  -->
  <form id="<%=MicroflowConstants.GENERAL_FORM_PREFIX%>reusable" scope="document">
    <block name="block_reusable">      
      <!--  -->
      <ivr:include page="<%=vxmlPath + "ReusableVxml" + vxmlFileSuffix%>"/>
      <!--  -->           
    </block>
  </form>


<form id="<%=MicroflowConstants.GENERAL_FORM_PREFIX%>ListenAgain">
	<var name = "timeoutCounter" expr= "0"/>
	<var name="invalidEntryCounter" expr = "0"/>
	<block>
		<ivr:include page='<%=vxmlPath  + "PreListenAgain" + vxmlFileSuffix%>'/>
	</block>
		<field name="listenAgain">
			<prompt>
				<audio expr="returnAudioPath(application.promptsetId,application.subscriberLanguage, 'REF_LISTEN_AGAIN_MSG', versionId, debug)"/>
			</prompt>
			<grammar version="1.0" src='<%= "/VXMLIVR/grammarFiles/local/Confirmation.grxml"+"?versionId="+request.getParameter("versionId") %>' mode="dtmf"/>
			<filled>
				<if cond=" debug &gt; NO_DEBUG_LEVEL">
					<log label="StandardVoucherRefillJSP">DTMF used for Confirmation = <value expr="listenAgain"/></log>
				</if>
				<if cond="listenAgain == listenAgainDTMF">
					<assign name="announcementRepetitionTimes" expr = "announcementRepetitionTimes +1"/>
					<goto next="#<%=MicroflowConstants.GENERAL_FORM_PREFIX%>form_PostRefillAnnouncement"/>
				<else/>
					<throw event="nomatch"/>
				</if>
			</filled>
			<error>
				<assign name="status" expr="'FAILURE'"/>
				<assign name= "maxAnnouncementRepetitionTimes" expr="0"/> <%-- The maximum limit is set to zero so that the flow does not come back into ListenAgain from the exitModule--%>
				<goto next="#<%=MicroflowConstants.ERROR_FORM_PREFIX%>system_unavailable"/>
			</error>
			<noinput>
				<if cond="timeoutCounter &lt; maxNumberOfTimeout">
					<assign name="timeoutCounter" expr="timeoutCounter + 1"/>
					<assign name="promptId" expr="'REF_LISTEN_AGAIN_TIMEOUT_MSG'"/>
					<audio expr="returnAudioPath(promptsetId, subscriberLanguage, promptId, versionId, debug)"/>
					<ivr:include page='<%=vxmlPath  + "ListenAgainTimeout" + vxmlFileSuffix%>'/>
					<reprompt/>
				<else/>
					<assign name= "maxAnnouncementRepetitionTimes" expr="0"/> <%-- The maximum limit is set to zero so that the flow does not come back into ListenAgain from the exitModule--%>
					<goto next="#<%=MicroflowConstants.ERROR_FORM_PREFIX%>retry_count_exceed_timeout"/>
				</if>
			</noinput>
			<nomatch>
				<if cond="invalidEntryCounter &lt; maxNumberOfInvalidEntry">
					<assign name="invalidEntryCounter" expr="invalidEntryCounter + 1"/>
					<assign name="promptId" expr="'REF_LISTEN_AGAIN_INVALID_ENTRY_MSG'"/>
					<audio expr="returnAudioPath(promptsetId, subscriberLanguage, promptId, versionId, debug)"/>
					<ivr:include page='<%=vxmlPath + "ListenAgainInvalidInput" + vxmlFileSuffix%>'/>
					<clear namelist="listenAgain"/>
					<reprompt/>
				<else/>
					<assign name= "maxAnnouncementRepetitionTimes" expr="0"/> <%-- The maximum limit is set to zero so that the flow does not come back into ListenAgain from the exitModule--%>
					<goto next="#<%=MicroflowConstants.ERROR_FORM_PREFIX%>retry_count_exceed_invalidEntry"/>
				</if>
			</nomatch>
		</field>
</form>

<jsp:include page='<%=baseJspDirectory+"StandardVoucherRefillJSP_ErrorForms"+jspFileSuffix%>'/>

<form id="<%=MicroflowConstants.GENERAL_FORM_PREFIX%>thirdPartyNumberFailure">
	<var name="numberToPlay" expr="'0' +callingNumber"/>

	<block name="playPreNumberPrompt">
		<assign name="thirdPartyFailurePlayed" expr="1"/>
		<assign name="promptId" expr="'REF_ACCOUNT_MSG'"/>
		<audio expr="returnAudioPath(promptsetId, subscriberLanguage, promptId, versionId, debug)"/>
		<ivr:include page='<%=vxmlPath + "BlockPreThirdPartyNumberAnn" + vxmlFileSuffix%>'/>
	</block>

	<subdialog name="sub_msisdnReadout" fetchtimeout="15s" srcexpr="'/VXMLIVR/msisdnReadoutAction.do?presentationId='+presentationId+'&amp;debug='+debug+'&amp;versionId='+versionId+OptionalParametersString+'#<%=MicroflowConstants.GENERAL_FORM_PREFIX%>msisdnReadout'" cond="numberToPlay!='NULL'">
			<param name="appRootFromSubdialog" expr="application"/>
			<param name="numberToPlay" expr="numberToPlay"/>
			<param name="formatToPlay" expr="'NULL'"/>
			<param name="repromptFlag" expr="false"/>
	</subdialog>

	<block name="playPostNumberPrompt">
		<assign name="promptId" expr="'REF_RECHARGE_CODE_FAILURE_MSG'"/>
		<audio expr="returnAudioPath(promptsetId, subscriberLanguage, promptId, versionId, debug)"/>
		<ivr:include page='<%=vxmlPath + "BlockPostThirdPartyNumberAnn" + vxmlFileSuffix%>'/>
		<goto next="#<%=MicroflowConstants.GENERAL_FORM_PREFIX%>standard_refill_main"/>
	</block>
</form>

  <%-- Added for TURK-V006 uplift--%>
 <form id="<%=MicroflowConstants.GENERAL_FORM_PREFIX%>numberAnnouncement">
	

	<block name="playPreNumberPrompt">
	
	<ivr:include page='<%=vxmlPath + "PreNumberAnn" + vxmlFileSuffix%>'/>

	<ivr:log label="StandardVoucherRefill">Number to be played a msisdn number = <value expr="playNumberFlag "/>
	|| Voice Base Dialog to be played = <value expr="playVoiceBaseDialog "/>
	|| Number to be played =  <value expr="playNumber"/>
	</ivr:log>

	</block>

	<subdialog name="sub_msisdnReadout" fetchtimeout="15s" srcexpr="'/VXMLIVR/msisdnReadoutAction.do?presentationId='+presentationId+'&amp;debug='+debug+'&amp;versionId='+versionId+OptionalParametersString+'#<%=MicroflowConstants.GENERAL_FORM_PREFIX%>msisdnReadout'" cond="playVoiceBaseDialog == true &amp;&amp; playNumberFlag == true ">
			<param name="appRootFromSubdialog" expr="application"/>
			<param name="numberToPlay" expr="playNumber"/>
			<param name="formatToPlay" expr="'NULL'"/>
			<param name="repromptFlag" expr="false"/>
	</subdialog>

	<subdialog name="sub_VoucherNumber" srcexpr="voiceBaseInterfaceVxml + '?versionId='+versionId + '#' + playVoucherSubdialogName" cond="playVoiceBaseDialog == true  &amp;&amp; playNumberFlag == false">
      		<param name="arg" expr="playNumber"/>
      		<param name="format" expr="PlayNumberFormat"/>
      		<param name="lang" expr="application.voiceBaseLanguage"/>
      		<param name="speaker" expr="speaker"/>
      		<param name="gender" expr="application.gender"/>
      		<param name="voiceBaseURL" expr="voiceBaseURL"/>
      		<param name="debug" expr="application.debug"></param>
      		<param name="versionId" expr="application.versionId"></param>
      		<param name="ivrlanguage" expr="application.subscriberLanguage"></param>
	</subdialog>


	<block name="playPostNumberPrompt">
		<ivr:include page='<%=vxmlPath + "PostNumberAnn" + vxmlFileSuffix%>'/>
		<goto next="#<%=MicroflowConstants.GENERAL_FORM_PREFIX%>standard_refill_main"/>
	</block>
</form>

<catch event="connection.disconnect.hangup">
    <if cond=" debug &gt; NO_DEBUG_LEVEL ">
      	<log label="StandardVoucherRefill">After user disconnect. Exiting</log>
    	</if>
		<if cond="enableStatisticsLoggingGlobal == 'true' &amp;&amp; enableStatisticsLogging == 'true' &amp;&amp; voucherType != 'SUPERREFILL'">
		         <goto next="#<%=MicroflowConstants.GENERAL_FORM_PREFIX%>StatisticsLogging"/>
		</if>	
		<throw event="root.disconnect"/>	   		
  </catch>
  <%-- End If Super Value Voucher Active --%>  
  
  <%-- PC Change SBM 028 Added for handling AirTimeout --%>
	<catch event="error">
		<ivr:log label="StandardVoucherRefill">Error:Exiting module Standard Refill</ivr:log>
		<goto next="#<%=MicroflowConstants.ERROR_FORM_PREFIX%>system_unavailable"/>
    </catch>

<%-- End SBM 028--%>
<form id="<%=MicroflowConstants.GENERAL_FORM_PREFIX%>StatisticsLogging">
	        <var name="statType" expr="getStatType()"/>
    		<var name="voucherNumber" expr="getVoucherNumber()"/>
    		<var name="statusCode" expr="getStatusCode()"/>
			<var name="calledNumber" expr="application.calledNumber"/>
			<var name="loggingURL" expr="''"/>		
			<var name="refillAmount1" expr="getRefillAmountResult(currency1Flag,rechargeAmountMainTotal1,rechargeAmountPromoTotal1)"/>	
			<var name="refillAmount2" expr="getRefillAmountResult(currency2Flag,rechargeAmountMainTotal2,rechargeAmountPromoTotal2)"/>
	<block>	
			<if cond="refillInfoInStatisticsLogLicenseFlag == 'false'">
				<assign name="refillAmount1" expr="''"/>
				<assign name="refillAmount2" expr="''"/>
				<assign name="thirdPartyNumber" expr="''"/>
			</if>
			<if cond="application.enableRemoteStatisticsLogging=='true'">
				<assign name="loggingURL" expr="application.reportServiceURL + '/StatisticsLogger.do'"/>
			<else/>
				<assign name="loggingURL" expr="'../VXMLIVR/StatisticsLogger.do'"/>
			</if>	
    </block>
		 <subdialog name="statisticsLogger" srcexpr="loggingURL" fetchtimeout="15s" namelist="statType callingNumber calledNumber voucherNumber statusCode versionId refillAmount1 refillAmount2 currentModule" cond="application.orig_callingNumber == ''"/>
		 
		<block>
			 <if cond="application.callingNumber != application.orig_callingNumber &amp;&amp; application.orig_callingNumber != ''">
			 	<assign name="callingNumber" expr="application.orig_callingNumber"/>
			 </if>
		</block>
		 <subdialog name="statisticsLogger1" srcexpr="loggingURL" fetchtimeout="15s" namelist="statType callingNumber calledNumber voucherNumber statusCode versionId refillAmount1 refillAmount2 currentModule thirdPartyNumber" cond="application.callingNumber != application.orig_callingNumber &amp;&amp; application.callingNumber != ''"/>		 
	<block>
	<ivr:log label="StandardVoucherRefill">Throw disconnect Event</ivr:log>
	<throw event="root.disconnect"/>
 </block>
</form>
</vxml>