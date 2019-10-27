<xsl:stylesheet id="stylesheet"
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   version="1.0">
  <xsl:template match="xsl:stylesheet" /> 
  <xsl:param name="pMonthNames">
  <name><short>JAN</short><full>Januar</full></name>
  <name><short>FEB</short><full>Februar</full></name>
  <name><short>MAR</short><full>März</full></name>
  <name><short>APR</short><full>April</full></name>
  <name><short>MAY</short><full>Mai</full></name>
  <name><short>JUN</short><full>Juni</full></name>
  <name><short>JUL</short><full>Juli</full></name>
  <name><short>AUG</short><full>August</full></name>
  <name><short>SEP</short><full>September</full></name>
  <name><short>OCT</short><full>Oktober</full></name>
  <name><short>NOV</short><full>November</full></name>
  <name><short>DEC</short><full>Dezember</full></name>
 </xsl:param>

 <xsl:variable name="vMonthNames" select=
     "document('')/*/xsl:param[@name='pMonthNames']/*"/>

  <xsl:template match="/FreeXml">
    <xsl:for-each select="Losungen">
    
# <xsl:variable name="dayNo" select="number(substring-after(substring-after(substring-before(Datum,'T'),'-'),'-'))" />
<xsl:variable name="monthNo" select="number(substring-before(substring-after(Datum,'-'),'-'))" />
<xsl:value-of select="Wtag"/>, <xsl:value-of select="$dayNo"/>. <xsl:value-of select="$vMonthNames[$monthNo]/full"/>
    <xsl:text>&#xa;&#xa;</xsl:text>
    <xsl:text>&gt; </xsl:text><xsl:value-of select="Losungstext"/><xsl:text>&#xa;&#xa;</xsl:text>
<xsl:value-of select="Losungsvers"/>
    <xsl:text>&#xa;&#xa;---&#xa;&#xa;</xsl:text>

    <xsl:text>&gt; </xsl:text><xsl:value-of select="Lehrtext"/><xsl:text>&#xa;&#xa;</xsl:text>
<xsl:value-of select="Lehrtextvers"/>


  </xsl:for-each>
</xsl:template>
</xsl:stylesheet>