<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
  <xsl:template match="application">
    <html>

    <head>
      <meta charset="UTF-8" />
      <link rel="stylesheet" type="text/css" href="./RAPI.css" />
    </head>

    <body>
      <xsl:variable name="path">
        <xsl:value-of select="resources/resource/@path" />
      </xsl:variable>
      <xsl:for-each select="resources/resource">
        <h1 class="heading">
            <xsl:value-of select="/application/doc"/>
          </h1>
        <div id="info">
          <div class="content">
            <xsl:for-each select="method/doc">
              <p>
                <xsl:copy-of select="current()" />
              </p>
            </xsl:for-each>
          </div>
          <hr/>
          <h2>Request</h2>
          <div class="content">
            <h3>URL</h3>
            <p class="filled">
              <xsl:value-of select="/application/resources/@base" />
              <xsl:value-of select="$path" />
            </p>
            <xsl:for-each select="method/request/doc[position()&gt;=2]">
              <div class="note note">
                <span class="notetitle">
                    <b>Note</b>
                  </span>
                <xsl:value-of select="current()" />
              </div>
            </xsl:for-each>
            <h3>Method</h3>
            <p class="filled">
              <xsl:value-of select="method/@name" />
            </p>
            <h3>URL Parameters</h3>
            <table>
              <tr>
                <th class="desc40">Parameter</th>
                <th class="desc">Description</th>
              </tr>
              <xsl:for-each select="param">
                <tr>
                  <td class="mono">
                    <xsl:value-of select="@name" />
                  </td>
                  <td>
                    <xsl:value-of select="doc" />
                  </td>
                </tr>
              </xsl:for-each>
            </table>
            <h3>Request Headers</h3>
            <table>
              <tr>
                <th class="desc40">Header</th>
                <th class="desc">Description</th>
              </tr>
              <xsl:for-each select="method/request/param">
                <tr>
                  <td class="mono">
                    <xsl:value-of select="@name" />
                  </td>
                  <td>
                    <xsl:value-of select="doc" />
                  </td>
                </tr>
              </xsl:for-each>
            </table>
            <xsl:if test="method/request/representation !=''">
              <h3>Request Body</h3>
              <xsl:for-each select="method/request/representation">
                <xsl:if test="position()!=1">
                  <h4>
                      <xsl:value-of select="@name"/>
                    </h4>
                </xsl:if>
                <table>
                  <tr>
                    <th class="desc20">Name</th>
                    <th class="desc20">Type</th>
                    <th class="desc20">Optional</th>
                    <th class="desc40">Description</th>
                  </tr>
                  <xsl:for-each select="param">
                    <tr>
                      <td class="mono">
                        <xsl:value-of select="@name" />
                      </td>
                      <td class="mono">
                        <xsl:value-of select="@type" />
                        <xsl:if test="@repeating">[]</xsl:if>
                      </td>
                      <td>
                        <xsl:value-of select="@optional" />
                      </td>
                      <td>
                        <xsl:value-of select="doc" />
                        <xsl:if test="@repeating">
                          <p>Note: This is an array of elements.</p>
                        </xsl:if>
                      </td>
                    </tr>
                  </xsl:for-each>
                </table>
                <b class="tabbed">
                    <xsl:if test="doc">
                      <xsl:value-of select="doc"/>
                    </xsl:if>
                  </b>
                <br/>
              </xsl:for-each>
            </xsl:if>
            <xsl:if test="method/request/doc">
              <h3>Request Example</h3>
              <pre class="filled">
                  <xsl:value-of select="method/request/doc"/>
                </pre>
            </xsl:if>
          </div>
          <hr/>
          <h2>Response</h2>
          <xsl:for-each select="method/response">
            <xsl:sort select="@status" />
            <h3>Code: <xsl:value-of select="@status"/></h3>
            <div class="content">
              <p>
                <xsl:value-of select="doc" />
              </p>
              <xsl:if test="param">
                <h3>Headers</h3>
                <table>
                  <tr>
                    <th class="desc40">Header</th>
                    <th class="desc">Description</th>
                  </tr>
                  <xsl:for-each select="param">
                    <tr>
                      <td class="mono">
                        <xsl:value-of select="@name" />
                      </td>
                      <td>
                        <xsl:value-of select="doc" />
                      </td>
                    </tr>
                  </xsl:for-each>
                </table>
              </xsl:if>
              <xsl:if test="representation">
                <h3>Response Body</h3>
                <xsl:for-each select="representation">
                  <xsl:if test="position()!=1">
                    <h4>
                        <xsl:value-of select="@name"/> Type Definition
                      </h4>
                  </xsl:if>
                  <table>
                    <tr>
                      <th class="desc30">Name</th>
                      <th class="desc30">Type</th>
                      <th class="desc40">Description</th>
                    </tr>
                    <xsl:for-each select="param">
                      <tr>
                        <td class="mono desc20">
                          <xsl:value-of select="@name" />
                        </td>
                        <td class="mono desc20">
                          <xsl:value-of select="@type" />
                          <xsl:if test="@repeating">[]</xsl:if>
                        </td>
                        <td class="desc">
                          <xsl:value-of select="doc" />
                          <xsl:if test="@repeating">
                            <p>Note: This is an array of elements.</p>
                          </xsl:if>
                        </td>
                      </tr>
                    </xsl:for-each>
                  </table>
                  <b class="tabbed">
                      <xsl:if test="doc">
                        <xsl:value-of select="doc"/>
                      </xsl:if>
                    </b>
                  <br/>
                </xsl:for-each>
              </xsl:if>
              <xsl:for-each select="doc[position()&gt;=3]">
                <div class="note note">
                  <span class="notetitle">
                      <b>Note:</b>
                    </span>
                  <xsl:value-of select="current()" />
                </div>
              </xsl:for-each>
              <xsl:if test="doc[2]">
                <h3>Response Example</h3>
                <pre class="filled">
                    <xsl:value-of select="doc[2]"/>
                  </pre>
              </xsl:if>
            </div>
          </xsl:for-each>
        </div>
      </xsl:for-each>
    </body>

    </html>
  </xsl:template>
</xsl:stylesheet>