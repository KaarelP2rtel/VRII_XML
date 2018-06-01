<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <html>
      <body>
        <h1>Events</h1>
        <hr />
        <xsl:for-each select="events/event">
          <table>
            <tr>
              <td>Name</td>
              <td>
                <xsl:value-of select="event-name"/>
              </td>
            </tr>
            <xsl:if test="event-description">
              <tr>
                <td>Description</td>
                <td>
                  <xsl:value-of select="event-description"/>
                </td>
              </tr>
            </xsl:if>

            <xml:if test="performances">
            <xsl:for-each select="performances/performance">
              <tr>
                <td>When / Where</td>
                <td>
                  <xsl:value-of select="datetime"/>,&#160;<xsl:value-of select="location/location-name"/>,&#160;<xsl:value-of select="price"/>&#160;&#8364;
                </td>
              </tr>              
            </xsl:for-each>
            </xml:if>
            <br/>
            <br/>

          </table>
          <hr />
        </xsl:for-each>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
