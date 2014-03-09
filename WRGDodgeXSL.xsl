<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" encoding="utf-8" indent="no"/>
    <xsl:template match="/">
        <reports>
            <xsl:for-each select="reports/dodge-report">
                <project-temp>
                    <p-id>
                        <xsl:value-of select="./summary/dr-nbr"/>
                    </p-id>
                    <p-ver>
                        <xsl:value-of select="./summary/dr-ver"/>
                    </p-ver>
                    <p-url>
                        <xsl:value-of select="./summary/cn-project-url"/>
                    </p-url>
                    <p-title>
                        <xsl:value-of select="./data/proj-title/title-code/title"/>
                    </p-title>
                    <p-addr-line1>
                        <xsl:value-of select="./data/p-location/project-location/title-code/p-addr-line/p-addr-line1"/>
                    </p-addr-line1>
                    <p-addr-line2>
                        <xsl:value-of select="./data/p-location/project-location/title-code/p-addr-line/p-addr-line2"/>
                    </p-addr-line2>
                    <p-additonal-details>
                        <nbr-of-bldg>
                            <xsl:value-of select="./data/details/structural-data/title-code/nbr-of-bldg"/>
                        </nbr-of-bldg>
                        <nbr-of-story-ag>
                            <xsl:value-of select="./data/details/structural-data/title-code/nbr-of-story-ag"/>
                        </nbr-of-story-ag>
                        <p-text>
                            <xsl:value-of select="./data/details/std-includes/title-code"/>
                        </p-text>
                    </p-additonal-details>
                    <p-notes>
                    <proj-notes>
                    <xsl:value-of select="./data/project-notes/proj-notes/title-code"/>
                    
                    </proj-notes>
                    </p-notes>
                </project-temp>
            </xsl:for-each>
        </reports>
    </xsl:template>
</xsl:stylesheet>
