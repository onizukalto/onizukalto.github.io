<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="UTF-8"/>
    <xsl:key name="projects-by-language" match="Project" use="Language" />
    <xsl:template match="/">
        <html>
            <head>
                <title>CV - Issam ALIK</title>
                <style>
                    body {
                        font-family: Arial, sans-serif;
                        margin: 20px;
                    }
                    .section {
                        margin-bottom: 20px;
                    }
                    .section-title {
                        font-size: 24px;
                        color: #4CAF50;
                        border-bottom: 2px solid #4CAF50;
                        margin-bottom: 10px;
                    }
                    .item {
                        margin-bottom: 10px;
                    }
                    .item-title {
                        font-weight: bold;
                    }
                    .item-details {
                        margin-left: 20px;
                    }
                    .skills-container {
                        display: flex;
                        justify-content: space-between;
                        margin-bottom: 20px;
                    }
                    .skills-column {
                        width: 48%;
                    }
                    .subsection-title {
                        font-weight: bold;
                        margin-bottom: 10px;
                    }
                    ul {
                        list-style-type: disc;
                        margin: 0;
                        padding-left: 20px;
                    }
                </style>
            </head>
            <body>

                <div class="section">
                    <div class="section-title">Objectif</div>
                    <div class="item-details"><xsl:value-of select="CV/Objective/Text"/></div>
                </div>

                <div class="section">
                    <div class="section-title">Informations Personnelles</div>
                    <div class="item"><span class="item-title">Nom:</span> <span class="item-details"><xsl:value-of select="CV/PersonalInformation/Name"/></span></div>
                    <div class="item"><span class="item-title">Adresse:</span> <span class="item-details"><xsl:value-of select="CV/PersonalInformation/Address"/></span></div>
                    <div class="item"><span class="item-title">Téléphone:</span> <span class="item-details"><xsl:value-of select="CV/PersonalInformation/Phone"/></span></div>
                    <div class="item"><span class="item-title">Email:</span> <span class="item-details"><xsl:value-of select="CV/PersonalInformation/Email"/></span></div>
                    <div class="item"><span class="item-title">LinkedIn:</span> <span class="item-details"><xsl:value-of select="CV/PersonalInformation/LinkedIn"/></span></div>
                </div>
                
                <div class="section">
                    <div class="section-title">Formation</div>
                    <xsl:for-each select="CV/Education/Degree">
                        <div class="item">
                            <div class="item-title"><xsl:value-of select="Years"/> - <xsl:value-of select="Institution"/></div>
                        </div>
                    </xsl:for-each>
                </div>
                
                <div class="section">
                    <div class="section-title">Expérience Professionnelle</div>
                    <xsl:for-each select="CV/Experience/Job">
                        <div class="item">
                            <div class="item-title"><xsl:value-of select="Title"/></div>
                            <div class="item-details"><xsl:value-of select="Company"/> - <xsl:value-of select="Responsibilities"/></div>
                            <xsl:if test="Duration">
                                <div class="item-details">( <xsl:value-of select="Duration"/> )</div>
                            </xsl:if>
                        </div>
                    </xsl:for-each>
                </div>
                
                <div class="section">
                    <div class="section-title">Projets</div>
                    <xsl:for-each select="CV/Projects/Project[generate-id() = generate-id(key('projects-by-language', Language)[1])]">
                        <div class="item">
                            <div class="item-title"><xsl:value-of select="Language"/></div>
                            <xsl:for-each select="key('projects-by-language', Language)">
                                <div class="item-details"><xsl:value-of select="Description"/></div>
                            </xsl:for-each>
                        </div>
                    </xsl:for-each>
                </div>
                
                <div class="section">
                    <div class="section-title">Compétences</div>
                    <div class="skills-container">
                        <div class="skills-column">
                            <div class="subsection-title">Langues</div>
                            <ul>
                                <xsl:for-each select="CV/Skills/Languages">
                                    <li><xsl:value-of select="Language"/> - <xsl:value-of select="Proficiency"/></li>
                                </xsl:for-each>
                            </ul>
                        </div>
                        <div class="skills-column">
                            <div class="subsection-title">Soft Skills</div>
                            <ul>
                                <xsl:for-each select="CV/Skills/SoftSkills/Skill">
                                    <li><xsl:value-of select="."/></li>
                                </xsl:for-each>
                            </ul>
                        </div>
                    </div>
                    <div class="subsection" style="margin-top: 20px;">
                        <div class="subsection-title">Compétences Techniques</div>
                        <xsl:for-each select="CV/Skills/TechnicalSkills/Skill">
                            <div class="item">
                                <div class="item-details"><xsl:value-of select="."/></div>
                            </div>
                        </xsl:for-each>
                    </div>
                </div>
                
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
