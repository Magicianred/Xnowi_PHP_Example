<?xml version="1.0" encoding="ISO-8859-1" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <xsl:template name="header">
        <div id="header">
		<div class="sin"><h1><strong><xsl:value-of select="//website/name" /></strong> <em>(<xsl:value-of select="//website/denomination" />)</em></h1></div>
        	<div class="des"><h2><xsl:value-of select="//languages/content/header/slogan" /></h2></div>
        </div>
    </xsl:template>
    
</xsl:stylesheet>