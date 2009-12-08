<xsl:stylesheet
    xmlns:s="http://www.ascc.net/xml/schematron"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:i="http://www.iso.org/ns/1.0"
    xmlns:XSL="http://www.w3.org/1999/XSL/TransformAlias" 
    exclude-result-prefixes="xsl s" 
    version="2.0"
>

<xsl:output method="xml" indent="yes" encoding="utf-8"/>

<xsl:namespace-alias stylesheet-prefix="XSL" result-prefix="xsl"/>

<xsl:template match="/">
<XSL:stylesheet
    xmlns:i="http://www.iso.org/ns/1.0"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    version="2.0"
>

<XSL:output method="xml" indent="yes" encoding="utf-8"/>

  <xsl:for-each select="s:schema/s:pattern/s:rule">
    <XSL:template match="{@context}">
      <XSL:copy>
	<XSL:apply-templates select="*|@*|processing-instruction()|comment()|text()" mode="part0"/>
      </XSL:copy>
      <xsl:for-each select="s:assert|s:report">
      <xsl:choose>
	<xsl:when test="self::s:assert">
	  <XSL:if test="not({@test})">
	    <XSL:processing-instruction name="ISOerror">
	      <XSL:copy-of select="text()"/>
	    </XSL:processing-instruction>
	  </XSL:if>
	</xsl:when>
	<xsl:when test="self::s:report">
	  <XSL:if test="{@test}">
	    <XSL:processing-instruction name="ISOerror">
	      <XSL:copy-of select="text()"/>
	    </XSL:processing-instruction>
	  </XSL:if>
	</xsl:when>
      </xsl:choose>
      </xsl:for-each>
    </XSL:template>
  </xsl:for-each>
</XSL:stylesheet>
</xsl:template>

</xsl:stylesheet>