<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:json="http://www.ibm.com/xmlns/prod/2009/jsonx" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output indent="yes"></xsl:output>
    <xsl:template match="/">
        <json:object>
            <json:object name="Eidiko">
                <json:string name="Name">
                    <xsl:value-of select="Eidiko/Name"></xsl:value-of>
                </json:string>
                <json:string name="EmpID">
                    <xsl:value-of select="Eidiko/EmpID"></xsl:value-of>
                </json:string>
            </json:object>
        </json:object>
    </xsl:template>
</xsl:stylesheet>