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

#### Wordt:

NEN 3610:

| union | Klasse | Gestructureerd data type zonder identiteit waarvan precies één van de eigenschappen aanwezig is in elke instantie. [ISO/TS 19103:2005] |
|-------|--------|----------------------------------------------------------------------------------------------------------------------------------------|


iso19103:

\<\<Union\>\> is a type consisting of one and only one of several alternative
datatypes (listed as member attributes). This is similar to a discriminated
union in many programming languages. In some languages using pointers, this
requires a “void” pointer that can be cast to the appropriate type as determined
by a discriminator attribute.

INSPIRE:

| stereotype | modelelement | Description                                                                                                                        | Tagged value                   | Description                                                                                                                                                                                                                                                                                    |
|------------|--------------|------------------------------------------------------------------------------------------------------------------------------------|--------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| union      | Class        | A structured data type without identity where exactly one of the properties of the type is present in any instance. [ISO/TS 19103] | xsdEncodingRule noPropertyType | XML Schema encoding rule to apply (iso19136_2007, iso19136_2007_INSPIRE_Extensions or iso19139_2007) [D2.7] Suppress creation of a standard property type that supports inline or by-reference encoding (applies to ISO 19136:2007 encoding rule). Always set to false in INSPIRE. [ISO 19136] |

De definitie van ISO 19103 is mij niet duidelijk genoeg. De definitie van
INSPIRE wel. Dit is ook de manier waarop de union in NEN 3610 wordt toegepast.
Interessant is de opgenomen tagged value ‘noPropertyType’. Al weet ik niet
precies wat hiermee wordt bedoeld. Voor INSPIRE en NEN 3610 staat die altijd op
false. Het zou kunnen zijn dat men bedoelt dat er geen geneste structuur wordt
aangebracht. Dat zou wijzen op een keuze tussen datatypes ipv attribuuttypes.

Voorstel:

\- vertaal MIM 1.0.1 \<\<Union\>\> naar MIM 1.1 \<\<Keuze\>\>

\- Breidt de MIM 1.1 \<\<Keuze\>\> toepassing uit. Voor de volgende drie
toepassingen:

1.  keuze tussen: attributen die onder één hoofdattribuut vallen

2.  keuze tussen: datatypen die bij één attribuut horen

3.  keuze tussen: associatietargets die bij één associatie horen

Geef met een tagged value aan welke van de drie toegepast wordt. Afhankelijk van
de toepassing betekent het conceptueel iets anders. Encoding regels moeten hier
rekening mee houden.

Uitwerking:

#### Union

>   **Definitie Union**

Gestructureerd data type zonder identiteit waarvan precies één van de
eigenschappen aanwezig is in elke instantie. De union kent drie verschillende
keuze typen: een keuze uit verschillende attributen, uit verschillende datatypes
of keuze uit verschillende target objectypen die met één relatie gerelateerde
worden. Elk keuze-element is afzonderlijk beschreven in een union-element.

Keuze uit attributen: (tagged value ‘keuzetype”= attribuut

Voorbeeld:

![](media/b75942dcd0f4f963bb8275f5a8a86990.png)

Een objecttype persoon heeft een attribuut telefoonnummer. Het telefoonnummer is
het privenummer of werknummer.

Conceptueel zijn de attributen privenummer en werknummer van belang deze zullen
daarom ook in een technische omgeving geimplementeerd moeten worden.

Keuze uit datatypen: (tagged value ‘keuzetype’= datatype

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

Keuze uit verschillende target objecttypen met één relatie.

Voorbeeld:

![](media/a75fa4af24bda1a90df44440d9548373.png)

Een objecttype JuridischDocument heeft een relatie ‘betreft rechtspersoon’ naar
of een objecttype NatuurlijkPersoon of een objecttype NietNatuurlijkPersoon.

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
