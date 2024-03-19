# Transformatie MIM - RDFS/OWL/SHACL

## Inleiding

Het MIM is een *metamodel*. Dit betekent dat in termen van het MIM een concreet informatiemodel kan worden uitgewerkt, bijvoorbeeld het informatiemodel Basisregistratie Adressen en Gebouwen. Het MIM is niet bedoeld om vervolgens in termen van dit informatiemodel een concrete dataset te vormen. Hiervoor is een transformatie nodig naar een (technisch) uitwisselings- of opslagmodel, bijvoorbeeld een XSD schema of een RDMS database definitie.

Op diezelfde manier levert het toepassen van het MIM in RDF geen ontologie of vocabulaire waarin RDF kan worden uitgedrukt in een concrete Linked Data dataset. Slechts het informatiemodel zelf is op deze manier in RDF uitgedrukt. Een afzonderlijke transformatie is nodig voor de vertaalslag naar een ontologie voor een concrete Linked Data.

Zo leidt een MIM objecttype "Schip" tot de volgende weergave in RDF:

<pre class='ex-turtle'>
@prefix vb: &lt;http://bp4mc2.org/voorbeeld/>.
@prefix mim: &lt;http://bp4mc2.org/def/mim#>.

vb:Schip a mim:Objecttype;
  rdfs:label "Schip"@nl;
.
</pre>

`vb:Schip` is in dit voorbeeld een voorkomen van de klasse `mim:Objecttype`. Dit voorkomen, `vb:Schip`, kent zelf geen voorkomens. Het is dan ook niet mogelijk om te stellen:

<pre class='ex-turtle'>
vb:Pakjesboot12 a vb:Schip.
</pre>

`vb:Schip` is immers geen klasse maar zelf een voorkomen! Om te kunnen uitdrukken dat de pakjesboot een voorkomen van de klasse Schip is, is een vertaling nodig naar een `rdfs:Class` of `owl:Class`, bijvoorbeeld door:

<pre class='ex-turtle'>
@prefix vbo: &lt;http://bp4mc2.org/voorbeeld/def#>.

vbo:Schip a rdfs:Class;
  mim:equivalent vb:Schip;
.
vb:Pakjesboot12 a vbo:Schip.
</pre>

Dit document beschrijft hoe deze vertaling van het MIM model in RDF naar een RDFS-gebaseerde ontologie plaatsvindt. Daarbij zal niet alleen gebruik worden gemaakt van RDFS, maar ook van de OWL, SHACL en SKOS vocabulaires. De vertaling wordt zo veel mogelijk als SPARQL rules beschreven, zodat een machinale vertaling mogelijk is.

De vertaling is omkeerbaar. Op deze wijze kan een regulier Linked Data model in RDF/RDFS/OWL/SHACL worden gezien als een MIM compliant model. De SPARQL rules die vanuit een RDFS-gebaseerde ontologie de vertaling maken naar een MIM model in RDF, zijn daarom ook beschreven en opgenomen in [[[#transformatie-vanuit-rdfs-owl-shacl]]].

## Gebruikte functies

In de SPARQL rules wordt gebruik gemaakt van een aantal SPARQL functies. In onderstaande tabel staan deze opgesomd met de specificatie van de werking.

|Functie|Specificatie|
|-------|------------|
|t:CamelCase|Codeert een tekstveld naar een URI-vorm op basis van (upper) CamelCase regels|
|t:camelCase|Codeert een tekstveld naar een URI-vorm op basis van (lower) camelCase regels|
|t:kebabcase|Codeert een tekstveld naar een URI-vorm op basis van kebabcase regels (een `-` voor spaties)|
|t:uri|Formuleert de uri voor een modelelement op basis van de naam van het modelelement en de basis-URI van de package waartoe het modelelement behoort; wanneer de uri niet al bij het modelelement zelf gespecificeerd is. Anders wordt de waarde van _mim:uri_ gebruikt. De URI is opgebouwd als `{basisURI}{naam}`.|
|t:nodeshapeuri|Formuleert de uri voor een nodeshape op basis van de naam van een MIM resource. De nodeshape URI is opgebouwd als `{shape-namespace}#{t:CamelCase(term)}`. De `{shape-namespace}` is een vooraf vastgestelde waarde die gelijk is aan de te maken shapesgraph.|
|t:propertyshapeuri|Formuleert de uri voor een propertyshape op basis van de naam van een MIM resource en de naam van de MIM resource die hiervan de "bezitter" is. De propertyshape URI is opgebouwd als `{shape-namespace}#{t:CamelCase(bezittersnaam)}-{t:camelCase(naam)}`. Zie ook `t:nodeshapeuri`.|
|t:nodepropertyuri|Formuleert de uri voor een property op basis van de naam van een MIM resource en de naam van de MIM resource die hiervan de "bezitter" is. De property URI is opgebouwd als `{namespace}#{t:CamelCase(bezittersnaam)}-{t:camelCase(naam)}`.|
|t:statementuri|Formuleert de uri voor een rdf:Statement op basis van zijn afzonderlijke elementen. Mogelijke invulling kan het maken van een hash zijn op basis van de aaneenschakeling van subject, predicate en object.|
|t:schemeuri|Formuleert de uri voor een concept-scheme op basis van de naam van een MIM resource. De concept-scheme URI is opgebouwd als `{namespace}/id/scheme/{t:CamelCase(naam)}`. De `{namespace}` is een vooraf vastgestelde waarde die gelijk is aan de locatie van de package.|
|t:concepturi|Formuleert de uri voor een concept op basis van de naam van een MIM resource. De concept URI is opgebouwd als `{namespace}/id/concept/{t:CamelCase(naam)}`. De `{namespace}` is een vooraf vastgestelde waarde die gelijk is aan de locatie van de package.|
|t:mincount|Formuleert de minimum kardinaliteit op basis van een kardinaliteitsaanduiding (zie bij mim:kardinaliteit). De waarde kan ook unbound zijn, in dat geval wordt ook de variable niet gebound en daardoor de betreffende triple niet opgevoerd.|
|t:maxcount|Formuleert de maximum kardinaliteit op basis van een kardinaliteitsaanduiding (zie bij mim:kardinaliteit). De waarde kan ook unbound zijn, in dat geval wordt ook de variable niet gebound en daardoor de betreffende triple niet opgevoerd.|
|t:cast | Transformeert het datatype van een waarde naar het gegeven datatype. Deze functie verwacht twee parameters: `t:cast(?waarde, ?datatype)`. De `?waarde` parameter is de waarde waarvoor een datatype gezet moet worden. `?datatype` is het datatype wat `?waarde` moet krijgen. Op basis van `?datatype` bepaalt deze functie het juiste datatype om te zetten. |

<aside id='trans-1' class='note'>
Om een unieke URI op te bouwen, is naast de naam van een modelelement, `mim:naam`, ook een namespace noodzakelijk. Deze namespace wordt bepaald in het veld `mim:basisUri` van de package waartoe het modelelement behoord. Deze basis-URI is niet hetzelfde als de namespace van een gegenereerde XSD.
Als de basis-URI van het package niet is gespecificeerd, dan wordt de basis-URI geërfd van het package waartoe het package behoort. Dit werkt transitief. Als er geen enkele `basis-URI` wordt is gegeven, dan wordt de `basis-URI` gelijk aan `urn:modelelement:` aangevuld met de package structuur, bijvoorbeeld `urn:modelelement:imkad:recht:` of `urn:modelelement:imbaglv:objecten:`.
</aside>

<aside id='trans-2' class='note'>
Het MIM model kent geen volgorde. Ondanks dat in de weergave attribuutsoorten in een bepaalde volgorde getoond worden binnen een objecttype en ook referentiewaarden in een bepaalde volgorde getoond worden in een referentielijst, is er in het MIM geen aspect waarin deze volgorde is opgenomen. In het getransformeerde model is het mogelijk om een volgorde te specificeren met behulp van de eigenschap `sh:index`. Deze eigenschap komt echter niet terug in het MIM model zelf. Twee MIM modellen die alleen qua volgorde verschillen moeten gezien worden als equivalent.
</aside>

## URI-munting

Een belangrijk gegeven in Linked Data is het munten van URI's. Bij de vertaling van een MIM modelelement naar een overeenkomstige resource in Linked Data vocabulaires zullen ook nieuwe URI's gemunt moeten worden. Enerzijds omdat er (soms) sprake is van meer dan één resource voor één modelelement, maar ook omdat een Linked Data resource wel equivalent is met een MIM modelelement, maar niet exact gelijk: we willen niet dat de formele semantiek van de Linked Data vocabulaires vermengd wordt met de formele semantiek van het MIM metamodel.

Daarnaast geldt dat het in Linked Data gebruikelijk is om URI's over te nemen van andere (externe) vocabulaires c.q. modellen. Ook het MIM ondersteund dit, in de vorm van de mim metamodelklassen `mim:Extern` en `mim:View`. Echter, anders dan bij UML, behoren de modelementen uit deze externe modellen ook de URI's te krijgen die horen bij deze externe modellen. Ieder modelelement heeft dan ook een metagegeven `mim:uri` waar de vocabulaire URI's op gebaseerd worden.

Indien sprake is van een view package, dan wordt de `mim:basisUri` en/of de expliciet ingevulde `mim:uri` van deze view package alleen gebruikt voor de vocabulaire URI's (voorkomens van `owl:Class`, `owl:DatatypeProperty` en `owl:ObjectProperty`). Voor de voorkomens van shapes (`sh:NodeShape` en `sh:PropertyShape`) wordt juist gebruik gemaakt van de `mim:basisUri` zoals deze bij de eigen informatiemodel is opgegeven. Rationale hierachter is dat bij view-packages de "view" lokaal gedefinieerd is, maar de elementen wel afkomstig zijn uit een externe vocabulaire.

## Overzicht

Onderstaande tabellen geven een overzicht van alle transformaties en een referentie naar de betreffende transformatieregel

### Klassen

|MIM-klasse|Vertaling|Referentie|
|----------|---------|----------|
|`mim:Modelelement`|n.v.t.|Abstracte klasse|
|`mim:Objecttype`|`owl:Class`, `sh:NodeShape`|[Objecttype](#transformatie-objecttype)|
|`mim:Attribuutsoort`|`owl:ObjectProperty`, `owl:DatatypeProperty`, `sh:PropertyShape`|[Attribuutsoort](#transformatie-attribuutsoort)|
|`mim:Gegevensgroep`|`sh:PropertyShape`, `owl:ObjectProperty`|[Gegevensgroep](#transformatie-gegevensgroep)|
|`mim:Gegevensgroeptype`|`owl:Class`, `sh:NodeShape`|[Gegevensgroeptype](#transformatie-gegevensgroeptype)|
|`mim:Generalisatie`|`rdfs:subClassOf` `rdf:Statement`|[Generalisatie](#transformatie-generalisatie)|
|`mim:Relatiesoort`|`sh:PropertyShape`, `owl:ObjectProperty`|[Relatiesoort](#transformatie-relatiesoort)|
|`mim:Relatieklasse`|`rdf:Statement`|[Relatieklasse](#transformatie-relatieklasse)|
|`mim:ExterneKoppeling`|`sh:PropertyShape`, `owl:ObjectProperty`|[Externe koppeling](#transformatie-externe-koppeling)|
|`mim:Relatierol`|`sh:PropertyShape`, `owl:ObjectProperty`|[Relatierol](#transformatie-relatierol)|
|`mim:Referentielijst`|`owl:Class`, `sh:NodeShape`|[Referentielijst](#transformatie-referentielijst)|
|`mim:ReferentieElement`|`owl:Class`, `sh:NodeShape`|[Referentie-element](#transformatie-referentie-element)|
|`mim:Enumeratie`|`owl:Class`, `sh:NodeShape`, `skos:ConceptScheme`|[Enumeratie](#transformatie-enumeratie)|
|`mim:Enumeratiewaarde`|Enumeratie-klasse|[Enumeratiewaarde](#transformatie-enumeratiewaarde)|
|`mim:Codelijst`|`owl:Class`, `sh:NodeShape`|[Codelijst](#transformatie-codelijst)|
|`mim:Datatype`|n.v.t.|Abstracte klasse|
|`mim:PrimitiefDatatype`|`rdfs:Datatype`|[Primitief datatype](#transformatie-primitief-datatype)|
|`mim:GestructureerdDatatype`|`sh:NodeShape`|[Gestructureerd datatype](#transformatie-gestructureerd-datatype)|
|`mim:DataElement`|`owl:ObjectProperty`, `owl:DatatypeProperty`, `sh:PropertyShape`|[Data element](#transformatie-data-element)|
|`mim:Keuze`|`sh:xone`, `rdf:List`|[Keuze](#transformatie-keuze)|
|`mim:Keuzeconstraint`|`sh:xone`, `rdf:List`|[Keuze](#transformatie-keuze)|
|`mim:Package`|n.v.t.|Abstracte klasse|
|`mim:Domein`|`owl:Ontology`|[Domein](#transformatie-domein)|
|`mim:Extern`|`owl:imports`|[Extern](#transformatie-extern)|
|`mim:View`|`owl:imports`|[View](#transformatie-view)|
|`mim:Constraint`|`mim:Constraint`|[Constraint](#transformatie-constraint)|
|`mim:RelatierolBron`|`sh:PropertyShape`, `owl:ObjectProperty`|[Relatierol](#transformatie-relatierol)|
|`mim:RelatierolDoel`|`sh:PropertyShape`, `owl:ObjectProperty`|[Relatierol](#transformatie-relatierol)|

### Eigenschappen

|MIM-eigenschap|Vertaling|Referentie|
|--------------|---------|----------|
|`mim:naam`|`rdfs:label`|[naam](#transformatie-naam)|
|`mim:alias`|`mim:alias`|[alias](#transformatie-alias)|
|`mim:begrip`|`dct:subject`|[begrip](#transformatie-begrip)|
|`mim:begripsterm`|`mim:begripsterm`|[begripsterm](#transformatie-begripsterm)|
|`mim:definitie`|`rdfs:comment`|[definitie](#transformatie-definitie)|
|`mim:toelichting`|`mim:toelichting`|[toelichting](#transformatie-toelichting)|
|`mim:herkomst`|`mim:herkomst`|[herkomst](#transformatie-herkomst)|
|`mim:herkomstDefinitie`|`mim:herkomstDefinitie`|[herkomst definitie](#transformatie-herkomst-definitie)|
|`mim:datumOpname`|`mim:datumOpname`|[datum opname](#transformatie-datum-opname)|
|`mim:indicatieMaterieleHistorie`|`mim:indicatieMaterieleHistorie`|[indicatie materiële historie](#transformatie-indicatie-materiele-historie)|
|`mim:indicatieFormeleHistorie`|`mim:indicatieFormeleHistorie`|[indicatie formele historie](#transformatie-indicatie-formele-historie)|
|`mim:kardinaliteit`|`sh:minCount`, `sh:maxCount`|[kardinaliteit](#transformatie-kardinaliteit)|
|`mim:authentiek`|`mim:authentiek`|[authentiek](#transformatie-authentiek)|
|`mim:indicatieAfleidbaar`|`mim:indicatieAfleidbaar`|[indicatie afleidbaar](#transformatie-indicatie-afleidbaar)|
|`mim:mogelijkGeenWaarde`|`mim:mogelijkGeenWaarde`, `sh:minCount`|[mogelijk geen waarde](#transformatie-mogelijk-geen-waarde)
|`mim:locatie`|`mim:locatie`|[locatie](#transformatie-locatie)|
|`mim:type`|`sh:datatype`, `sh:node`|[type](#transformatie-type)|
|`mim:lengte`|`sh:minLength`, `sh:maxLength`|[lengte](#transformatie-lengte)|
|`mim:patroon`|`mim:patroon`|[patroon](#transformatie-patroon)|
|`mim:formeelPatroon`|`sh:pattern`|[formeel patroon](#transformatie-formeel-patroon)|
|`mim:uniekeAanduiding`|`mim:uniekeAanduiding`|[unieke aanduiding](#transformatie-unieke-aanduiding)
|`mim:populatie`|`mim:populatie`|[populatie](#transformatie-populatie)|
|`mim:kwaliteit`|`mim:kwaliteit`|[kwaliteit](#transformatie-kwaliteit)|
|`mim:indicatieAbstractObject`|`sh:propertyShape` en `mim:indicatieAbstractObject`|[indicatie abstract object](#transformatie-indicatie-abstract-object)|
|`mim:identificerend`|`mim:identificerend`|[identificerend](#transformatie-identificerend)|
|`mim:gegevensgroeptype`|`sh:node`|[gegevensgroeptype](#transformatie-gegevensgroeptype-eigenschap)|
|`mim:unidirectioneel`|(bij false) `owl:inverseOf`|[unidirectioneel](#transformatie-unidirectioneel)|
|`mim:bron`|`sh:property`|[bron](#transformatie-bron)|
|`mim:doel`|`sh:class`|[doel](#transformatie-doel)|
|`mim:aggregatietype`|`mim:aggregatietype`|[aggregatietype](#transformatie-aggregatietype)|
|`mim:subtype`|`rdfs:subClassOf`|[Generalisatie](#transformatie-generalisatie)|
|`mim:supertype`|`rdfs:subClassOf`|[Generalisatie](#transformatie-generalisatie)|
|`mim:code`|`skos:notation`|[code](#transformatie-code)|
|`mim:specificatieTekst`|`mim:specificatieTekst`|[specificatie-tekst](#transformatie-specificatie-tekst)|
|`mim:specificatieFormeel`|`mim:specificatieFormeel`|[specificatie-formeel](#transformatie-specificatie-formeel)|
|`mim:attribuut`|`sh:property`|[attribuut](#transformatie-attribuut)|
|`mim:gegevensgroep`|`sh:property`|[gegevensgroep](#transformatie-gegevensgroep-eigenschap)|
|`mim:waarde`|`rdf:type`, `skos:inScheme`|[Enumeratie](#transformatie-enumeratie)|
|`mim:constraint`|`mim:constraint`|[Constraint](#transformatie-constraint)|
|`mim:element`|`sh:property`|[Data element](#transformatie-data-element)|
|`mim:indicatieClassificerend`|`rdfs:subClassOf` (onder meer)|[indicatie classificerend](#transformatie-indicatie-classificerend)|
|`mim:bevatModelelement`|`rdfs:isDefinedBy`, `owl:imports`|[bevat modelelement](#transformatie-bevat-modelement)|

### Instanties (datatypen)

|MIM datatype|Vertaling|Referentie|
|------------|---------|----------|
|`mim:CharacterString`|`xsd:string`|[Primitief datatype - standaard datatypen](#transformatie-primitief-datatype-standaard-datatypen)|
|`mim:Integer`|`xsd:integer`|[Primitief datatype - standaard datatypen](#transformatie-primitief-datatype-standaard-datatypen)|
|`mim:Real`|`xsd:float`|[Primitief datatype - standaard datatypen](#transformatie-primitief-datatype-standaard-datatypen)|
|`mim:Decimal`|`xsd:decimal`|[Primitief datatype - standaard datatypen](#transformatie-primitief-datatype-standaard-datatypen)|
|`mim:Boolean`|`xsd:boolean`|[Primitief datatype - standaard datatypen](#transformatie-primitief-datatype-standaard-datatypen)|
|`mim:Date`|`xsd:date`|[Primitief datatype - standaard datatypen](#transformatie-primitief-datatype-standaard-datatypen)|
|`mim:DateTime`|`xsd:dateTime`|[Primitief datatype - standaard datatypen](#transformatie-primitief-datatype-standaard-datatypen)|
|`mim:Year`|`xsd:gYear`|[Primitief datatype - standaard datatypen](#transformatie-primitief-datatype-standaard-datatypen)|
|`mim:Day`|`xsd:gDay`|[Primitief datatype - standaard datatypen](#transformatie-primitief-datatype-standaard-datatypen)|
|`mim:Month`|`xsd:gMonth`|[Primitief datatype - standaard datatypen](#transformatie-primitief-datatype-standaard-datatypen)|
|`mim:URI`|`xsd:anyURI`|[Primitief datatype - standaard datatypen](#transformatie-primitief-datatype-standaard-datatypen)|

## Klassen

Omdat het getransformeerde model daadwerkelijk een nieuw model is, zullen de elementen in het getransformeerde model ook eigen URI's krijgen. Om de relatie tussen het originele MIM-model het het getransformeerde model op basis van RDFS te behouden, wordt de eigenschap `mim:equivalent` gebruikt.

### Transformatie: Objecttype

> De typering van een groep objecten die binnen een domein relevant zijn en als gelijksoortig worden beschouwd.

Een `mim:Objecttype` wordt vertaald naar een `owl:Class` in combinatie met een `sh:NodeShape`.

<pre class='ex-sparql'>
CONSTRUCT {
  ?class a owl:Class.
  ?class mim:equivalent ?objecttype.
  ?nodeshape a sh:NodeShape.
  ?nodeshape mim:equivalent ?objecttype.
  ?nodeshape sh:targetClass ?class.
}
WHERE {
  ?objecttype a mim:Objecttype.
  ?objecttype mim:naam ?objecttypenaam.
  
  BIND (t:uri(?objecttypenaam) as ?class)
  BIND (t:nodeshapeuri(?objecttypenaam) as ?nodeshape)
}
</pre>

### Transformatie: Attribuutsoort

> De typering van gelijksoortige gegevens die voor een objecttype van toepassing is.

Een `mim:Attribuutsoort` wordt vertaald naar een `owl:DatatypeProperty` in combinatie met een `sh:PropertyShape`.

In OWL is een property anders dan in het MIM een *first class citizen*. Dit betekent dat als in twee objecttypen gebruik wordt gemaakt van een attribuutsoort die dezelfde naam heeft, dit leidt tot twee verschillende attribuutsoorten. In OWL zou dit echter leiden tot maar één attribuutsoort, tenzij daadwerkelijk sprake is van verschil in betekenis.

<aside id='trans-4' class='note'>
In een goed RDF model bestaat de mogelijkheid dat de properties worden hergebruikt over meerdere klassen. Er is nog steeds sprake van één unieke propertyshape bij één objecttype, maar in het RDF model kan vervolgens expliciet worden aangegeven dat de *betekenis* van de attribuutsoort dezelfde is als een attribuutsoort van een andere klasse. Dit is uit te drukken in MIM door erop toe te zien dat voor de verschillende Attribuutsoorten, dezelfde URI wordt gehanteerd. Wanneer precies dezelfde propertyshape gebruikt moet worden; moet vanuit het voorkomen van Objecttype naar hetzelfde voorkomen van Attribuutsoort verwezen worden.

Wanneer er geen URI is gepecificeerd kan er terug gevallen worden op het veld mim:begrip. Indien bij twee attribuutsoorten verwezen wordt naar hetzelfde `mim:begrip` en ook hun `mim:naam` hetzelfde is, dan wordt ook verondersteld dat de betekenis van deze attribuutsoorten hetzelfde is, en sprake is van dezelfde property.

Mocht het veld `mim:begrip` niet gebruikt zijn, dan wordt gekeken naar het veld `mim:definitie` in combinatie met het veld `mim:naam`. Indien twee attribuutsoorten dezelfde definitie hebben EN dezelfde naam, dan wordt ook verondersteld dat de betekenis van deze attribuutsoorten hetzelfde is, en sprake is van dezelfde property.
</aside>

<aside id='trans-5' class='note'>
De identificatie van een attribuutsoort is afgeleid van de `mim:uri` van het attribuutsoort. Voor de propertyshape geldt dat deze ook nog afhankelijk is van de naam van het objecttype waartoe de attribuutsoort behoord. Aangezien een attribuutsoort binnen zijn objecttype uniek behoord te zijn conform het MIM, zal hiermee ook een unieke identificatie worden verkregen. Voor de identificatie van de propertyshape geldt dat deze uniek moet zijn binnen de package als sprake is van hetzelfde begrip. Een dergelijke regel geldt ook voor andere modelelementen die binnen een objecttype vallen.
</aside>

Indien het datatype van een attribuutsoort gelijk is aan PrimitiefDatatype (of een daarvan afgeleid datatype), dan is sprake van een `owl:DatatypeProperty` en een `sh:nodeKind sh:Literal`. In alle andere gevallen is sprake van een `owl:Objecttype` en een `sh:nodeKind sh:IRI`. Zie ook de transformatie van de eigenschapen `mim:type`.

De URI van de propertyshape wordt afgeleid van de naam van het modelelement dat de attribuutsoort "bezit" en de naam van de attribuutsoort. De URI van de datatypeproperty is gelijk aan de mim:uri van het attribuutsoort of wordt afgeleid van de naam van de attribuutsoort en de basis-URI van de bijbehorende package.

<pre class='ex-sparql'>
CONSTRUCT {
  ?propertyshape a sh:PropertyShape.
  ?propertyshape sh:path ?datatypeproperty.
  ?propertyshape sh:nodekind sh:Literal.
  ?propertyshape mim:equivalent ?attribuutsoort.
  ?datatypeproperty a owl:DatatypeProperty.
  ?datatypeproperty mim:equivalent ?attribuutsoort.
}
WHERE {
  ?attribuutsoort a mim:Attribuutsoort.
  ?attribuutsoort mim:naam ?attribuutsoortnaam.
  ?bezitter mim:attribuut ?attribuutsoort.
  ?bezitter mim:naam ?bezittersnaam
  BIND (t:propertyshapeuri(?bezittersnaam,?attribuutsoortnaam) as ?propertyshape)
  BIND (t:uri(?attribuutsoortnaam) as ?datatypeproperty)
  {
    {
      ?attribuutsoort mim:datatype/rdfs:subClassOf* mim:PrimitiefDatatype.
      BIND (owl:DatatypeProperty as ?type)
    }
    UNION
    {
      ?attribuutsoort mim:datatype ?datatype.
      FILTER NOT EXISTS {
        ?attribuutsoort mim:datatype/rdfs:subClassOf* mim:PrimitiefDatatype.
      }
      BIND (owl:ObjectProperty as ?type)
    }
}
</pre>

### Transformatie: Gegevensgroep

> Een typering van een groep van gelijksoortige gegevens die voor een objecttype van toepassing is.

Een `mim:Gegevensgroep` wordt vertaald naar een `sh:PropertyShape` in combinatie met een `owl:ObjectProperty`. De nodekind van de propertyshape is een `sh:BlankNode`. Gedachte hierachter is dat de gegevensgroep de verbinding is tussen een objecttype en een gegevensgroeptype. Een gegevensgroeptype is vervolgens een groep van samenhangende attribuutsoorten, wat overeen komt met een class en een nodeshape (zie ook gegevensgroeptype). Omdat een gegevensgroeptype geen eigen identiteit heeft, zal dit gemodelleerd worden als blank node.

De URI van de propertyshape wordt afgeleid van de naam van het modelelement dat de gegevensgroep "bezit" en de naam van de gegevensgroep. De URI van de `owl:objectProperty` is gelijk aan de mim:uri van de gegevensgroep.

<pre class='ex-sparql'>
CONSTRUCT {
  ?propertyshape a sh:PropertyShape.
  ?propertyshape sh:path ?objectproperty.
  ?propertyshape sh:nodekind sh:BlankNode.
  ?propertyshape mim:equivalent ?gegevensgroep.
  ?objectproperty a owl:ObjectProperty.
  ?objectproperty mim:equivalent ?gegevensgroep.
}
WHERE {
  ?gegevensgroep a mim:Gegevensgroep.
  ?gegevensgroep mim:naam ?gegevensgroepnaam.
  ?bezitter mim:gegevensgroep ?gegevensgroep.
  ?bezitter mim:naam ?bezittersnaam
  BIND (t:propertyshapeuri(?bezittersnaam,?gegevensgroepnaam) as ?propertyshape)
  BIND (t:uri(?gegevensgroepnaam) as ?objectproperty)
}
</pre>

### Transformatie: Gegevensgroeptype

> Een groep van met elkaar samenhangende attribuutsoorten. Een gegevensgroeptype is altijd een type van een gegevensgroep.

Een `mim:Gegevensgroeptype` wordt vertaald naar een `owl:Class` en een `sh:NodeShape`, net zoals een `mim:Objecttype`.

Merk op dat er in het getransformeerde Linked Data model weinig verschil meer is tussen een gegevensgroeptype en een objecttype. Het verschil is alleen zichtbaar doordat een gegevensgroeptype als blank node verbonden is (zie ook [Gegevensgroep](#gegevensgroep)).

<pre class='ex-sparql'>
CONSTRUCT {
  ?class a owl:Class.
  ?class mim:equivalent ?gegevensgroeptype.
  ?nodeshape a sh:NodeShape.
  ?nodeshape mim:equivalent ?gegevensgroeptype.
  ?nodeshape sh:targetClass ?class.
}
WHERE {
  ?gegevensgroeptype a mim:Gegevensgroeptype.
  ?gegevensgroeptype mim:naam ?gegevensgroeptypenaam.
  BIND (t:uri(?gegevensgroeptypenaam) as ?class)
  BIND (t:nodeshapeuri(?gegevensgroeptypenaam) as ?nodeshape)
}
</pre>

### Transformatie: Generalisatie

> De typering van het hiërarchische verband tussen een meer generiek en een meer specifiek modelelement van hetzelfde soort, waarbij het meer specifieke modelelement eigenschappen van het meer generieke modelelement overerft.

Generalisatie kan gebruikt worden tussen objecttypen, maar ook tussen datatypen. Aangezien zowel objecttypen als datatypen in het RDFS gebaseerde model worden getransformeerd naar een subklasse van `rdfs:Class`, kan in beide gevallen gebruik worden gemaakt van dezelfde transformatie.

Een `mim:Generalisatie` wordt vertaald naar een `rdfs:subClassOf`.

<aside id='trans-7' class='note'>
Generalisatie is in Linked Data ook mogelijk op properties, en daar ook wel gebruikelijk. Dit wordt nu formeel niet door het MIM ondersteunt. Indien in een RDF model een dergelijke situatie zich voordoet, kan dit vertaald worden naar een MIM model waarbij de aspecten `mim:subtype` en `mim:supertype` verwijzen naar een attribuutsoort of relatieklasse.
</aside>

### Transformatie: Relatiesoort

> De typering van het structurele verband tussen een object van een objecttype en een (ander) object van een ander (of hetzelfde) objecttype.

In het MIM zijn er twee specificatievormen voor relaties: op basis van `mim:Relatiesoort` of op basis van `mim:Relatierol`. Indien gekozen wordt voor `mim:Relatiesoort` dan geldt onderstaande uitwerking. Indien gekozen wordt voor `mim:Relatierol`, dan geldt de uitwerking zoals beschreven bij Relatierol. De keuze wordt bepaald door de aanwezigheid van het attribuut `mim:relatierol`.

Een `mim:Relatiesoort` wordt vertaald naar een `sh:PropertyShape` in combinatie met een `owl:ObjectProperty`. De nodekind van de propertyshape is een `sh:IRI`.

De URI van de propertyshape wordt afgeleid van de naam van het modelelement dat de relatiesoort "bezit" en de naam van de relatiesoort. De URI van de `owl:objectProperty` is gelijk aan de mim:uri van de relatiesoort.

<pre class='ex-sparql'>
CONSTRUCT {
  ?propertyshape a sh:PropertyShape.
  ?propertyshape sh:path ?objectproperty.
  ?propertyshape sh:nodekind sh:IRI.
  ?propertyshape mim:equivalent ?relatiesoort.
  ?objectproperty a owl:ObjectProperty.
  ?objectproperty mim:equivalent ?relatiesoort.
}
WHERE {
  ?relatiesoort a mim:Relatiesoort.
  ?relatiesoort mim:naam ?relatiesoortnaam.
  ?bezitter mim:bron ?relatiesoort.
  ?bezitter mim:naam ?bezittersnaam
  BIND (t:propertyshapeuri(?bezittersnaam,?relatiesoortnaam) as ?propertyshape)
  BIND (t:uri(?relatiesoortnaam) as ?objectproperty)
  FILTER NOT EXISTS {
    ?relatiesoort mim:relatierol ?rol
  }
}
</pre>

### Transformatie: Relatieklasse

> Een relatiesoort met eigenschappen.

Een `mim:Relatieklasse` wordt vertaald naar een subklasse van `rdf:Statement`, waarbij bovendien ook de transformatieregels voor een `mim:Objecttype` en een `mim:Relatiesoort` worden gevolgd.

<pre class='ex-sparql'>
CONSTRUCT {
  ?class a owl:Class.
  ?class rdfs:subClassOf rdf:Statement.
  ?class mim:equivalent ?relatieklasse.
  ?nodeshape a sh:NodeShape.
  ?nodeshape mim:equivalent ?relatieklasse.
  ?nodeshape sh:targetClass ?class.
  ?nodeshape sh:property [
    sh:path rdf:predicate;
    sh:hasValue ?objectproperty;
    sh:minCount 1;
    sh:maxCount 1;
  ];
  ?nodeshape sh:property [
    sh:path rdf:subject;
    sh:class ?subject;
  ];
  ?nodeshape sh:property [
    sh:path rdf:object;
    sh:class ?object;
  ];
  ?propertyshape a sh:PropertyShape.
  ?propertyshape sh:path ?objectproperty.
  ?propertyshape sh:nodekind sh:IRI.
  ?propertyshape mim:equivalent ?relatieklasse.
  ?objectproperty a owl:ObjectProperty.
  ?objectproperty mim:equivalent ?relatieklasse.
}
WHERE {
  ?relatieklasse a mim:Relatiesoort.
  ?relatieklasse mim:naam ?relatieklassenaam.
  ?relatieklasse mim:bron ?bezitter.
  ?bezitter mim:naam ?bezittersnaam.
  ?bezitter mim:seeAlso ?subject.
  ?relatieklasse mim:doel ?doelklasse.
  ?doelklasse mim:seeAlso ?object.
  BIND (t:uri(t:CamelCase(?relatieklassenaam)) as ?class)
  BIND (t:nodeshapeuri(?relatieklassenaam) as ?nodeshape)
  BIND (t:propertyshapeuri(?bezittersnaam,?relatieklassenaam) as ?propertyshape)
  BIND (t:uri(t:camelCase(?relatieklassenaam)) as ?objectproperty)
}
</pre>

### Transformatie: Externe koppeling

> Een associatie waarmee vanuit het perspectief van het eigen informatiemodel een objecttype uit het 'eigen' informatiemodel gekoppeld wordt aan een objecttype van een extern informatiemodel. De relatie zelf hoort bij het 'eigen' objecttype.

Een externe koppeling wordt op dezelfde wijze omgezet als een `mim:Relatiesoort` (zie [Relatiesoort](#relatiesoort)). Het verschil is zichtbaar doordat de betreffende objecttypes uit verschillende modellen komen. Anders dan bij UML is het daarbij niet gebruikelijk om het andere objecttype "in" het eigen model te plaatsen, maar juist om direct naar het andere objecttype te verwijzen. Eventueel kan daarbij ook nog gebruik worden gemaakt van een `owl:imports` om expliciet aan te geven dat een ander model wordt gebruikt.

<aside id='trans-8' class='note'>
Een externe koppeling gedraagt zich in een RDF model exact als een relatiesoort. Het verschil wordt zichtbaar doordat het gerelateerde objecttype in een andere package zitten met de aanduiding `mim:view` of `mim:extern`. De objecttypen in deze packages zullen dan ook niet worden omgezet. Wel wordt een extra `owl:imports` statement toegevoegd. Dit gebeurt bij de vertaling van de betreffende packages.
</aside>

#### Transformatie: Relatierol

In het MIM zijn er twee specificatievormen voor relaties: op basis van `mim:Relatiesoort` of op basis van `mim:Relatierol`. Indien gekozen wordt voor `mim:Relatierol` dan geldt onderstaande uitwerking. Indien gekozen wordt voor `mim:Relatiesoort`, dan geldt de uitwerking zoals beschreven bij Relatiesoort.

Een `mim:Relatiesoort` wordt vertaald naar een `sh:PropertyShape` in combinatie met een `owl:ObjectProperty`. De nodekind van de propertyshape is een `sh:IRI`.

De URI van de propertyshape wordt afgeleid van de naam van het modelelement dat de relatierol "bezit" en de naam van de relatierol. De URI van de `owl:objectProperty` is gelijk aan de mim:uri van de relatiesoort. Aangezien er twee relatierollen gedefinieerd kunnen worden, kan ook sprake zijn van twee properties. In dat geval zijn deze twee properties elkaars inverse.

<pre class='ex-sparql'>
CONSTRUCT {
  ?propertyshape a sh:PropertyShape.
  ?propertyshape sh:path ?objectproperty.
  ?propertyshape sh:nodekind sh:IRI.
  ?propertyshape mim:equivalent ?relatierol.
  ?objectproperty a owl:ObjectProperty.
  ?objectproperty mim:equivalent ?relatierol.
}
WHERE {
  ?relatierol a ?type.
  ?relatierol mim:naam ?relatiesoortnaam.
  ?relatiesoort mim:relatierol ?relatierol.
  ?bezitter mim:bron ?relatiesoort.
  ?bezitter mim:naam ?bezittersnaam
  BIND (t:propertyshapeuri(?bezittersnaam,?relatiesoortnaam) as ?propertyshape)
  BIND (t:uri(?relatiesoortnaam) as ?objectproperty)
  FILTER (?type = mim:RelatierolBron || ?type = mim:RelatierolDoel)
}

CONSTRUCT {
  ?sourceproperty owl:inverseOf ?targetproperty
}
WHERE {
  ?sourceproperty a owl:ObjectProperty.
  ?sourceproperty mim:equivalent ?relatierolbron.
  ?relatierolbron a mim:RelatierolBron.
  ?targetproperty a owl:ObjectProperty.
  ?targetproperty mim:equivalent ?relatieroldoel.
  ?relatieroldoel a mim:RelatierolDoel.
  ?relatiesoort mim:relatierol ?relatierolbron,
                               ?relatieroldoel.
}
</pre>

### Transformatie: Referentielijst

> Een lijst met een opsomming van de mogelijke domeinwaarden van een attribuutsoort, die buiten het model in een externe waardelijst worden beheerd. De domeinwaarden in de lijst kunnen in de loop van de tijd aangepast, uitgebreid, of verwijderd worden, zonder dat het informatiemodel aangepast wordt (in tegenstelling tot bij een enumeratie).

Een waardelijst kan verschillende soorten dingen opsommen. Een lijst met waardes, bijv. een opsomming van nummers, maar ook een lijst met concepten, datatypen, of objecten. Het is dan ook niet triviaal om een goede automatische vertaling te bepalen die een waardelijst kan vertalen naar Linked Data.

Het MIM biedt echt aanknopingspunten hoe een waardelijst gemodelleerd dient te worden:

1. Een enumeratie geeft een opsomming van waarden, waarbij de waarden zelf ook eigenschappen kunnen hebben. Het zijn met andere woorden geen literals, maar resources;
2. Een referentielijst geeft een opsomming van waarden, waarbij van de waarden specifieke kenmerken worden opgenomen die gespecificeerd zijn middels referentie-elementen. Ook referentiewaarden zijn met andere woorden resources, met specifieke eigenschappen.
3. Een codelijst is gelijk aan een referentielijst, met dit verschil dat de codelijst zelf niet gespecificeerd is, maar "direct" is overgenomen van een externe partij.

In de Inspire RDF Guidelines wordt voorgeschreven om een enumeratie te modelleren als rdfs:Datatype in plaats van als klasse. Dit leidt tot enumeratiewaardes die een literal zijn, met het datatype van de enumeratie. Bijvoorbeeld `"hoog"^^imgolf:NatuurwaardeValue`. De reden om hiervan af te wijken is omdat enumeraties vaker waardelijsten zijn die een object of concept modelleren, dan een lijst van letterlijke waardes. Door deze waardes als objecten te modelleren blijft het mogelijk om nieuwe uitdrukkingen te doen over de waardes.

Voor het MIM wordt een waardelijst dan ook vertaald naar een klasse gelijknamig aan de waardelijst (referentielijst, enumeratie of codelijst).

Voor een referentielijst geldt bovendien dat ook nog een `sh:NodeShape` wordt gedefinieerd, waar de referentie-elementen vervolgens aan gehangen kunnen worden.

<pre class='ex-sparql'>
CONSTRUCT {
  ?class a owl:Class.
  ?class mim:equivalent ?referentielijst.
  ?nodeshape a sh:NodeShape.
  ?nodeshape mim:equivalent ?referentielijst.
  ?nodeshape sh:targetClass ?class.
}
WHERE {
  ?referentielijst a mim:Referentielijst.
  ?referentielijst mim:naam ?referentielijstnaam.
  BIND (t:uri(?referentielijstnaam) as ?class)
  BIND (t:nodeshapeuri(?referentielijstnaam) as ?nodeshape)
}
</pre>

### Transformatie: Referentie element

> Een eigenschap van een object in een referentielijst in de vorm van een gegeven.

Een `mim:ReferentieElement` wordt op dezelfde wijze omgezet als een `mim:Attribuutsoort`, waarbij de referentielijst de "bezitter" is van het referentie element. De relatie tussen de referentielijst en het referentie element wordt direct meegenomen in de transformatie.

De URI van de propertyshape wordt afgeleid van de naam van de referentielijst dat het referentie element "bezit" en de naam van het referentie element. De URI van de datatypeproperty wordt ook op die manier afgeleid. Dit in afwijking van de wijze waarop dit bij een attribuutsoort gebeurt. Reden is het feit dat een referentie element echt uniek bij een gestructureerd datatype hoort, conform het metamodel (er is sprake van een compositie-aggregatie). Dit is weer vergelijkbaar met de situatie bij `mim:DataElement`.

<pre class='ex-sparql'>
CONSTRUCT {
  ?nodeshape sh:property ?propertyshape.
  ?propertyshape a sh:PropertyShape.
  ?propertyshape sh:path ?datatypeproperty.
  ?propertyshape sh:nodekind sh:Literal.
  ?propertyshape mim:equivalent ?referentieelement.
  ?datatypeproperty a owl:DatatypeProperty.
  ?datatypeproperty mim:equivalent ?referentieelement.
}
WHERE {
  ?referentieelement a mim:ReferentieElement.
  ?referentieelement mim:naam ?referentieelementnaam.
  ?bezitter mim:element ?referentieelement.
  ?bezitter mim:naam ?bezittersnaam
  BIND (t:nodeshapeuri(?bezittersnaam) as ?nodeshape)
  BIND (t:propertyshapeuri(?bezittersnaam,?referentieelementnaam) as ?propertyshape)
  BIND (t:nodepropertyuri(?referentieelementnaam) as ?datatypeproperty)
}
</pre>

### Transformatie: Enumeratie

> Een datatype waarvan de mogelijke waarden limitatief zijn opgesomd in een statische lijst.

Een `mim:Enumeratie` wordt vertaald naar een `owl:Class` in combinatie met een `sh:Nodeshape`, `skos:ConceptScheme` en enkele `sh:PropertyShape`s, waarbij de betreffende klasse een `rdfs:subClassOf skos:Concept` is.

De reden om deze vertaling te maken, is dat in het MIM een enumeratie onderdeel is van het eigen model, en zeer specifieke eigenschappen kent. Het is expliciet geen "normale" klasse (daarvoor lenen `mim:Objecttype` of `mim:Referentielijst` zich meer). Maar het is ook geen enkele opsomming van enkelvoudige waarden.

De waarden van een enumeratie zijn voorkomens van deze klasse en onderdeel van het `skos:ConceptScheme` dat aan deze enumeratie zit.

<pre class='ex-sparql'>
CONSTRUCT {
  ?class a owl:Class.
  ?class rdfs:subClassOf skos:Concept.
  ?class mim:equivalent ?enumeratie.
  ?nodeshape a sh:NodeShape.
  ?nodeshape mim:equivalent ?enumeratie.
  ?nodeshape sh:targetClass ?class.
  ?nodeshape sh:property [
    sh:path rdfs:label;
  ].
  ?nodeshape sh:property [
    sh:path skos:notation;
  ].
  ?nodeshape sh:property [
    sh:path skos:definition
  ].
  ?nodeshape sh:property [
    sh:path rdf:type;
    sh:hasValue ?class
  ].
  ?nodeshape sh:property [
    sh:path skos:inScheme;
    sh:hasValue ?scheme
  ]
}
WHERE {
  ?enumeratie a mim:Enumeratie.
  ?objecttype mim:naam ?enumeratienaam.
  BIND (t:uri(?enumeratienaam) as ?class)
  BIND (t:nodeshapeuri(?enumeratienaam) as ?nodeshape)
  BIND (t:schemeuri(?enumeratienaam) as ?scheme)
}
</pre>

### Transformatie: Enumeratiewaarde

> Een gedefinieerde waarde, in de vorm van een eenmalig vastgesteld constant gegeven.

Enumeratiewaarden worden vertaald naar voorkomens van de klasse die bepaald wordt door de Enumeratie zelf. Voor de URI wordt het metagegeven `mim:code` gebruikt, tenzij deze niet aanwezig is.

<pre class='ex-sparql'>
CONSTRUCT {
  ?concept a ?class.
  ?concept skos:inScheme ?scheme.
  ?concept mim:equivalent ?waarde.
}
WHERE {
  ?waarde a mim:Enumeratiewaarde.
  ?enumeratie mim:waarde ?waarde.
  ?class mim:equivalent ?enumeratie.
  ?class a owl:Class.
  ?scheme mim:equivalent ?enumeratie.
  ?scheme a skos:ConceptScheme.
  {
    {
      ?waarde mim:naam ?notation
      FILTER NOT EXISTS {?waarde mim:code ?nocode}
    }
    UNION
    {
      ?waarde mim:code ?notation
    }
  }
  BIND (t:concepturi(?notation) as ?concept)
}
</pre>

### Transformatie: Codelijst

> Een referentielijst die extern wordt beheerd, en geen onderdeel is van het informatiemodel.

Een `mim:Codelijst` wordt op dezelfde wijze getransformeerd als een `mim:Referentielijst`.

<pre class='ex-sparql'>
CONSTRUCT {
  ?class a owl:Class.
  ?class mim:equivalent ?codelijst.
  ?nodeshape a sh:NodeShape.
  ?nodeshape mim:equivalent ?codelijst.
  ?nodeshape sh:targetClass ?class.
}
WHERE {
  ?codelijst a mim:Codelijst.
  ?codelijst mim:naam ?codelijstnaam.
  BIND (t:uri(?codelijstnaam) as ?class)
  BIND (t:nodeshapeuri(?codelijstnaam) as ?nodeshape)
}
</pre>


## Datatypen

### Transformatie: Primitief datatype

> Een in het eigen model gedefinieerd primitieve datatype. Deze worden wel door de modelleur gecreëerd, met een eigen naam en een eigen definitie (en eigen metagegevens).

Een primitief datatype wordt vertaald naar een `rdfs:Datatype`. Indien er geen subklasse aanwezig is naar een andere datatype, dan wordt per default een subklasse van xsd:string toegevoegd.

<pre class='ex-sparql'>
CONSTRUCT {
  ?datatype a rdfs:Datatype.
  ?datatype rdfs:subClassOf xsd:string.
  ?datatype mim:equivalent ?primitiefdatatype.
}
WHERE {
  ?primitiefdatatype a mim:PrimitiefDatatype.
  ?primitiefdatatype mim:naam ?primitiefdatatypenaam.
  FILTER NOT EXISTS {
    ?generalisatie mim:subtype ?primitiefdatatype
  }
  BIND (t:uri(?primitiefdatatypenaam) as ?datatype)
}

CONSTRUCT {
  ?datatype a rdfs:Datatype.
  ?datatype mim:equivalent ?primitiefdatatype.
}
WHERE {
  ?primitiefdatatype a mim:PrimitiefDatatype.
  ?primitiefdatatype mim:naam ?primitiefdatatypenaam.
  ?generalisatie mim:subtype ?primitiefdatatype
  BIND (t:uri(?primitiefdatatypenaam) as ?datatype)
}
</pre>

### Transformatie: Primitief datatype - standaard datatypen

Voor standaard datatypen maakt RDF gebruik van de XSD datatypen. Onderstaande tabel geeft de mapping weer vanuit de datatypen die in het MIM zijn gespecificeerd.

|MIM datatype|XSD Datatype|
|------------|------------|
|`mim:CharacterString`|`xsd:string`|
|`mim:Integer`|`xsd:integer`|
|`mim:Real`|`xsd:float`|
|`mim:Decimal`|`xsd:decimal`|
|`mim:Boolean`|`xsd:boolean`|
|`mim:Date`|`xsd:date`|
|`mim:DateTime`|`xsd:dateTime`|
|`mim:Year`|`xsd:gYear`|
|`mim:Day`|`xsd:gDay`|
|`mim:Month`|`xsd:gMonth`|
|`mim:URI`|`xsd:anyURI`|

Deze vertaaltabel kan worden doorgevoerd via `mim:equivalent` statements, aangezien deze vervolgens gebruikt wordt in de transformatieregel voor generalisatie en in de transformatieregel voor het aspect `mim:type`.

<pre class='ex-sparql'>
CONSTRUCT {
  mim:CharacterString a mim:PrimitiefDatatype.
  mim:Integer a mim:PrimitiefDatatype.
  mim:Real a mim:PrimitiefDatatype.
  mim:Decimal a mim:PrimitiefDatatype.
  mim:Boolean a mim:PrimitiefDatatype.
  mim:Date a mim:PrimitiefDatatype.
  mim:DateTime a mim:PrimitiefDatatype.
  mim:Year a mim:PrimitiefDatatype.
  mim:Day a mim:PrimitiefDatatype.
  mim:Month a mim:PrimitiefDatatype.
  mim:URI a mim:PrimitiefDatatype.
  xsd:string mim:equivalent mim:CharacterString.
  xsd:integer mim:equivalent mim:Integer.
  xsd:float mim:equivalent mim:Real.
  xsd:decimal mim:equivalent mim:Decimal.
  xsd:boolean mim:equivalent mim:Boolean.
  xsd:date mim:equivalent mim:Date.
  xsd:dateTime mim:equivalent mim:DateTime.
  xsd:gYear mim:equivalent mim:Year.
  xsd:gDay mim:equivalent mim:Day.
  xsd:gMonth mim:equivalent mim:Month.
  xsd:anyURI mim:equivalent mim:URI.
}
WHERE {}
</pre>

### Transformatie: Gestructureerd datatype

> Specifiek benoemd gestructureerd datatype dat de structuur van een gegeven beschrijft, samengesteld uit minimaal twee elementen.

Een `mim:GestructureerdDatatype` wordt vertaald naar een `sh:NodeShape`. Er wordt geen `sh:Class` aangemaakt zoals bij een `mim:Objecttype`, aangezien conform het MIM een gestructureerd datatype slechts een structuur schetst en geen semantiek.

<pre class='ex-sparql'>
CONSTRUCT {
  ?nodeshape a sh:NodeShape.
  ?nodeshape mim:equivalent ?gestructureerddatatype.
}
WHERE {
  ?gestructureerddatatype a mim:GestructureerdDatatype.
  ?gestructureerddatatype mim:naam ?gestructureerddatatypenaam.
  BIND (t:uri(?gestructureerddatatypenaam) as ?nodeshape)
}
</pre>

### Transformatie: Data element

> Een onderdeel/element van een Gestructureerd datatype die als type een datatype heeft.

Een `mim:DataElement` wordt op dezelfde wijze omgezet als een `mim:Attribuutsoort`, waarbij het gestructureerd datatype de "bezitter" is van het data element. De relatie tussen het gestructureerd datatype en het data element wordt direct meegenomen in de transformatie.

De URI van de propertyshape wordt afgeleid van de naam van het gestructureerde datatype dat het data element "bezit" en de naam van het data element. De URI van de datatypeproperty wordt ook op die manier afgeleid. Dit in afwijking van de wijze waarop dit bij een attribuutsoort gebeurt. Reden is het feit dat een data element echt uniek bij een gestructureerd datatype hoort, conform het metamodel (er is sprake van een compositie-aggregatie).

<pre class='ex-sparql'>
CONSTRUCT {
  ?nodeshape sh:property ?propertyshape.
  ?propertyshape a sh:PropertyShape.
  ?propertyshape sh:path ?datatypeproperty.
  ?propertyshape sh:nodekind sh:Literal.
  ?propertyshape mim:equivalent ?dataelement.
  ?datatypeproperty a owl:DatatypeProperty.
  ?datatypeproperty mim:equivalent ?dataelement.
}
WHERE {
  ?dataelement a mim:DataElement.
  ?dataelement mim:naam ?dataelementnaam.
  ?bezitter mim:element ?dataelement.
  ?bezitter mim:naam ?bezittersnaam
  BIND (t:nodeshapeuri(?bezittersnaam) as ?nodeshape)
  BIND (t:propertyshapeuri(?bezittersnaam,?dataelementnaam) as ?propertyshape)
  BIND (t:nodepropertyuri(?dataelementnaam) as ?datatypeproperty)
}
</pre>

### Transformatie: Keuze

> Een opsomming van meerdere modelelementen, waarbij er maar van één tegelijkertijd sprake kan zijn.

Een keuze tussen modelelementen wordt gemodelleerd als een speciaal soort NodeShape die zelf een `sh:xone` eigenschap heeft. Deze eigenschap verwijst naar een `rdf:List` waarin de opsomming van de keuze staat uitgewerkt.

<pre class='ex-sparql'>
CONSTRUCT {
  ?shape a sh:NodeShape.
  ?shape sh:xone ?list.
  ?shape mim:equivalent ?keuze.
  ?list a rdf:List.
  ?list rdf:rest rdf:nil.
}
WHERE {
  ?keuze a ?type.
  FILTER (?type = mim:Keuze || ?type = mim:Keuzeconstraint)
  ?keuze mim:naam ?keuzenaam.
  ?keuze ?keuzerelatie ?keuzewaarde.
  BIND (t:nodeshapeuri(?keuzenaam) as ?shape)
}
</pre>

Voor het toevoegen van de waarden in de lijst wordt, anders dan andere voorbeelden, geen CONSTRUCT query gebruikt, omdat de lijst recursief wordt opgebouwd, in combinaties van DELETE en INSERT queries. Nieuwe elementen worden aan het begin van de lijst toegevoegd (er wordt geen volgorde verondersteld, zie ook het algemene issue over volgorde bovenaan). Het union element wordt zelf als blank node toegevoegd.

Onderstaand voorbeeld geeft aan hoe de conversie uiteindelijk plaatsvindt:

```
ex:GeometrischObject a mim:Objecttype;
  mim:naam "Geometrisch object";
  mim:attribuut ex:geometrie;
.
ex:geometrie a mim:Attribuutsoort;
  mim:naam "geometrie";
  mim:type ex:LineOrPolygon;
.
ex:LineOrPolygon a mim:Keuze;
  mim:naam "Line or polygon";
  mim:type ex:Line;
  mim:type ex:Polygon;
.
ex:Line a mim:PrimitiefDatatype;
  mim:naam "Line";
  mim:type gml:Line;
.
ex:Polygon a mim:PrimitiefDatatype;
  mim:naam "Polygon";
  mim:type gml:Polygon;
.

shape:GeometrischObject-geometrie a sh:PropertyShape;
  rdfs:label "geometrie";
  mim:equivalent ex:geometrie;
  sh:node shape:LineOrPolygon;
.
shape:LineOrPolygon a sh:NodeShape;
  rdfs:label "Line or polygon";
  mim:equivalent ex:LineOrPolygon;
  sh:xone (
    [ sh:datatype gml:Line ]
    [ sh:datatype gml:Polygon ]
  )
.
```

De query hiervoor is als volgt:

<pre class='ex-sparql'>
DELETE {
  ?endoflist rdf:rest rdf:nil
}
INSERT {
  ?list rdf:first [ mim:equivalent ?keuzeelement ];
  ?list rdf:rest ?endoflist.
}
WHERE {
  ?keuze a mim:Keuze.
  ?keuze ?keuzerelatie ?keuzelement.
  ?list mim:equivalent ?keuze.
  ?list rdf:rest* ?endoflist.
  ?endoflist rdf:rest rdf:nil.
}

DELETE {
  ?endoflist rdf:rest rdf:nil.
  ?realendoflist rdf:rest ?endoflist.
}
INSERT {
  ?realendoflist rdf:rest rdf:nil
}
WHERE {
  ?list a rdf:List.
  ?list rdf:rest* ?realendoflist.
  ?realendoflist rdf:rest ?endoflist.
  ?endoflist rdf:rest rdf:nil.
}
</pre>

De tweede delete-insert query is een "opruimquery": aangezien we zijn begonnen met een rdf:List in plaats van een rdf:nil, moeten we het einde van de lijst er nog weer afknippen.

## Packages
> Een package is een benoemde en begrensde verzameling/groepering van modelelementen.

### Transformatie: Domein
> Het eigen IM.

Een `mim:Domein` wordt omgezet naar een `owl:Ontology`.

### Transformatie: Extern
> Een groepering van constructies die een externe instantie beheert en beschikbaar stelt aan een informatiemodel en die in het informatiemodel ongewijzigd gebruikt worden.

Een `mim:Extern` wordt omgezet naar een `owl:Ontology`. Bovendien wordt een `owl:imports` aangelegd tussen de package van het type `mim:Domein` en deze externe package.

De gedachte hierachter, is dat een externe package letterlijk is overgenomen vanuit een extern model, en hier aanvullend is meegenomen. Feitelijk zal de inhoud dus identiek moeten zijn aan het model op de betreffende externe locatie.

### Transformatie: View
> Een groepering van objecttypen die gespecificeerd zijn in een extern informatiemodel en vanuit het perspectief van het eigen informatiemodel inzicht geeft welke gegevens van deze objecttypen relevant zijn binnen het eigen informatiemodel.

Een `mim:View` wordt omgezet naar een `owl:Ontology`. Daarbij geldt dat voor de locatie, de locatie wordt overgenomen uit de package van het type `mim:Informatiemodel`. Bovendien wordt een `owl:imports` relatie gelegd tussen de package van het type informatiemodel en deze view-package, EN er wordt een `owl:imports` gelegd van de view-package naar een externe locatie, op basis van de locatie bij deze view package.

De gedachte hieracter, is dat een view package deels is overgenomen vanuit een extern model. Er zijn aanpassingen gedaan aan de structuur, maar niet aan de betekenis. Dit betekent dat er een "imports" relatie loopt van de domein-package naar de view-package, en vervolgens vanuit de view-package naar de externe package (die hier verder niet is opgenomen).

Deze constructie heeft ook consequenties voor de URI's van de modelelementen in deze view package. URI's van shapes (Nodeshapes en Propertyshapes) krijgen als namespace de de basis- URI van het eigen informatiemodel (dit gaat immers om de structuur en is lokaal gedefinieerd in relatie tot de domein-package). URI's van classes en properties krijgen als namespace de basis-URI van het model waar de view van is gemaakt, waarbij -net als bij `mim:Extern`- dit de namespace zal zijn van het externe model.

## Overig

### Transformatie: Constraint
> Een <a>Constraint</a> is een conditie of een beperking, die over een of meerdere modelelementen uit het informatiemodel geldt.

Een Constraint (en bijbehorende gegevens) worden direct overgenomen in het vertaalde model als blank node. Het MIM kent voor een Constraint twee aspecten: tekstueel en formeel. Het MIM doet daarbij geen uitspraak over de taal die voor het formele model moet worden gehanteerd. Daarmee is een transformatie niet op zijn plaats. Zie ook de [INSPIRE RDF Guidelines](http://inspire-eu-rdf.github.io/inspire-rdf-guidelines/#ref_cr_constraint) waar een vergelijkbare redenatie wordt gevolgd.

<pre class='ex-sparql'>
CONSTRUCT {
  ?subject mim:constraint ?constraint.
  ?constraint ?prop ?obj.
}
WHERE {
  ?modelelement mim:constraint ?constraint.
  ?subject mim:equivalent ?modelelement.
  ?constraint ?prop ?obj.
}
</pre>

## Properties

### transformatie: naam

> De naam van een modelelement

Een `mim:naam` wordt vertaald naar een `rdfs:label`.

<aside id='trans-11' class='note'>
Het MIM geeft de mogelijkheid voor naamgevingsconventies. Zie MIM [Naamgevingsconventies](#afspraken-rondom-naamgeving-en-definities). Dit is op dit moment niet in het MIM zelf als gestructureerd aspect beschikbaar. Voor een RDF model wordt uitgegaan dat de `mim:naam` de voor mensen leesbare naam bevat. Hier wordt dus **geen** technische naam verondersteld en dit veld mag dus ook spaties bevatten.
</aside>

<aside id='trans-12' class='note'>
Het MIM in Linked Data ondersteunt, zoals elk Linked Data model, de mogelijkheid om specifiek een taal aan te geven. Indien een taal aanwezig is, dan wordt dit veld overgenomen. Ook kent het MIM de mogelijkheid om expliciet een taal op het niveau van een package aan te geven. Dit is mede gedaan omdat in UML het niet zo eenvoudig is om een taal per aspect aan te geven. Indien er in een MIM model geen taal is aangegeven, dan wordt deze taal op package niveau gebruikt op elke plek waar een aspect een string is en geen expliciete taalvermelding heeft.
</aside>

<pre class='ex-sparql'>
CONSTRUCT {
  ?subject rdfs:label ?naam
}
WHERE {
  ?modelelement mim:naam ?naam.
  ?subject mim:equivalent ?modelelement.
}
</pre>

### transformatie: alias

> De alternatieve weergave van de naam.

Een `mim:alias` wordt direct, zonder aanpassing, overgenomen in het vertaalde model.

<aside id='trans-13' class='note'>
Het MIM geeft de mogelijkheid voor naamgevingsconventies. Zie MIM [Naamgevingsconventies](#afspraken-rondom-naamgeving-en-definities). Dit is op dit moment niet in het MIM zelf als gestructureerd aspect beschikbaar. Om te voorkomen dat we bij de transformatie onnodige interpretatie doen van de betekenis van mim:alias nemen we dit veld as-is over.
</aside>

<pre class='ex-sparql'>
CONSTRUCT {
  ?subject mim:alias ?alias
}
WHERE {
  ?modelelement mim:alias ?alias.
  ?subject mim:equivalent ?modelelement.
}
</pre>

### transformatie: begrip

> Verwijzing naar een begrip, vanuit een modelelement, waarmee wordt aangegeven op welk begrip, of begrippen, het informatiemodel element is gebaseerd.

Een `mim:begrip` wordt vertaald naar een `dct:subject`

<pre class='ex-sparql'>
CONSTRUCT {
  ?subject dct:subject ?begrip
}
WHERE {
  ?modelelement mim:begrip ?begrip.
  ?subject mim:equivalent ?modelelement
}
</pre>

### transformatie: begripsterm

> Verwijzing naar een begrip in de vorm van de term, vanuit een modelelement, waarmee wordt aangegeven op welk begrip, of begrippen, het informatiemodel element is gebaseerd.

Een `mim:begripsterm` wordt één op één overgenomen. Het heeft de voorkeur om geen gebruik te maken van dit aspect, maar om gebruik te maken van het aspect `mim:begrip`, waarmee een directe verwijzing kan worden gemaakt naar het begrip zelf.

<pre class='ex-sparql'>
CONSTRUCT {
  ?subject mim:begripsterm ?begripsterm
}
WHERE {
  ?modelelement mim:begripsterm ?begripsterm.
  ?subject mim:equivalent ?modelelement
}
</pre>

### transformatie: definitie

> De beschrijving van de betekenis van dit modelelement.

Een `mim:definitie` wordt vertaald naar een `rdfs:comment`

Rationale om niet te kiezen voor `skos:definition`: in de meeste Linked Data vocabulaires is het gebruikelijk om de beschrijving van een klasse op te nemen door middel van een `rdfs:comment`, wat ook de intentie is in het MIM. Het MIM is niet beoogd als een volledig begrippenkader. Het MIM biedt daarnaast de mogelijkheid om expliciet te verwijzen vanuit een modelelement naar een `skos:Concept`. Het ligt dan ook voor de hand om bij dit `skos:Concept` de werkelijke `skos:definition` op te nemen.

### transformatie: toelichting

> Een inhoudelijke toelichting op de definitie, ter verheldering of nadere duiding.

Een `mim:toelichting` wordt direct, zonder aanpassing, overgenomen in het vertaalde model.

*Aanbevolen wordt om geen gebruik te maken van mim:toelichting, maar gebruik te maken van de verwijzing naar expliciet gedefinieerde begrippen, waarbij de toelichting bij het begrip zelf wordt opgenomen*.

<pre class='ex-sparql'>
CONSTRUCT {
  ?subject mim:toelichting ?toelichting
}
WHERE {
  ?modelelement mim:toelichting ?toelichting.
  ?subject mim:equivalent ?modelelement.
}
</pre>

### transformatie: herkomst

> De registratie of het informatiemodel waaraan het modelelement ontleend is dan wel de eigen organisatie indien het door de eigen organisatie toegevoegd is.

Een `mim:herkomst` wordt direct, zonder aanpassing, overgenomen in het vertaalde model.

<pre class='ex-sparql'>
CONSTRUCT {
  ?subject mim:herkomst ?herkomst
}
WHERE {
  ?modelelement mim:herkomst ?herkomst.
  ?subject mim:equivalent ?modelelement.
}
</pre>

### transformatie: herkomst definitie

> De registratie of het informatiemodel waaruit de definitie is overgenomen dan wel een aanduiding die aangeeft uit welke bronnen de definitie is samengesteld.

Een `mim:herkomstDefinitie` wordt direct, zonder aanpassing, overgenomen in het vertaalde model.

*Aanbevolen wordt om geen gebruik te maken van mim:herkomstDefinitie, maar gebruik te maken van de verwijzing naar expliciet gedefinieerde begrippen, waarbij de herkomst van de definitie bij het begrip zelf wordt opgenomen*.

<pre class='ex-sparql'>
CONSTRUCT {
  ?subject mim:herkomstDefinitie ?herkomstdefinitie
}
WHERE {
  ?modelelement mim:herkomstDefinitie ?herkomstdefinitie.
  ?subject mim:equivalent ?modelelement.
}
</pre>

### transformatie: datum opname

> De datum waarop het modelelement is opgenomen in het informatiemodel.

Een `mim:datumOpname` wordt direct, zonder aanpassing, overgenomen in het vertaalde model.

<pre class='ex-sparql'>
CONSTRUCT {
  ?subject mim:datumOpname ?datumopname
}
WHERE {
  ?modelelement mim:datumOpname ?datumopname.
  ?subject mim:equivalent ?modelelement.
}
</pre>

### transformatie: indicatie materiële historie

> Indicatie of de materiële historie van het kenmerk van het object te bevragen is.

Een `mim:indicatieMaterieleHistorie` wordt direct, zonder aanpassing, overgenomen in het vertaalde model.

<pre class='ex-sparql'>
CONSTRUCT {
  ?subject mim:indicatieMaterieleHistorie ?indicatiematerielehistorie
}
WHERE {
  ?modelelement mim:indicatieMaterieleHistorie ?indicatiematerielehistorie.
  ?subject mim:equivalent ?modelelement.
}
</pre>

<aside id='trans-99' class='note'>
In Linked Data zal een indicatie materiële historie altijd betekenen dat er een constructie wordt gerealiseerd waarbij de eigenschappen
die betrekking hebben op de historie van het objecttype (zoals geldigheidsperiode, bron, herkomst) onderscheiden zijn van de
eigenschappen van het objecttype zelf. Deze constructie is toegelicht in [NEN3610 Linked Data](https://geonovum.github.io/NEN3610-Linkeddata/#regels-attributen-materieleHistorie). Hoewel het denkbaar is om een dergelijke vertaling al direct mee te nemen bij het
vertalen van het metagegeven "indicatie materiële historie" is hier niet voor gekozen, omdat een dergelijke vertaling ook met zich
meebrengt dat zichtbaar is gemaakt welke eigenschappen behoren tot het objecttype en welke eigenschappen tot de historie van het objecttype. Beter zou zijn als een dergelijk onderscheid al direct in het model is opgenomen.
</aside>

### transformatie: indicatie formele historie

> Indicatie of de formele historie van het kenmerk van het object bijgehouden wordt en te bevragen is.

Een `mim:indicatieFormeleHistorie` wordt direct, zonder aanpassing, overgenomen in het vertaalde model.

<pre class='ex-sparql'>
CONSTRUCT {
  ?subject mim:indicatieFormeleHistorie ?indicatieformelehistorie
}
WHERE {
  ?modelelement mim:indicatieFormeleHistorie ?indicatieformelehistorie.
  ?subject mim:equivalent ?modelelement.
}
</pre>

<aside id='trans-100' class='note'>
In Linked Data zal een indicatie formele historie altijd betekenen dat er een constructie wordt gerealiseerd waarbij de eigenschappen
die betrekking hebben op de historie van het objecttype (zoals geldigheidsperiode, bron, herkomst) onderscheiden zijn van de
eigenschappen van het objecttype zelf. Deze constructie is toegelicht in [NEN3610 Linked Data](https://geonovum.github.io/NEN3610-Linkeddata/#regels-attributen-formeleHistorie). Hoewel het denkbaar is om een dergelijke vertaling al direct mee te nemen bij het
vertalen van het metagegeven "indicatie formele historie" is hier niet voor gekozen, omdat een dergelijke vertaling ook met zich
meebrengt dat zichtbaar is gemaakt welke eigenschappen behoren tot het objecttype en welke eigenschappen tot de historie van het objecttype. Beter zou zijn als een dergelijk onderscheid al direct in het model is opgenomen.
</aside>

### transformatie: kardinaliteit

De `mim:kardinaliteit` wordt vertaald naar `sh:minCount` en `sh:maxCount`. Daarbij wordt de volgende tabel gebruikt om de string-waarde van mim:kardinaliteit om te zetten. Een `-` betekent dat de betreffende triple niet wordt opgenomen in het model.

Daarnaast wordt `min:kardinaliteit` ook direct overgenomen in het vertaalde model. De reden hiervoor is tweeledig. Enerzijds maakt het daarmee eenvoudiger om de originele kardinaliteit weer te geven. Voor niet-SHACL experts kan het verwarrend zijn dat het ontbreken van zowel sh:minCount als sh:maxCount betekent dat sprake is van een 0..* kardinaliteit. Anderzijds maakt het de terugvertaling in geval van een `min:mogelijkGeenWaarde` mogelijk, aangezien dit veld invloed kan hebben op de sh:minCount (zie ook [mogelijk-geen-waarde](#mogelijk-geen-waarde)).

|mim:kardinaliteit|sh:minCount|sh:maxCount|
|-----------------|-----------|-----------|
|1|1|1|
|*|-|-|
|0..1|-|1|
|0..*|-|-|
|1..1|1|1|
|1..*|1|-|
|a..z|a|z|

In de laatste regel moet voor a en z een geheel getal vanaf 1 worden gelezen.

<pre class='ex-sparql'>
CONSTRUCT {
  ?propertyshape sh:minCount ?mincount.
}
WHERE {
  ?modelelement mim:kardinaliteit ?kardinaliteit.
  ?modelelement mim:mogelijkGeenWaarde ?mogelijkgeenwaarde.
  ?propertyshape mim:equivalent ?modelelement.
  BIND (t:mincount(?kardinaliteit) as ?mincount)
  FILTER(NOT(?mogelijkgeenwaarde))
}

CONSTRUCT {
  ?propertyshape sh:maxCount ?maxcount.
}
WHERE {
  ?modelelement mim:kardinaliteit ?kardinaliteit.
  ?propertyshape mim:equivalent ?modelelement.
  BIND (t:maxcount(?kardinaliteit) as ?maxcount)
}
</pre>

### transformatie: authentiek
> Aanduiding of het kenmerk een authentiek gegeven betreft.

Een `mim:authentiek` wordt direct, zonder aanpassing, overgenomen in het vertaalde model.

<pre class='ex-sparql'>
CONSTRUCT {
  ?subject mim:authentiek ?authentiek
}
WHERE {
  ?modelelement mim:authentiek ?authentiek.
  ?subject mim:equivalent ?modelelement.
}
</pre>

### transformatie: indicatie afleidbaar
> Aanduiding dat gegeven afleidbaar is uit andere attribuut- en/of relatiesoorten.

Een `mim:indicatieAfleidbaar` wordt direct, zonder aanpassing, overgenomen in het vertaalde model.

<pre class='ex-sparql'>
CONSTRUCT {
  ?subject mim:indicatieAfleidbaar ?indicatieafleidbaar
}
WHERE {
  ?modelelement mim:indicatieAfleidbaar ?indicatieafleidbaar.
  ?subject mim:equivalent ?modelelement.
}
</pre>

### transformatie: mogelijk geen waarde
> Aanduiding dat van een aspect geen waarde is geregistreerd, maar dat onduidelijk is of de waarde er werkelijk ook niet is.

Een `mim:mogelijkGeenWaarde` wordt direct, zonder aanpassing, overgenomen in het vertaalde model, waarbij in een enkel geval een aanpassing wordt gedaan aan de manier waarop `mim:kardinaliteit` wordt getransformeerd.

Linked Data gaat in beginsel uit van een "open word assumptie". Dit houdt onder andere in dat Linked Data er van uitgaat dat elk aspect mogelijk geen waarde kan hebben. Met SHACL kan deze assumptie worden beperkt. Zo zal bij een verplicht veld (zoals kardinaliteit 1..* of 1..1) daadwerkelijk ook een waarde aanwezig moeten zijn. Het MIM gaat in beginsel  uit van een "closed world assumptie", het veld `mim:mogelijkGeenWaarde` is juist bedoeld om deze assumptie te verruimen. Doordat het veld `mim:mogelijkGeenWaarde` altijd een waarde heeft ("Ja" of "Nee"), kan het veld ook worden gelezen als *als de waarde in de werkelijkheid bestaat, dan is deze ook aanwezig*. Dit maakt dat het veld `mim:mogelijkGeenWaarde` feitelijk in de context van Linked Data het model in vele gevallen een gesloten model maakt, vandaar ook het gebruik van SHACL waarmee we deze beperkingen kunnen opleggen. Indien sprake is van een "mogelijk geen waarde" dan is het wel noodzakelijk om de transformatieregel voor `mim:kardinaliteit` aan te passen, conform onderstaande tabel:

| mim:mogelijkGeenWaarde | mim:kardinaliteit |Aanpassing             |
|------------------------|-------------------|-----------------------|
| Nee                    | 0..x              |geen                   |
| Nee                    | 1..x              |geen                   |
| Ja                     | 0..x              |geen                   |
| Ja                     | 1..x              |sh:minCount verwijderd |
| Ja                     | n..x (met n>1)    |sh:minCount verwijderd |

"sh:minCount verwijderd" houdt in dat de kardinaliteit 0..x wordt. Deze aanpassing is opgenomen in de transformatieregel van [[[#transformatie-kardinaliteit]]].

Zie ook het NEN3610 Linked Data Profiel [7.3.4.2.3 Attribuut met stereotype «voidable»](https://geonovum.github.io/NEN3610-Linkeddata/#regels-attributen-voidable) voor meer achtergrondinformatie.

<pre class='ex-sparql'>
CONSTRUCT {
  ?subject mim:mogelijkGeenWaarde ?mogelijkgeenwaarde
}
WHERE {
  ?modelelement mim:mogelijkGeenWaarde ?mogelijkgeenwaarde.
  ?subject mim:equivalent ?modelelement.
}
</pre>

### transformatie: locatie
> Als het type van het attribuutsoort een waardelijst is, dan wordt hier de locatie waar deze te vinden is opgegeven.

Een `mim:locatie` wordt direct, zonder aanpassing, overgenomen in het vertaalde model. Daarnaast wordt dit veld gebruikt bij het achterhalen van de inhoud van een waardelijst.

### transformatie: type
> Het datatype waarmee waarden van deze attribuutsoort worden vastgelegd.

De vertaling van een `mim:type` hangt af van de vertaling van het datatype waar naar wordt verwezen:

- Voor primitieve datatypen wordt vertaald naar een `sh:datatype`;
- Voor gestructureerde datatypen wordt vertaald naar een `sh:node`;
- Voor een enumeratie wordt vertaald naar een `sh:node`;
- Voor een referentielijst wordt vertaald naar een `sh:node`;
- Voor een codelijst wordt vertaald naar een `sh:node`;
- Voor een keuze wordt de vertaling opgepakt bij de transformatieregel van keuze zelf (zie:[[[#transformatie-keuze]]]);
- In geval van zelfgespecificeerde datatypen wordt vertaald conform het betreffende supertype.

<pre class='ex-sparql'>
CONSTRUCT {
  ?subject sh:datatype ?datatype
}
WHERE {
  ?modelelement mim:type ?type.
  ?type rdfs:subClassOf*/rdf:type mim:PrimitiefDatatype.
  ?subject mim:equivalent ?modelelement.
  ?datatype mim:equivalent ?type.
}

CONSTRUCT {
  ?subject sh:node ?datatype
}
WHERE {
  ?modelelement mim:type ?type.
  ?type rdfs:subClassOf*/rdf:type ?mimtype.
  ?subject mim:equivalent ?modelelement.
  ?subject a sh:NodeShape.
  ?datatype mim:equivalent ?type.
  FILTER (?mimtype = mim:GestructureerdDatatype
       || ?mimtype = mim:Enumeratie
       || ?mimtype = mim:Referentielijst
       || ?mimtype = mim:Codelijst
  )
}
</pre>

### transformatie: lengte
> De aanduiding van de lengte van een gegeven, in de vorm van de aangegeven notatiewijze.

Afhankelijk van de notatiewijze vindt de transformatie plaats. Deze transformatie is niet van toepassing op het gebruik van lengte voor getallen (aantal cijfers voor- en/of na de komma).

Een `mim:lengte` wordt vertaald naar `sh:minLength` en/of `sh:maxLength`, conform onderstaande tabel.

|Notatiewijze|sh:minLength|sh:maxLength|Betekenis|
|------------|------------|------------|---------|
|1|1|1|De lengte is exact 1 karakter|
|..99||99|De lengte is maximaal 99 karakters, geen minimum aangegeven|
|1..|1||De lengte is minimaal 1 karakter, geen maximum aangegeven|
|1..99|1|99|De lengte is minimaal 1 karakter en maximaal 99 karakters|

<pre class='ex-sparql'>
CONSTRUCT {
  ?subject sh:minLength ?minlength
}
WHERE {
  ?modelelement mim:lengte ?lengte.
  ?subject mim:equivalent ?modelelement.
  BIND (t:mincount(?lengte) as ?minlength)
}

CONSTRUCT {
  ?subject sh:maxLength ?maxlength
}
WHERE {
  ?modelelement mim:lengte ?lengte.
  ?subject mim:equivalent ?modelelement.
  BIND (t:maxcount(?lengte) as ?maxlength)
}
</pre>

### transformatie: patroon
> De verzameling van waarden die gegevens van deze attribuutsoort kunnen hebben, oftewel het waardenbereik, uitgedrukt in een specifieke structuur.

De structuur van `mim:patroon` is in woorden beschreven. Deze wordt direct, zonder aanpassing, overgenomen in het vertaalde model.

<pre class='ex-sparql'>
CONSTRUCT {
  ?subject mim:patroon ?patroon
}
WHERE {
  ?modelelement mim:patroon ?patroon.
  ?subject mim:equivalent ?modelelement.
}
</pre>

### transformatie: formeel patroon
> Zoals patroon, formeel vastgelegd, uitgedrukt in een formele taal die door de computer wordt herkend.

`mim:formeelPatroon` wordt beschreven met `sh:pattern`.

<aside id='trans-14' class='note'>
Het MIM stelt dat het formeelPatroon door de computer moet worden herkend, zonder specifiek te zijn op welke manier. In het geval van een MIM in Linked Data model wordt uitgegaan dat hier sprake is van een reguliere expressie.
</aside>

<pre class='ex-sparql'>
CONSTRUCT {
  ?subject sh:pattern ?formeelpatroon
}
WHERE {
  ?modelelement mim:formeelPatroon ?formeelpatroon.
  ?subject mim:equivalent ?modelelement.
}
</pre>

### transformatie: unieke aanduiding
> Voor objecttypen die deel uitmaken van een (basis)registratie of informatiemodel betreft dit de wijze waarop daarin voorkomende objecten (van dit type) uniek in de registratie worden aangeduid.

Een `mim:uniekeAanduiding` wordt direct, zonder aanpassing, overgenomen in het vertaalde model.

<pre class='ex-sparql'>
CONSTRUCT {
  ?subject mim:uniekeAanduiding ?uniekeaanduiding
}
WHERE {
  ?modelelement mim:uniekeAanduiding ?uniekeaanduiding.
  ?subject mim:equivalent ?modelelement.
}
</pre>

### transformatie: populatie
> Voor objecttypen die deel uitmaken van een (basis)registratie betreft dit de beschrijving van de exemplaren van het gedefinieerde objecttype die in de desbetreffende (basis)­registratie voorhanden zijn.

Een `mim:populatie` wordt direct, zonder aanpassing, overgenomen in het vertaalde model.

<pre class='ex-sparql'>
CONSTRUCT {
  ?subject mim:populatie ?populatie
}
WHERE {
  ?modelelement mim:populatie ?populatie.
  ?subject mim:equivalent ?modelelement.
}
</pre>

### transformatie: kwaliteit
> Beschrijving van de mate waarin in de registratie opgenomen objecten van het desbetreffende type volledig, juist, actueel, nauwkeurig en betrouwbaar zijn.

Een `mim:kwaliteit` wordt direct, zonder aanpassing, overgenomen in het vertaalde model.

<pre class='ex-sparql'>
CONSTRUCT {
  ?subject mim:kwaliteit ?kwaliteit
}
WHERE {
  ?modelelement mim:kwaliteit ?kwaliteit.
  ?subject mim:equivalent ?modelelement.
}
</pre>

### transformatie: indicatie abstract object
> Indicatie dat het objecttype een generalisatie is, waarvan een object als specialisatie altijd voorkomt in de hoedanigheid van één (en slechts één) van de specialisaties van het betreffende objecttype.

In een MIM conform informatiemodel kunnen zowel abstracte als concrete klassen voorkomen. In UML kun je daarvan afleiden dat je geen instanties mag hebben van abstracte klassen, maar alleen van concrete klassen. In RDF wordt geen onderscheid gemaakt tussen het abstract of concreet zijn van klassen. In RDF worden klassen beschouwd als sets van dingen. Als je een set kunt beschrijven, dan kunnen er ook dingen zijn die tot die set behoren.

Wel kun je aangeven dat indien er sprake is van een triple `<subject> rdf:type <abstract-class>` er minimaal óók een tweede triple moet zijn `<subject> rdf:type <non-abstract-class>`

Een `mim:indicatieAbstractObject` wordt aanvullend direct, zonder aanpassing, overgenomen in het vertaalde model.

<pre class='ex-sparql'>
CONSTRUCT {
  ?subject mim:indicatieAbstractObject ?indicatieabstractobject.
  ?subject sh:propertyShape [
    sh:path rdf:type;
    sh:minCount 2
  ]
}
WHERE {
  ?modelelement mim:indicatieAbstractObject ?indicatieabstractobject.
  ?subject mim:equivalent ?modelelement.
}
</pre>

### transformatie: identificerend
> Een kenmerk van een objecttype die aangeeft of deze eigenschap uniek identificerend is voor alle objecten in de populatie van objecten van dit objecttype.

Een `mim:identificerend` wordt direct, zonder aanpassing, overgenomen in het vertaalde model.

<pre class='ex-sparql'>
CONSTRUCT {
  ?subject mim:identificerend ?identificerend
}
WHERE {
  ?modelelement mim:identificerend ?identificerend.
  ?subject mim:equivalent ?modelelement.
}
</pre>

### transformatie: gegevensgroeptype (eigenschap)

> De verwijzing naar het bijbehorende gegevensgroeptype.

Een `mim:gegevensgroeptype` wordt vertaald naar een `sh:class` met als waarde de URI van de class die het bijbehorende gegevensgroeptype representeert. Zie [Gegevensgroep](#gegevensgroep) en [Gegevensgroeptype](#gegevensgroeptype) voor meer uitleg.

<pre class='ex-sparql'>
CONSTRUCT {
  ?subject sh:class ?object
}
WHERE {
  ?modelelement mim:gegevensgroeptype ?gegevensgroeptype.
  ?subject mim:equivalent ?modelelement.
  ?subject a sh:NodeShape.
  ?object mim:equivalent ?gegevensgroeptype.
  ?object a owl:Class.
}
</pre>

### transformatie: unidirectioneel

In Linked Data is een relatiesoort feitelijk automatisch unidirectioneel, tenzij aanvullende maatregelen worden genomen waardoor de
relatiesoort vanuit twee kanten kan worden bekeken. Dit betekent dat de vertaling van unidirectioneel juist wordt opgepakt op het
moment dat *niet* sprake is van unidirectioneel (de waarde van het metakenmerk is *false*).

Indien sprake is van geen unidirectionaliteit, dan wordt een `owl:inverseOf` relatie gelegd tussen de relatierol die aan de bron-kant van de relatiesoort ligt en de relatierol die aan de doel-kant van de relatiesoort ligt. Merk op dat "unidirectioneel" alleen betekenis heeft als zowel de doel als bron kant van de relatiesoort zijn beschreven als relatierollen. Anders is de relatiesoort per definitie unidirectioneel vanuit het perspectief van Linked Data.

<pre class='ex-sparql'>
CONSTRUCT {
  ?doel sh:inverseOf ?bron.
  ?bron sh:inverseOf ?doel.
}
WHERE {
  ?relatiesoort mim:relatierol ?relatierolbron.
  ?relatiesoort mim:relatierol ?relatieroldoel.
  ?relatiesoort mim:unidirectioneel false .
  ?relatierolbron a mim:RelatierolDoel.
  ?relatieroldoel a mim:RelatierolDoel.
  ?doel mim:equivalent ?relatieroldoel.
  ?bron mim:equivalent ?relatierolbron.
}
</pre>

### transformatie: bron
> Aanduiding van het bronobject in een relatie tussen objecten. Een bronoject heeft middels een relatiesoort een relatie met een doelobject.

Een `mim:bron` wordt vertaald naar een `sh:property` die hoort bij de de NodeShape van het objecttype. Zie voor meer informatie over hoe relaties tussen objecttypen worden vertaald de paragrafen [Relatiesoort](#relatiesoort) en [Externe koppeling](#externe-koppeling).

<pre class='ex-sparql'>
CONSTRUCT {
  ?objecttype sh:property ?modelelement
}
WHERE {
  ?modelelement mim:bron ?objecttype.
  ?subject mim:equivalent ?modelelement.
  ?object mim:equivalent ?objecttype.
}
</pre>

### transformatie: doel
> Aanduiding van het gerelateerde objecttype die het eindpunt van de relatie aangeeft. Naar objecten van dit objecttype wordt verwezen.

Een `mim:doel` wordt vertaald naar een `sh:class` met als waarde de URI van de Class die het gerelateerde objecttype representeert. Zie voor meer informatie over hoe relaties tussen objecttypen worden vertaald de paragrafen [Relatiesoort](#relatiesoort) en [Externe koppeling](#externe-koppeling).

<pre class='ex-sparql'>
CONSTRUCT {
  ?subject sh:class ?object
}
WHERE {
  ?modelelement mim:doel ?gerelateerdobjecttype.
  ?subject mim:equivalent ?modelelement.
  ?object mim:equivalent ?gerelateerdobjecttype.
}
</pre>

### transformatie: aggregatietype
> Aanduiding of het objecttype die de eigenaar is van een relatie het doel van relatie ziet als een samen te voegen onderdeel.

Aggregatie- en compositie-associaties worden gemodelleerd zoals simpele relatiesoorten, gebruikmakend van de specifieke naam die de associatie in het oorspronkelijke model heeft. Een `mim:aggregatietype` wordt direct, zonder aanpassing, overgenomen in het vertaalde model.

<pre class='ex-sparql'>
CONSTRUCT {
  ?subject mim:aggregatietype ?aggregatietype
}
WHERE {
  ?modelelement mim:aggregatietype ?aggregatietype.
  ?subject mim:equivalent ?modelelement.
}
</pre>

### transformatie: code
> De in een registratie of informatiemodel aan de enumeratiewaarde toegekend unieke code (niet te verwarren met alias, zoals bedoeld in 2.6.1).

Een `mim:code` wordt vertaald naar een `skos:notation`.

<pre class='ex-sparql'>
CONSTRUCT {
  ?subject skos:notation ?notation
}
WHERE {
  ?modelelement mim:code ?notation.
  ?subject mim:equivalent ?modelelement
}
</pre>

### transformatie: specificatie-tekst
> De specificatie van de constraint in normale tekst.

Een `mim:specificatieTekst` wordt direct, zonder aanpassing, overgenomen in het vertaalde model, als onderdeel van de [transformatieregel voor constraints](#constraint).

<pre class='ex-sparql'>
CONSTRUCT {
  ?subject skos:specificatieTekst ?specificatietekst
}
WHERE {
  ?modelelement mim:specificatieTekst ?specificatietekst.
  ?subject mim:equivalent ?modelelement
}
</pre>

### transformatie: specificatie-formeel
> De beschrijving van de constraint in een formele specificatietaal, in OCL.

Een `mim:specificatieFormeel` wordt direct, zonder aanpassing, overgenomen in het vertaalde model, als onderdeel van de [transformatieregel voor constraints](#constraint).

<pre class='ex-sparql'>
CONSTRUCT {
  ?subject skos:specificatieFormeel ?specificatieformeel
}
WHERE {
  ?modelelement mim:specificatieFormeel ?specificatieformeel.
  ?subject mim:equivalent ?modelelement
}
</pre>

### transformatie: attribuut

Een `mim:attribuut` wordt vertaald naar een `sh:property` die hoort bij de de NodeShape van de bezitter van het attribuut. Zie ook [Attribuutsoort](#attribuutsoort).

<pre class='ex-sparql'>
CONSTRUCT {
  ?nodeshape sh:property ?propertyshape
}
WHERE {
  ?modelelement mim:attribuut ?attribuutsoort.
  ?nodeshape mim:equivalent ?modelelement.
  ?nodeshape a sh:NodeShape.
  ?propertyshape mim:equivalent ?attribuutsoort.
  ?propertyshape a sh:PropertyShape.

}
</pre>

### transformatie: gegevensgroep (eigenschap)

Een `mim:gegevensgroep` wordt vertaald naar een `sh:property` die hoort bij de de NodeShape van de bezitter van het attribuut. Zie ook [Gegevensgroep](#gegevensgroep).

<pre class='ex-sparql'>
CONSTRUCT {
  ?nodeshape sh:property ?propertyshape
}
WHERE {
  ?modelelement mim:gegevensgroep ?gegevensgroep.
  ?nodeshape mim:equivalent ?modelelement.
  ?nodeshape a sh:NodeShape.
  ?propertyshape mim:equivalent ?gegevensgroep.
  ?propertyshape a sh:PropertyShape.

}
</pre>

### transformatie: indicatie classificerend

Een `mim:indicatieClassificerend` kent een complexe vertaling. De betekenis van dit veld is dat dit veld een waardelijst kent, waarbij de waarden zelf feitelijk als subklassen gezien moeten worden van het objecttype waartoe het attribuutsoort hoort die deze indicatie heeft.

De vertaling hieronder gaat er vanuit dat sprake is van een enumeratie. In geval van een referentielijst dan geldt een vergelijkbare constructie. Echter, omdat bij een referentielijst de waarden zelf niet onderdeel zijn van het model, kan niet met zekerheid wordt gesteld dat alle gegevens aanwezig zijn voor een vertaling.

Bij de vertaling worden de `mim:Enumeratiewaarden` omgezet naar een `owl:Class`, waarbij een `rdfs:subClassOf` relatie wordt gelegd tussen deze klasse en de `owl:Class` die het equivalent is van het `mim:Objecttype` dat bij de `mim:Attribuutsoort` hoort met de indicatie classificerend.

Aangezien de overige metagegevens getransformeerd worden op basis van de `mim:equivalent` relatie, is het van belang dat onderstaande transformatie wordt uitgevoerd vóór de transformatie van de overige metakenmerken, maar ná de transformatie van de metaklassen.

<pre class='ex-sparql'>
CONSTRUCT {
  ?class a owl:Class.
  ?class rdfs:subClassOf ?superclass.
  ?class mim:equivalent ?enumeratiewaarde.
}
WHERE {
  ?objecttype mim:attribuut ?attribuutsoort.
  ?objecttype mim:equivalent ?superclass.
  ?superclass a owl:Class.
  ?attribuutsoort mim:indicatieClassificerend true .
  ?attribuutsoort mim:type ?enumeratie.
  ?enumeratie mim:waarde ?enumeratiewaarde.
  {
    {
      ?enumeratiewaarde mim:naam ?notation
      FILTER NOT EXISTS {?enumeratiewaarde mim:code ?nocode}
    }
    UNION
    {
      ?enumeratiewaarde mim:code ?notation
    }
  }
  BIND (t:uri(?notation) as ?class)
}
</pre>

### transformatie: bevat modelement

Een `mim:bevatModelelement` wordt vertaald naar een `mim:bevatModelelement`. In geval er sprake is van een owl:Ontology, dan wordt vertaald naar `owl:imports`.

In MIM is het niet nodig om voor alle modelelementen rechtstreeks aan te geven welke package dit modelelement bezit: het is ook mogelijk dat dit via andere modelelementen loopt. Als een rechtstreekse relatie niet aanwezig is, dan wordt deze afgeleide relatie gebruikt.
<pre class='ex-sparql'>
CONSTRUCT {
  ?ontology mim:bevatModelelement ?ontologyelement .
}
WHERE {
  ?package mim:bevatModelement ?modelelement.
  ?package mim:equivalent ?ontology.
  ?modelelement mim:equivalent ?ontologyelement.
  ?ontologyelement a ?type . 
  FILTER (?type != owl:Ontology)
}
CONSTRUCT {
  ?ontology owl:imports ?importontology
}
WHERE {
  ?package mim:bevatModelement ?subpackage.
  ?package mim:equivalent ?ontology.
  ?subpackage mim:equivalent ?importedontology.
  ?importedontology a owl:Ontology.
}
</pre>

### transformatie: is gedefinieerd in

Een `mim:isGedefinieerdIn` wordt vertaald naar een `rdfs:isDefinedBy` voor zover modelelementen vertaald worden naar een owl:Class, owl:DatatypeProperty of owl:ObjectProperty.

In MIM is het niet nodig om voor alle modelelementen rechtstreeks aan te geven welke package het modelelement definieert: meestal is dit namelijk de package die het modelelement bevat. Als een rechtstreekse relatie niet aanwezig is, dan wordt mim:bevatModelelement gebruikt. Merk op dat deze vertaling in de omgekeerde richting is. Als bijvoorbeeld een Domein X modelelement Objecttype Y bevat, dan zal de relatie rdfs:isDefinedBy gaan lopen vanaf de klasse Y naar de Ontology X.

<pre class='ex-sparql'>
CONSTRUCT {
  ?class rdfs:isDefinedBy ?ontology
}
WHERE {
  ?package mim:bevatModelement ?modelelement.
  ?package mim:equivalent ?packageontology.
  ?modelelement mim:equivalent ?class.
  ?class a owl:Class.

  OPTIONAL { ?modelelement mim:isGedefinieerdIn ?setOntology }
  BIND(coalesce(?setOntology, ?packageontology) as ?ontology
}

CONSTRUCT {
  ?property rdfs:isDefinedBy ?ontology
}
WHERE {
  ?package mim:bevatModelement ?eigenaar.
  ?eigenaar ?eigenaarrelatie ?modelelement
  ?package mim:equivalent ?packageontology.
  ?modelelement mim:equivalent ?property.
  FILTER NOT EXISTS {?package mim:bevatModelelement ?modelelement}
  FILTER (?eigenaarrelatie=mim:attribuut
       || ?eigenaarrelatie=mim:dataElement
       || ?eigenaarrelatie=mim:waarde
       || ?eigenaarrelatie=mim:referentieElement
       || ?eigenaarrelatie=mim:constraint)

  OPTIONAL { ?modelelement mim:isGedefinieerdIn ?setOntology }
  BIND(coalesce(?setOntology, ?packageontology) as ?ontology
}

CONSTRUCT {
  ?property rdfs:isDefinedBy ?ontology
}
WHERE {
  ?package mim:bevatModelement ?eigenaar.
  ?modelelement ?eigenaarrelatie ?eigenaar
  ?package mim:equivalent ?packageontology.
  ?modelelement mim:equivalent ?property.
  FILTER NOT EXISTS {?package mim:bevatModelelement ?modelelement}
  FILTER (?eigenaarrelatie=mim:bron
       || ?eigenaarrelatie=mim:subtype)

  OPTIONAL { ?modelelement mim:isGedefinieerdIn ?setOntology }
  BIND(coalesce(?setOntology, ?packageontology) as ?ontology
}
</pre>

### transformatie: minimumwaarde inclusief

> De ondergrens van het waardebereik voor een attribuutsoort of data element getypeerd met een primitief datatype, inclusief die waarde zelf. De minimumwaarde moet van hetzelfde primitieve datatype zijn als het datatype van het modelelement waar het voor geldt.

De `mim:minimumwaardeInclusief ` wordt vertaald naar `sh:minInclusive`. De datatype van de waarde van `sh:minInclusive` wordt afgeleid op basis van het primitief datatype wat het `mim:type` is van het modelelement waarvoor de `mim:minimumwaardeInclusief ` gespecificeerd is.

<pre class='ex-sparql'>
CONSTRUCT {
  ?propertyshape sh:minInclusive ?minInclusive.
}
WHERE {
  ?modelelement mim:minimumwaardeInclusief ?minimumwaardeInclusief .
  ?modelelement mim:type ?datatype .
  ?propertyshape mim:equivalent ?modelelement .
  ?datatype a mim:PrimitiefDatatype .
  bind(t:cast(?minimumwaardeInclusief, ?datatype) as ?minInclusive)
}
</pre>

### transformatie: minimumwaarde exclusief

> De ondergrens van het waardebereik voor een attribuutsoort of data element getypeerd met een primitief datatype, exclusief die waarde zelf. De minimumwaarde moet van hetzelfde primitieve datatype zijn als het datatype van het modelelement waar het voor geldt.

De `mim:minimumwaardeExclusief ` wordt vertaald naar `sh:minExclusive`. De datatype van de waarde van `sh:minExclusive` wordt afgeleid op basis van het primitief datatype wat het `mim:type` is van het modelelement waarvoor de `mim:minimumwaardeExclusief ` gespecificeerd is.

<pre class='ex-sparql'>
CONSTRUCT {
  ?propertyshape sh:minExclusive ?minExclusive.
}
WHERE {
  ?modelelement mim:minimumwaardeExclusief ?minimumwaardeExclusief .
  ?modelelement mim:type ?datatype .
  ?propertyshape mim:equivalent ?modelelement .
  ?datatype a mim:PrimitiefDatatype .
  bind(t:cast(?minimumwaardeExclusief, ?datatype) as ?minExclusive)
}
</pre>

### transformatie: maximumwaarde inclusief

> De bovengrens van het waardebereik voor een attribuutsoort of data element getypeerd met een primitief datatype, inclusief die waarde zelf. De maximumwaarde moet van hetzelfde primitieve datatype zijn als het datatype van het modelelement waar het voor geldt.

De `mim:maximumwaardeInclusief ` wordt vertaald naar `sh:maxInclusive`. De datatype van de waarde van `sh:maxInclusive` wordt afgeleid op basis van het primitief datatype wat het `mim:type` is van het modelelement waarvoor de `mim:maximumwaardeInclusief ` gespecificeerd is.

<pre class='ex-sparql'>
CONSTRUCT {
  ?propertyshape sh:maxInclusive ?maxInclusive.
}
WHERE {
  ?modelelement mim:maximumwaardeInclusief ?maximumwaardeInclusief .
  ?modelelement mim:type ?datatype .
  ?propertyshape mim:equivalent ?modelelement .
  ?datatype a mim:PrimitiefDatatype .
  bind(t:cast(?maximumwaardeInclusief, ?datatype) as ?maxInclusive)
}
</pre>

### transformatie: maximumwaarde exclusief

> De bovengrens van het waardebereik voor een attribuutsoort of data element getypeerd met een primitief datatype, exclusief die waarde zelf. De maximumwaarde moet van hetzelfde primitieve datatype zijn als het datatype van het modelelement waar het voor geldt.

De `mim:maximumwaardeExclusief ` wordt vertaald naar `sh:maxExclusive`. De datatype van de waarde van `sh:maxExclusive` wordt afgeleid op basis van het primitief datatype wat het `mim:type` is van het modelelement waarvoor de `mim:maximumwaardeExclusief ` gespecificeerd is.

<pre class='ex-sparql'>
CONSTRUCT {
  ?propertyshape sh:maxExclusive ?maxExclusive.
}
WHERE {
  ?modelelement mim:maximumwaardeExclusief ?maximumwaardeExclusief .
  ?modelelement mim:type ?datatype .
  ?propertyshape mim:equivalent ?modelelement .
  ?datatype a mim:PrimitiefDatatype .
  bind(t:cast(?maximumwaardeExclusief, ?datatype) as ?maxExclusive)
}
</pre>

### transformatie: mixin

> Metagegeven om bij een generalisatie aan te geven dat bij een implementatie die geen multiple inheritance ondersteunt de eigenschappen van de superklasse worden overgenomen door de subklasse. De superklasse zelf komt niet in de implementatie voor.

Een `mim:mixin` wordt direct, zonder aanpassing, overgenomen in het vertaalde model.

<pre class='ex-sparql'>
CONSTRUCT {
  ?subject mim:mixin ?mixin
}
WHERE {
  ?modelelement mim:mixin ?mixin.
  ?subject mim:equivalent ?modelelement.
}
</pre>

## Transformatie vanuit RDFS/OWL/SHACL

Een Linked Data model dat is uitgedrukt in RDFS/OWL/SHACL kan gelezen worden als een MIM model. Hiervoor dient het model wel eerste getransformeerd te worden naar de MIM vocabulaire. Vervolgens dient het resultaat te voldoen aan de minimale eisen die worden gesteld aan een MIM vocabulaire.

Onderstaande tabellen geeft een overzicht van de wijze waarop de vertaling plaatsvindt. Naast deze tabel is ook een set van SPARQL statement beschikbaar gesteld (zie: [rdf2mim.sparql](media/rdf2mim.sparql)) waarmee de transformatie automatisch kan worden uitgevoerd.

|RDFS term | MIM-klasse | Uitleg |
|----------|-------------|--------|
| sh:NodeShape met sh:targetClass | mim:Objecttype | Een nodeshape met een targetClass verwijst naar zowel de structuur als de betekenis, zoals ook bij een objecttype |
| sh:NodeShape zonder sh:targetClass | mim:GestructureerdDatatype | Een nodeshape zonder targetClass is enkel een structuur, dwz: een gestructureerd datatype |
| sh:PropertyShape met sh:datatype | mim:Attribuutsoort | Een propertyshape met een datatype betreft een attribuutsoort |
| sh:PropertyShape met sh:node | mim:Attribuutsoort | Een propertyshape met een verwijzing naar een nodeshape betreft een attribuutsoort met een enumeratie of gestructureerd datatype (maar geen relatie naar een objecttype) |
| sh:PropertyShape met sh:class | mim:Relatiesoort | Een propertyshape met een verwijzing naar een andere klasse betreft een relatiesoort |
| sh:NodeShape gelinkt aan skos:inScheme of skos:member | mim:Referentielijst | Een nodeshape die gelinkt is aan een skos:ConceptScheme of skos:Collection betreft een referentielijst |
| rdfs:subClassOf | mim:Generalisatie | De rdfs:subClassOf eigenschap betreft een generalisatie-specialisatie constructie |

Aspecten:

|RDFS term | MIM-aspect | Uitleg |
|----------|-------------|--------|
| IRI | mim:uri | De URI van het modelelement wordt in mim vastgelegd als eigenschap |
| rdfs:label, sh:name | mim:naam | Het rdfs:label (of sh:name als een meer technische naam gewenst is) van een nodeshape of class betreft de naam |
| skos:altLabel, skos:prefLabel, rdfs:label, sh:name | mim:alias | skos:altLabel is letterlijk een alias, sh:name is ook een alias en wordt met name gebruikt voor meer technische namen, terwijl skos:prefLabel of skos:altLabel vaak een meer functionele naam bevat|
| dct:subject | mim:begrip | dct:subject geeft dezelfde relatie weer als mim:begrip |
| rdfs:comment | mim:definitie | rdfs:comment wordt in de praktijk gebruikt op de manier als de mim:definitie. Merk op dat skos:definition hier niet wordt toegepast, omdat vanuit het MIM aanbevolen wordt om hiervoor een afzonderlijk begrippenkader op te stellen (via dct:subject / mim:begrip)|
| sh:minCount en sh:maxCount | mim:kardinaliteit | De kardinaliteit wordt bepaald door sh:minCount en sh:maxCount |
| sh:datatype | mim:type | Voor eenvoudige (data)type wordt sh:datatype gebruikt |
| sh:node | mim:type | Indien het datatype een gestructureerd datatype of enumeratie betreft, dan betreft de sh:node de relatie naar het datatype |
| sh:minLength en sh:maxLength | mim:lengte | De lengte wordt bepaald door sh:minLength en sh:maxLength |
| sh:pattern | mim:formeelPatroon | Identieke betekenis |
| sh:class | mim:doel | Indien een propertyshape een relatiesoort voorstelt, dan geeft sh:class het doel van de relatiesoort weer |
| rdfs:isDefinedBy | mim:isGedefinieerdIn | rdfs:isDefinedBy geeft dezelfde relatie weer als mim:isGedefinieerdIn |

Er zijn ook MIM aspecten die niet een overeenkomstige tegenhanger kennen in RDFS/OWL/SHACL. Indien een modelleur deze aspecten wel wil beschrijven in het originele RDFS/OWL/SHACL model, dan kan de modelleur deze direct toepassen. Het gaat daarbij om de volgende aspecten:

| MIM-aspect zonder tegenhanger in RDFS/OWL/SHACL | Opmerking |
|-------------------------------------------------|-----------|
| mim:begripsterm | Het wordt afgeraden om dit element te gebruiken, en in plaats daarvan direct te verwijzen naar het begrip zelf |
| mim:toelichting | Het wordt afgeraden om dit element te gebruiken, en dergelijke toelichtingen op te nemen bij het begrip zelf |
| mim:herkomst | Het wordt afgeraden om dit element te gebruiken, en dergelijke toelichtingen op te nemen bij het begrip zelf |
| mim:herkomstDefinitie | Het wordt afgeraden om dit element te gebruiken, en dergelijke toelichtingen op te nemen bij het begrip zelf |
| mim:datumOpname | Indien de ontologie onder versiebeheer staat, dan kan dit aspect afgeleid worden uit het versiesysteem |
| mim:authentiek | Specifiek MIM aspect, belangrijk voor stelselcatalogus |
| mim:identificatieAfleidbaar | |
| mim:kardinaliteitRelatieBron | Dit betreft de kardinaliteit van de inverse relatie die in het geval van het gebruik van dit aspect niet aanwezig is|
| mim:locatie | Dis aspect is alleen van toepassing op waardelijsten en wordt direct, zonder aanpassing, overgenomen in het vertaalde model. |
| mim:patroon | Dit betreft een tekstuele variant van sh:pattern / mim:formeelPatroon |
| mim:populatie | Specifiek MIM aspect, belangrijk voor stelselcatalogus |
| mim:kwaliteit | Specifiek MIM aspect, belangrijk voor stelselcatalogus |
| mim:indicatieAbstractObject | Het concept van abstract object is minder scherp in LD dan in het MIM. Hoewel deze indicatie is om te zetten in een expliciete constraint, zal het in de praktijk makkelijker leesbaar zijn om dit aspect expliciet op te nemen |
| mim:identificerend | In LD is de URI zelf de identificatie. Met dit aspect kan aangegeven worden dat specifieke propertyshapes ook identificerend zijn |
| mim:aggregatietype | Het aggregatietype zoals beoogd in het MIM is niet direct in RDFS/OWL/SHACL uit te drukken en kan zo alsnog worden toegelicht bij een propertyshape |
| mim:specificatieTekst | Het gebruik van dit aspect ligt niet voor de hand, zie de opmerking onder deze tabel |
| mim:specificatieFormeel | Het gebruik van dit aspect ligt niet voor de hand, zie de opmerking onder deze tabel |
| mim:constraint | Dit aspect verwijst, via een `mim:Constraint` direct terug naar de originele shape-constraint in LD |

In het MIM is het mogelijk om een constraint te beschrijven als een afzonderlijk modelelement `mim:Constraint`. Het idee hierachter is dat voor dergelijke constraints geen metamodelelementen beschikbaar zijn, en dat dit in een afzonderlijke formele (of informele) taal opgenomen moet worden. In Linked Data is het echter gebruikelijk om in dergelijke gevallen het metamodel uit te breiden met specifieke constructies voor een dergelijke formalisatie: Linked Data modellen zijn van nature open en uitbreidbare modellen, waarbij universele identificaties (URI's) ervoor zorgen dat de verschillende (meta)modelelementen uit elkaar gehouden kunnen worden.

Het ligt dan ook meer voor de hand om gebruik te (blijven) maken van dergelijke constructies in Linked Data. Dit wordt uitgelegd aan de hand van onderstaand voorbeeld.

**Voorbeeld**

> Van een objecttype "Persoon" leggen we de geboortedatum en de datum van overlijden vast. Daarbij geldt dat de geboortedatum vóór, of
> gelijk moet zijn aan de datum van overlijden.

In het MIM zou dit als volgt uitgedrukt kunnen worden:

<pre class='ex-turtle'>
vb:Persoon a mim:Objecttype;
  mim:naam "Persoon";
  mim:attribuut vb:geboortedatum;
  mim:attribuut vb:overlijdensdatum;
  mim:constraint [
    mim:specificatieTekst "Het is niet mogelijk dat een persoon overlijdt voordat deze is geboren.";
    mim:specificatieFormeel "geboortedatum <= overlijdensdatum";
  ]
.
vb:geboortedatum a mim:Attribuutsoort;
  mim:naam "geboortedatum";
  mim:datatype mim:Date;
  mim:kardinaliteit "1"
.
vb:overlijdensdatum a mim:Attribuutsoort;
  mim:naam "overlijdensdatum";
  mim:datatype mim:Date;
  mim:kardinaliteit "0..1"
.
</pre>

In RDF/RDFS/SHACL zou je dit als volgt uitdrukken (waarbij SHACL wordt gebruikt als formele taal):

<pre class='ex-turtle'>
shape:Persoon a sh:NodeShape;
  sh:targetClass voc:Persoon;
  sh:property shape:geboortedatum
  sh:property shape:overlijdensdatum
  sh:property shape:geboorteVSoverlijden
.
shape:geboortedatum a sh:PropertyShape;
  sh:path voc:geboortedatum;
  sh:datatype xsd:date;
  sh:minCount 1;
  sh:maxCount 1;
.
shape:overlijdensdatum a sh:PropertyShape;
  sh:path voc:overlijdensdatum;
  sh:datatype xsd:date;
  sh:maxCount 1;
.
shape:geboorteVSoverlijden a sh:PropertyShape;
  sh:path voc:geboortedatum;
  sh:lessThanOrEquals voc:overlijdensdatum
  sh:message "Het is niet mogelijk dat een persoon overlijdt voordat deze is geboren."
.
<pre>

Bij de terugvertaling naar het MIM, kan bovenstaande formalisatie `sh:lessThanOrEquals` gehandhaafd blijven, waarbij de link wordt gelegd via het metagegeven `mim:equivalent`:

<pre class='ex-turtle'>
vb:Meting a mim:Objecttype;
  mim:naam "Meting";
  mim:attribuut vb:temperatuur;
  min:constraint [
    a mim:Constraint;
    mim:equivalent shape:geboorteVSoverlijden.
  ];
.
shape:geboorteVSoverlijden a sh:PropertyShape;
  sh:path voc:geboortedatum;
  sh:lessThanOrEquals voc:overlijdensdatum
  sh:message "Het is niet mogelijk dat een persoon overlijdt voordat deze is geboren."
.
</pre>
