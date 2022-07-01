# HANDLEIDING MIM-PROFIEL, -TOOLBOX, -MDG GENEREREN

 - _Enterprise 15.2_
 - _SVN 1.14.1_
 - _GitHub_

## Inhoud
 1. Beschrijving doel etc.
 1. Benodigde bestanden
 1. Voorbereiding (todo)
 1. Aanpassingen (todo)
 1. Settings (versienummer, quick linker, etc.)
 1. Profielen genereren
 1. MDG genereren
 1. Resultaat controleren
 1. QuickLinker maken of bewerken (todo)

## Beschrijving
Deze handleiding beschrijft het proces voor het genereren van een customized toolbox voor modelleren met Enterprise Architect. Het gaat specifiek in op het maken van de _MIM-toolbox_. Maar ook voor het genereren customized toolboxen in het algemeen, biedt deze beschrijving een handig overzicht van de benodigde stappen. Een inhoudelijke beschrijving voor het maken van de benodigde profielen, vind je hier ([linkOpnemen](url)). De meest actuele versie van MIM kun je hier ([linkOpnemen](url)) raadplegen.

Er zijn drie stappen in het proces. Het kan zijn dat je 
 1. Voorbereiding
 1. Profiel publiceren
 1. MDG Technology genereren (toolbox)

```diff
NOG VERWERKEN
+ In deze bexchrijving gaan we ervan uit dat de inhoud voor de toolbox al is aangemaakt
+ en dat deze in de juiste packages en dito structuur is opgenomen.
+ Beschrijving inhoudelijke informatie voor het maken van _profile packages_
+ (zelf schrijven en/of verwijzen naar _Sparx_/_profile helpers_)?
```

## Voorbereiding
Controleer voordat je profielen gaat genereren eerst de volgende zaken:

 - Beschik je over de [benodigde bestanden](#benodigde-bestanden)?
 - Zijn de [benodigde profielen](#benodigde-profielen) aanwezig?
 - Is het [versienummer correct ingevuld](#versienummer-toolbox)?

### Benodigde bestanden
Controleer of je beschikt over alle benodigde bestanden:

 - EA-file met MIM profile packages voor het genereren van de profiles en mdg technology ([Create MDG Technology File](https://sparxsystems.com/enterprise_architect_user_guide/15.2/modeling/creatingmdgtechnologies.html)), hiertoe behoren tenminste één `«profile»` _package_, een `«diagram profile»` _package_ en een `«toolbox profile»` _package_ (zie voor meer informatie over ... ([linkOpnemenNaarWelkePackagesPubliceren](url)).
 - MTS-file met MIM properties voor het genereren van MDG Technology ([Working with MTS Files](https://sparxsystems.com/enterprise_architect_user_guide/16.0/modeling_frameworks/working_with_mts_files.html )) 
 - CSV-file met definities van de quick linkers ([Quick Linker Definition Format](https://sparxsystems.com/enterprise_architect_user_guide/16.0/modeling_frameworks/quick_linker_definition_format.html))

De MTS- en CSV-file vind je [hier](https://github.com/Geonovum/MIM-Werkomgeving/tree/master/UML%20profieltooling/werkversie1.1.1).

![](Media/mim_profile_mts_and_csv_file_location.jpg)

### Benodigde profielen
Controleer of je beschikt over alle benodigde profielen:

 - Open met Enterprise Architect het project met de MIM-profielen.
 - Ga in de project browser naar het package `MIM-UMLprofiel`.
 - Controleer of daarin de benodigde _profile packages_ aanwezig zijn:

![](Media/MIM_01_profile_benodigde_profielen.jpg)

 - Controleer of in het _package_ `«profile» MIM` het element `«document» QuickLinker` aanwezig is.

![](Media/mim_profile_quick_linker_location.jpg)

> **NOTE**: Het CSV-bestand van de QuickLinker is een kopie van de informatie die in dit element is opgeslagen. Als je wijzigingen wilt aanbrengen in de QuickLinker, of als er in het model wijzingen zijn doorgevoerd die van invloed zijn op de QuickLinker, kun je die met behulp van het CSV-bestand aanpassen (hier [linkOpnemenNaarQuickLinkerMakenOfBewerken](url) lees je hoe dat moet).

Indien de profielen al in XML-formaat beschikbaar zijn (zie: ([linkOpnemenNaarPackagePublicerenAlsProfiel](url)), klik dan hier ([linkOpnemenGenererenToolbox](url)) om de volgende stap over te slaan en direct te beginnen met het genereren van de toolbox.

### Versienummer Toolbox

Het is handig om een toolbox een versienummer mee te geven. ~~~Hiervoor zijn verschillende manieren. Bovendien is het mogelijk om te kiezen hoever je deze nummering doorvoert.~~~ Hieronder wordt uitgelegd op welke manier de MIM-toolbox van een versienummer wordt voorzien. het belangrijkste uitgangspunt is dat het versienummer van de MIM-toolbox, correspondeert met het versienummer van de bijbehorende MIM-dataspecificatie.

Voor de MIM-toolbox is besloten om het versienummer op verschillende plekken mee te geven:

 - bij [het genereren van de Toolbox](#versienummer-mdg-technology-toolbox)
 - bij [het genereren van het profiel](#versienummer-profiel)
 - als [alias van het _package_](#versienummer-package)
 - _optioneel_: [stereotype in diagram](#versienummer-diagram). Let op: als je dit veranderd, moet je ook het csv-bestand van de _Quick Linker_ aanpassen ([linkOpnemenNaarQuickLinkerMakenOfBewerken](url)).

#### Versienummer _MDG Technology_ (Toolbox)

Dit is het originele versienummer. Als een gebruiker de toolbox importeerd, kan dit teruggevonden worden onder 'Specialize ... etc.'

> **NOTE**: Aanvullen/controleren

#### Versienummer profiel

Profielen waaruit toolbox gegenereerd wordt. Nummer o.a. terug te vinden in XML-bestand. Handig om te weten, omdat er in de loop van de tijd meerdere profielen gemaakt zullen worden. Mocht je dus willen weten welk profiel aan een toolbox ten grondslag ligt, kun je dat in de XML terugvinden.

> **NOTE**: Aanvullen/controleren

#### Versienummer _package_

Als alias van elk package: hierdoor kan de gebruiker van de toolbox in één oogopslag zien met welke versie van de toolbox een modelelement gemaakt is. Dit is vooral heel handig in het dagelijks gebruik. Ook als je twee (versies van) MIM-modellen wilt vergelijken, geef je de gebruiker via deze plek snel inzicht in de gebruikte MIM-versie.

> **NOTE**: Aanvullen/controleren


#### Versienummer diagram

Binnen MIM heeft dit (nog) geen versienummer. Indien gewenst, zou dat via de naam van dit stereotype kunnen. De MIM-dataspecificatie zegt niets over een diagram.

> **NOTE**: Aanvullen/controleren

## Profiel publiceren

### X | STAP 1: PUBLICEER "PACKAGE" ALS UML PROFIEL
 - Kies package MIM-UML profiel.
 - Selecteer vervolgens één van de bovengenoemde profielen.
 - Ga naar: _Specialize_.
 - Kies _Publish Package as UML Profile_.
 - En klik op: _Publish Pack As UML profile_.
 - Er verschijnt nu een nieuw venster.

![](Media/MIM_03_publish_as_UML_or_MDG.jpg)

 - Voer _profile name_ in: _MIM_.
 - Kies de locatie waar je het profiel wilt opslaan en geef het bestand een herkenbare naam 
 - Voer het versienummer van MIM in waar deze toolbox mee moet kloppen, version: `<versienummer>` (bijv.:`1.1.1`).

![](Media/MIM_02_profile_publish_as_uml_settings.jpg)

Let op er zijn twee belangrijke voorwaarden
 > **opm.**: [**CONTROLEREN**]De profile name moet overeenkomenm met de naam van het package.
Verder lijkt het erop of «profile» MIM en «toolbox profile» MIM niet alleen overeen moeten komen met de naam van het package, maar eveneens onderling ... 

1. De vier keuze-packages moeten een unieke naam hebben bij profile name (bijv. "MIM_Keuzeattribuut")
2. Het basisprofiel <naam> (iets van «profile» MIM), moet bij profile name dezelfde naam hebben als «toolbox profile» MIM

 > **opm**: ~zorg dat profile name en version overal exact hetzelfde zijn, anders werkt het profiel niet~. Dit kan eventueel met een XML-editor gerepareerd worden, maar voorkomen is beter dan genezen.

In MIM-toolbox diagram kun je aan de prefixen zien, wat de profile names moeten zijn
Als je diagram rtoevoegd moet je drie stappen doorlopen bij het selecteren van profielen

 - Klik: "Save"
 - Herhaal dit proces voor alle bovengenoemde onderdelen (dus ook voor toolbox profile)

 >**Let op**: de toolbox moet samengesteld worden uit verschillende profielen (lijst). Het 'basisprofiel' is ... en dat moet dezelfde naam hebb

## X | STAP 2: GENEREER MDG TECHNOLOGIE
 - Selecteer vervolgens het package waaronder alle subpackages vallen
 - Ga weer naar "Specialize"
 - Kies: "Publish Package"
 - Kies: "Generate MDG Technology"

![](Media/MIM_03_publish_as_UML_or_MDG.jpg)

 - Kies Volgende
 - Kies 'Open an existing MTS file'
 - Negeer de melding
 
 > **Opm**: De MTS file vult een aantal standaard configuraties vooraf in, maar je kunt deze tijdens het proces nog aanpassen.

 - Vanuit MTS file wordt het volgende venster al ingevuld
 - Technology: MIM
 - Filename: ingevuld, maar kun je zelf kiezen
 - ID: MIM
 - Version: 1.1.1

![](Media/MIM_04_mdg_tech.jpg)

 > **Opm**: deze twee moeten dus kloppen met stap x in packages publiceren

 - Icon en logo blijven vooralsnog leeg.
 - URL: link naar corresponderende MIM-documentatie op GitHub/ReSpec.
 - Support, link naar website Geonovum.
 - Notes: Vul in het notes veld kort release notes in: wat is er nieuw/aangepast.
 - Klik 'Volgende'
 - Controleer de instellingen en klik op 'Ok'

![](Media/MIM_05_mdg_tech.jpg)

 > **Opm**: In het metaprofiel zitten profiles en toolboxes

 - Alle configuraties kun je laden vanuit de MTF file.
 - Voor de eerste keer kun je ook een MTS-file genereren.
 - Select:  "Files To Be Included As Profiles".
 - Kies hier alle xml-bestanden, behalve de toolboxprofile.
 - Klik 'Volgende'.

![](Media/MIM_06_mdg_tech.jpg)

 - Select: "Files To Be Included As Diagrams"
 - Kies hier het diagram profiel
 - Klik 'Volgende'.

![](Media/MIM_07_mdg_tech.jpg)

 - In de volgende stap selecteer je tot slot het toolbox profiel.

![](Media/MIM_08_mdg_tech.jpg)

 - Klik 'Volgende'.
 - Check de box "Save to MTS" en klik op 'Voltooien'
 - Indien je wijzigingen in de configuratie hebt aangebracht:
 - Kies checkbox  "Save To Mts"

![](Media/MIM_09_mdg_tech.jpg)

 - Klik: "Voltooien"

## X | STAP 3: TEST DE TOOLBOX
 - Laad het MIM-profiel via "Resources"
 - maar er is een EAP-testf file
 - Verschillende manieren om de nieuwe toolbox te testen
 - Een model bouwen met alle MIM-mogelijkheden erin
 - Of: een nieuwe toolbox laden en update van het bestaande model uitvoeren
 - En dat kan door MIM metaklassen te slepen
 - Of door gebruik te maken va "Sync Tagged Values And Constraints"
 - Deze laatste optie vind je terug in het "Resources" menu

## X | MIM_MDG
 - profile helpers, model wizard: https://sparxsystems.com/enterprise_architect_user_guide/15.2/modeling/using_the_profile_helpers.html
 - Create Diagram Profiles using the Profile Helpers:https://sparxsystems.com/enterprise_architect_user_guide/15.2/modeling/create_diagram_profiles_using_.html
 - Morgen weer verder!

## X | Aandachtspunt
 - Tekstveld voor teolichting, niet initial value, maar notes veld als datatype
 - Uitgebreide toelichting wordt afgekapt vanwege maximale lengte.
 - Profiel niet elke keer opnieuw moeten laden door het kopppelen aan een (std.) diagram
 - MIM 1.1 build 1
 - Vorige versie had ook zo'n naam, dit kun je op website of github terugvinden. gaat om de naam van de het XML