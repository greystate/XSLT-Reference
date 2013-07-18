<?xml version="1.0" encoding="utf-8" ?>
<!DOCTYPE xsl:stylesheet [
	<!ENTITY id-prefix "">
]>
<xsl:stylesheet
	version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
>

	<xsl:output
		method="html"
		indent="yes"
		omit-xml-declaration="yes"
		doctype-system="about:legacy-compat"
	/>

	<xsl:variable name="prefix" select="'&lt;xsl:'" />
	<xsl:variable name="suffix" select="'&gt;'" />
	
	<xsl:key name="elements-by-name" match="element" use="@name" />
	<xsl:key name="nodes-by-name" match="element | attribute" use="@name" />
	
	<xsl:template match="/">
		<html>
		<head>
			<link rel="stylesheet" href="/css/docset.css" />
			<meta name="viewport" content="width=device-width, initial-scale=1" />
			<xsl:comment>
Note: This file is generated by XSLT from the elements.xml file.
So you definitely shouldn't be editing it, or you'll end up sad...
			</xsl:comment>
		</head>
		<body>
			<xsl:apply-templates select="docset/element" />
		</body>
		</html>
	</xsl:template>
	
	<xsl:template match="element">
		<section class="element" id="&id-prefix;{@name}">
			<xsl:apply-templates select="@name" />
			<xsl:apply-templates select="description" />
			<ul class="content">
				<xsl:apply-templates select="attribute" mode="content" />
			</ul>
			<ul class="content">
				<xsl:apply-templates select="element" mode="content" />
			</ul>
		</section>
	</xsl:template>
	
	<xsl:template match="element[@ref]">
		<xsl:apply-templates select="key('elements-by-name', @ref)" />
	</xsl:template>
	
	<xsl:template match="element/@name">
		<h1>
			<a href="#&id-prefix;{.}">
				<xsl:value-of select="$prefix" />
				<xsl:value-of select="." />
				<xsl:value-of select="$suffix" />
			</a>
		</h1>
		
	</xsl:template>
	
	<xsl:template match="element" mode="content">
		<xsl:variable name="name" select="concat(@name, key('nodes-by-name', @ref)/@name)" />
		<xsl:variable name="displayName" select="concat($prefix, $name, $suffix)" />
		<li class="elem-ref">
			<a href="#&id-prefix;{$name}">
				<xsl:value-of select="$displayName" />
			</a>
		</li>
	</xsl:template>
	
	<xsl:template match="attribute" mode="content">
		<xsl:variable name="name" select="concat(@name, key('nodes-by-name', @ref)/@name)" />
		<li class="attr-ref">
			<xsl:value-of select="$name" />
		</li>
	</xsl:template>
	
	<xsl:template match="description">
		<div class="desc">
			<xsl:apply-templates />
		</div>
	</xsl:template>
	
	<xsl:template match="description//*">
		<xsl:copy>
			<xsl:apply-templates select="* | text()" />
		</xsl:copy>
	</xsl:template>
	
	<xsl:template match="description//ref">
		<a href="#{.}">
			<xsl:value-of select="." />
		</a>
	</xsl:template>

</xsl:stylesheet>