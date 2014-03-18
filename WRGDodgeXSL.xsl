<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="xml" encoding="utf-8" indent="no" />
  <xsl:template match="/">
    <reports>
      <xsl:for-each select="reports/dodge-report">
        <xsl:variable name="dodge_Id" select="./summary/dr-nbr" />
        <project-temp>
          <p-id>
            <xsl:value-of select="./summary/dr-nbr" />
          </p-id>
          <p-ver>
            <xsl:value-of select="./summary/dr-ver" />
          </p-ver>
          <p-url>
            <xsl:value-of select="./summary/cn-project-url" />
          </p-url>
          <p-first-publish-date>
          <xsl:variable name="fst_pub_dt" select="./summary/first-publish-date" />
          <xsl:value-of select="concat(substring($fst_pub_dt,1,4),'-',substring($fst_pub_dt,5,2),'-',substring($fst_pub_dt,7,2))" />
          </p-first-publish-date>
          <p-publish-date>
          <xsl:variable name="pub_dt" select="./summary/publish-date" />
          <xsl:value-of select="concat(substring($pub_dt,1,4),'-',substring($pub_dt,5,2),'-',substring($pub_dt,7,2))" />
          </p-publish-date>
          <p-prior-publish-date>
          
          <xsl:variable name="prior_pub_dt" select="./summary/prior-publish-date" />
          <xsl:if test="$prior_pub_dt != ''">
          <xsl:value-of select="concat(substring($prior_pub_dt,1,4),'-',substring($prior_pub_dt,5,2),'-',substring($prior_pub_dt,7,2))" />
          </xsl:if>
          </p-prior-publish-date>
          <p-title>
            <xsl:value-of select="./data/proj-title/title-code/title" />
          </p-title>
          <p-addr-line1>
            <xsl:value-of select="./data/p-location/project-location/title-code/p-addr-line/p-addr-line1" />
          </p-addr-line1>
          <p-addr-line2>
            <xsl:value-of select="./data/p-location/project-location/title-code/p-addr-line/p-addr-line2" />
          </p-addr-line2>
          <p-county-name>
            <xsl:value-of select="./data/p-location/project-location/title-code/p-county-name" />
          </p-county-name>
          <p-city-name>
            <xsl:value-of select="./data/p-location/project-location/title-code/p-city-name" />
          </p-city-name>
          <p-state-id>
            <xsl:value-of select="./data/p-location/project-location/title-code/p-state-id" />
          </p-state-id>
          <p-zip-code5>
            <xsl:value-of select="./data/p-location/project-location/title-code/p-zip-code5" />
          </p-zip-code5>
          <p-country-id>
            <xsl:value-of select="./data/p-location/project-location/title-code/p-country-id" />
          </p-country-id>
          <p-type>
            <xsl:for-each select="./data/project-type/title-code/proj-type">
              <xsl:value-of select="." />
              <xsl:if test="position() != last()">
                <xsl:text>;</xsl:text>
              </xsl:if>
            </xsl:for-each>
          </p-type>
          <p-action-stage>
            <xsl:value-of select="./data/project-stage/title-code/stage-desc" />
          </p-action-stage>
          <p-delivery-system>
            <xsl:value-of select="./data/additional-details/title-code/proj-dlvry-sys" />
          </p-delivery-system>
          <p-bid-date>
            <xsl:if test="./data/bid-information/title-code/bid-date != ''">
              <xsl:value-of select="./data/bid-information/title-code/bid-date" />
              <xsl:text />
              <xsl:value-of select="./data/bid-information/title-code/bid-time" />
              <xsl:text />
              <xsl:value-of select="./data/bid-information/title-code/bid-zone" />
            </xsl:if>
          </p-bid-date>
          <p-owner-class>
            <xsl:value-of select="./data/additional-details/title-code/owner-class" />
          </p-owner-class>
          <p-prj-status>
            <xsl:value-of select="./data/status/project-status/title-code/status-text" />
          </p-prj-status>
          <p-prj-status-deliver-system>
            <xsl:value-of select="./data/status/title-code/status-proj-dlvry-sys" />
          </p-prj-status-deliver-system>
          <nbr-of-bldg>
            <xsl:value-of select="./data/details/structural-data/title-code/nbr-of-bldg" />
          </nbr-of-bldg>
          <nbr-of-story-ag>
            <xsl:value-of select="./data/details/structural-data/title-code/nbr-of-story-ag" />
          </nbr-of-story-ag>
          <p-text>
            <xsl:comment>Concatenate Project Text</xsl:comment>
            <xsl:value-of select="./data/details/std-includes/title-code" />
          </p-text>
          <proj-notes>
            <xsl:comment>Concatenate Project Notes</xsl:comment>
            <xsl:value-of select="./data/project-notes/proj-notes/title-code" />
          </proj-notes>
          <p-accounts>
            <xsl:for-each select="./data/project-contact-information/title-code/project-contact">
              <xsl:variable name="Ckms_Site_Ind" select="./contact-information/ckms-process-ind" />
              <xsl:variable name="Ckms_Cont_Ind" select="./contact-information/ckms-contact-process-ind" />
              <xsl:variable name="Cont_Role" select="./contact-information/s-contact-role" />
               <xsl:if test="$Ckms_Site_Ind = 'Y' and $Ckms_Cont_Ind = 'Y'">
               <xsl:if test="not($Cont_Role = 'Electrical Engineer') and not($Cont_Role = 'Landscape Architect') and not($Cont_Role = 'Mechanical Engineer')">
             
              <p-account-details>
              
           
              
                <p-id>
                  <xsl:value-of select="$dodge_Id" />
                </p-id>
                <p-acc-id>
                  <xsl:value-of select="./contact-information/ckms-site-id" />
                </p-acc-id>
                <p-acc-role>
                   <xsl:value-of select="$Cont_Role" />
                </p-acc-role>
                 <p-acc-role-code>
                 <xsl:value-of select="./contact-information/s-contact-role/@code" />
 </p-acc-role-code>
 <p-acc-cont-id>
   <xsl:value-of select="./contact-information/ckms-contact-id" />
 </p-acc-cont-id>
 

               
                <p-acc-name>
                  <xsl:value-of select="./contact-information/firm-name" />
                </p-acc-name>
                <p-acc-contact>
                  <xsl:value-of select="./contact-information/contact-name" />
                </p-acc-contact>
                <p-acc-addr1>
                  <xsl:value-of select="./contact-information/c-addr-line/c-addr-line1" />
                </p-acc-addr1>
                <p-acc-addr2>
                  <xsl:value-of select="./contact-information/c-addr-line/c-addr-line2" />
                </p-acc-addr2>
                <p-acc-county>
                  <xsl:value-of select="./contact-information/c-county-name" />
                </p-acc-county>
                <p-acc-state>
                  <xsl:value-of select="./contact-information/c-state-id" />
                </p-acc-state>
                <p-acc-country>
                  <xsl:value-of select="./contact-information/c-country-id" />
                </p-acc-country>
                <p-acc-zip>
                  <xsl:value-of select="./contact-information/c-zip-code5" />
                </p-acc-zip>
                <p-acc-phone>
                  <xsl:value-of select="./contact-information/area-code" />
                  <xsl:value-of select="./contact-information/phone-nbr" />
                </p-acc-phone>
                <p-acc-fax>
                  <xsl:value-of select="./contact-information/fax-area-code" />
                  <xsl:value-of select="./contact-information/fax-nbr" />
                </p-acc-fax>
                <p-acc-email>
                  <xsl:value-of select="./contact-information/email-id" />
                </p-acc-email>
                <p-acc-url>
                  <xsl:value-of select="./contact-information/www-url" />
                </p-acc-url>
              
             
              </p-account-details>
</xsl:if>
                </xsl:if>
            </xsl:for-each>
          </p-accounts>
        </project-temp>
      </xsl:for-each>
    </reports>
  </xsl:template>
</xsl:stylesheet>
