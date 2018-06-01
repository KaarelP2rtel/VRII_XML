<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
  <xsl:output method="xml" indent="yes"/>

  <xsl:template match="/">
    <events>
      <xsl:for-each select="events/event">
        <xsl:if test="performances/performance/price>=25">
          <event>
            <event-name>
              <xsl:value-of select="event-name"/>
            </event-name>
            <xml:if test="performances">
              <xsl:for-each select="performances/performance">
                <xsl:value-of select="datetime"/>,&#160;<xsl:value-of select="location/location-name"/>,&#160;<xsl:value-of select="price"/>&#160;&#8364;<xsl:value-of select="@currency"/>
              </xsl:for-each>
            </xml:if>
          </event>
        </xsl:if>
      </xsl:for-each>
    </events>

  </xsl:template>
</xsl:stylesheet>
