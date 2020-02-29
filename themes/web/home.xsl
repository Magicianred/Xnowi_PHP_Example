<?xml version="1.0" encoding="iso-8859-1" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="xml" encoding="iso-8859-1" omit-xml-declaration="yes" version="1.0" indent="yes"/>

  <xsl:include href="core/config.xsl"/>
  
  <xsl:template name="content">
	<!--(debug - lang:<xsl:value-of select="$language"></xsl:value-of>; pagename: <xsl:value-of select="$pageName">index</xsl:value-of>;
		urlRoot: pagename: <xsl:value-of select="$urlRoot"/>; pathRoot: <xsl:value-of select="$pathRoot"/>)-->
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
        <hr />
        <div id="login">
        	
	      <xsl:if test="$isLoggin!='1'">
		<p><xsl:value-of select="//languages/strings/string[@id=2]"/>.<br/>(!!! <xsl:value-of select="//languages/strings/string[@id=3]"/> !!!)</p>
		
		<form name="frmLogin" id="frmLogin" action="{$pathRoot}logics/Login.php" method="POST">
		  <label for="txtUser"><xsl:value-of select="//languages/strings/string[@id=7]"/></label>
		  <input type="text" id="txtUser" name="txtUser" value="{//languages/strings/string[@id=7]}" />
		  <label for="txtPass"><xsl:value-of select="//languages/strings/string[@id=8]"/></label>
		  <input type="password" id="txtPass" name="txtPass" value="{//languages/strings/string[@id=8]}" />
		  <input type="submit" name="Login" id="Login" value="Login" />
		</form>
	      </xsl:if>
	      
		<xsl:if test="$isLoggin='1'">
		  <xsl:value-of select="//languages/strings/string[@id=5]"/>.<br />
		  <strong>
		    <xsl:value-of select="//languages/strings/string[@id=4]"/><xsl:text>&#160;</xsl:text><em><xsl:value-of select="$username"/></em>.
		  </strong> <a href="{$pathRoot}logics/Login.php"> <xsl:value-of select="//languages/strings/string[@id=6]"/></a>.
		</xsl:if>
	</div>
      </div>
    </div>
  </xsl:template>

</xsl:stylesheet>
