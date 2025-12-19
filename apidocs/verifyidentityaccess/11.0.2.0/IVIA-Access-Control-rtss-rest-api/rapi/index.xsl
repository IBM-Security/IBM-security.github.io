<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
  <xsl:template match="index">
    <html>

    <head>
      <link rel="stylesheet" type="text/css" href="./index.css" />
      <meta charset="UTF-8" />
      <script type="text/javascript" src="mktree.js"></script>
      <script type="text/javascript" src="filter.js"></script>
      <title>ISAM Rest API</title>
    </head>

    <body>
      <div class="heading">
        <h1>ISAM REST API</h1>
      </div>
      <table role="presentation">
        <tr>
          <td width="100%" colspan="2">
            <label for="rapi_filter">Filter:</label>
          </td>
        </tr>
        <tr>
          <td width="100%" colspan="2">
            <input type="text" id="rapi_filter" placeholder="title or URI" style="width:100%"></input>
          </td>
        </tr>
        <tr>
          <td width="50%">
            <button type="button" onclick="rapi_filter()" style="width:100%;">Apply Filter</button>
          </td>
          <td width="50%">
            <button id="filter_clear" type="button" onclick="clear_filter()" style="width:100%;">Clear Filter</button>
          </td>
        </tr>
        <tr>
          <td width="50%">
            <button type="button" onclick="set_all(true)" style="width:100%;">Open All</button>
          </td>
          <td width="50%">
            <button type="button" onclick="set_all(false)" style="width:100%;">Close All</button>
          </td>
        </tr>
      </table>
      <ul id="rapi_root" role="tree">
        <xsl:call-template name="topic" />
      </ul>
    </body>

    </html>
  </xsl:template>
  <xsl:template name="topic">
    <ul class="mktree">
      <xsl:for-each select="topic">
        <xsl:sort select="@file" />
        <xsl:sort select="@name" />
        <li>
          <xsl:attribute name="id">
            <xsl:value-of select="@file" /></xsl:attribute>
          <xsl:choose>
            <xsl:when test="@file">
              <a class="topic">
                <xsl:attribute name="role">treeitem</xsl:attribute>
                <xsl:attribute name="aria-label">
                  <xsl:value-of select="@name" /></xsl:attribute>
                <xsl:attribute name="href">
                  <xsl:value-of select="@file" /></xsl:attribute>
                <xsl:attribute name="target">API Documentation</xsl:attribute>
                <xsl:value-of select="@name" />
                <br/>
                <span class="uri"><xsl:value-of select="@method"/>&#160;<xsl:value-of select="@uri"/></span>
              </a>
            </xsl:when>
            <xsl:otherwise>
              <xsl:attribute name="role">group</xsl:attribute>
              <xsl:attribute name="aria-label">
                <xsl:value-of select="@name" /></xsl:attribute>
              <a class="category">
                <xsl:value-of select="@name" />
              </a>
              <xsl:call-template name="topic" />
            </xsl:otherwise>
          </xsl:choose>
        </li>
      </xsl:for-each>
    </ul>
  </xsl:template>
</xsl:stylesheet>