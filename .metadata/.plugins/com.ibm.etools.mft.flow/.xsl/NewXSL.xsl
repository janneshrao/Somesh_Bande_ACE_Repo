<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:dp="http://www.datapower.com/extensions" xmlns:func="http://exslt.org/functions" xmlns:json="http://www.ibm.com/xmlns/prod/2009/jsonx" xmlns:regexp="http://exslt.org/regular-expressions" xmlns:xalan="http://xml.apache.org/xslt" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    
    <xsl:output encoding="utf-8" indent="no" media-type="application/json" method="text"></xsl:output>

    <func:function name="json:procNameAttr">
       <xsl:if test="local-name(..)='object'">
          <func:result select="concat('&quot;', dp:encode(@name, 'json-escape-reverse-solidus'), '&quot;', ':')"></func:result>
       </xsl:if>
    </func:function>

    <xsl:template match="json:object">
        <xsl:value-of select="json:procNameAttr()"></xsl:value-of>
        <xsl:text>{ </xsl:text>
        <xsl:for-each select="*">
           <xsl:apply-templates select="."></xsl:apply-templates>
            <xsl:if test="position() != last()">
                <xsl:text>, </xsl:text>
            </xsl:if>
       </xsl:for-each>
       <xsl:text> }</xsl:text>
    </xsl:template>

    <xsl:template match="json:array">
        <xsl:value-of select="json:procNameAttr()"></xsl:value-of>
        <xsl:text>[ </xsl:text>
        <xsl:for-each select="*">
            <xsl:apply-templates select="."></xsl:apply-templates>
            <xsl:if test="position() != last()">
                <xsl:text>, </xsl:text>
            </xsl:if>
        </xsl:for-each>
        <xsl:text> ]</xsl:text>
    </xsl:template>

    <xsl:template match="json:string">
       <xsl:value-of select="json:procNameAttr()"></xsl:value-of>
       <xsl:text>"</xsl:text>  
       <xsl:value-of select="dp:encode(., 'json-escape-reverse-solidus')"></xsl:value-of>
       <xsl:text>"</xsl:text>
    </xsl:template>

    <xsl:template match="json:number">
       <xsl:value-of select="json:procNameAttr()"></xsl:value-of>
       <xsl:value-of select="normalize-space()"></xsl:value-of>
    </xsl:template>

    <xsl:template match="json:boolean">
       <xsl:value-of select="json:procNameAttr()"></xsl:value-of>
       <xsl:value-of select="normalize-space()"></xsl:value-of>
    </xsl:template>

    <xsl:template match="json:null">
        <xsl:value-of select="json:procNameAttr()"></xsl:value-of>
        <xsl:text>null</xsl:text>
    </xsl:template>
</xsl:stylesheet>