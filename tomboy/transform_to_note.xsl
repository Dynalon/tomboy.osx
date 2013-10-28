<?xml version='1.0' encoding="Windows-1252" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:tomboy="http://beatniksoftware.com/tomboy"
		xmlns:size="http://beatniksoftware.com/tomboy/size"
		xmlns:link="http://beatniksoftware.com/tomboy/link"
                exclude-result-prefixes="tomboy link size"
                version='1.0'>

  <xsl:output method="xml"
              encoding="utf-8"
              indent ="yes"
              omit-xml-declaration="yes"/>

  <xsl:preserve-space elements="*" />

  <xsl:template match="br">
    <xsl:text>&#xA;</xsl:text>
  </xsl:template>

  <xsl:template match="div">
	<xsl:text>&#xA;</xsl:text><xsl:apply-templates select="node()"/>
  </xsl:template>
  
  <xsl:template match="b">
    <bold>
      <xsl:apply-templates select="node()"/>
    </bold>
  </xsl:template>

  <xsl:template match="i">
    <italic>
      <xsl:apply-templates select="node()"/>
    </italic>
  </xsl:template>

  <xsl:template match="strike">
    <strikethrough>
      <xsl:apply-templates select="node()"/>
    </strikethrough>
  </xsl:template>

  <xsl:template match="span[@class='note-highlight']">
    <highlight>
      <xsl:apply-templates select="node()"/>
    </highlight>
  </xsl:template>

  <xsl:template match="span[@class='note-datetime']">
    <datetime>
      <xsl:apply-templates select="node()"/>
    </datetime>
  </xsl:template>

  <xsl:template match="span[@class='note-size-small']">
    <size-small>
      <xsl:apply-templates select="node()"/>
    </size-small>
  </xsl:template>

  <xsl:template match="span[@class='note-size-large']">
    <size-large>
      <xsl:apply-templates select="node()"/>
    </size-large>
  </xsl:template>

  <xsl:template match="span[@class='note-size-huge']">
    <size-huge>
      <xsl:apply-templates select="node()"/>
    </size-huge>
  </xsl:template>


  <xsl:template match="span[@style = 'color:#555753;text-decoration:underline']">
    <link:broken>
      <xsl:apply-templates/>
    </link:broken>
  </xsl:template>

  <!--	<xsl:template match="a[style='color:#204A87'" ] >
	<link:internal><xsl:value-of select="@href"/></link:internal>
</xsl:template>

	<xsl:template match="a[style='color:#3465A4'"]>
	<link:url><xsl:value-of select="@href"/></link:url>
</xsl:template>
-->
  <xsl:template match="font">
    <xsl:choose>
      <xsl:when test="@size = '2'">
        <size:small>
          <xsl:apply-templates select="node()"/>
        </size:small>
      </xsl:when>
      <xsl:when test="@size = '3'">
        <size:small>
          <xsl:apply-templates select="node()"/>
        </size:small>
      </xsl:when>
      <xsl:when test="@size = '5'">
        <size:big>
          <xsl:apply-templates select="node()"/>
        </size:big>
      </xsl:when>
      <xsl:when test="@size = '6'">
        <size:large>
          <xsl:apply-templates select="node()"/>
        </size:large>
      </xsl:when>
      <xsl:when test="@size = '7'">
        <size:huge>
          <xsl:apply-templates select="node()"/>
        </size:huge>
      </xsl:when>
      <xsl:when test="@face = 'Courier New'">
        <tomboy:monospace>
          <xsl:apply-templates select="node()"/>
        </tomboy:monospace>
      </xsl:when>
      <xsl:when test="@face = 'Andale Mono'">
        <tomboy:monospace>
          <xsl:apply-templates select="node()"/>
        </tomboy:monospace>
      </xsl:when>
    </xsl:choose>
  </xsl:template>
  
  
  <!-- find some better way to do rules 
  <xsl:template match="hr">
    <xsl:text>
    </xsl:text>
  </xsl:template>
  -->
  
  <xsl:template match="ul">
    <list>
      <xsl:apply-templates select="*"/>
    </list>
  </xsl:template>

  <xsl:template match="li">
    <list-item>
  <!--    <xsl:value-of select="."/> -->
      <xsl:apply-templates select="node()"/>
    <!--  <xsl:text>
</xsl:text> -->
    </list-item>
  </xsl:template>


  <!-- Evolution.dll Plugin -->
  <!--
<xsl:template match="a[img[@alt = 'Open Email Link']]">
	<link:evo-mail>
		<xsl:attribute name="uri" select="@href"/>
		<xsl:value-of select="node()"/>
	</link:evo-mail>
</xsl:template>
-->

  <!-- FixedWidth.dll Plugin -->
  <xsl:template match="span[@class='note-monospace']">
    <monospace>
      <xsl:apply-templates select="node()"/>
    </monospace>
  </xsl:template>

  <xsl:template match="tt">
    <monospace>
      <xsl:apply-templates select="node()"/>
    </monospace>
  </xsl:template>

  <!-- Bugzilla.dll Plugin -->
  <!--
<xsl:template match="TODO">
	<link:bugzilla><xsl:apply-templates select="node()"/></link:bugzilla>
</xsl:template>
-->

</xsl:stylesheet>