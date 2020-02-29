<?xml version="1.0" encoding="ISO-8859-1" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="xml" encoding="iso-8859-1" omit-xml-declaration="yes" version="1.0" indent="yes"/>
    
    <xsl:template name="footer">
        <div id="footer">
            <img src="{$pathTheme}images/logo.png" id="logo" class="image" name="logo" title="Code Imagineer Logo" width="113" height="93">
                
            </img>
            <h3><strong><xsl:value-of select="//website/name" /></strong> <em>(<xsl:value-of select="//website/denomination" />)</em></h3>
            <p><xsl:value-of select="//languages/strings/string[@id=22]" /><xsl:text>&#160;</xsl:text><a target="_blank" href="http://simone.paolucci.name">Magicianred</a>, <em>Code Imagineer</em></p>
            <p><xsl:value-of select="//languages/strings/string[@id=23]" /><xsl:text>&#160;</xsl:text>
            	<a target="_blank" href="http://simone.paolucci.name/licences/LAGPLv3.txt"><acronym title="Lesser Affero General Public License v3">LAGPLv3</acronym></a>
            	derived by <a target="_blank" href="http://simone.paolucci.name/licences/AGPLv3.txt"><acronym title="Affero General Public License v3">AGPLv3</acronym></a>
            </p>
            <p>
            	<strong>Xs.WebUI</strong><xsl:text>&#160;</xsl:text><xsl:value-of select="//languages/strings/string[@id=29]" /><xsl:text>&#160;</xsl:text>
            	<strong><a href="http://simone.paolucci.name/xnowi">xnowi</a></strong>
            	<xsl:text>&#160;</xsl:text><xsl:value-of select="//languages/strings/string[@id=30]" />
            	<xsl:text>&#160;</xsl:text><xsl:value-of select="//languages/strings/string[@id=31]" />
            </p>
            <p>
				<span xmlns:dct="http://purl.org/dc/terms/" href="http://purl.org/dc/dcmitype/Text" property="dct:title" rel="dct:type">Xs.WebUI</span> 
				by <a xmlns:cc="http://creativecommons.org/ns#" href="http://simone.paolucci.name/xnowi" property="cc:attributionName" rel="cc:attributionURL">Simone Paolucci</a> 
				is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by/3.0/">Creative Commons Attribuzione 3.0 Unported License</a>.
				<br />Permissions beyond the scope of this license may be available at <a xmlns:cc="http://creativecommons.org/ns#" href="http://simone.paolucci.name" rel="cc:morePermissions">http://simone.paolucci.name</a>.
            </p>
        </div>
    </xsl:template>
    
</xsl:stylesheet>
