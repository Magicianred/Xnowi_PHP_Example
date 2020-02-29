<?xml version="1.0" encoding="ISO-8859-1" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:include href="base.config.xsl"/>
  
  <xsl:include href="header.xsl"/>
  <xsl:include href="footer.xsl"/>
  <xsl:include href="navigation.xsl"/>

  <xsl:template match="/">
    <html xmlns="http://www.w3.org/1999/xhtml" xml:lang="{$language}">
      <head>
        <xsl:call-template name="head" />
      </head>
      <body>
        <xsl:call-template name="header"></xsl:call-template>
        <xsl:call-template name="content"></xsl:call-template>
        <xsl:call-template name="navigation"></xsl:call-template>
        <xsl:call-template name="footer"></xsl:call-template>
      </body>
    </html>
  </xsl:template>

  <xsl:template name="head">
    <title>
      <xsl:value-of select="//website/name" /> -<xsl:value-of select="//website/denomination" /> 
    </title>
    <link type="text/css" rel="stylesheet" href="{$pathRoot}{$pathTheme}styles/onlytext.css" media="screen" />
    <link type="text/css" rel="stylesheet" href="{$pathRoot}{$pathTheme}styles/print.css" media="print" />
  </xsl:template>

</xsl:stylesheet>
