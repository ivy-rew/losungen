<xsl:stylesheet id="stylesheet"
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   version="1.0">
  <xsl:template match="xsl:stylesheet" />
<xsl:template match="Datum">
    <Datum>
        <xsl:value-of select="substring-before(.,'T')" />
    </Datum>
</xsl:template> 
  <xsl:template match="/FreeXml">
    <xsl:for-each select="Losungen">


    
# <xsl:value-of select="substring-before(Datum,'T')"/><xsl:text>&#xa;&#xa;</xsl:text>
    <xsl:value-of select="Wtag"/><xsl:text>&#xa;&#xa;</xsl:text>
<xsl:text>&gt; </xsl:text><xsl:value-of select="Losungstext"/><xsl:text>&#xa;&#xa;</xsl:text>
    <xsl:value-of select="Losungsvers"/>
    <xsl:text>&#xa;&#xa;---&#xa;&#xa;</xsl:text>

    <xsl:value-of select="Lehrtext"/><br/>
    // <xsl:value-of select="Lehrtextvers"/>
    
  </xsl:for-each>
</xsl:template>
</xsl:stylesheet>