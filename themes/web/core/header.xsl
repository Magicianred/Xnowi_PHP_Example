<?xml version="1.0" encoding="ISO-8859-1" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <xsl:template name="header">
        <div id="header">
            <h1><strong><xsl:value-of select="//website/name" /></strong> <em>(<xsl:value-of select="//website/denomination" />)</em></h1>
            <p><xsl:value-of select="//languages/content/header/slogan" /></p>
        </div>
    </xsl:template>
    
</xsl:stylesheet>