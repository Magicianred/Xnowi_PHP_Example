<?xml version="1.0" encoding="iso-8859-1" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="xml" encoding="iso-8859-1" omit-xml-declaration="yes" version="1.0" indent="yes"/>

  <xsl:include href="core/config.xsl"/>

  <xsl:template name="content">
      <h3>
        <xsl:value-of select="//root/website/name"/>
	<br/>      
        <xsl:value-of select="//root/website/denomination"/>
      <br/>
        <xsl:value-of select="//root/website/slogan"/>
      </h3>
      <div id="content">
        <xsl:copy-of select="//languages/content/text"/>
      </div>
    
  </xsl:template>

</xsl:stylesheet>