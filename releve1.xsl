<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"   version="2.0">
    <xsl:template match="/">
        <html>
            <head>
                <title>Releve</title>
            </head>
            <body>
                <h3>Releve bancaire du compte: <xsl:value-of select="/releve/@RIB"/></h3>
                <h3>Date releve: <xsl:value-of select="/releve/dateReleve"/></h3>
                <h3>Solde: <xsl:value-of select="/releve/solde"/></h3>
                <table border="1" width="80%">
                    <thead>
                        <tr>
                            <th>Date</th>
                            <th>Type</th>
                            <th>Montant DEBIT</th>
                            <th>Montant CREDIT</th>
                            <th>Description</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:for-each select="releve/operations/operation">
                        <tr>
                            <td><xsl:value-of select="@date"/></td>
                            <td><xsl:value-of select="@type"/></td>
                            <td><xsl:if test="@type='DEBIT'">
                                <xsl:value-of select="@montant"/>
                            </xsl:if></td>
                            <td><xsl:if test="@type='CREDIT'">
                                <xsl:value-of select="@montant"/>
                            </xsl:if></td>
                            <td><xsl:value-of select="@description"/></td>
                        </tr>
                        </xsl:for-each>
                    </tbody>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>