# Metamodel in Linked Data (LD)

## Ontologisch metamodel in LD

Het MIM uitgedrukt in LD houdt onder ander een ontologisch metamodel in. Dit betekent dat er voor elk van de modelelementen van het MIM een klasse en/of eigenschap gedefinieerd is in termen van RDF, RDFS en OWL. In de hierop volgende paragrafen wordt deze uitwerking geven.

Het MIM is een *metamodel*. Dit betekent dat in termen van het MIM een concreet informatiemodel kan worden uitgewerkt, bijvoorbeeld het informatiemodel Basisregistratie Adressen en Gebouwen. Het MIM is niet bedoeld om vervolgens in termen van dit informatiemodel een concrete dataset te vormen. Zie ook [Typen informatiemodellen](#typen-informatiemodellen): het MIM is niet beoogd voor een informatiemodel op niveau 4. Hiervoor is een transformatie nodig naar een (technisch) uitwisselings- of opslagmodel nodig.

Op diezelfde manier levert het toepassen van het MIM in RDF geen ontologie of vocabulaire waarin RDF kan worden uitgedrukt: slechts het informatiemodel zelf is op deze manier in RDF uitgedrukt. Voor de vertaalslag naar een ontologie is een afzonderlijke transformatie nodig.

Vanuit een Linked Data perspectief is dit bijzonder. Een kernmerk van Linked Data is namelijk dat een informatiemodel op niveau 3 *ook* direct, zonder aanpassingen, bruikbaar is als informatiemodel op niveau 4. Sterker nog: Linked Data modellen zijn ook bruikbaar op niveau 1 en 2. Dit is vanuit het MIM zelf niet mogelijk. Hiervoor is een vertaalslag nodig naar een "echte" Linked Data ontologie.

Zo leidt een MIM objecttype "Schip" tot de volgende weergave in RDF:

<pre class='ex-turtle'>
@prefix vb: &lt;http://bp4mc2.org/voorbeeld/> .
@prefix mim: &lt;http://bp4mc2.org/def/mim#> .

vb:Schip a mim:Objecttype;
  rdfs:label "Schip"@nl;
.
</pre>

`vb:Schip` is in dit voorbeeld een voorkomen van de klasse `mim:Objecttype`. dit voorkomen kent zelf geen voorkomens. Hiervoor is een vertaling nodig naar een `rdfs:Class`, bijvoorbeeld door:

<pre class='ex-turtle'>
@prefix vbo: &lt;http://bp4mc2.org/voorbeeld/def#>.

vbo:Schip a rdfs:Class;
  mim:equivalent vb:Schip;
.
vb:Pakjesboot12 a vbo:Schip.
</pre>

De transformatie van het MIM model naar deze RDF ontologie is opgenomen in [sectie 6.4](#transformatie-mim-rdfs-owl-shacl).

## Structuur metamodel in LD

Het RDF model is opgesplitst in twee delen. Zoals gebruikelijk in RDF zijn deze modeldelen via hun URL op het internet te benaderen:

1. de [RDF vocabulaire](media/mim.ttl), met de (meta)klassen en (meta)eigenschappen;
2. de [RDF Shapesgraph](media/mim-shapes.ttl), met "shapes", de structuur die gelden op het gebruik van de klassen en eigenschappen.

In onderstaande paragrafen wordt zowel de vocabulaire als de structuur gezamenlijk per modelelement besproken. Een RDF representatie in turtle wordt gegeven en daarnaast ook een grafische representatie. Hiervoor wordt de verbeelding gebruikt zoals beschreven in het document: [Best Practises for meaningful connected computing](https://bp4mc2.org/20181107/#grafische-representatie).

Met behulp van bovenstaande twee - machine leesbare - bestanden kan een geserialiseerd MIM model uitgedrukt in RDF (bijvoorbeeld een [XML](https://www.w3.org/TR/rdf-syntax-grammar/), [JSON](https://www.w3.org/TR/json-ld11/) of [Turtle](https://www.w3.org/TR/turtle/) bestand) gevalideerd worden of deze correct conform MIM is opgesteld. Hiervoor kan bijvoorbeeld [dit open source java tool](https://github.com/architolk/mimtools) gebruikt worden.

Bij het opstellen van het MIM in RDF is gebruik gemaakt van de algemene, tekstuele beschrijving van het MIM uit het hoofdstuk [Metamodel Algemeen](#metamodel-algemeen). Er is een 1-op-1 omzetting gedaan, zonder enige aanpassing van de beschrijvingen. Dit maakt het mogelijk om een MIM informatiemodel om te zetten van de ene representatie (bijvoorbeeld in UML) naar de andere en weer terug, zonder verlies van informatie.

De volgende regels zijn gebruikt bij de omzetting van de MIM tekst naar RDF:

1. Elk voorkomen van een MIM «metaclass» is omgezet naar een voorkomen van een `owl:Class`;
2. Elk metagegeven van een MIM «metaclass» is omgezet naar een voorkomen van een `owl:DatatypeProperty`, voor zover sprake is van een metagegeven dat een waarde heeft die met een datatype is uit te drukken (zoals tekstuele, numerieke of boolean metagegevens);
3. Elk metagegeven van een MIM «metaclass» is omgezet naar een voorkomen van een `owl:ObjectProperty`, voor zover sprake is van een metagegeven waarbij de waarde verwijst naar een voorkomen van een andere MIM «metaclass»;
4. Een `rdfs:label` is opgenomen met de naam van de MIM «metaclass» c.q. het metagegeven;
5. Een `rdfs:comment` is opgenomen met de definitie van de MIM «metaclass» c.q. het metagegeven.

Voor de omzetting van de gegevensconstraints (zoals cardinaliteiten, datatypen en properties per klasse), is op de volgende manier een SHACL shape graph gemaakt:

1. Elk voorkomen van een MIM «metaclass» kent ook een `sh:NodeShape` met een `sh:name` die overeen komt de originele technische naam (UpperCamelCase);
2. Voor elk voorkomen van een MIM «metaclass» zijn `sh:PropertyShapes` aangemaakt om aan te geven welke metagegevens zijn toegestaan voor een MIM «metaclass», de kardinaliteiten en het datatype c.q. de geassocieerde MIM «metaclass».

Ten opzichte van de UML weergave van het MIM metamodel kent het MIM in RDF alleen het gebruik van de namen van de metagegevens en niet de namen van de bindingen die bij deze metagegevens horen. Zo kent het UML metamodel voor de binding tussen Objecttype en Attribuutsoort de bindingsnaam "heeft attribuut" en de rolnaam "attribuut". Het MIM in RDF gebruikt alleen de rolnaam "attribuut" in dit geval.

### Kern

<figure id="media/rdf-kern">
  <img src="media/rdf-kern.png" alt="" />
  <figcaption>Kern metamodel in LD</figcaption>
</figure>

Als prefix wordt voor de vocabulaire gebruik gemaakt van `mim`, met de namespace `http://bp4mc2.org/def/mim#`. Voor de shapes wordt als prefix gebruik gemaakt van `shape`, met als namespace `http://bp4mc2.org/def/mim-shapes#`.

| **MIM metaclass** | **Metaclass in RDF** | **Shape in RDF** | **Grondslag** |
|-------------------|----------------------|------------------|---------------|
| Objecttype        | [`mim:Objecttype`](http://bp4mc2.org/def/mim#Objecttype) | shape:Objecttype | [grondslag](#objecttypen-en-attribuutsoorten) |
| Attribuutsoort    | [`mim:Attribuutsoort`](http://bp4mc2.org/def/mim#Attribuutsoort) | shape:Attribuutsoort | [grondslag](#attribuutsoort-en-een-groepering-ervan)
| Gegevensgroep     | [`mim:Gegevensgroep`](http://bp4mc2.org/def/mim#Gegevensgroep) | shape:Gegevensgroep | [grondslag](#gegevensgroep) |
| Gegevensgroeptype | [`mim:Gegevensgroeptype`](http://bp4mc2.org/def/mim#Gegevensgroeptype) | shape:Gegevensgroeptype | [grondslag](#gegevensgroeptype) |
| Generalisatie     | [`mim:Generalisatie`](http://bp4mc2.org/def/mim#Generalisatie) | shape:Generalisatie | [grondslag](#generalisatie) |
| Relatiesoort      | [`mim:Relatiesoort`](http://bp4mc2.org/def/mim#Relatiesoort) | shape:Relatiesoort | [grondslag](#relatiesoort) |
| Relatieklasse     | [`mim:Relatieklasse`](http://bp4mc2.org/def/mim#Relatieklasse) | shape:Relatieklasse | [grondslag](#relatieklasse) |

In bovenstaand figuur zijn niet alle bindingen getekend rondom `mim:Relatiesoort`: dit zou het figuur onnodig complex maken. De bindingen met `mim:Gegevensgroeptype` zijn niet getekend. Dit is afgebeeld in onderstaand figuur. Daarbij is zichtbaar dat een `mim:Gegevensgroeptype` wel uitgaande relaties kan hebben, maar geen inkomende relaties: dat is altijd een `mim:Objecttype`.

<figure id="media/rdf-relatiekern">
  <img src="media/rdf-relatiekern.png" alt="" />
  <figcaption>Bindingen met mim:Gegevensgroeptype</figcaption>
</figure>

### Datatypen

<figure id="media/rdf-datatype">
  <img src="media/rdf-datatype.png" alt="" />
  <figcaption>Datatypen</figcaption>
</figure>

| **MIM metaclass** | **Metaclass in RDF** | **Shape in RDF** | **Grondslag** |
|-------------------|----------------------|------------------|---------------|
| Datatype                | [`mim:Datatype`](http://bp4mc2.org/def/mim#Datatype) | shape:Datatype | [grondslag](#datatypen) |
| Primitief datatype      | [`mim:PrimitiefDatatype`](http://bp4mc2.org/def/mim#PrimitiefDatatype) |shape:PrimitiefDatatype | [grondslag](#primitief-datatype) |
| Gestructureerd datatype | [`mim:GestructuurdDatatype`](http://bp4mc2.org/def/mim#GestructuurdDatatype) | shape:GestructuurdDatatype | [grondslag](#gestructureerd-datatype) |
| Data element            | [`mim:DataElement`](http://bp4mc2.org/def/mim#DataElement) | shape:DataElement | [grondslag](#data-element) |
| Enumeratie              | [`mim:Enumeratie`](http://bp4mc2.org/def/mim#Enumeratie) | shape:Enumeratie | [grondslag](#enumeratie) |
| Enumeratiewaarde        | [`mim:Enumeratiewaarde`](http://bp4mc2.org/def/mim#Enumeratiewaarde) | shape:Enumeratiewaarde | [grondslag](#enumeratiewaarde) |
| Referentielijst         | [`mim:Referentielijst`](http://bp4mc2.org/def/mim#Referentielijst) | shape:Referentielijst | [grondslag](#referentielijst) |
| Referentie element      | [`mim:ReferentieElement`](http://bp4mc2.org/def/mim#ReferentieElement) | shape:ReferentieElement | [grondslag](#referentie-element) |
| Codelijst                | [`mim:Codelijst`](http://bp4mc2.org/def/mim#Codelijst) | shape:Codelijst | [grondslag](#codelijst) |

### Overige

#### Constraint

<figure id="media/rdf-constraint">
  <img src="media/rdf-constraint.png" alt="" />
  <figcaption>Constraint</figcaption>
</figure>

| **MIM metaclass** | **Metaclass in RDF** | **Shape in RDF** | **Grondslag** |
|-------------------|----------------------|------------------|---------------|
| Constraint        | [`mim:Constraint`](http://bp4mc2.org/def/mim#Constraint) | shape:Constraint | [grondslag](#constraint) |
| Keuzeconstraint   | [`mim:Keuzeconstraint`](http://bp4mc2.org/def/mim#Keuze) | shape:Keuze | [grondslag](#keuze) |

#### Keuze

De "keuze constructie" maakt een keuze mogelijk tussen meerdere attribuutsoorten, datatypen en relatiedoelen (objecttypen). Er mag aan één specifieke keuze maar één soort van deze drie worden verbonden. Indien dit datatype gekozen wordt voor een attribuutsoort of relatiedoel, dan heeft dit de volgende betekenis, afhankelijk van de verbonden soort:

- Attribuutsoort: een keuze tussen attribuutsoorten **in plaats van** de attribuutsoort die deze keuze als datatype heeft;
- Datatype: een keuze tussen datatypen **in plaats van** dit keuze datatype;
- Relatiedoel: een keuze tussen objecttypen als relatiedoel **in plaats van** het doel van de relatieroldoel

| **MIM metaclass** | **Metaclass in RDF** | **Shape in RDF** | **Grondslag** |
|-------------------|----------------------|------------------|---------------|
| Keuze             | [`mim:Keuze`](http://bp4mc2.org/def/mim#Keuze) | shape:Keuze | [grondslag](#keuze) |
| Datatype          | [`mim:Datatype`](http://bp4mc2.org/def/mim#Datatype) | shape:Datatype | [grondslag](#datatype) |
| Objecttype        | [`mim:Objecttype`](http://bp4mc2.org/def/mim#Objecttype) | shape:Objecttype | [grondslag](#objecten-en-objecttype) |
| Attribuutsoort    | [`mim:Attribuutsoort`](http://bp4mc2.org/def/mim#Attribuutsoort) | shape:Attribuutsoort | [grondslag](#attribuutsoort-en-een-groepering-ervan) |

*Datatypekeuze*

<figure id="media/rdf-keuze-datatype">
  <img src="media/rdf-keuze-datatype.png" alt="" />
  <figcaption>Datatypekeuze</figcaption>
</figure>

Aangezien een `mim:Keuze` een specialisatie is van een `mim:Datatype`, mag een attribuutsoort via een `mim:type` een verwijzen naar een Keuze. Een dergelijk keuze heeft in dit geval zelf minimaal twee `mim:type` verwijzingen naar de 2 (of meer) datatypen waaruit gekozen wordt.

*Attribuutkeuze*

<figure id="media/rdf-keuze-attribuut">
  <img src="media/rdf-keuze-attribuut.png" alt="" />
  <figcaption>Attribuutkeuze</figcaption>
</figure>

Indien een `mim:Keuze` wordt gebruikt voor een keuze tussen attribuutsoorten, dan wordt vanuit een objecttype via een `mim:attribuut` niet verwezen naar een attribuutsoort, maar naar de keuze. De keuze zelf verwijst op zijn beurt naar de attribuutsoorten waartussen gekozen wordt.

*Relatiedoelkeuze*

<figure id="media/rdf-keuze-relatiedoel">
  <img src="media/rdf-keuze-relatiedoel.png" alt="" />
  <figcaption>Relatiedoelkeuze</figcaption>
</figure>

Indien een `mim:Keuze` wordt gebruikt voor een keuze tussen objecttypen die de relatiedoelen zijn voor een relatiesoort, dan wordt vanuit een relatiesoort via een `mim:doel` niet verwezen naar een objecttype, maar naar de keuze. De keuze zelf verwijst op zijn beurt naar de objecttypen waartussen gekozen wordt.

*Relatiesoortkeuze*

<figure id="media/rdf-keuze-relatiesoort">
  <img src="media/rdf-keuze-relatiesoort.png" alt="" />
  <figcaption>Relatiesoortkeuze</figcaption>
</figure>

Een keuze tussen relatiesoorten wordt gedaan op basis van een keuzeconstraint. Een keuzeconstraint is geen datatype, maar juist een constraint die in dit geval aangeeft dat er een keuze gemaakt moet worden tussen twee relatiesoorten.

#### Relatierol

<figure id="media/rdf-relatie">
  <img src="media/rdf-relatie.png" alt="" />
  <figcaption>Relatierol</figcaption>
</figure>

| **MIM metaclass** | **Metaclass in RDF** | **Shape in RDF** | **Grondslag** |
|-------------------|----------------------|------------------|---------------|
| Relatierol (abstract) | [`Relatierol`](http://bp4mc2.org/def/mim#Relatierol) | shape:Relatierol | [grondslag](#relatierol) |
| Relatierol bron       | [`RelatierolBron`](http://bp4mc2.org/def/mim#RelatierolBron) | shape:RelatierolBron | [grondslag](#relatierol) |
| Relatierol doel       | [`RelatierolDoel`](http://bp4mc2.org/def/mim#RelatierolDoel) | shape:RelatierolDoel | [grondslag](#relatierol) |

#### Externe koppeling

| **MIM metaclass** | **Metaclass in RDF** | **Shape in RDF** | **Grondslag** |
|-------------------|----------------------|------------------|---------------|
| Externe koppeling | [`mim:ExterneKoppeling`](http://bp4mc2.org/def/mim#ExterneKoppeling) | shape:ExterneKoppeling | [grondslag](#externe-koppeling) |

#### Packages

<figure id="media/rdf-packages">
  <img src="media/rdf-packages.png" alt="" />
  <figcaption>Packages</figcaption>
</figure>

De relatie bevatModelelement geeft aan dat packages modelelementen kunnen bevatten. Welke modelelementen precies toegestaan zijn, wordt in het plaatje niet tot uitdrukking gebracht. Zie hiervoor [sectie 2.6](#packages).

| **MIM metaclass**     | **Metaclass in RDF** | **Shape in RDF** | **Grondslag** |
|-----------------------|----------------------|------------------|---------------|
| Package               | [`mim:Package`](http://bp4mc2.org/def/mim#Package) | shape:Package | [grondslag](#packages) |
| Informatiemodel       | [`mim:Informatiemodel`](http://bp4mc2.org/def/mim#Informatiemodel) | shape:Informatiemodel | [grondslag](#informatiemodel) |
| Domein (het eigen IM) | [`mim:Domein`](http://bp4mc2.org/def/mim#Domein) | shape:Domein | [grondslag](#domein) |
| Extern                | [`mim:Extern`](http://bp4mc2.org/def/mim#Extern) | shape:Extern | [grondslag](#extern) |
| View                  | [`mim:View`](http://bp4mc2.org/def/mim#View) | shape:View | [grondslag](#view) |

## Specificatie metagegevens in LD

Deze paragraaf is een aanvulling op de paragraaf *'Specificatie metagegevens'* in het hoofdstuk [Metamodel Algemeen](#metamodel-algemeen). De betekenis van de metagegevens worden in LD gespecificeerd los van de klasse waartoe deze metagegevens behoren. Hieronder is een opsomming gegeven van alle metagegevens en de overeenkomstige meta-eigenschap in RDF. De gegevensregels (structuur) voor de metagegevens zijn wel specifiek per klasse, en worden in de betreffende paragraaf behandeld.

| **MIM metagegeven** | **Meta-eigenschap in RDF** | **RDF type** | **Grondslag** |
|---------------------|----------------------------|--------------|---------------|
| aggregatietype | [`mim:aggregatietype`](http://bp4mc2.org/def/mim#aggregatietype) | owl:ObjectProperty | [grondslag](#metagegeven-aggregatietype) |
| alias | [`mim:naam`](http://bp4mc2.org/def/mim#naam) | owl:DatatypeProperty | [grondslag](#metagegeven-alias) |
| attribuut | [`mim:attribuut`](http://bp4mc2.org/def/mim#attribuut) | owl:ObjectProperty | [grondslag](#metagegeven-attribuut) |
| authentiek | [`mim:authentiek`](http://bp4mc2.org/def/mim#authentiek) | owl:ObjectProperty | [grondslag](#metagegeven-authentiek) |
| begrip | [`mim:begrip`](http://bp4mc2.org/def/mim#begrip) | owl:ObjectProperty | [grondslag](#metagegeven-begrip) |
| begripsterm | [`mim:begripsterm`](http://bp4mc2.org/def/mim#begripsterm) | owl:DatatypeProperty | [grondslag](#metagegeven-begrip) |
| bron | [`mim:bron`](http://bp4mc2.org/def/mim#bron) | owl:ObjectProperty | [grondslag](#metagegeven-bron) |
| code | [`mim:code`](http://bp4mc2.org/def/mim#code) | owl:DatatypeProperty | [grondslag](#metagegeven-code) |
| constraint | [`mim:constraint`](http://bp4mc2.org/def/mim#constraint) | owl:ObjectProperty | [grondslag](#metagegeven-constraint) |
| data element | [`mim:dataElement`](http://bp4mc2.org/def/mim#dataElement) | owl:ObjectProperty | [grondslag](#metagegeven-data-element) |
| datum opname | [`mim:datumOpname`](http://bp4mc2.org/def/mim#datumOpname) | owl:DatatypeProperty | [grondslag](#metagegeven-datum-opname) |
| definitie | [`mim:definitie`](http://bp4mc2.org/def/mim#definitie) | owl:DatatypeProperty | [grondslag](#metagegeven-definitie) |
| doel | [`mim:doel`](http://bp4mc2.org/def/mim#doel) | owl:ObjectProperty | [grondslag](#metagegeven-doel) |
| formeel patroon | [`mim:formeelPatroon`](http://bp4mc2.org/def/mim#formeelPatroon) | owl:DatatypeProperty | [grondslag](#metagegeven-formeel-patroon) |
| gegevensgroep | [`mim:gegevensgroep`](http://bp4mc2.org/def/mim#gegevensgroep) | owl:ObjectProperty | [grondslag](#metagegeven-gegevensgroep) |
| groeptype | [`mim:groeptype`](http://bp4mc2.org/def/mim#groeptype) | owl:ObjectProperty | [grondslag](#metagegeven-groeptype) |
| herkomst | [`mim:herkomst`](http://bp4mc2.org/def/mim#herkomst) | owl:DatatypeProperty | [grondslag](#metagegeven-herkomst) |
| herkomst definitie | [`mim:herkomstDefinitie`](http://bp4mc2.org/def/mim#herkomstDefinitie) | owl:DatatypeProperty | [grondslag](#metagegeven-herkomst-definitie) |
| identificerend | [`mim:identificerend`](http://bp4mc2.org/def/mim#identificerend) | owl:DatatypeProperty | [grondslag](#metagegeven-identificerend) |
| indicatie abstract object | [`mim:indicatieAbstractObject`](http://bp4mc2.org/def/mim#indicatieAbstractObject) | owl:DatatypeProperty | [grondslag](#metagegeven-indicatie-abstract-object)|
| indicatie afleidbaar | [`mim:indicatieAfleidbaar`](http://bp4mc2.org/def/mim#indicatieAfleidbaar) | owl:DatatypeProperty | [grondslag](#metagegeven-indicatie-afleidbaar) |
| indicatie classificerend | [`mim:indicatieClassificerend`](http://bp4mc2.org/def/mim#indicatieAfleidbaar) | owl:DatatypeProperty | [grondslag](#metagegeven-indicatie-classificerend) |
| indicatie formele historie | [`mim:indicatieFormeleHistorie`](http://bp4mc2.org/def/mim#indicatieFormeleHistorie) | owl:DatatypeProperty | [grondslag](#metagegeven-indicatie-formele-historie) |
| indicatie materiële historie | [`mim:indicatieMaterieleHistorie`](http://bp4mc2.org/def/mim#indicatieMaterieleHistorie) | owl:DatatypeProperty | [grondslag](#metagegeven-indicatie-materiele-historie) |
| informatiedomein | [`mim:informatiedomein`](http://bp4mc2.org/def/mim#informatiedomein) | owl:DatatypeProperty | [grondslag](#metagegeven-domein) |
| informatiemodeltype | [`mim:informatiemodeltype`](http://bp4mc2.org/def/mim#informatiemodeltype) | owl:ObjectProperty | [grondslag](#metagegeven-informatiemodel-type) |
| kardinaliteit | [`mim:kardinaliteit`](http://bp4mc2.org/def/mim#kardinaliteit) | owl:DatatypeProperty | [grondslag](#metagegeven-kardinaliteit)
| kwaliteit | [`mim:kwaliteit`](http://bp4mc2.org/def/mim#kwaliteit) | owl:DatatypeProperty | |
| lengte | [`mim:lengte`](http://bp4mc2.org/def/mim#lengte) | owl:DatatypeProperty | [grondslag](#metagegeven-lengte-domein-van-een-waarde-van-een-gegeven) |
| locatie | [`mim:locatie`](http://bp4mc2.org/def/mim#locatie) | owl:DatatypeProperty | [grondslag](#metagegeven-locatie) |
| mim extensie | [`mim:extensie`](http://bp4mc2.org/def/mim#extensie) | owl:DatatypeProperty | [grondslag](#metagegeven-mim-extensie)
| mim taal | [`mim:taal`](http://bp4mc2.org/def/mim#taal) | owl:DatatypeProperty | [grondslag](#metagegeven-mim-taal) |
| mim versie | [`mim:versie`](http://bp4mc2.org/def/mim#versie) | owl:DatatypeProperty | [grondslag](#metagegeven-mim-versie) |
| mogelijk geen waarde | [`mim:mogelijkGeenWaarde`](http://bp4mc2.org/def/mim#mogelijkGeenWaarde) | owl:DatatypeProperty | [grondslag](#metagegeven-mogelijk-geen-waarde) |
| naam | [`mim:naam`](http://bp4mc2.org/def/mim#naam) | owl:DatatypeProperty | [grondslag](#metagegeven-naam) |
| patroon | [`mim:patroon`](http://bp4mc2.org/def/mim#patroon) | owl:DatatypeProperty | [grondslag](#metagegeven-patroon) |
| populatie | [`mim:populatie`](http://bp4mc2.org/def/mim#populatie) | owl:DatatypeProperty | |
| referentie element | [`mim:referentieElement`](http://bp4mc2.org/def/mim#referentieElement) | owl:ObjectProperty | [grondslag](#metagegeven-referentie-element) |
| relatiemodelleringstype | [`mim:relatiemodelleringstype`](http://bp4mc2.org/def/mim#relatiemodelleringstype) | owl:ObjectProperty | [grondslag](#metagegeven-relatiemodelleringstype) |
| relatierol | [`mim:relatierol`](http://bp4mc2.org/def/mim#relatierol) | owl:ObjectProperty | |
| specificatie formeel | [`mim:specificatieFormeel`](http://bp4mc2.org/def/mim#specificatieFormeel) | owl:DatatypeProperty | |
| specificatie tekst | [`mim:specificatieTekst`](http://bp4mc2.org/def/mim#specificatieTekst) | owl:DatatypeProperty | |
| subtype | [`mim:subtype`](http://bp4mc2.org/def/mim#subtype) | owl:ObjectProperty | |
| supertype | [`mim:supertype`](http://bp4mc2.org/def/mim#supertype) | owl:ObjectProperty | |
| toelichting | [`mim:toelichting`](http://bp4mc2.org/def/mim#toelichting) | owl:DatatypeProperty | [grondslag](#metagegeven-toelichting)
| type | [`mim:type`](http://bp4mc2.org/def/mim#type) | owl:ObjectProperty | [grondslag](#metagegeven-type-domein-van-een-waarde-een-gegeven) |
| unidirectioneel | [`mim:unidirectioneel`](http://bp4mc2.org/def/mim#unidirectioneel) | owl:DatatypeProperty | [grondslag](#metagegeven-unidirectioneel) |
| waarde | [`mim:waarde`](http://bp4mc2.org/def/mim#waarde) | owl:ObjectProperty | [grondslag](#metagegeven-waarde) |

### Objecten en attributen in LD

#### mim:Objecttype

De objecttypen worden naar de volgende aspecten gespecificeerd:

| **Aspect**                | **Eigenschap** | **Kardinaliteit** | **Datatype of klasse** |
|---------------------------|----------------|-------------------|--------------|
| Naam                      | [`mim:naam`](http://bp4mc2.org/def/mim#naam) | 1 | tekst |
| Alias                     | [`mim:alias`](http://bp4mc2.org/def/mim#alias) | 0..1 | tekst |
| Begrip                    | [`mim:begrip`](http://bp4mc2.org/def/mim#begrip) | 0..* | [`skos:Concept`](http://www.w3.org/2004/02/skos/core#Concept) |
| Begripsterm               | [`mim:begripsterm`](http://bp4mc2.org/def/mim#begripsterm) | 0..* | tekst |
| Herkomst                  | [`mim:herkomst`](http://bp4mc2.org/def/mim#herkomst) | 1 | tekst |
| Definitie                 | [`mim:definitie`](http://bp4mc2.org/def/mim#definitie) | 1 | tekst |
| Herkomst definitie        | [`mim:herkomstDefinitie`](http://bp4mc2.org/def/mim#herkomstDefinitie) | 1 | tekst |
| Datum opname              | [`mim:datumOpname`](http://bp4mc2.org/def/mim#datumOpname) | 1 | datum |
| Populatie                 | [`mim:populatie`](http://bp4mc2.org/def/mim#populatie) | 0..1 | tekst |
| Kwaliteit                 | [`mim:kwaliteit`](http://bp4mc2.org/def/mim#kwaliteit) | 0..1 | tekst |
| Toelichting               | [`mim:toelichting`](http://bp4mc2.org/def/mim#toelichting) | 0..1 | tekst |
| Indicatie abstract object | [`mim:indicatieAbstractObject`](http://bp4mc2.org/def/mim#indicatieAbstractObject) | 1 | boolean |
| Attribuut                 | [`mim:attribuut`](http://bp4mc2.org/def/mim#attribuut) | 0..n | [`mim:Attribuutsoort`](http://bp4mc2.org/def/mim#Attribuutsoort) |
| Gegevensgroep             | [`mim:gegevensgroep`](http://bp4mc2.org/def/mim#gegevensgroep) | 0..n | [`mim:Gegevensgroep`](http://bp4mc2.org/def/mim#Gegevensgroep) |
| Constraint                | [`mim:constraint`](http://bp4mc2.org/def/mim#constraint) | 0..n | [`mim:Constraint`](http://bp4mc2.org/def/mim#Constraint) |

#### mim:Attribuutsoort

De attribuutsoorten worden naar de volgende aspecten gespecificeerd:

| **Aspect**                   | **Eigenschap** | **Kardinaliteit** | **Datatype of klasse** |
|------------------------------|----------------|-------------------|--------------|
| Naam                         | [`mim:naam`](http://bp4mc2.org/def/mim#naam) | 1 | tekst |
| Alias                        | [`mim:alias`](http://bp4mc2.org/def/mim#alias) | 0..1 | tekst |
| Begrip                    | [`mim:begrip`](http://bp4mc2.org/def/mim#begrip) | 0..* | [`skos:Concept`](http://www.w3.org/2004/02/skos/core#Concept) |
| Begripsterm               | [`mim:begripsterm`](http://bp4mc2.org/def/mim#begripsterm) | 0..* | tekst |
| Herkomst                     | [`mim:herkomst`](http://bp4mc2.org/def/mim#herkomst) | 1 | tekst |
| Definitie                    | [`mim:definitie`](http://bp4mc2.org/def/mim#definitie) | 1 | tekst |
| Herkomst definitie           | [`mim:herkomstDefinitie`](http://bp4mc2.org/def/mim#herkomstDefinitie) | 1 | tekst |
| Datum opname                 | [`mim:datumOpname`](http://bp4mc2.org/def/mim#datumOpname) | 1 | datum |
| Type                         | [`mim:type`](http://bp4mc2.org/def/mim#type) | 1 | [`mim:Datatype`](http://bp4mc2.org/def/mim#Datatype) |
| Lengte                       | [`mim:lengte`](http://bp4mc2.org/def/mim#lengte) | 0..1 | tekst |
| Patroon                      | [`mim:patroon`](http://bp4mc2.org/def/mim#patroon) | 0..1 | tekst |
| Formeel patroon              | [`mim:formeelPatroon`](http://bp4mc2.org/def/mim#formeelPatroon) | 0..1 | tekst |
| Indicatie materiële historie | [`mim:indicatieMaterieleHistorie`](http://bp4mc2.org/def/mim#indicatieMaterieleHistorie) | 1 | boolean |
| Indicatie formele historie   | [`mim:indicatieFormeleHistorie`](http://bp4mc2.org/def/mim#indicatieFormeleHistorie) | 1 | boolean |
| Kardinaliteit                | [`mim:kardinaliteit`](http://bp4mc2.org/def/mim#kardinaliteit) | 1 | tekst |
| Authentiek                   | [`mim:authentiek`](http://bp4mc2.org/def/mim#authentiek) | 1 | Authenticiteit |
| Toelichting                  | [`mim:toelichting`](http://bp4mc2.org/def/mim#toelichting) | 0..1 | tekst |
| Indicatie afleidbaar         | [`mim:indicatieAfleidbaar`](http://bp4mc2.org/def/mim#indicatieAfleidbaar) | 1 | boolean |
| Indicatie classificerend     | [`mim:indicatieAfleidbaar`](http://bp4mc2.org/def/mim#indicatieAfleidbaar) | 1 | boolean |
| Mogelijk geen waarde         | [`mim:mogelijkGeenWaarde`](http://bp4mc2.org/def/mim#mogelijkGeenWaarde) | 1 | boolean |
| Identificerend               | [`mim:identificerend`](http://bp4mc2.org/def/mim#identificerend) | 0..1 | boolean |
| Constraint                | [`mim:constraint`](http://bp4mc2.org/def/mim#constraint) | 0..n | [`mim:Constraint`](http://bp4mc2.org/def/mim#Constraint) |

Het veld `mim:authentiek` verwijst naar één van de volgende mogelijke waarden:

| **Authenticiteit** | **Definitie** |
|--------------------|---------------|
| [`mim:Authentiek`](http://bp4mc2.org/def/mim#Authentiek) | In een basisregistratie opgenomen gegeven dat bij wettelijk voorschrift als authentiek is aangemerkt. |
| [`mim:Basisgegeven`](http://bp4mc2.org/def/mim#Basisgegeven) | Een in een basisregistratie opgenomen gegeven. |
| [`mim:WettelijkGegeven`](http://bp4mc2.org/def/mim#WettelijkGegeven) | Gegeven behorende bij een wettelijke registratie, niet zijnde een basisregistratie |
| [`mim:LandelijkKerngegeven`](http://bp4mc2.org/def/mim#LandelijkKerngegeven) | Indien het een gegeven of een als relatiesoort gemodelleerd gegeven is in een landelijk sector- en domein-overstijgend informatiemodel en geen authentiek gegeven en geen basisgegeven is. |
| [`mim:OverigeAuthenticiteit`](http://bp4mc2.org/def/mim#OverigeAuthenticiteit) | Indien het géén van de voorgaande categorieën betreft. Veelal gaat het dan om proces-, taakveld- of domeinspecifieke gegevens. |

#### mim:Gegevensgroep

De gegevensgroepen worden naar de volgende aspecten gespecificeerd:

| **Aspect**                   | **Eigenschap** | **Kardinaliteit** | **Datatype of klasse** |
|------------------------------|----------------|-------------------|--------------|
| Naam                         | [`mim:naam`](http://bp4mc2.org/def/mim#naam) | 1 | tekst |
| Alias                        | [`mim:alias`](http://bp4mc2.org/def/mim#alias) | 0..1 | tekst |
| Begrip                    | [`mim:begrip`](http://bp4mc2.org/def/mim#begrip) | 0..* | [`skos:Concept`](http://www.w3.org/2004/02/skos/core#Concept) |
| Begripsterm               | [`mim:begripsterm`](http://bp4mc2.org/def/mim#begripsterm) | 0..* | tekst |
| Definitie                    | [`mim:definitie`](http://bp4mc2.org/def/mim#definitie) | 1 | tekst |
| Toelichting                  | [`mim:toelichting`](http://bp4mc2.org/def/mim#toelichting) | 0..1 | tekst |
| Gegevensgroeptype            | [`mim:gegevensgroeptype`](http://bp4mc2.org/def/mim#gegevensgroeptype) | 1 | [`mim:Gegevensgroeptype`](http://bp4mc2.org/def/mim#Gegevensgroeptype) |
| Herkomst                     | [`mim:herkomst`](http://bp4mc2.org/def/mim#herkomst) | 1 | tekst |
| Herkomst definitie           | [`mim:herkomstDefinitie`](http://bp4mc2.org/def/mim#herkomstDefinitie) | 1 | tekst |
| Datum opname                 | [`mim:datumOpname`](http://bp4mc2.org/def/mim#datumOpname) | 1 | datum |
| Kardinaliteit                | [`mim:kardinaliteit`](http://bp4mc2.org/def/mim#kardinaliteit) | 1 | tekst |
| Authentiek                   | [`mim:authentiek`](http://bp4mc2.org/def/mim#authentiek) | 1 | Authenticiteit |
| Constraint                | [`mim:constraint`](http://bp4mc2.org/def/mim#constraint) | 0..n | [`mim:Constraint`](http://bp4mc2.org/def/mim#Constraint) |

#### mim:Gegevensgroeptype

De gegevensgroeptypen worden naar de volgende aspecten gespecificeerd:

| **Aspect**                   | **Eigenschap** | **Kardinaliteit** | **Datatype of klasse** |
|------------------------------|----------------|-------------------|--------------|
| Naam                         | [`mim:naam`](http://bp4mc2.org/def/mim#naam) | 1 | tekst |
| Alias                        | [`mim:alias`](http://bp4mc2.org/def/mim#alias) | 0..1 | tekst |
| Begrip                    | [`mim:begrip`](http://bp4mc2.org/def/mim#begrip) | 0..* | [`skos:Concept`](http://www.w3.org/2004/02/skos/core#Concept) |
| Begripsterm               | [`mim:begripsterm`](http://bp4mc2.org/def/mim#begripsterm) | 0..* | tekst |
| Definitie                    | [`mim:definitie`](http://bp4mc2.org/def/mim#definitie) | 0..1 | tekst |
| Herkomst definitie           | [`mim:herkomstDefinitie`](http://bp4mc2.org/def/mim#herkomstDefinitie) | 0..1 | tekst |
| Toelichting                  | [`mim:toelichting`](http://bp4mc2.org/def/mim#toelichting) | 0..1 | tekst |
| Datum opname                 | [`mim:datumOpname`](http://bp4mc2.org/def/mim#datumOpname) | 1 | datum |
| Attribuut                 | [`mim:attribuut`](http://bp4mc2.org/def/mim#attribuut) | 0..n | [`mim:Attribuutsoort`](http://bp4mc2.org/def/mim#Attribuutsoort) |
| Gegevensgroep             | [`mim:gegevensgroep`](http://bp4mc2.org/def/mim#gegevensgroep) | 0..n | [`mim:Gegevensgroep`](http://bp4mc2.org/def/mim#Gegevensgroep) |
| Constraint                | [`mim:constraint`](http://bp4mc2.org/def/mim#constraint) | 0..n | [`mim:Constraint`](http://bp4mc2.org/def/mim#Constraint) |

### Relaties in LD

Het metamodel heeft twee manieren om een relatie tussen twee objecttypen te beschrijven. Deze keuze wordt aangegeven in de eigen extensie, zoals beschreven in paragraaf 1.8. Alleen het gekozen alternatief is relevant voor de modellering in uw informatiemodel.

- Alternatief 1: Verplichte benoeming van de naam van de relatie met de bijbehorende metagegevens
- Alternatief 2: Verplichte benoeming van de rol van het doel in een relatie met de bijbehorende metagegevens en optioneel de benoeming van de naam van de relatie.

Beide alternatieven gebruiken relatiesoort en relatierol, maar met andere regels voor gebruik.

<!-- Onderstaande tekst weglaten: dubbelop, staat in hoofdstuk MetamodelAlgemeend.md
#### Relatiesoort leidend (alternatief 1)

Relatiesoort is verplicht, met een naam en met een definitie en deze is leidend. Metadata aspecten worden hierbij altijd vastgelegd. Het gebruik van relatierol is optioneel (zowel bij bron en doel). Áls er een relatierol doel wordt vastgelegd, dan is de metadata hierbij wel verplicht. Merk op dat bij het modelleren op deze wijze, alleen de kardinaliteit voor het doel aangegeven kan worden. De kardinaliteit aan de bron kant wordt open gelaten. -->

#### mim:Relatiesoort (alt 1: soort leidend)

De relatiesoorten worden naar de volgende aspecten gespecificeerd.

| **Aspect**                   | **Eigenschap** | **Kardinaliteit** | **Datatype of klasse** |
|------------------------------|----------------|-------------------|--------------|
| Naam                         | [`mim:naam`](http://bp4mc2.org/def/mim#naam) | 1 | tekst |
| Alias                        | [`mim:alias`](http://bp4mc2.org/def/mim#alias) | 0..1 | tekst |
| Begrip                       | [`mim:begrip`](http://bp4mc2.org/def/mim#begrip) | 0..* | [`skos:Concept`](http://www.w3.org/2004/02/skos/core#Concept) |
| Begripsterm                  | [`mim:begripsterm`](http://bp4mc2.org/def/mim#begripsterm) | 0..* | tekst |
| Unidirectioneel              | [`mim:unidirectioneel`](http://bp4mc2.org/def/mim#unidirectioneel) | 1 | boolean |
| Bron                         | [`mim:bron`](http://bp4mc2.org/def/mim#bron) | 1 | [`mim:Objecttype`](http://bp4mc2.org/def/mim#Objecttype) |
| Doel                         | [`mim:doel`](http://bp4mc2.org/def/mim#doel) | 1 | [`mim:Objecttype`](http://bp4mc2.org/def/mim#Objecttype) |
| Aggregatietype               | [`mim:aggregatietype`](http://bp4mc2.org/def/mim#aggregatietype) | 1 | Aggregatietype |
| Kardinaliteit                | [`mim:kardinaliteit`](http://bp4mc2.org/def/mim#kardinaliteit) | 1 | tekst |
| Kardinaliteit relatie bron   | [`mim:kardinaliteitRelatieBron`](http://bp4mc2.org/def/mim#kardinaliteitRelatieBron) | 0..1 | tekst |
| Herkomst                     | [`mim:herkomst`](http://bp4mc2.org/def/mim#herkomst) | 1 | tekst |
| Definitie                    | [`mim:definitie`](http://bp4mc2.org/def/mim#definitie) | 1 | tekst |
| Toelichting                  | [`mim:toelichting`](http://bp4mc2.org/def/mim#toelichting) | 0..1 | tekst |
| Herkomst definitie           | [`mim:herkomstDefinitie`](http://bp4mc2.org/def/mim#herkomstDefinitie) | 1 | tekst |
| Datum opname                 | [`mim:datumOpname`](http://bp4mc2.org/def/mim#datumOpname) | 1 | datum |
| Identificerend               | [`mim:identificerend`](http://bp4mc2.org/def/mim#identificerend) | 0..1 | boolean |
| Indicatie materiële historie | [`mim:indicatieMaterieleHistorie`](http://bp4mc2.org/def/mim#indicatieMaterieleHistorie) | 1 | boolean |
| Indicatie formele historie   | [`mim:indicatieFormeleHistorie`](http://bp4mc2.org/def/mim#indicatieFormeleHistorie) | 1 | boolean |
| Authentiek                   | [`mim:authentiek`](http://bp4mc2.org/def/mim#authentiek) | 1 | Authenticiteit |
| Indicatie afleidbaar         | [`mim:indicatieAfleidbaar`](http://bp4mc2.org/def/mim#indicatieAfleidbaar) | 1 | boolean |
| Mogelijk geen waarde         | [`mim:mogelijkGeenWaarde`](http://bp4mc2.org/def/mim#mogelijkGeenWaarde) | 1 | boolean |
| Constraint                | [`mim:constraint`](http://bp4mc2.org/def/mim#constraint) | 0..n | [`mim:Constraint`](http://bp4mc2.org/def/mim#Constraint) |

Het veld `mim:aggregatietype` verwijst naar één van de volgende mogelijke waarden:

| **Aggregatietype** | **Definitie** |
|--------------------|---------------|
| [`mim:Geen`](http://bp4mc2.org/def/mim#Geen) | Er is geen sprake van een aggregatie |
| [`mim:Compositie`](http://bp4mc2.org/def/mim#Compositie) | Compositie (gesloten wiebertje) |
| [`mim:Gedeeld`](http://bp4mc2.org/def/mim#Gedeeld) | Gedeelde aggregatie (open wiebertje) |

#### mim:Relatiesoort (alt 2: rol leidend)

De relatiesoorten worden naar de volgende aspecten gespecificeerd.

| **Aspect**                   | **Eigenschap** | **Kardinaliteit** | **Datatype of klasse** |
|------------------------------|----------------|-------------------|--------------|
| Naam                         | [`mim:naam`](http://bp4mc2.org/def/mim#naam) | 0..1 | tekst |
| Alias                        | [`mim:alias`](http://bp4mc2.org/def/mim#alias) | 0..1 | tekst |
| Begrip                       | [`mim:begrip`](http://bp4mc2.org/def/mim#begrip) | 0..* | [`skos:Concept`](http://www.w3.org/2004/02/skos/core#Concept) |
| Begripsterm                  | [`mim:begripsterm`](http://bp4mc2.org/def/mim#begripsterm) | 0..* | tekst |
| Definitie                    | [`mim:definitie`](http://bp4mc2.org/def/mim#definitie) | 0..1 | tekst |
| Relatierol                   | [`mim:relatierol`](http://bp4mc2.org/def/mim#relatierol) | 1..2 | [`Relatierol`](http://bp4mc2.org/def/mim#Relatierol) |
| Constraint                | [`mim:constraint`](http://bp4mc2.org/def/mim#constraint) | 0..n | [`mim:Constraint`](http://bp4mc2.org/def/mim#Constraint) |

#### mim:Relatierol (alt 1: soort leidend)

Voor relatierollen worden naar de volgende aspecten gespecificeerd.

| **Aspect**                   | **Eigenschap** | **Kardinaliteit** | **Datatype of klasse** |
|------------------------------|----------------|-------------------|--------------|
| Naam                         | [`mim:naam`](http://bp4mc2.org/def/mim#naam) | 0..1 | tekst |
| Alias                        | [`mim:alias`](http://bp4mc2.org/def/mim#alias) | 0..1 | tekst |
| Begrip                    | [`mim:begrip`](http://bp4mc2.org/def/mim#begrip) | 0..* | [`skos:Concept`](http://www.w3.org/2004/02/skos/core#Concept) |
| Begripsterm               | [`mim:begripsterm`](http://bp4mc2.org/def/mim#begripsterm) | 0..* | tekst |
| Definitie                    | [`mim:definitie`](http://bp4mc2.org/def/mim#definitie) | 0..1 | tekst |
| Constraint                | [`mim:constraint`](http://bp4mc2.org/def/mim#constraint) | 0..n | [`mim:Constraint`](http://bp4mc2.org/def/mim#Constraint) |

<!-- Herhaling van uitleg in hoofdstuk MetamodelAlgemeen.md
#### Relatierol is leidend (alternatief 2)

Verplichte benoeming van de rol van het doel in een relatie met de bijbehorende
metagegevens en optioneel de benoeming van de naam van de relatie. -->

#### mim:Relatierol (alt 2: rol leidend)

Voor relatierol worden bij het doel rol van een relatiesoort de volgende
aspecten gespecificeerd.

| **Aspect**                   | **Eigenschap** | **Kardinaliteit** | **Datatype of klasse** |
|------------------------------|----------------|-------------------|--------------|
| Naam                         | [`mim:naam`](http://bp4mc2.org/def/mim#naam) | 1 | tekst |
| Alias                        | [`mim:alias`](http://bp4mc2.org/def/mim#alias) | 0..1 | tekst |
| Begrip                       | [`mim:begrip`](http://bp4mc2.org/def/mim#begrip) | 0..* | [`skos:Concept`](http://www.w3.org/2004/02/skos/core#Concept) |
| Begripsterm                  | [`mim:begripsterm`](http://bp4mc2.org/def/mim#begripsterm) | 0..* | tekst |
| Kardinaliteit                | [`mim:kardinaliteit`](http://bp4mc2.org/def/mim#kardinaliteit) | 1 | tekst |
| Herkomst                     | [`mim:herkomst`](http://bp4mc2.org/def/mim#herkomst) | 1 | tekst |
| Definitie                    | [`mim:definitie`](http://bp4mc2.org/def/mim#definitie) | 1 | tekst |
| Toelichting                  | [`mim:toelichting`](http://bp4mc2.org/def/mim#toelichting) | 0..1 | tekst |
| Herkomst definitie           | [`mim:herkomstDefinitie`](http://bp4mc2.org/def/mim#herkomstDefinitie) | 1 | tekst |
| Datum opname                 | [`mim:datumOpname`](http://bp4mc2.org/def/mim#datumOpname) | 1 | datum |
| Identificerend               | [`mim:identificerend`](http://bp4mc2.org/def/mim#identificerend) | 0..1 | boolean |
| Indicatie materiële historie | [`mim:indicatieMaterieleHistorie`](http://bp4mc2.org/def/mim#indicatieMaterieleHistorie) | 1 | boolean |
| Indicatie formele historie   | [`mim:indicatieFormeleHistorie`](http://bp4mc2.org/def/mim#indicatieFormeleHistorie) | 1 | boolean |
| Authentiek                   | [`mim:authentiek`](http://bp4mc2.org/def/mim#authentiek) | 1 | Authenticiteit |
| Mogelijk geen waarde         | [`mim:mogelijkGeenWaarde`](http://bp4mc2.org/def/mim#mogelijkGeenWaarde) | 1 | boolean |
| Constraint                | [`mim:constraint`](http://bp4mc2.org/def/mim#constraint) | 0..n | [`mim:Constraint`](http://bp4mc2.org/def/mim#Constraint) |

#### mim:Generalisatie bij objecttypen

De generalisaties worden naar het volgende aspect gespecificeerd:

| **Aspect**                   | **Eigenschap** | **Kardinaliteit** | **Datatype of klasse** |
|------------------------------|----------------|-------------------|--------------|
| Subtype                      | [`mim:definitie`](http://bp4mc2.org/def/mim#subtype) | 1 | [`mim:Objecttype`](http://bp4mc2.org/def/mim#Objecttype) |
| Supertype                      | [`mim:definitie`](http://bp4mc2.org/def/mim#supertype) | 1 | [`mim:Objecttype`](http://bp4mc2.org/def/mim#Objecttype) |
| Datum opname                 | [`mim:datumOpname`](http://bp4mc2.org/def/mim#datumOpname) | 1 | datum |
<!-- | Constraint                | [`mim:constraint`](http://bp4mc2.org/def/mim#constraint) | 0..n | [`mim:Constraint`](http://bp4mc2.org/def/mim#Constraint) | -->

#### mim:Generalisatie bij datatypen

De generalisaties worden naar het volgende aspect gespecificeerd:

| **Aspect**                   | **Eigenschap** | **Kardinaliteit** | **Datatype of klasse** |
|------------------------------|----------------|-------------------|--------------|
| Subtype                      | [`mim:definitie`](http://bp4mc2.org/def/mim#subtype) | 1 | [`mim:Datatype`](http://bp4mc2.org/def/mim#Datatype) |
| Supertype                      | [`mim:definitie`](http://bp4mc2.org/def/mim#supertype) | 1 | [`mim:Datatype`](http://bp4mc2.org/def/mim#Datatype) |
<!-- | Constraint                | [`mim:constraint`](http://bp4mc2.org/def/mim#constraint) | 0..n | [`mim:Constraint`](http://bp4mc2.org/def/mim#Constraint) | -->

#### mim:Relatieklasse

De relatieklassen worden naar de volgende aspecten gespecificeerd:

| **Aspect**                   | **Eigenschap** | **Kardinaliteit** | **Datatype of klasse** |
|------------------------------|----------------|-------------------|--------------|
| Naam                         | [`mim:naam`](http://bp4mc2.org/def/mim#naam) | 0..1 | tekst |
| Alias                        | [`mim:alias`](http://bp4mc2.org/def/mim#alias) | 0..1 | tekst |
| Herkomst                     | [`mim:herkomst`](http://bp4mc2.org/def/mim#herkomst) | 1 | tekst |
| Begrip                    | [`mim:begrip`](http://bp4mc2.org/def/mim#begrip) | 0..* | [`skos:Concept`](http://www.w3.org/2004/02/skos/core#Concept) |
| Begripsterm               | [`mim:begripsterm`](http://bp4mc2.org/def/mim#begripsterm) | 0..* | tekst |
| Definitie                    | [`mim:definitie`](http://bp4mc2.org/def/mim#definitie) | 0..1 | tekst |
| Herkomst definitie           | [`mim:herkomstDefinitie`](http://bp4mc2.org/def/mim#herkomstDefinitie) | 1 | tekst |
| Toelichting               | [`mim:toelichting`](http://bp4mc2.org/def/mim#toelichting) | 0..1 | tekst |
| Datum opname                 | [`mim:datumOpname`](http://bp4mc2.org/def/mim#datumOpname) | 1 | datum |
| Constraint                   | [`mim:constraint`](http://bp4mc2.org/def/mim#constraint) | 0..n | [`mim:Constraint`](http://bp4mc2.org/def/mim#Constraint) |
| Unidirectioneel              | [`mim:unidirectioneel`](http://bp4mc2.org/def/mim#unidirectioneel) | 1 | boolean |
| Aggregatietype               | [`mim:aggregatietype`](http://bp4mc2.org/def/mim#aggregatietype) | 1 | Aggregatietype |
| Kardinaliteit                | [`mim:kardinaliteit`](http://bp4mc2.org/def/mim#kardinaliteit) | 1 | tekst |
| Indicatie materiële historie | [`mim:indicatieMaterieleHistorie`](http://bp4mc2.org/def/mim#indicatieMaterieleHistorie) | 1 | boolean |
| Indicatie formele historie   | [`mim:indicatieFormeleHistorie`](http://bp4mc2.org/def/mim#indicatieFormeleHistorie) | 1 | boolean |
| Authentiek                   | [`mim:authentiek`](http://bp4mc2.org/def/mim#authentiek) | 1 | Authenticiteit |
| Indicatie afleidbaar         | [`mim:indicatieAfleidbaar`](http://bp4mc2.org/def/mim#indicatieAfleidbaar) | 1 | boolean |
| Mogelijk geen waarde         | [`mim:mogelijkGeenWaarde`](http://bp4mc2.org/def/mim#mogelijkGeenWaarde) | 1 | boolean |

#### mim:ExterneKoppeling

Externe koppelingen worden naar de volgende aspecten gespecificeerd.

| **Aspect**                   | **Eigenschap** | **Kardinaliteit** | **Datatype of klasse** |
|------------------------------|----------------|-------------------|--------------|
| Naam                         | [`mim:naam`](http://bp4mc2.org/def/mim#naam) | 1 | tekst |
| Alias                        | [`mim:alias`](http://bp4mc2.org/def/mim#alias) | 0..1 | tekst |
| Begrip                       | [`mim:begrip`](http://bp4mc2.org/def/mim#begrip) | 0..* | [`skos:Concept`](http://www.w3.org/2004/02/skos/core#Concept) |
| Begripsterm                  | [`mim:begripsterm`](http://bp4mc2.org/def/mim#begripsterm) | 0..* | tekst |
| Unidirectioneel              | [`mim:unidirectioneel`](http://bp4mc2.org/def/mim#unidirectioneel) | 1 | boolean |
| Bron                         | [`mim:bron`](http://bp4mc2.org/def/mim#bron) | 1 | [`mim:Objecttype`](http://bp4mc2.org/def/mim#Objecttype) |
| Doel                         | [`mim:doel`](http://bp4mc2.org/def/mim#doel) | 1 | [`mim:Objecttype`](http://bp4mc2.org/def/mim#Objecttype) |
| Aggregatietype               | [`mim:aggregatietype`](http://bp4mc2.org/def/mim#aggregatietype) | 1 | Aggregatietype |
| Kardinaliteit                | [`mim:kardinaliteit`](http://bp4mc2.org/def/mim#kardinaliteit) | 1 | tekst |
| Herkomst                     | [`mim:herkomst`](http://bp4mc2.org/def/mim#herkomst) | 1 | tekst |
| Definitie                    | [`mim:definitie`](http://bp4mc2.org/def/mim#definitie) | 1 | tekst |
| Toelichting                  | [`mim:toelichting`](http://bp4mc2.org/def/mim#toelichting) | 0..1 | tekst |
| Herkomst definitie           | [`mim:herkomstDefinitie`](http://bp4mc2.org/def/mim#herkomstDefinitie) | 1 | tekst |
| Datum opname                 | [`mim:datumOpname`](http://bp4mc2.org/def/mim#datumOpname) | 1 | datum |
| Indicatie materiële historie | [`mim:indicatieMaterieleHistorie`](http://bp4mc2.org/def/mim#indicatieMaterieleHistorie) | 1 | boolean |
| Indicatie formele historie   | [`mim:indicatieFormeleHistorie`](http://bp4mc2.org/def/mim#indicatieFormeleHistorie) | 1 | boolean |
| Authentiek                   | [`mim:authentiek`](http://bp4mc2.org/def/mim#authentiek) | 1 | Authenticiteit |
| Indicatie afleidbaar         | [`mim:indicatieAfleidbaar`](http://bp4mc2.org/def/mim#indicatieAfleidbaar) | 1 | boolean |
| Mogelijk geen waarde         | [`mim:mogelijkGeenWaarde`](http://bp4mc2.org/def/mim#mogelijkGeenWaarde) | 1 | boolean |
| Constraint                | [`mim:constraint`](http://bp4mc2.org/def/mim#constraint) | 0..n | [`mim:Constraint`](http://bp4mc2.org/def/mim#Constraint) |

### Waardelijsten in LD

Waar in onderstaande specificaties sprake is van een locatie, wordt in Linked Data termen veronderstelt dat op deze locatie de waardelijst te vinden is. Concreet betekent dit dat via content negotiation de waardelijst in een specifieke serialisatie van Linked Data is op te halen (zoals: JSON-LD, RDF/XML, Turtle). Vervolgens wordt verondersteld dat de resources in dit bestand de afzonderlijke waarden van de waardelijst zijn, of andere metagegevens van de waardelijst. Zo ligt voor de hand dat het bestand een resource bevat met dezelfde URL als opgegeven in de locatie, waarmee nadere informatie kan worden aangegeven.

#### mim:Referentielijst

Voor referentielijsten worden de volgende aspecten gespecificeerd:

| **Aspect**                   | **Eigenschap** | **Kardinaliteit** | **Datatype of klasse** |
|------------------------------|----------------|-------------------|--------------|
| Naam                         | [`mim:naam`](http://bp4mc2.org/def/mim#naam) | 1 | tekst |
| Alias                        | [`mim:alias`](http://bp4mc2.org/def/mim#alias) | 0..1 | tekst |
| Begrip                       | [`mim:begrip`](http://bp4mc2.org/def/mim#begrip) | 0..* | [`skos:Concept`](http://www.w3.org/2004/02/skos/core#Concept) |
| Begripsterm                  | [`mim:begripsterm`](http://bp4mc2.org/def/mim#begripsterm) | 0..* | tekst |
| Herkomst                     | [`mim:herkomst`](http://bp4mc2.org/def/mim#herkomst) | 1 | tekst |
| Definitie                    | [`mim:definitie`](http://bp4mc2.org/def/mim#definitie) | 1 | tekst |
| Herkomst definitie           | [`mim:herkomstDefinitie`](http://bp4mc2.org/def/mim#herkomstDefinitie) | 1 | tekst |
| Datum opname                 | [`mim:datumOpname`](http://bp4mc2.org/def/mim#datumOpname) | 1 | datum |
| Toelichting                  | [`mim:toelichting`](http://bp4mc2.org/def/mim#toelichting) | 0..1 | tekst |
| Locatie                      | [`mim:locatie`](http://bp4mc2.org/def/mim#locatie) | 1 | tekst |
| Referentie-element           | [`mim:referentieElement`](http://bp4mc2.org/def/mim#referentieElement) | 1..* | [`mim:ReferentieElement`](http://bp4mc2.org/def/mim#ReferentieElement) |
| Constraint                | [`mim:constraint`](http://bp4mc2.org/def/mim#constraint) | 0..n | [`mim:Constraint`](http://bp4mc2.org/def/mim#Constraint) |

#### mim:ReferentieElement

De referentie-elementen worden naar de volgende aspecten gespecificeerd:

| **Aspect**                   | **Eigenschap** | **Kardinaliteit** | **Datatype of klasse** |
|------------------------------|----------------|-------------------|--------------|
| Naam                         | [`mim:naam`](http://bp4mc2.org/def/mim#naam) | 1 | tekst |
| Alias                        | [`mim:alias`](http://bp4mc2.org/def/mim#alias) | 0..1 | tekst |
| Begrip                    | [`mim:begrip`](http://bp4mc2.org/def/mim#begrip) | 0..* | [`skos:Concept`](http://www.w3.org/2004/02/skos/core#Concept) |
| Begripsterm               | [`mim:begripsterm`](http://bp4mc2.org/def/mim#begripsterm) | 0..* | tekst |
| Definitie                    | [`mim:definitie`](http://bp4mc2.org/def/mim#definitie) | 1 | tekst |
| Datum opname                 | [`mim:datumOpname`](http://bp4mc2.org/def/mim#datumOpname) | 1 | datum |
| Type                         | [`mim:type`](http://bp4mc2.org/def/mim#type) | 1 | [`mim:Datatype`](http://bp4mc2.org/def/mim#Datatype) |
| Lengte                       | [`mim:lengte`](http://bp4mc2.org/def/mim#lengte) | 0..1 | tekst |
| Patroon                      | [`mim:patroon`](http://bp4mc2.org/def/mim#patroon) | 0..1 | tekst |
| Formeel patroon              | [`mim:formeelPatroon`](http://bp4mc2.org/def/mim#formeelPatroon) | 0..1 | tekst |
| Kardinaliteit                | [`mim:kardinaliteit`](http://bp4mc2.org/def/mim#kardinaliteit) | 1 | tekst |
| Identificerend               | [`mim:identificerend`](http://bp4mc2.org/def/mim#identificerend) | 0..1 | tekst |
| Toelichting                  | [`mim:toelichting`](http://bp4mc2.org/def/mim#toelichting) | 0..1 | tekst |
| Constraint                | [`mim:constraint`](http://bp4mc2.org/def/mim#constraint) | 0..n | [`mim:Constraint`](http://bp4mc2.org/def/mim#Constraint) |

#### mim:Codelijst

Voor codelijst worden de volgende aspecten gespecificeerd:

| **Aspect**                   | **Eigenschap** | **Kardinaliteit** | **Datatype of klasse** |
|------------------------------|----------------|-------------------|--------------|
| Naam                         | [`mim:naam`](http://bp4mc2.org/def/mim#naam) | 1 | tekst |
| Alias                        | [`mim:alias`](http://bp4mc2.org/def/mim#alias) | 0..1 | tekst |
| Begrip                    | [`mim:begrip`](http://bp4mc2.org/def/mim#begrip) | 0..* | [`skos:Concept`](http://www.w3.org/2004/02/skos/core#Concept) |
| Begripsterm               | [`mim:begripsterm`](http://bp4mc2.org/def/mim#begripsterm) | 0..* | tekst |
| Herkomst                     | [`mim:herkomst`](http://bp4mc2.org/def/mim#herkomst) | 1 | tekst |
| Definitie                    | [`mim:definitie`](http://bp4mc2.org/def/mim#definitie) | 1 | tekst |
| Datum opname                 | [`mim:datumOpname`](http://bp4mc2.org/def/mim#datumOpname) | 1 | datum |
| Toelichting                  | [`mim:toelichting`](http://bp4mc2.org/def/mim#toelichting) | 0..1 | tekst |
| Locatie                      | [`mim:locatie`](http://bp4mc2.org/def/mim#locatie) | 1 | tekst |
| Constraint                | [`mim:constraint`](http://bp4mc2.org/def/mim#constraint) | 0..n | [`mim:Constraint`](http://bp4mc2.org/def/mim#Constraint) |

### Datatypen in LD

Het betreft metagegevens voor in het informatiemodel gedefinieerde datatypen,
oftewel exclusief datatypen die al buiten het model bestaan, zoals Integer,
DateTime, Surface.

#### mim:PrimitiefDatatype

De datatypen worden naar de volgende aspecten gespecificeerd:

| **Aspect**                   | **Eigenschap** | **Kardinaliteit** | **Datatype of klasse** |
|------------------------------|----------------|-------------------|--------------|
| Naam                         | [`mim:naam`](http://bp4mc2.org/def/mim#naam) | 1 | tekst |
| Alias                        | [`mim:alias`](http://bp4mc2.org/def/mim#alias) | 0..1 | tekst |
| Begrip                    | [`mim:begrip`](http://bp4mc2.org/def/mim#begrip) | 0..* | [`skos:Concept`](http://www.w3.org/2004/02/skos/core#Concept) |
| Begripsterm               | [`mim:begripsterm`](http://bp4mc2.org/def/mim#begripsterm) | 0..* | tekst |
| Definitie                    | [`mim:definitie`](http://bp4mc2.org/def/mim#definitie) | 1 | tekst |
| Toelichting               | [`mim:toelichting`](http://bp4mc2.org/def/mim#toelichting) | 0..1 | tekst |
| Type                         | [`mim:type`](http://bp4mc2.org/def/mim#type) | 1 | [`mim:Datatype`](http://bp4mc2.org/def/mim#Datatype) |
| Lengte                       | [`mim:lengte`](http://bp4mc2.org/def/mim#lengte) | 0..1 | tekst |
| Patroon                      | [`mim:patroon`](http://bp4mc2.org/def/mim#patroon) | 0..1 | tekst |
| Formeel patroon              | [`mim:formeelPatroon`](http://bp4mc2.org/def/mim#formeelPatroon) | 0..1 | tekst |
| Herkomst                     | [`mim:herkomst`](http://bp4mc2.org/def/mim#herkomst) | 1 | tekst |
| Datum opname                 | [`mim:datumOpname`](http://bp4mc2.org/def/mim#datumOpname) | 1 | datum |
| Constraint                | [`mim:constraint`](http://bp4mc2.org/def/mim#constraint) | 0..n | [`mim:Constraint`](http://bp4mc2.org/def/mim#Constraint) |

#### mim:GestructureerdDatatype

Voor Gestructureerde datatypen worden de volgende aspecten gespecificeerd:

| **Aspect**                   | **Eigenschap** | **Kardinaliteit** | **Datatype of klasse** |
|------------------------------|----------------|-------------------|--------------|
| Naam                         | [`mim:naam`](http://bp4mc2.org/def/mim#naam) | 1 | tekst |
| Alias                        | [`mim:alias`](http://bp4mc2.org/def/mim#alias) | 0..1 | tekst |
| Begrip                    | [`mim:begrip`](http://bp4mc2.org/def/mim#begrip) | 0..* | [`skos:Concept`](http://www.w3.org/2004/02/skos/core#Concept) |
| Begripsterm               | [`mim:begripsterm`](http://bp4mc2.org/def/mim#begripsterm) | 0..* | tekst |
| Herkomst                     | [`mim:herkomst`](http://bp4mc2.org/def/mim#herkomst) | 1 | tekst |
| Definitie                    | [`mim:definitie`](http://bp4mc2.org/def/mim#definitie) | 1 | tekst |
| Toelichting               | [`mim:toelichting`](http://bp4mc2.org/def/mim#toelichting) | 0..1 | tekst |
| Patroon                      | [`mim:patroon`](http://bp4mc2.org/def/mim#patroon) | 0..1 | tekst |
| Formeel patroon              | [`mim:formeelPatroon`](http://bp4mc2.org/def/mim#formeelPatroon) | 0..1 | tekst |
| Datum opname                 | [`mim:datumOpname`](http://bp4mc2.org/def/mim#datumOpname) | 1 | datum |
| Data-element                 | [`mim:dataElement`](http://bp4mc2.org/def/mim#dataElement) | 0..* | [`mim:DataElement`](http://bp4mc2.org/def/mim#DataElement) |
| Constraint                | [`mim:constraint`](http://bp4mc2.org/def/mim#constraint) | 0..n | [`mim:Constraint`](http://bp4mc2.org/def/mim#Constraint) |

#### mim:DataElement

De data-elementen worden naar de volgende aspecten gespecificeerd:

| **Aspect**                   | **Eigenschap** | **Kardinaliteit** | **Datatype of klasse** |
|------------------------------|----------------|-------------------|--------------|
| Naam                         | [`mim:naam`](http://bp4mc2.org/def/mim#naam) | 1 | tekst |
| Alias                        | [`mim:alias`](http://bp4mc2.org/def/mim#alias) | 0..1 | tekst |
| Begrip                    | [`mim:begrip`](http://bp4mc2.org/def/mim#begrip) | 0..* | [`skos:Concept`](http://www.w3.org/2004/02/skos/core#Concept) |
| Begripsterm               | [`mim:begripsterm`](http://bp4mc2.org/def/mim#begripsterm) | 0..* | tekst |
| Definitie                    | [`mim:definitie`](http://bp4mc2.org/def/mim#definitie) | 1 | tekst |
| Toelichting               | [`mim:toelichting`](http://bp4mc2.org/def/mim#toelichting) | 0..1 | tekst |
| Datum opname                 | [`mim:datumOpname`](http://bp4mc2.org/def/mim#datumOpname) | 1 | datum |
| Type                         | [`mim:type`](http://bp4mc2.org/def/mim#type) | 1 | [`mim:Datatype`](http://bp4mc2.org/def/mim#Datatype) |
| Lengte                       | [`mim:lengte`](http://bp4mc2.org/def/mim#lengte) | 0..1 | tekst |
| Patroon                      | [`mim:patroon`](http://bp4mc2.org/def/mim#patroon) | 0..1 | tekst |
| Formeel patroon              | [`mim:formeelPatroon`](http://bp4mc2.org/def/mim#formeelPatroon) | 0..1 | tekst |
| Kardinaliteit                | [`mim:kardinaliteit`](http://bp4mc2.org/def/mim#kardinaliteit) | 1 | tekst |
| Constraint                | [`mim:constraint`](http://bp4mc2.org/def/mim#constraint) | 0..n | [`mim:Constraint`](http://bp4mc2.org/def/mim#Constraint) |

### Packages in LD

#### mim:Informatiemodel

Informatiemodel packages worden naar de volgende aspecten gespecificeerd:

| **Aspect**                   | **Eigenschap** | **Kardinaliteit** | **Datatype of klasse** |
|------------------------------|----------------|-------------------|--------------|
| Naam                         | [`mim:naam`](http://bp4mc2.org/def/mim#naam) | 1 | tekst |
| Alias                        | [`mim:alias`](http://bp4mc2.org/def/mim#alias) | 0..1 | tekst |
| Definitie                    | [`mim:definitie`](http://bp4mc2.org/def/mim#definitie) | 1 | tekst |
| Herkomst                     | [`mim:herkomst`](http://bp4mc2.org/def/mim#herkomst) | 1 | tekst |
| Datum opname                 | [`mim:datumOpname`](http://bp4mc2.org/def/mim#datumOpname) | 1 | datum |
| MIM versie                   | [`mim:mimversie`](http://bp4mc2.org/def/mim#mimversie) | 1 | tekst |
| MIM extensie                 | [`mim:mimextensie`](http://bp4mc2.org/def/mim#mimextensie) | 0..1 | tekst |
| MIM taal                     | [`mim:mimtaal`](http://bp4mc2.org/def/mim#mimtaal) | 0..1 | tekst |
| Informatiedomein             | [`mim:informatiedomein`](http://bp4mc2.org/def/mim#informatiedomein) | 1..1 | tekst |
| Informatiemodel type         | [`mim:informatiemodeltype`](http://bp4mc2.org/def/mim#informatiemodeltype) | 1..1 | Informatiemodeltypen |
| Relatiemodelleringtype       | [`mim:relatiemodelleringtype`](http://bp4mc2.org/def/mim#relatiemodelleringtype) | 1..1 | Relatiemodelleringtypen |
| Constraint                | [`mim:constraint`](http://bp4mc2.org/def/mim#constraint) | 0..n | [`mim:Constraint`](http://bp4mc2.org/def/mim#Constraint) |

Het veld `mim:informatiemodeltype` verwijst naar één van de volgende mogelijke waarden:

| **Informatiemodeltype** | **Definitie** |
|-------------------------|---------------|
| [`mim:ConceptueelInformatiemodel`](http://bp4mc2.org/def/mim#ConceptueelInformatiemodel) | Niveau-2 model, conform [deze](#niveau-2-conceptueel-informatiemodel) sectie |
| [`mim:LogischInformatiemodel`](http://bp4mc2.org/def/mim#LogischInformatiemodel) | Niveau-3 model, conform [deze](#niveau-3-logisch-informatie-of-gegevensmodel) sectie |
| [`mim:TechnischInformatiemodel`](http://bp4mc2.org/def/mim#TechnischInformatiemodel) | Niveau-4 model, conform [deze](#niveau-4-fysiek-of-technisch-gegevens-of-datamodel) sectie |

Het veld `mim:relatiemodelleringtype` verwijst naar één van de volgende mogelijke waarden:

| **Relatiemodelleringtype** | **Definitie** |
|----------------------------|---------------|
| [`mim:RelatiesoortLeidend`](http://bp4mc2.org/def/mim#RelatiesoortLeidend) | Relatiesoort leidend, conform [deze](#relatiesoort-leidend-alternatief-1-0) sectie  |
| [`mim:RelatierolLeidend`](http://bp4mc2.org/def/mim#RelatierolLeidend) | Relatierol leidend, conform [deze](#relatierol-is-leidend-alternatief-2-0) sectie |

#### mim:Domein

Domein packages worden naar de volgende aspecten gespecificeerd:

| **Aspect**                   | **Eigenschap** | **Kardinaliteit** | **Datatype of klasse** |
|------------------------------|----------------|-------------------|--------------|
| Naam                         | [`mim:naam`](http://bp4mc2.org/def/mim#naam) | 1 | tekst |
| Alias                        | [`mim:alias`](http://bp4mc2.org/def/mim#alias) | 0..1 | tekst |
| Datum opname                 | [`mim:datumOpname`](http://bp4mc2.org/def/mim#datumOpname) | 1 | datum |
| Constraint                | [`mim:constraint`](http://bp4mc2.org/def/mim#constraint) | 0..n | [`mim:Constraint`](http://bp4mc2.org/def/mim#Constraint) |

#### mim:Extern

Externe packages worden naar de volgende aspecten gespecificeerd:

| **Aspect**                   | **Eigenschap** | **Kardinaliteit** | **Datatype of klasse** |
|------------------------------|----------------|-------------------|--------------|
| Naam                         | [`mim:naam`](http://bp4mc2.org/def/mim#naam) | 1 | tekst |
| Alias                        | [`mim:alias`](http://bp4mc2.org/def/mim#alias) | 0..1 | tekst |
| Locatie                      | [`mim:locatie`](http://bp4mc2.org/def/mim#locatie) | 1 | tekst |
| Definitie                    | [`mim:definitie`](http://bp4mc2.org/def/mim#definitie) | 1 | tekst |
| Toelichting               | [`mim:toelichting`](http://bp4mc2.org/def/mim#toelichting) | 0..1 | tekst |
| Herkomst                     | [`mim:herkomst`](http://bp4mc2.org/def/mim#herkomst) | 1 | tekst |
| Datum opname                 | [`mim:datumOpname`](http://bp4mc2.org/def/mim#datumOpname) | 1 | datum |
| Constraint                | [`mim:constraint`](http://bp4mc2.org/def/mim#constraint) | 0..n | [`mim:Constraint`](http://bp4mc2.org/def/mim#Constraint) |

#### mim:View

View packages worden naar de volgende aspecten gespecificeerd:

| **Aspect**                   | **Eigenschap** | **Kardinaliteit** | **Datatype of klasse** |
|------------------------------|----------------|-------------------|--------------|
| Naam                         | [`mim:naam`](http://bp4mc2.org/def/mim#naam) | 1 | tekst |
| Alias                        | [`mim:alias`](http://bp4mc2.org/def/mim#alias) | 0..1 | tekst |
| Locatie                      | [`mim:locatie`](http://bp4mc2.org/def/mim#locatie) | 1 | tekst |
| Definitie                    | [`mim:definitie`](http://bp4mc2.org/def/mim#definitie) | 1 | tekst |
| Toelichting               | [`mim:toelichting`](http://bp4mc2.org/def/mim#toelichting) | 0..1 | tekst |
| Herkomst                     | [`mim:herkomst`](http://bp4mc2.org/def/mim#herkomst) | 1 | tekst |
| Datum opname                 | [`mim:datumOpname`](http://bp4mc2.org/def/mim#datumOpname) | 1 | datum |
| Constraint                | [`mim:constraint`](http://bp4mc2.org/def/mim#constraint) | 0..n | [`mim:Constraint`](http://bp4mc2.org/def/mim#Constraint) |

### Overige modelelementen in LD

#### mim:Enumeratie

Enumeraties betreffen de metaclass Enumeration en worden naar de volgende
aspecten gespecificeerd:

| **Aspect**                   | **Eigenschap** | **Kardinaliteit** | **Datatype of klasse** |
|------------------------------|----------------|-------------------|--------------|
| Naam                         | [`mim:naam`](http://bp4mc2.org/def/mim#naam) | 1 | tekst |
| Alias                        | [`mim:alias`](http://bp4mc2.org/def/mim#alias) | 0..1 | tekst |
| Begrip                    | [`mim:begrip`](http://bp4mc2.org/def/mim#begrip) | 0..* | [`skos:Concept`](http://www.w3.org/2004/02/skos/core#Concept) |
| Begripsterm               | [`mim:begripsterm`](http://bp4mc2.org/def/mim#begripsterm) | 0..* | tekst |
| Definitie                    | [`mim:definitie`](http://bp4mc2.org/def/mim#definitie) | 1 | tekst |
| Toelichting               | [`mim:toelichting`](http://bp4mc2.org/def/mim#toelichting) | 0..1 | tekst |
| Datum opname                 | [`mim:datumOpname`](http://bp4mc2.org/def/mim#datumOpname) | 1 | datum |
| Waarde                       | [`mim:waarde`](http://bp4mc2.org/def/mim#Enumeratiewaarde) | 1..* | [`mim:Waarde`](http://bp4mc2.org/def/mim#Enumeratiewaarde) |
| Constraint                | [`mim:constraint`](http://bp4mc2.org/def/mim#constraint) | 0..n | [`mim:Constraint`](http://bp4mc2.org/def/mim#Constraint) |

#### mim:Enumeratiewaarde

De enumeratiewaarde zelf betreft de metaclass UML-EnumerationLiteral en kent
volgende aspecten:

| **Aspect**                   | **Eigenschap** | **Kardinaliteit** | **Datatype of klasse** |
|------------------------------|----------------|-------------------|--------------|
| Naam                         | [`mim:naam`](http://bp4mc2.org/def/mim#naam) | 1 | tekst |
| Definitie                    | [`mim:definitie`](http://bp4mc2.org/def/mim#definitie) | 0..1 | tekst |
| Toelichting               | [`mim:toelichting`](http://bp4mc2.org/def/mim#toelichting) | 0..1 | tekst |
| Code                         | [`mim:code`](http://bp4mc2.org/def/mim#code) | 0..1 | tekst |
| Begrip                       | [`mim:begrip`](http://bp4mc2.org/def/mim#begrip) | 0..* | [`skos:Concept`](http://www.w3.org/2004/02/skos/core#Concept) |
| Begripsterm                  | [`mim:begripsterm`](http://bp4mc2.org/def/mim#begripsterm) | 0..* | tekst |
| Datum opname                 | [`mim:datumOpname`](http://bp4mc2.org/def/mim#datumOpname) | 1 | datum |
| Constraint                | [`mim:constraint`](http://bp4mc2.org/def/mim#constraint) | 0..n | [`mim:Constraint`](http://bp4mc2.org/def/mim#Constraint) |

Een enumeratiewaarde mag geen alias hebben, omdat in UML het alias-veld wordt gebruikt voor de mim:code. Mocht toch een `mim:alias` zijn opgegeven voor een enumeratiewaarde, dan dient deze gelezen te worden als een `mim:code`. In het RDF model is `mim:code` een subproperty van een `mim:alias`.

#### mim:Constraint

De enumeratiewaarde zelf betreft de metaclass UML-EnumerationLiteral en kent
volgende aspecten:

| **Aspect**                   | **Eigenschap** | **Kardinaliteit** | **Datatype of klasse** |
|------------------------------|----------------|-------------------|--------------|
| Naam                         | [`mim:naam`](http://bp4mc2.org/def/mim#naam) | 1 | tekst |
| Specificatie-tekst           | [`mim:specificatieTekst`](http://bp4mc2.org/def/mim#specificatieTekst) | 0..1 | tekst |
| Specificatie-formeel         | [`mim:specificatieFormeel`](http://bp4mc2.org/def/mim#specificatieFormeel) | 0..1 | tekst |

## Linked Data Tooling

Het metamodel van MIM is specifiek voor het MIM opgesteld. Hiervoor zijn niet direct tools beschikbaar. Wel zijn er twee alternatieve opties die modelleurs kunnen volgen:

1. Modelleurs kunnen een MIM model met behulp van Enterprise Architect opstellen. Er is een tool *Imvertor*, waarmee het mogelijk is om een MIM Model opgesteld in Enterprise Architect te transformeren naar een Linked Data model. Deze tool is open source en is te vinden op [www.imvertor.org](http://www.imvertor.org).
2. Modelleurs kunnen ook direct in een Linked Data model (in OWL en SHACL) opstellen. Een dergelijk model kan, indien het voldoet aan de transformatieregels, gezien worden als een MIM informatiemodel. Om expliciet de link naar het MIM duidelijk te maken, kan gebruik worden gemaakt van deze [SPARQL constructieregels](media/rdf2mim.sparql), die een RDF/RDFS/OWL/SHACL model "terugvertalen" naar een MIM model. De terugvertaalregels zijn beschreven in [sectie 6.4.9](#transformatie-vanuit-rdfs-owl-shacl). Er zijn diverse tools beschikbaar om een dergelijk model op te stellen. De meest bekende tools zijn [Protege](https://protege.stanford.edu) (open source), [Topbraid Composer](https://www.topquadrant.com/topbraid-composer-install/) en [Poolparty](https://www.poolparty.biz) (de laatste twee zijn commerciële producten). Daarnaast zijn er ook veel modelleurs die gebruik maken van generieke IDE's voor het maken van Linked Data modellen, vaak op basis van de voor mensen leesbare [Turtle syntax](https://www.w3.org/TR/turtle).