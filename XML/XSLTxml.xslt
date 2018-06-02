<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
  <xsl:output method="xml" indent="yes"/>

  <xsl:template match="/events">
    <events>

      <events-by-type>
        <title>Events by price more than 30 &#8364; with performances</title>
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
      </events-by-type>

      <events-by-type>
        <title>Events by price = 20 &#8364; with performances</title>
        <xsl:for-each select="event">
          <xsl:if test="performances/performance/price=25">
            <event>
              <event-name>
                <xsl:value-of select="event-name"/>
              </event-name>
              <xsl:for-each select="performances/performance">
                <performace>
                  <xsl:value-of select="datetime"/>,&#160;<xsl:value-of select="location/location-name"/>
                </performace>
              </xsl:for-each>              
            </event>
          </xsl:if>
        </xsl:for-each>
      </events-by-type>

      <events-by-type>
        <title>Events by type with performances</title>
        <xsl:for-each select="event">
          <xsl:if test="event-name/@type='operetta'">
            <show>
              <xsl:value-of select="event-name" />,&#160;<xsl:value-of select="event-name/@type" />
            </show>
            <xsl:for-each select="performances/performance">
              <performance>
                <xsl:value-of select="datetime"/>,&#160;<xsl:value-of select="location/location-name"/>
              </performance>
            </xsl:for-each>
          </xsl:if>
        </xsl:for-each>
      </events-by-type>

      <artists>
        <title>List of actors</title>
        <xsl:for-each select="event/performers/performer">
          <xsl:if test="@type='actor'">
            <performer>
              <xsl:value-of select="performer-name" />,&#160;<xsl:value-of select="@type" />
            </performer>
          </xsl:if>
        </xsl:for-each>
        <title>List of directors</title>
        <xsl:for-each select="event/performers/performer">
          <xsl:if test="@type='director'">
            <performer>
              <xsl:value-of select="performer-name" />,&#160;<xsl:value-of select="@type" />
            </performer>
          </xsl:if>
        </xsl:for-each>
      </artists>

      <locations>
        <title>List of concert halls</title>
        <xsl:for-each select="event/performances/performance/location/location-name">
          <xsl:if test="@type='concert hall'">
            <location>
              <xsl:value-of select="." />,&#160;<xsl:value-of select="@type" />
            </location>
          </xsl:if>
        </xsl:for-each>
      </locations>

    </events>
  </xsl:template>
</xsl:stylesheet>
