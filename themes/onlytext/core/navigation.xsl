<?xml version="1.0" encoding="ISO-8859-1" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="xml" encoding="iso-8859-1" omit-xml-declaration="yes" version="1.0" indent="yes"/>
    
    <xsl:template name="navigation">
        <div id="navigation">
			<a id="navigation-menu" name="navigation-menu" href="#navigation-menu" title="{//languages/strings/string[@name='accesskey-link-navigation']}" accesskey="N"/>
			<xsl:if test="$lang_mode='cookie'">
				<ul>
					<li><strong><xsl:value-of select="//languages/strings/string[@name='menu-navigation']"/> (cookie):</strong></li>
					<xsl:for-each select="//navigations/sections/section">
						<xsl:variable name="sectionname" select="./@name"/>
						<xsl:if test="count(pages/page)>1">
							<li> - <xsl:value-of select="$sectionname"/></li>
						</xsl:if>
						<xsl:for-each select="./pages/page">
							<xsl:variable name="pagename" select="./@name"/>
							<xsl:variable name="pagemode" select="./@mode"/>
							<li><a>
									<xsl:attribute name="id"><xsl:value-of select="$pagename"/></xsl:attribute>
								<xsl:choose>
									<xsl:when test="$pagemode='external'">
										<xsl:attribute name="href"><xsl:value-of select="@href"/></xsl:attribute>
									</xsl:when>
									<xsl:otherwise>
										<xsl:attribute name="href"><xsl:value-of select="$pagename"/><xsl:value-of select="$pageExt"/></xsl:attribute>
									</xsl:otherwise>
								</xsl:choose>
								<xsl:attribute name="title">
									<xsl:value-of select="@description"/>
								</xsl:attribute>
								<xsl:value-of select="//languages/strings/string[@name=concat('link-',$pagename)]"/>
						</a></li>
						</xsl:for-each>
					</xsl:for-each>
				</ul>
			</xsl:if>
			<xsl:if test="$lang_mode='uri'">
				<ul>
					<li><strong><xsl:value-of select="//languages/strings/string[@name='menu-navigation']"/> (uri):</strong></li>
					<xsl:for-each select="//navigations/sections/section">
						<xsl:variable name="sectionname" select="./@name"/>
						<xsl:if test="count(pages/page)>1">
							<li> - <xsl:value-of select="$sectionname"/></li>
						</xsl:if>
						<xsl:for-each select="./pages/page">
							<xsl:variable name="pagename" select="./@name"/>
							<xsl:variable name="pagemode" select="./@mode"/>
							<li><a id="{$pagename}">
								<xsl:choose>
									<xsl:when test="$pagemode='external'">
										<xsl:attribute name="href"><xsl:value-of select="@href"/></xsl:attribute>
									</xsl:when>
									<xsl:otherwise>
										<xsl:attribute name="href"><xsl:value-of select="//navigations/lang-pagenames/string[@name=concat($language,concat('-pagename_',$pagename))]"/><xsl:value-of select="$pageExt"/></xsl:attribute>
									</xsl:otherwise>
								</xsl:choose>
								<xsl:attribute name="title">
									<xsl:value-of select="@description"/>
								</xsl:attribute>
								<xsl:value-of select="//navigations/lang-pagenames/string[@name=concat($language,concat('-pagename_',$pagename))]"/>
						</a></li>
						</xsl:for-each>
					</xsl:for-each>
				</ul>
            </xsl:if>
          <ul>
            <li>
              <strong><xsl:value-of select="//languages/strings/string[@name='menu-mode']"/>:</strong>
            </li>
                <xsl:for-each select="//navigations/modes/mode">
                	<xsl:variable name="modeview" select="@name"/>
                    <li><a id="{@id}">
                      <xsl:attribute name="href"><xsl:value-of select="$pathRoot"/>logics/SwitchTheme.php?mode=<xsl:value-of select="@name"/></xsl:attribute>
                      <xsl:attribute name="title"><xsl:value-of select="//languages/strings/string[@name='title-link-mode']"/><xsl:text>&#160;</xsl:text>'<xsl:value-of select="//languages/strings/string[@name=concat('link-',$modeview)]"/>'</xsl:attribute>
                      <xsl:value-of select="//languages/strings/string[@name=concat('link-',$modeview)]"/>
                    </a></li>
                </xsl:for-each>
      		<li><p>Select: <xsl:value-of select="$mode"/></p></li>
          </ul>
			  <ul>
				<li>
				  <strong><xsl:value-of select="//languages/strings/string[@name='menu-language']"/> (cookie):</strong>
				</li>
					<xsl:for-each select="//navigations/langs/lang">
						<xsl:variable name="langcode" select="@id"/>
						<li><a id="{@id}">
						  <xsl:attribute name="href"><xsl:value-of select="$pathRoot"/>logics/SwitchLang.php?lang=<xsl:value-of select="@id"/></xsl:attribute>
						  <xsl:attribute name="title"><xsl:value-of select="//languages/strings/string[@name='title-link-language']"/><xsl:text>&#160;</xsl:text>'<xsl:value-of select="@name"/>'</xsl:attribute>
						  <xsl:value-of select="//languages/strings/string[@name=concat('link-',$langcode)]"/>
						</a></li>
					</xsl:for-each>
			  </ul>
			<xsl:if test="$lang_mode='uri'">
			  <ul>
				<li>
				  <strong><xsl:value-of select="//languages/strings/string[@name='menu-language']"/> (uri):</strong>
				</li>
					<xsl:for-each select="//navigations/langs/lang">
						<xsl:variable name="langcode" select="@id"/>
						<li><a id="{@id}">
						  <xsl:attribute name="href"><xsl:value-of select="$pathRoot"/><xsl:value-of select="$langcode"/>/<xsl:value-of select="//navigations/lang-pagenames/string[@name=concat($langcode,concat('-pagename_',$pageName))]"/><xsl:value-of select="$pageExt"/></xsl:attribute>
						  <xsl:attribute name="title"><xsl:value-of select="//languages/strings/string[@name='title-link-language']"/><xsl:text>&#160;</xsl:text>'<xsl:value-of select="@name"/>'</xsl:attribute>
						   <xsl:value-of select="//navigations/lang-pagenames/string[@name=concat($langcode,concat('-pagename_',$pageName))]"/>
						  (<xsl:value-of select="$langcode"/>)
						</a></li>
					</xsl:for-each>
				<li><p><em><xsl:value-of select="//languages/strings/string[@id=1]"/></em></p></li>
			  </ul>
			</xsl:if> 
			<xsl:if test="$lang_mode='cookie'">
			  <ul>
				<li>
				  <strong><xsl:value-of select="//languages/strings/string[@name='menu-language']"/> (uri):</strong>
				</li>
					<xsl:for-each select="//navigations/langs/lang">
						<xsl:variable name="langcode" select="@id"/>
						<li><a id="{@id}">
						  <xsl:attribute name="href"><xsl:value-of select="$pathRoot"/><xsl:value-of select="$langcode"/>/</xsl:attribute>
						  <xsl:attribute name="title"><xsl:value-of select="//languages/strings/string[@name='title-link-language']"/><xsl:text>&#160;</xsl:text>'<xsl:value-of select="@name"/>'</xsl:attribute>
						  (<xsl:value-of select="//languages/strings/string[@name=concat('link-',$langcode)]"/>)
						</a></li>
					</xsl:for-each>
				<li><p><em><xsl:value-of select="//languages/strings/string[@id=1]"/></em></p></li>
			  </ul>
			</xsl:if>
        </div>
    </xsl:template>
    
</xsl:stylesheet>
