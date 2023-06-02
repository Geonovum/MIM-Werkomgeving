## Conclusies en aanbevelingen

Hieronder worden eerst de belangrijkste bevindingen uiteengezet die tijdens het uitvoeren en opstellen van de best practice zijn gedaan. In de paragraven daarna worden deze vertaald naar de conclusies en aanbevelingen. 

### Bevindingen

De belangrijkste bevindingen in uiteraard dat het kan! Het is mogelijk om model/ontologie te maken die volledige NEN2660-2, NEN3610 en MIM compliant is. Bij het uitwerken van de best practice waren wel alle auteurs van de standaarden nodig om tot het complete product te komen. Maar dit heeft geresulteerd in _een_ manier waarop het kan. De volgende belangrijke bevindingen zijn hierbij gedaan.

__Het loont om Begrippenkader, Ontologie (Classes), Shapes (Gegevensbehoefte) te splitsen__

Deze splitsing wordt door zowel de NEN2660-2 als het MIM aanbevolen en verdient het ook om opgevolgd te worden. De belangrijkste reden is zijnde dat het Begrippenkader en de Ontologie relatief eenvoudig in lijn te houden op het gebied van MIM, NEN3610 en NEN2660-2. Op het niveau van de Shapes daarentegen is dit een stuk ingewikkelder. Wellicht komt dit door het onderscheidt tussen OWL en SHACL. Maar waarschijnlijker is dat het specificeren van _hoe_ gegevens vastgelegd moeten worden (in tegenstelling tot van welke klasse gegevens zijn) veel meer beperkingen opgelegd en dat daardoor de complexiteit van het model toeneemt. Door de niveaus te splitsen is het mogelijk om op een eenvoudiger niveau te beginnen en vervolgens waar nodig af te dalen naar de meer complexere niveaus. Hier kan er vervolgens doorgeborduurd worden op het reeds gedane werk. In IMBOR2022 is er _wel_ onderscheidt gemaakt tussen het Begrippenkader en de rest, maar geen onderscheidt tussen de Ontologie en de Shapes (insanties van `sh:NodeShape` en `rdfs:Class` zijn dezelfde resource). Dit heeft voor de nodige hoofdbrekers gezorgd. 

__NEN3610 en NEN2660-2 leven in symbiose__

Zowel in de NEN3610:2022 als de NEN2660-2:2022 wordt aandacht besteedt aan de ander. Hierdoor gaan ze prima samen en vullen ze elkaar aan. Doordat het semantisch model van de NEN3610 relatief goed past in het praktisch toplevelmodel van de NEN2660-2 kan een domeinontologie zoals IMBOR eenvoudig het semantisch model van de NEN3610 specialiseren op het gebied van Geo-objecten. Voor alle overige zaken kan het NEN2660-2 praktische toplevelmodel worden gespecialiseerd. 

De LinkedData taalbinding van de NEN2660-2 geeft daarnaast invulling aan de passage van de NEN3610 waarin gesteld wordt dat een model gebaseerd op de NEN3610 in LinkedData (RDF) _kan_ worden uitgedrukt. Dit vult elkaar zodoende aan. Er bestaat nog wel enige onduidelijkheid over het gebruik van de termen/klassen Geo-object en InformatieObject. Hier bestaat nog semantische/spraakverwarring die verduidelijkt kan worden. 

__MIM dekt niet alles helemaal af__

Het MIM schiet nog te kort op het gebied van Eenheden en Attributen. De NEN2660-2 schrijft voor dat er gebruik gemaakt moet worden van QUDT voor de eenheden en grootheden. Hiervoor is eigenlijk geen goede plek in MIM. Momenteel wordt er daarom gewerkt met een tijdelijke situatie waar dit op `mim:toelichting` zit (zie hiervoor ook [MIM issue #15](https://github.com/Geonovum/MIM-Werkomgeving/issues/15)). 

Ook op het gebied van Attributen is er enige discrepantie in het detailniveau van MIM en de NEN2660-2. Doordat de NEN2660-2 de relatie tussen een `mim:Objecttype` en `mim:Attribuutsoort` in principe 'objectificeerd' ontstaat er de situatie dat zowel de 'shape' als de 'property' een `mim:equivalent` relatie naar de `mim:Attribuutsoort` hebben. Een expliciete vorm van deze splitsing wordt daarom reeds overwogen binnen het MIM team. 

__MIM definieert eigen datatypen__
Doordat MIM eigen representaties van de standaard datatypen voorschrijft loopt deze achter. Het datatype `xsd:duration` is in MIM nog geen standaard Primitief datatype. Hierdoor kunnen niet alle soorten datatypen worden getransformeerd omdat de NEN2660-2 de `xsd:` specificatie voorschrijft die breder is.

__OWL vs. SHACL__

De NEN2660-2 schrijft een relatief strikte scheiding voor tussen het gebruik van OWL en SHACL. Dit is terecht onderwerp van debat. IMBOR heeft echter gekozen voor een RDFS/SHACL implementatie. Daarmee is het onduidelijk of deze best practice ook een-op-een toegepast kan worden op een model dat OWL gebruikt.

__Modellering van geometrie nog te onderzoeken__
De NEN2660-2 zegt niets over hoe een geometrie vastgelegd moet worden. Bij het opstellen van de best practice werd geconcludeerd dat door bij IMBOR niet de OGC splitsing gevolgd wordt het enigzins onduidelijk is hoe de geometrie behandeld moet worden. Momenteel wordt daar de `geo:wktLiteral` vertaald naar een string. Dit is niet fout, maar de discussie kan gevoerd worden of dit waardevol is. De conclusie is echter dat dit nog verder onderzocht moet worden. 

### Conclusies

*Beschrijf hier de belangrijkste conclusies:* 



<aside class='note'>
    Conclusies in een mooi tabelletje misschien?
</aside> 

| Kolom-1 | Kolom-2 | Kolom-3 | Kolom 4 | Kolom-n |
|---------|---------|---------|---------|---------|
| Rij-1   |         |         |         |         |
| Rij-2   |         |         |         |         |
| Rij-3   |         |         |         |         |
| Rij-4   |         |         |         |         |
| Rij-5   |         |         |         |         |
| Rij-6   |         |         |         |         |

### Aanbevelingen

*Beschrijf hier de belangrijkste aanbevelingen:* 



<aside class='note'>
    Aanbevelingen in een mooi tabelletje misschien?
</aside> 

| Kolom-1 | Kolom-2 | Kolom-3 | Kolom 4 | Kolom-n |
|---------|---------|---------|---------|---------|
| Rij-1   |         |         |         |         |
| Rij-2   |         |         |         |         |
| Rij-3   |         |         |         |         |
| Rij-4   |         |         |         |         |
| Rij-5   |         |         |         |         |
| Rij-6   |         |         |         |         |

