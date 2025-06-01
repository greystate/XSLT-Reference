<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet
	version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
>
	<xsl:output method="xml" indent="yes" omit-xml-declaration="no" />

	<xsl:param name="filename" />

	<xsl:template match="/">
		<entry>
			<version><xsl:value-of select="docset/@version" /></version>
			<url><xsl:value-of select="concat('https://xslt.dk/reference/', $filename, '.tgz')" /></url>
		</entry>
	</xsl:template>

</xsl:stylesheet>
