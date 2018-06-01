<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
  <xsl:output method="xml" indent="yes"/>

  <xsl:template match="/events">
    <events>

      <xsl:for-each select="event">
        <xsl:if test="performances/performance/price>=30">
          <event>
            <event-name>
              <xsl:value-of select="event-name"/>
            </event-name>
            <xsl:for-each select="performances/performance">
              <performace>
                <xsl:value-of select="datetime"/>,&#160;<xsl:value-of select="location/location-name"/>,&#160;<xsl:value-of select="price"/>&#160;&#8364;
              </performace>
            </xsl:for-each>
          </event>
        </xsl:if>
      </xsl:for-each>

      <xsl:for-each select="event">
        <xsl:if test="performances/performance/price=25">
          <event>
            <xsl:for-each select="performances/performance">
              <performace>
                <xsl:value-of select="datetime"/>,&#160;<xsl:value-of select="location/location-name"/>
              </performace>
            </xsl:for-each>
            <event-name>
              <xsl:value-of select="event-name"/>
            </event-name>
          </event>
        </xsl:if>
      </xsl:for-each>

      <artists>List of actors</artists>
      <xsl:for-each select="event/performers/performer">
          <xsl:if test="@type='actor'">
            <performer>
              <xsl:value-of select="performer-name" />,&#160;<xsl:value-of select="@type" />
            </performer>
          </xsl:if>
      </xsl:for-each>

    </events>
  </xsl:template>
</xsl:stylesheet>
