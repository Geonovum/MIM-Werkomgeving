TODO

(hoofstukken van de werkversie, niet gepubliceerde versie)
| hfds        | Titel                                      | doen      | beschrijving                                                                                                                                          | Afhandeling                                                |
| ----------- | ------------------------------------------ | --------- | ----------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------- |
| H2.4.2      | modelelementidentificatie-metagegevens     | misschien | Kan dit niet beter onder 2.4.3?                                                                                                                       |                                                            |
| H2.4.2      | modelelementidentificatie-metagegevens     | misschien | hernoemen basisURI naar namespace? basisURI is al gekozen, echter wordt in de tekst hier en daar namespace gebruikt; willen we dat liever?            |                                                            |
| H2.4.2      | modelelementidentificatie-metagegevens     | misschien | Toevoegen namespace voor shapes. Daar hebben we nu queries voor, was buiten scope gezet omdat dit LD specifiek is. Kunnen we vooralsnog introduceren. | Het is mogelijk om unieke URI's te maken obv beschikbare informatie                                                             |
| H3.2        | specificatie-metagegevens-in-uml           |           | opnemen metagegevens in specificaties                                                                                                                 | Gedaan                                                     |
| H4          | metamodel-in-linked-data-ld                |           | Update tekst waar nodig                                                                                                                               | niet nodig                                                 |
| H4.2.1      | kern-1                                     |           | Update diagram(men)                                                                                                                                   |                                                            |
| H4.3        | specificatie-metagegevens-in-ld            |           | opnemen metagegevens in specificaties                                                                                                                 | Gedaan                                                     |
| H5.13       | externe-schema-s-her-gebruiken             |           | Update aanvulling hergebruik van Attribuutsoorten/relatiesoorten en URI's                                                                             |                                                            |
| H5.16       | afspraken-rondom-naamgeving-en-definities  |           | iets over URN van modelelementen?                                                                                                                     | Hier is iets toegevoegd; vereist wellicht meer introductie |
| H6.1.2      | modelelementen-en-metagegevens-als-diagram |           | Update diagrammen                                                                                                                                     |                                                            |
| H6.4        | transformatie-mim-rdfs-owl-shacl           |           | maar gebruik van metagegevens voor transformatie                                                                                                      | gedaan                                                      |
| H6.3        | vertaling-naar-engels                      |           | Voeg metagegevens toe                                                                                                                                 | geen mapping naar iso:19109 gevonden                       |
| BP4MC2      |                                            |           | Update rdf vocabulaire                                                                                                                                |                                                            |
| BegrippenXL |                                            |           | Update skos                                                                                                                                           |                                                            |

bevindingen:
- Volgens mij zijn een Keuze en Constraint geen RDFS-term dus geen URI nodig? Wel een shape...
- In alle specificaties staat URI toegelicht als algemeen metagegeven - checken of dit de juiste toelichting is.
- URI Optioneel bij een modelelement; eigenlijk niet correct. Een violation zou een warning kunnen zijn. Aanvullend, basis-URI is verplicht; echter is dit alleen maar een  manier om snel te zorgen dat alle modelelementen een URI krijgen.
- Is isGedefinieerdIn verplicht of optioneel? Herkomst is verplicht.
- Het definieren van de namespace van het 'MIM in RDF'-model (niet zonder RDFS/SHACL) is niet mogelijk.
- Verwijzingen in H4.3 naar RDF-termen zijn toegevoegd; maar deze bestaan nog niet. e.g. bp4mc2-mim:URI
- rdfs:isDefinedBy kan niet bepaald worden op basis van mim:bevatModelelement; bijvoorbeeld alleen al omdat veel modellen nen3610:identificatie bevatten; maar alleen de nen3610 definieert het. 
- hebben waardelijsten wel een rdfs:isDefinedBy? is een waardelijst een owl:Class of een dcat:Dataset?
Wellicht ergens toevoegen: Bij een waardelijst duidt mim:locatie een distributies van de waardelijst aan.
--> Waardelijsten hebben een rdfs:isDefinedBy omdat dit klassen zijn. mim:locatie verwijst naar een distributie waar waardelijst te downloaden valt. 
Enumeratiewaardes zijn named individuals en die worden ook binnen de ontologie gedefinieerd.
- 2.4.3.22 Metagegeven: Locatie wordt nu op meer plekken gebruikt dat conform de definitie is toegestaan. Bijvoorbeeld bij Extern en Views https://docs.geostandaarden.nl/mim/mim/#specificatie-metagegevens-voor-packages
- Hebben Packages een isGedefinieerdIn relatie naar bovenliggende packages?
- In RDF heeft isGedefinieerdIn als range owl:Ontology. Is dit handig of liever mim:Package, of mim:Informatiemodel (EN/)OF mim:Domein
- http://127.0.0.1:5500/index.html#mim-gegevensgroeptype heeft geen HERKOMST aantal andere tabellen komen in het hoofdstuk over Metadmodel in Linked Data ook niet overeen met het UML metamodel.
- ordening van rijen in de tabellen verschillen in Metamodel in LD
- In 4.2 geven we daan dat een Klasse wordt beschreven met sh:name; dit is niet correct omdat dat betekent dat een owl:Class een sh:PropertyShape wordt. Ook hier kan alleen rdfs:label gebruikt worden.
  >Elk voorkomen van een MIM «metaclass» kent ook een sh:NodeShape met een sh:name die overeen komt de originele technische naam (UpperCamelCase);
- De vraag is of de SPARQL functies zoals t:CamelCase ect nodig zijn als we de [conventies](https://docs.geostandaarden.nl/mim/mim/#naamgeving-voor-alternatief-2-ook-leesbaar-door-systemen) hanteren.
- aan de LD kant wordt de domeinpackage als 'het eigen informatiemodel' gezien. aan de UML kan heb ik het idee dat juist het informatiemodel ackage als het eigen IM gezien wordt. hierdoor lopen de teksten niet altijd gelijk. https://docs.geostandaarden.nl/mim/mim/#transformatie-domein
- [bevatModelelement](https://docs.geostandaarden.nl/mim/mim/#transformatie-bevat-modelelement) is niet beschreven in metamodel algemeen.
- in ### Transformatie uitleg aangepast zodat eerst het vocabulaire wordt genoemd en daarna de het shapeselement. voor uniformiteit en omdat het vocabulaire het belangrijkste is.
- in ### Tansformatie Attribuutsoort wordt aangegeven dat een attribuutsoort in mim geen first class citizen is; klopt wel wel nu mim:Attribuutsoort een object is?
- Volgens mij klopt tabel 6.4.4.1 Klassen voor ReferentieElement niet. Een referentielijst beschrijft de structuur van de referentiewaarden, het is een owl:Class en een sh:Nodeshape. Een Referentieelement is één (van de) eigenschappen die we van de Referentiewaarden hebben, zoals een "code". Referentieelementen moeten we daarom vertalen naar een propertyshape en een datatypepropery bij de nodeshape van de referentielijst.

