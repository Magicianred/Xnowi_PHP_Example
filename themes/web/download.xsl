<?xml version="1.0" encoding="iso-8859-1" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="xml" encoding="iso-8859-1" omit-xml-declaration="yes" version="1.0" indent="yes"/>

  <xsl:include href="core/config.xsl"/>

  <xsl:template name="content">
    <div>
      <h1>
        <xsl:value-of select="//root/website/name"/>
      </h1>
      <h2>
        <xsl:value-of select="//root/website/denomination"/>
      </h2>
      <p>
        <xsl:value-of select="//root/website/slogan"/>
      </p>
      <div id="content">
        <xsl:copy-of select="//languages/content/text"/>
      </div>
    </div>
  </xsl:template>

</xsl:stylesheet>