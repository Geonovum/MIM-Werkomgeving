#### Was:

#### Union

>   **Definitie Union**

>   Gestructureerd datatype, waarmee wordt aangegeven dat er meer dan één
>   mogelijkheid is voor het datatype van een attribuut. Het attribuut zelf
>   krijgt als datatype de union. De union biedt een keuze uit verschillende
>   datatypes, elk afzonderlijk beschreven in een union element.

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Union LineOrPolygon. Deze biedt een keuze uit Union element Line of Union element Polygon.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#### Union element

>   **Definitie Union element**

>   Een type dat gebruikt kan worden voor het attribuut zoals beschreven in de
>   definitie van Union. Het union element is een onderdeel van een Union,
>   uitgedrukt in een eigenschap (attribute) van een union, die als keuze binnen
>   de Union is gerepresenteerd..

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Union element Line en union element Polygon zijn beiden onderdeel van Union LineOrPolygon.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#### WORDT

#### Keuze

>   **Definitie Keuze**

Gestructureerd data type zonder identiteit waarvan precies één van de
eigenschappen aanwezig is in elke instantie. Elke eigenschap representeert een
keuze optie. Een keuze kent vier verschillende keuzetypen: een keuze uit
verschillende attributen, keuze uit verschillende datatypes, keuze uit
verschillende relaties en een keuze uit verschillende relatietargets.

#### Keuze element

>   **Definitie Keuze element**

>   Het attribuut dat gebruikt wordt voor de eigenschap zoals beschreven in de
>   definitie van Keuze. Het keuze element is een onderdeel van een klasse met
>   het stereotype Keuze, uitgedrukt in een attribute van die klasse.

Toelichting op het gebruik van Keuze:

Het stereotype \<\<Keuze\>\> wordt gebruikt voor het modelleren van keuze opties
op het niveau van attributen en relaties van een objectype. Deze keuze opties
kunnen ook met constraints gemodelleerd worden. Het gebruik van het stereotype
\<\<Keuze\>\> als alternatief voor constraints maakt de keuze optie leesbaarder
in het model en specifieke keuzes worden herbruikbaar in het model. Tevens
kunnen er gestandaardiseerde encodingregels voor het stereotype opgesteld en
toegepast worden.

Het stereotype \<\<Keuze\>\> kent vier keuzetypen. Elk keuzetype betekent
conceptueel iets anders.

1.  keuze tussen twee of meer attributen die onder één hoofdattribuut vallen

2.  keuze tussen twee of meer datatypen die bij één attribuut horen

3.  keuze tussen twee of meer relaties die bij één objecttype horen

4.  keuze tussen twee of meer relatietargets die bij één relatie horen.

De vier keuzetypen worden gespecificeerd met een specifieke waarde voor een
tagged value ‘keuzetype’. Encodingregels moeten hier rekening mee houden.

**1) Keuze tussen twee of meer attributen die onder één hoofdattribuut vallen.**

(tagged value ‘keuzetype”= attribuut)

Voorbeeld:

![](media/b75942dcd0f4f963bb8275f5a8a86990.png)

Een objecttype persoon heeft een attribuut telefoonnummer. Het telefoonnummer is
het privenummer of werknummer.

Conceptueel zijn de attributen telefoonnummer, privenummer en werknummer van
belang deze zullen daarom ook in een technische omgeving geimplementeerd moeten
worden.

**2) Keuze tussen twee of meer datatypen die bij één attribuut horen**

(tagged value ‘keuzetype’= datatype)

Voorbeeld:

![](media/6dbedf94f96eb5bc5492baa5051dbea3.png)

Een objecttype Gebouw heeft een attribuut geometrie. Het geometrietype kan punt
(GM_Point) of vlak (GM_Surface) zijn. Het attribuut geometrie heeft in dit geval
als datatype de \<\<Keuze\>\> PuntOfVlak met twee attributen
puntgeometrie.GM_Point en vlakgeometrie.GM_Surface.

In het conceptuele model hebben het PuntOfVlak en de beide attribuutnamen geen
betekenis en zijn alleen om de datatype GM_Surface en GM_Point te koppelen aan
het attribuut geometrie. In een technische omgeving moeten ze daarom niet
geimplementeerd worden.

**3) Keuze tussen twee of meer relaties die bij één objecttype horen.**

(tagged value ‘keuzetype’= relatie)

Voorbeeld:

**4) Keuze tussen twee of meer relatietargets die bij één relatie horen.**

(tagged value ‘keuzetype”= relatietarget)

Voorbeeld:

![](media/a75fa4af24bda1a90df44440d9548373.png)

Een objecttype JuridischDocument heeft een relatie ‘betreft rechtspersoon’ naar
of een objecttype NatuurlijkPersoon of een objecttype NietNatuurlijkPersoon.

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
