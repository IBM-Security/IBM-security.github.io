<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
 >
 
<xsl:template match="index">
<html>
    <head>
    <link rel="stylesheet" type="text/css" href="./index.css"/>
    <meta charset="UTF-8"/>
    <script type="text/javascript" src="mktree.js"></script>
	
    <title>RAPIDOC!</title>
    </head>
    <body>
      <xsl:call-template name="topic"/>
    </body>
  </html>
</xsl:template> 

<xsl:template name="topic">
  <ul class="mktree"> 
    <xsl:for-each select="topic">
	
      <li> 
          
      <xsl:choose>

         <xsl:when test="@file">
          <a>
            <xsl:attribute name="href"><xsl:value-of select="@file"/></xsl:attribute>
            <xsl:attribute name="target">page</xsl:attribute>
             <xsl:value-of select="@name"/>
          </a>
        </xsl:when>
        <xsl:otherwise>
            <b><xsl:value-of select="@name"/></b>
            <xsl:call-template name="topic"/>
        </xsl:otherwise>
      </xsl:choose>
      </li> 
  </xsl:for-each>
  </ul> 
</xsl:template>


</xsl:stylesheet>