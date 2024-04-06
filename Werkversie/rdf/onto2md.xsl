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

<xsl:variable name="params" select="/ROOT/@params"/>
<xsl:variable name="lang">
  <xsl:choose>
    <xsl:when test="substring-after($params,'lang=')!=''"><xsl:value-of select="substring-after($params,'lang=')"/></xsl:when>
    <xsl:otherwise>en</xsl:otherwise>
  </xsl:choose>
</xsl:variable>

<xsl:key name="resource" match="/ROOT/rdf:RDF/rdf:Description" use="@rdf:about|@rdf:nodeID"/>
<xsl:key name="blank" match="/ROOT/rdf:RDF/rdf:Description" use="@rdf:nodeID"/>
<xsl:key name="nshape" match="/ROOT/rdf:RDF/rdf:Description" use="sh:targetClass/@rdf:resource"/>
<xsl:key name="pshape" match="/ROOT/rdf:RDF/rdf:Description" use="sh:path/@rdf:resource"/>
<xsl:key name="nshapep" match="/ROOT/rdf:RDF/rdf:Description" use="sh:property/(@rdf:resource|@rdf:nodeID)"/>
<xsl:key name="concepts" match="/ROOT/rdf:RDF/rdf:Description" use="skos:inScheme/@rdf:resource"/>

<xsl:variable name="namespace">
  <xsl:value-of select="key('resource',/ROOT/rdf:RDF/rdf:Description/sh:declare/@rdf:nodeID)/sh:namespace[1]"/>
</xsl:variable>

<!-- Deze nog integreren met degene hieronder -->
<xsl:template match="@*" mode="reflabel">
  <xsl:variable name="pshapelabel"><xsl:apply-templates select="key('nshape',.)[1]" mode="label"/></xsl:variable>
  <xsl:variable name="nshapelabel"><xsl:apply-templates select="key('pshape',.)[1]" mode="label"/></xsl:variable>
  <xsl:variable name="definedlabel"><xsl:apply-templates select="key('resource',.)" mode="label"/></xsl:variable>
  <xsl:choose>
    <xsl:when test="$definedlabel!=''"><xsl:value-of select="$definedlabel"/></xsl:when>
    <xsl:when test="$nshapelabel!=''"><xsl:value-of select="$nshapelabel"/></xsl:when>
    <xsl:when test="$pshapelabel!=''"><xsl:value-of select="$pshapelabel"/></xsl:when>
    <xsl:otherwise><xsl:value-of select="."/></xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="*" mode="label">
  <xsl:variable name="pshapelabel"><xsl:apply-templates select="key('nshape',@rdf:about)[1]" mode="label"/></xsl:variable>
  <xsl:variable name="nshapelabel"><xsl:apply-templates select="key('pshape',@rdf:about)[1]" mode="label"/></xsl:variable>
  <xsl:choose>
    <xsl:when test="exists(sh:name)"><xsl:value-of select="sh:name"/></xsl:when>
    <xsl:when test="$nshapelabel!=''"><xsl:value-of select="$nshapelabel"/></xsl:when>
    <xsl:when test="$pshapelabel!=''"><xsl:value-of select="$pshapelabel"/></xsl:when>
    <xsl:when test="rdfs:label[@xml:lang=$lang]!=''"><xsl:value-of select="rdfs:label[@xml:lang=$lang]"/></xsl:when>
    <xsl:otherwise><xsl:value-of select="rdfs:label[1]"/></xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="@*" mode="link">
  <xsl:choose>
    <xsl:when test="starts-with(.,$namespace) and ends-with($namespace,'#')">#<xsl:value-of select="substring-after(.,$namespace)"/></xsl:when>
    <xsl:otherwise><xsl:value-of select="."/></xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="*" mode="labelledlink">
  <xsl:text>[</xsl:text><xsl:apply-templates select="." mode="label"/><xsl:text>](</xsl:text>
  <xsl:apply-templates select="@rdf:about" mode="link"/>
  <xsl:text>)</xsl:text>
</xsl:template>

<xsl:template match="@*" mode="anchor">
  <xsl:text>[</xsl:text><xsl:apply-templates select="." mode="reflabel"/><xsl:text>](</xsl:text><xsl:apply-templates select="." mode="link"/><xsl:text>)</xsl:text>
</xsl:template>

<xsl:template match="text()|*" mode="header1">
  <xsl:text># </xsl:text><xsl:value-of select="."/><xsl:text>&#xa;</xsl:text>
</xsl:template>

<xsl:template match="text()|*" mode="header2">
  <xsl:text>&#xa;## </xsl:text><xsl:value-of select="."/><xsl:text>&#xa;</xsl:text>
</xsl:template>

<xsl:template match="text()" mode="header3">
  <xsl:text>&#xa;### </xsl:text><xsl:value-of select="."/><xsl:text>&#xa;&#xa;</xsl:text>
</xsl:template>
<xsl:template match="*" mode="header3">
  <xsl:variable name="label">
    <xsl:apply-templates select="." mode="label"/>
    <xsl:if test="starts-with(@rdf:about,$namespace) and ends-with($namespace,'#')"> {#<xsl:value-of select="substring-after(@rdf:about,$namespace)"/>}</xsl:if>
  </xsl:variable>
  <xsl:apply-templates select="$label" mode="header3"/>
</xsl:template>

<xsl:template match="*" mode="meta-uri">
  <xsl:text>|URI|</xsl:text><xsl:value-of select="@rdf:about"/><xsl:text>|&#xa;</xsl:text>
  <xsl:text>|-|-|&#xa;</xsl:text>
</xsl:template>

<xsl:template match="*" mode="meta-specialisatie">
  <xsl:if test="exists(rdfs:subClassOf)">
    <xsl:text>|Specialisatie van|</xsl:text>
    <xsl:for-each select="rdfs:subClassOf/@rdf:resource">
      <xsl:if test="position()!=1"><xsl:text>, </xsl:text></xsl:if>
      <xsl:apply-templates select="." mode="anchor"/>
    </xsl:for-each>
    <xsl:text>|&#xa;</xsl:text>
  </xsl:if>
</xsl:template>

<xsl:template match="*" mode="meta-propspecialisatie">
  <xsl:if test="exists(rdfs:subPropertyOf)">
    <xsl:text>|Specialisatie van|</xsl:text>
    <xsl:for-each select="key('resource',rdfs:subPropertyOf/@rdf:resource)">
      <xsl:if test="position()!=1"><xsl:text>, </xsl:text></xsl:if>
      <xsl:text>[</xsl:text><xsl:apply-templates select="." mode="label"/><xsl:text>](</xsl:text><xsl:value-of select="@rdf:about"/><xsl:text>)</xsl:text>
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
    <xsl:text>|Eigenschappen|</xsl:text>
    <xsl:for-each select="key('resource',sh:property/(@rdf:resource|@rdf:nodeID))"><xsl:sort select="sh:order" data-type="number"/><xsl:sort select="sh:name"/>
      <xsl:if test="position()!=1"><xsl:text>, </xsl:text></xsl:if>
      <xsl:text>[</xsl:text><xsl:apply-templates select="." mode="label"/><xsl:text>](</xsl:text><xsl:apply-templates select="sh:path/@rdf:resource" mode="link"/><xsl:text>)</xsl:text>
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
  <xsl:for-each select=".|key('resource',rdfs:subPropertyOf/@rdf:resource)"> <!-- Niet alleen de eigen property, maar ook superproperties -->
    <xsl:for-each select="key('pshape',@rdf:about)">
        <xsl:for-each select="key('resource',key('nshapep',@rdf:about|@rdf:nodeID)/sh:targetClass/@rdf:resource)">
          <xsl:apply-templates select="." mode="labelledlink"/>
          <xsl:text>, </xsl:text>
        </xsl:for-each>
    </xsl:for-each>
  </xsl:for-each>
  <xsl:text>|&#xa;</xsl:text>
</xsl:template>

<xsl:template match="*" mode="meta-relatie">
  <xsl:if test="exists(key('pshape',@rdf:about)/sh:class)">
    <xsl:text>|Gerelateerde klasse|</xsl:text>
    <xsl:for-each select="key('resource',key('pshape',@rdf:about)/sh:class/@rdf:resource)">
      <xsl:text>[</xsl:text><xsl:apply-templates select="." mode="label"/><xsl:text>](</xsl:text><xsl:value-of select="@rdf:about"/><xsl:text>)</xsl:text>
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
  <xsl:variable name="label"><xsl:apply-templates select="." mode="label"/></xsl:variable>
  <xsl:apply-templates select="." mode="header3"/>
  <xsl:apply-templates select="." mode="meta-uri"/>
  <xsl:apply-templates select="." mode="meta-specialisatie"/>
  <xsl:apply-templates select="." mode="meta-definitie"/>
  <xsl:apply-templates select="." mode="meta-bron"/>
  <xsl:apply-templates select="key('nshape',@rdf:about)" mode="meta-eigenschappen"/>
</xsl:template>

<xsl:template match="*" mode="objectproperties">
  <xsl:variable name="label"><xsl:apply-templates select="." mode="label"/></xsl:variable>
  <xsl:apply-templates select="." mode="header3"/>
  <xsl:apply-templates select="." mode="meta-uri"/>
  <xsl:apply-templates select="." mode="meta-propspecialisatie"/>
  <xsl:apply-templates select="." mode="meta-definitie"/>
  <xsl:apply-templates select="." mode="meta-bron"/>
  <xsl:apply-templates select="." mode="meta-eigenaar"/>
  <xsl:apply-templates select="." mode="meta-relatie"/>
  <xsl:apply-templates select="." mode="meta-waarden"/>
</xsl:template>

<xsl:template match="*" mode="datatypeproperties">
  <xsl:variable name="label"><xsl:apply-templates select="." mode="label"/></xsl:variable>
  <xsl:apply-templates select="." mode="header3"/>
  <xsl:apply-templates select="." mode="meta-uri"/>
  <xsl:apply-templates select="." mode="meta-propspecialisatie"/>
  <xsl:apply-templates select="." mode="meta-definitie"/>
  <xsl:apply-templates select="." mode="meta-bron"/>
  <xsl:apply-templates select="." mode="meta-datatype"/>
  <xsl:apply-templates select="." mode="meta-eigenaar"/>
</xsl:template>

<xsl:template match="rdf:Description" mode="class-hierarchy-leaf">
  <xsl:param name="spaces"/>
  <xsl:value-of select="$spaces"/><xsl:text>- </xsl:text>
  <xsl:apply-templates select="." mode="labelledlink"/>
  <xsl:text>&#xa;</xsl:text>
  <xsl:variable name="uri" select="@rdf:about"/>
  <xsl:for-each select="../rdf:Description[rdf:type/@rdf:resource='http://www.w3.org/2002/07/owl#Class' and rdfs:subClassOf/@rdf:resource=$uri]"><xsl:sort select="concat(key('nshape',@rdf:about)/sh:name[1],rdfs:label[@xml:lang=$lang],rdfs:label[1])"/>
    <xsl:apply-templates select="." mode="class-hierarchy-leaf"><xsl:with-param name="spaces"><xsl:value-of select="concat($spaces,'  ')"/></xsl:with-param></xsl:apply-templates>
  </xsl:for-each>
</xsl:template>

<xsl:template match="rdf:RDF" mode="class-hierarchy">
  <xsl:for-each select="rdf:Description[rdf:type/@rdf:resource='http://www.w3.org/2002/07/owl#Class' and not(exists(rdfs:subClassOf))]"><xsl:sort select="concat(key('nshape',@rdf:about)/sh:name[1],rdfs:label[@xml:lang=$lang],rdfs:label[1])"/>
    <xsl:apply-templates select="." mode="class-hierarchy-leaf"><xsl:with-param name="spaces"></xsl:with-param></xsl:apply-templates>
  </xsl:for-each>
</xsl:template>

<xsl:template match="/ROOT/rdf:RDF">
  <xsl:variable name="ontologie">Ontologie</xsl:variable>
  <xsl:variable name="klassen">Klassen</xsl:variable>
  <xsl:variable name="relaties">Eigenschappen (bindingen)</xsl:variable>
  <xsl:variable name="attributen">Eigenschappen (metagegevens)</xsl:variable>
  <xsl:apply-templates select="$ontologie" mode="header1"/>
  <xsl:apply-templates select="$klassen" mode="header2"/>
  <xsl:apply-templates select="." mode="class-hierarchy"/>
  <xsl:for-each select="rdf:Description[rdf:type/@rdf:resource='http://www.w3.org/2002/07/owl#Class']"><xsl:sort select="concat(key('nshape',@rdf:about)/sh:name[1],rdfs:label[@xml:lang=$lang],rdfs:label[1])"/>
    <xsl:apply-templates select="." mode="classes"/>
  </xsl:for-each>
  <xsl:apply-templates select="$relaties" mode="header2"/>
  <xsl:for-each select="rdf:Description[rdf:type/@rdf:resource='http://www.w3.org/2002/07/owl#ObjectProperty']"><xsl:sort select="concat(rdfs:label[@xml:lang=$lang],rdfs:label[1])"/>
    <xsl:apply-templates select="." mode="objectproperties"/>
  </xsl:for-each>
  <xsl:apply-templates select="$attributen" mode="header2"/>
  <xsl:for-each select="rdf:Description[rdf:type/@rdf:resource='http://www.w3.org/2002/07/owl#DatatypeProperty']"><xsl:sort select="concat(rdfs:label[@xml:lang=$lang],rdfs:label[1])"/>
    <xsl:apply-templates select="." mode="datatypeproperties"/>
  </xsl:for-each>
</xsl:template>

</xsl:stylesheet>
