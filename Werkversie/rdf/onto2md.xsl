<xsl:stylesheet version="2.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xs="http://www.w3.org/2001/XMLSchema"
	xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
	xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
  xmlns:sh="http://www.w3.org/ns/shacl#"
  xmlns:skos="http://www.w3.org/2004/02/skos/core#"
  xmlns:graphml="http://graphml.graphdrawing.org/xmlns"
  xmlns:y="http://www.yworks.com/xml/graphml"
  xmlns:owl="http://www.w3.org/2002/07/owl#"
  xmlns:dct="http://purl.org/dc/terms/"
  xmlns:foaf="http://xmlns.com/foaf/0.1/"
>

<xsl:output method="text"/>

<xsl:key name="resource" match="/ROOT/rdf:RDF/rdf:Description" use="@rdf:about"/>
<xsl:key name="blank" match="/ROOT/rdf:RDF/rdf:Description" use="@rdf:nodeID"/>
<xsl:key name="nshape" match="/ROOT/rdf:RDF/rdf:Description" use="sh:targetClass/@rdf:resource"/>
<xsl:key name="pshape" match="/ROOT/rdf:RDF/rdf:Description" use="sh:path/@rdf:resource"/>
<xsl:key name="nshapep" match="/ROOT/rdf:RDF/rdf:Description" use="sh:property/@rdf:resource"/>
<xsl:key name="concepts" match="/ROOT/rdf:RDF/rdf:Description" use="skos:inScheme/@rdf:resource"/>

<xsl:template match="text()|*" mode="header1">
  <xsl:text># </xsl:text><xsl:value-of select="."/><xsl:text>&#xa;</xsl:text>
</xsl:template>

<xsl:template match="text()|*" mode="header2">
  <xsl:text>&#xa;## </xsl:text><xsl:value-of select="."/><xsl:text>&#xa;</xsl:text>
</xsl:template>

<xsl:template match="text()|*" mode="header3">
  <xsl:text>&#xa;### </xsl:text><xsl:value-of select="."/><xsl:text>&#xa;&#xa;</xsl:text>
</xsl:template>

<xsl:template match="*" mode="meta-uri">
  <xsl:text>|URI|</xsl:text><xsl:value-of select="@rdf:about"/><xsl:text>|&#xa;</xsl:text>
  <xsl:text>|-|-|&#xa;</xsl:text>
</xsl:template>

<xsl:template match="*" mode="meta-specialisatie">
  <xsl:if test="exists(rdfs:subClassOf)">
    <xsl:text>|Specialisatie van|</xsl:text>
    <xsl:for-each select="key('resource',rdfs:subClassOf/@rdf:resource)">
      <xsl:if test="position()!=1"><xsl:text>, </xsl:text></xsl:if>
      <xsl:text>[</xsl:text><xsl:value-of select="rdfs:label"/><xsl:text>](</xsl:text><xsl:value-of select="@rdf:about"/><xsl:text>)</xsl:text>
    </xsl:for-each>
    <xsl:text>|&#xa;</xsl:text>
  </xsl:if>
</xsl:template>

<xsl:template match="*" mode="meta-definitie">
  <xsl:if test="exists(rdfs:comment)">
    <xsl:text>|Definitie|</xsl:text><xsl:value-of select="rdfs:comment"/><xsl:text>|&#xa;</xsl:text>
  </xsl:if>
</xsl:template>

<xsl:template match="*" mode="meta-bron">
  <xsl:if test="exists(dct:source)">
    <xsl:text>|Bron|</xsl:text>
    <xsl:for-each select="key('resource',dct:source/@rdf:resource)">
      <xsl:if test="position()!=1"><xsl:text>, </xsl:text></xsl:if>
      <xsl:text>[</xsl:text><xsl:value-of select="dct:bibliographicCitation"/><xsl:text>](</xsl:text><xsl:value-of select="foaf:page/@rdf:resource"/><xsl:text>)</xsl:text>
    </xsl:for-each>
    <xsl:text>|&#xa;</xsl:text>
  </xsl:if>
</xsl:template>

<xsl:template match="*" mode="meta-eigenschappen">
  <xsl:if test="exists(sh:property)">
    <xsl:text>|Metagegevens|</xsl:text>
    <xsl:for-each select="key('resource',sh:property/@rdf:resource)"><xsl:sort select="sh:name"/>
      <xsl:if test="position()!=1"><xsl:text>, </xsl:text></xsl:if>
      <xsl:text>[</xsl:text><xsl:value-of select="sh:name"/><xsl:text>](</xsl:text><xsl:value-of select="sh:path/@rdf:resource"/><xsl:text>)</xsl:text>
    </xsl:for-each>
    <xsl:text>|&#xa;</xsl:text>
  </xsl:if>
</xsl:template>

<xsl:template match="*" mode="recurse">
  <xsl:copy-of select="key('blank',rdf:first/@rdf:nodeID)"/>
  <xsl:apply-templates select="key('blank',rdf:rest/@rdf:nodeID)" mode="recurse"/>
</xsl:template>

<xsl:template match="*" mode="meta-datatype">
  <!-- Datatype is afkomstig uit mogelijk meerdere property-shapes -->
  <!-- Eerst verzamelen we alle datatypes uit die propertyshapes. Maar dan nog kan er een "or" situatie optreden, dus die ook nog verzamelen -->
  <xsl:variable name="list">
    <xsl:for-each select="key('pshape',@rdf:about)">
      <xsl:if test="exists(sh:datatype)">
        <xsl:copy-of select="."/>
      </xsl:if>
      <xsl:apply-templates select="key('blank',sh:or/@rdf:nodeID)" mode="recurse"/>
    </xsl:for-each>
  </xsl:variable>
  <!-- Nu we een lijst hebben met propertyshapes met datatype-verwijzingen, kunnen we ze langslopen, maar wel alleen per uniek geval! -->
  <xsl:if test="count($list/*)>0">
    <xsl:text>|Datatype|</xsl:text>
    <xsl:for-each-group select="$list/*" group-by="sh:datatype/@rdf:resource">
      <xsl:if test="position()!=1 and position()&lt;count($list/*)"><xsl:text>, </xsl:text></xsl:if>
      <xsl:if test="position()!=1 and position()=count($list/*)"><xsl:text> of </xsl:text></xsl:if>
      <xsl:text>[</xsl:text><xsl:value-of select="substring-after(sh:datatype/@rdf:resource,'#')"/><xsl:text>](</xsl:text><xsl:value-of select="sh:datatype/@rdf:resource"/><xsl:text>)</xsl:text>
    </xsl:for-each-group>
    <xsl:text>|&#xa;</xsl:text>
  </xsl:if>
</xsl:template>

<xsl:template match="*" mode="meta-eigenaar">
  <xsl:text>|Eigenschap van|</xsl:text>
  <xsl:for-each select="key('pshape',@rdf:about)">
      <xsl:for-each select="key('resource',key('nshapep',@rdf:about)/sh:targetClass/@rdf:resource)">
        <xsl:text>[</xsl:text><xsl:value-of select="rdfs:label"/><xsl:text>](</xsl:text><xsl:value-of select="@rdf:about"/><xsl:text>)</xsl:text>
      </xsl:for-each>
  </xsl:for-each>
  <xsl:text>|&#xa;</xsl:text>
</xsl:template>

<xsl:template match="*" mode="meta-relatie">
  <xsl:if test="exists(key('pshape',@rdf:about)/sh:class)">
    <xsl:text>|Gerelateerde klasse|</xsl:text>
    <xsl:for-each select="key('resource',key('pshape',@rdf:about)/sh:class/@rdf:resource)">
      <xsl:text>[</xsl:text><xsl:value-of select="rdfs:label"/><xsl:text>](</xsl:text><xsl:value-of select="@rdf:about"/><xsl:text>)</xsl:text>
    </xsl:for-each>
    <xsl:text>|&#xa;</xsl:text>
  </xsl:if>
</xsl:template>

<xsl:template match="*" mode="meta-waarden">
  <xsl:variable name="waardelijst">
    <xsl:for-each select="key('pshape',@rdf:about)"> <!-- Propertyshape of the property -->
      <xsl:for-each select="key('resource',sh:node/@rdf:resource)"> <!--Nodeshape -->
        <xsl:for-each select="key('blank',sh:property/@rdf:nodeID)"> <!--Properyshape in nodeshape -->
          <xsl:for-each select="key('resource',sh:hasValue/@rdf:resource)"> <!--ConceptScheme -->
            <xsl:value-of select="@rdf:about"/>
          </xsl:for-each>
        </xsl:for-each>
      </xsl:for-each>
    </xsl:for-each>
  </xsl:variable>
  <xsl:if test="$waardelijst!=''">
    <xsl:text>|Mogelijke waarden|</xsl:text>
    <xsl:for-each select="key('concepts',$waardelijst)">
      <xsl:text>[</xsl:text><xsl:value-of select="rdfs:label"/><xsl:text>](</xsl:text><xsl:value-of select="@rdf:about"/><xsl:text>)</xsl:text>
    </xsl:for-each>
    <xsl:text>|&#xa;</xsl:text>
  </xsl:if>
</xsl:template>

<xsl:template match="*" mode="classes">
  <xsl:apply-templates select="rdfs:label" mode="header3"/>
  <xsl:apply-templates select="." mode="meta-uri"/>
  <xsl:apply-templates select="." mode="meta-specialisatie"/>
  <xsl:apply-templates select="." mode="meta-definitie"/>
  <xsl:apply-templates select="." mode="meta-bron"/>
  <xsl:apply-templates select="key('nshape',@rdf:about)" mode="meta-eigenschappen"/>
</xsl:template>

<xsl:template match="*" mode="objectproperties">
  <xsl:apply-templates select="rdfs:label" mode="header3"/>
  <xsl:apply-templates select="." mode="meta-uri"/>
  <xsl:apply-templates select="." mode="meta-definitie"/>
  <xsl:apply-templates select="." mode="meta-bron"/>
  <xsl:apply-templates select="." mode="meta-eigenaar"/>
  <xsl:apply-templates select="." mode="meta-relatie"/>
  <xsl:apply-templates select="." mode="meta-waarden"/>
</xsl:template>

<xsl:template match="*" mode="datatypeproperties">
  <xsl:apply-templates select="rdfs:label" mode="header3"/>
  <xsl:apply-templates select="." mode="meta-uri"/>
  <xsl:apply-templates select="." mode="meta-definitie"/>
  <xsl:apply-templates select="." mode="meta-bron"/>
  <xsl:apply-templates select="." mode="meta-datatype"/>
  <xsl:apply-templates select="." mode="meta-eigenaar"/>
</xsl:template>

<xsl:template match="/ROOT/rdf:RDF">
  <xsl:variable name="ontologie">Ontologie</xsl:variable>
  <xsl:variable name="klassen">Klassen</xsl:variable>
  <xsl:variable name="relaties">Eigenschappen (Bindingen)</xsl:variable>
  <xsl:variable name="attributen">Eigenschappen (metagegevens)</xsl:variable>
  <xsl:apply-templates select="$ontologie" mode="header1"/>
  <xsl:apply-templates select="$klassen" mode="header2"/>
  <xsl:for-each select="rdf:Description[rdf:type/@rdf:resource='http://www.w3.org/2002/07/owl#Class']"><xsl:sort select="rdfs:label"/>
    <xsl:apply-templates select="." mode="classes"/>
  </xsl:for-each>
  <xsl:apply-templates select="$relaties" mode="header2"/>
  <xsl:for-each select="rdf:Description[rdf:type/@rdf:resource='http://www.w3.org/2002/07/owl#ObjectProperty']"><xsl:sort select="rdfs:label"/>
    <xsl:apply-templates select="." mode="objectproperties"/>
  </xsl:for-each>
  <xsl:apply-templates select="$attributen" mode="header2"/>
  <xsl:for-each select="rdf:Description[rdf:type/@rdf:resource='http://www.w3.org/2002/07/owl#DatatypeProperty']"><xsl:sort select="rdfs:label"/>
    <xsl:apply-templates select="." mode="datatypeproperties"/>
  </xsl:for-each>
</xsl:template>

</xsl:stylesheet>
