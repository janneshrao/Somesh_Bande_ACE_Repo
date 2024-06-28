<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="xs soapenv xsi" version="2.0" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output encoding="UTF-8" indent="yes" method="xml" omit-xml-declaration="yes"></xsl:output>
    <xsl:template match="/">
        <xsl:element name="Eidiko">
            <xsl:element name="Name">
                <xsl:value-of select="soapenv:Envelope/soapenv:Body/Eidiko/Name"></xsl:value-of>
            </xsl:element>
            <xsl:element name="EmpID">
                <xsl:value-of select="soapenv:Envelope/soapenv:Body/Eidiko/EmpID"></xsl:value-of>
            </xsl:element>
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>