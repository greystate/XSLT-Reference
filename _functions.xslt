<?xml version="1.0" encoding="utf-8" ?>
<!DOCTYPE xsl:stylesheet [
	<!ENTITY id-prefix "">
]>
<xsl:stylesheet
	version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
>

	<xsl:variable name="func-prefix" select="'('" />
	<xsl:variable name="func-suffix" select="')'" />


	<xsl:template match="function">
		<section class="function" id="&id-prefix;{@name}">
			<xsl:apply-templates select="@name" />
			<xsl:apply-templates select="description" />
		</section>
	</xsl:template>
	
	<xsl:template match="function/@name">
		<h1>
			<a href="#&id-prefix;{.}">
				<xsl:value-of select="." />
				<xsl:value-of select="$func-prefix" />
				<span class="arglist">
					<xsl:apply-templates select="../argument" mode="arglist" />
				</span>
				<xsl:value-of select="$func-suffix" />
			</a>
		</h1>
	</xsl:template>
	
	<xsl:template match="argument" mode="arglist">
		<span class="arg-ref">
			<xsl:if test="@required = 'yes'"><xsl:attribute name="class">arg-ref required</xsl:attribute></xsl:if>
			<xsl:value-of select="@name" />
		</span>
		<xsl:apply-templates select="." mode="typeinfo" />
		<xsl:if test="not(position() = last())">, </xsl:if>
		
	</xsl:template>

	<xsl:template match="argument" mode="typeinfo">
		<span class="type">
			<xsl:text> </xsl:text>
			<span class="general"><xsl:value-of select="@type" /></span>
		</span>
	</xsl:template>

</xsl:stylesheet>