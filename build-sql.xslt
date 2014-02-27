<?xml version="1.0" encoding="utf-8" ?>
<!DOCTYPE xsl:stylesheet [
	<!ENTITY newline "&#x0a;">
]>
<xsl:stylesheet
	version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
>

	<xsl:output method="text" indent="no" omit-xml-declaration="yes" />
	
	<xsl:template match="/">
		<xsl:apply-templates select="docset/element | docset/functions/function" />
	</xsl:template>
	
	<xsl:template match="element | function">
		<xsl:if test="not(position() = 1)">
			<xsl:text>&newline;</xsl:text>
		</xsl:if>
		<xsl:text>INSERT OR IGNORE INTO searchIndex(name, type, path) VALUES ('</xsl:text>
			<xsl:value-of select="@name" />
			<xsl:text>', '</xsl:text>
			<xsl:value-of select="substring('Function|Element', not(self::function) * 9 + 1, 8)" />
			<xsl:text>', 'index.html#</xsl:text>
			<xsl:value-of select="@name" />
		<xsl:text>');</xsl:text>
	</xsl:template>
	
</xsl:stylesheet>