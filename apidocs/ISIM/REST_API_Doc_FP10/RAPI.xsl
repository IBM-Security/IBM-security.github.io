<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
 >
 
<xsl:template match="application">
  <html>
  <head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" type="text/css" href="./RAPI.css"/>

  </head>
  
     
  <body>
  <div id="index">
 
  </div>  <hr/>
  

  <div id="info">
  <xsl:variable name="path">
    <xsl:value-of select="resources/resource/@path"/>
  </xsl:variable>
  <xsl:for-each select="resources/resource">
  
  <h2>
    <xsl:value-of select="/application/doc"/>
  </h2>
  <xsl:for-each select="method/doc">
    <p>
      <xsl:value-of select="current()"/>
    </p>
  </xsl:for-each>   

  <h2>Request</h2>
    <h4>URL:</h4>
      <p class="filled"><xsl:value-of select="/application/resources/@base"/><xsl:value-of select="$path"/></p>
      <xsl:for-each select="method/request/doc[position()&gt;=2]">
        <div class="note note"><span class="notetitle"><b>Note:</b></span><xsl:value-of select="current()"/></div>
      </xsl:for-each>  
      
    <h4>Method:</h4>
      <p class="filled"><xsl:value-of select="method/@name"/></p>
    

    <h4>Parameters</h4>
    <table >
      <tr>
      <th class="shortHead">
      Parameter
      </th>
      <th>
      Description
      </th>
      </tr>
      <xsl:for-each select="param">
        <tr>
          <td><xsl:value-of select="@name"/></td>
          <td><xsl:value-of select="doc"/></td>
        </tr>
      </xsl:for-each>
    </table>

    <h4>Headers</h4>
    <table >
      <tr>
      <th class="shortHead">
      Header</th>
        <th>Description</th>
      </tr>
      <xsl:for-each select="method/request/param">
        <tr >
          <td class="mono"><xsl:value-of select="@name"/></td>
          <td><xsl:value-of select="doc"/></td>
        </tr>
      </xsl:for-each>
    </table>
    <xsl:if test="method/request/representation !=''">
    <h4>Request Body</h4>
    <xsl:for-each  select="method/request/representation">
    <xsl:if test="position()!=1">
      <h5 class="repHead"><xsl:value-of select="@name"/></h5>
    </xsl:if> 
    <table >
      <tr>
      <th class="shortHead">
        Name</th>
      <th class="shortHead">
        Type</th>
      <th class="shortHead">
        Optional</th>
        <th>Description</th>
      </tr>
        <xsl:for-each select="param">
          <tr>
            <td><xsl:value-of select="@name"/></td>
            <td class="mono"><xsl:value-of select="@type"/></td>
            <td><xsl:value-of select="@optional"/></td>
            <td><xsl:value-of select="doc"/></td>
          </tr>
        </xsl:for-each>
    </table>
    <b class = "tabbed">
    <xsl:if test="doc">
      <xsl:value-of select="doc"/>
    </xsl:if>
    </b>
    <br/>
    </xsl:for-each>
    </xsl:if>
    <xsl:if test="method/request/doc">
      <h4>Request Example</h4>
      <pre class="filled"><xsl:value-of select="method/request/doc"/></pre>
    </xsl:if>
    <h2>Response</h2>
    <xsl:for-each select="method/response">
    <h3>Code: <xsl:value-of select="@status"/></h3>
    <p><xsl:value-of select="doc"/></p>
    <xsl:if test="param">
     <h5>Headers</h5>
    <table >
      <tr>
      <th class="shortHead">
        Header</th>
        <th>Description</th>
      </tr>
      <xsl:for-each select="param">
        <tr>
          <td class="mono"><xsl:value-of select="@name"/></td>
          <td><xsl:value-of select="doc"/></td>
        </tr>
      </xsl:for-each>
    </table>
        
    </xsl:if>
    <xsl:if test="representation">
    <h5>Response Body</h5>
    <xsl:for-each  select="representation">
    
    <xsl:if test="position()!=1">
      <h5 class="repHead"><xsl:value-of select="@name"/></h5>
    </xsl:if> 
    <table >
      <tr>
      <th class="shortHead">
        Name</th>
      <th class="shortHead">
        Type</th>
        <th>Description</th>
      </tr>
      <xsl:for-each select="param">
        <tr>
          <td><xsl:value-of select="@name"/></td>
          <td class="mono"><xsl:value-of select="@type"/></td>
          <td><xsl:value-of select="doc"/> <xsl:if test="@repeating" >
      <p>Note: This is an array of elements.</p>
      </xsl:if></td>
        </tr>
      </xsl:for-each>
    </table>
    <b class = "tabbed">
    <xsl:if test="doc">
      <xsl:value-of select="doc"/>
    </xsl:if>
    </b>
    <br/>
    </xsl:for-each>

    </xsl:if>

    <xsl:for-each select="doc[position()&gt;=3]">
      <div class="note note"><span class="notetitle"><b>Note:</b></span><xsl:value-of select="current()"/></div>
    </xsl:for-each>

    <xsl:if test="doc[2]">
    <h4>Response Example</h4><pre class="filled"><xsl:value-of select="doc[2]"/></pre>
    </xsl:if>
    </xsl:for-each>
    

  </xsl:for-each>

  </div>   

  </body>
  </html>
  </xsl:template>
  
  </xsl:stylesheet>
