<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template match="/sum-of-sequence">
    <xsl:variable name="f" select="from"/>
    <xsl:variable name="t" select="to"/>
    
    <result>
    <xsl:text>Результат: </xsl:text>
      <xsl:call-template name="for">
        <xsl:with-param name="current" select="$f"/>
        <xsl:with-param name="end" select="$t"/>
        <xsl:with-param name="sum" select="0"/>
      </xsl:call-template>
    </result>
  </xsl:template>
  
  <xsl:template name="for">
    <xsl:param name="current"/>
    <xsl:param name="end"/>
    <xsl:param name="sum"/>

    <xsl:choose>
      <xsl:when test="$current &gt; $end">
        <xsl:value-of select="$sum"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="for">
          <xsl:with-param name="current" select="$current + 1"/>
          <xsl:with-param name="end" select="$end"/>
          <xsl:with-param name="sum" select="$sum + $current"/>
        </xsl:call-template>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
</xsl:stylesheet>
