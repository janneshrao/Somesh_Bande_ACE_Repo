<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" 
xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" exclude-result-prefixes="xs soapenv xsi" 
version="2.0">
    <xsl:output method="xml" indent="yes" encoding="UTF-8" omit-xml-declaration="yes"/>
    <xsl:template match="/">
        <xsl:element name="Eidiko">
            <xsl:element name="Name">
                <xsl:value-of 
select="soapenv:Envelope/soapenv:Body/Eidiko/Name"/>
            </xsl:element>
            <xsl:element name="EmpID">
                <xsl:value-of 
select="soapenv:Envelope/soapenv:Body/Eidiko/EmpID"/>
            </xsl:element>
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>