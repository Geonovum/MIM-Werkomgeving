# Handleiding - Importeren en toepassen MIM-toolbox in Enterprise Architect

| Software/Standaard | Versie |
| --------------------- | :-------------- |
| MIM-standaard         | 1.1.1           |
| MIM-toolbox           | 1.1.1, build 5  |
| Enterprise Architect  | 15.2            |
| Subversion (SVN)      | 1.14.1          |

## Inhoud
 1. [Importeren MIM-toolbox](#1-importeren-mim-toolbox)
 1. [Toepassen MIM-diagram](#2-toepassen-mim-diagram)
 1. [Toepassen Quick Linker](#3-toepassen-quick-linker)
 1. [Toepassen toolbox-item 'Relatierol'](#4-toepassen-toolbox-item-relatierol)
 1. [Updaten MIM-versie in bestaand informatiemodel](#5-updaten-mim-versie-in-bestaand-informatiemodel)
 1. [Verwijderen oudere toolbox](#6-verwijderen-oudere-toolbox)
 1. [Toolboxen beheren](#7-toolboxen-beheren)

## 1: Importeren MIM-toolbox

 - [Download het XML-bestand](https://register.geostandaarden.nl/informatiemodel/mim/1.1.1/) van de MIM-toolbox: `MDG_MIM_Toolbox_v1.1.1_build05.xml`.
 - Verwijder eventueel eerst de oudere versie van de toolbox als je die niet meer nodig hebt ([Toolbox verwijderen](#5-verwijderen-oudere-toolbox)).
 - Open Enterprise Architect
 - Open '_Resources_'
    - Kies rechts in beeld op '_Portals_', of direct op het gelijknamige tablad in de '_Project Browser_'
    - Selecteer in het dropdown-menu '_Windows_'
    - Kies '_Resources_' (onder '_Explore_')

![](Media/mim_import_find_resources.jpg)

 - Klik op '_MDG Technologies_'

![](Media/mim_import_find_mdg_tech.jpg)

> **Note**<br>
> Hier moet je de keuze maken of je de toolbox op model- of gebruikersniveau importeert. Beide hebben voor- en nadelen:
>  - **Model**: alleen te gebruiken binnen één EA-project. Voor elke project moet je apart de toolbox importeren. Indien je dit project met een andere gebruiker deelt, beschikt deze gebruiker ook over de toolbox. Dit is de **aanbevolen optie**. Dit geeft de minste kans op conflicten. 
>  - **User**: Je hoeft de toolbox slechts éénmalig te importeren. Vervolgens is de toolbox automatisch beschikbaar voor alle EA-projecten waar je als gebruiker aan werkt. Het nadeel is dat bij het delen van projecten de toolbox niet mee komt. Bovendien kunnen er conflicten tussen toolboxen ontstaan (zie: volgende informatiekader).

 > **Warning**<br>
 > Indien binnen jouw EA-omgeving ook een toolbox van een extensie op het MIM aanwezig is (bijvoorbeeld voor de BRO), dan is het raadzaam om de toolboxen alleen op model-niveau te importeren. Indien tenminste één van de twee op user-niveau is geïmporteerd, kan dit bij het toewijzen van stereotypen verwarring opleveren. Veel stereotypen hebben exact dezelfde naam en voor EA is het dan onduidelijk welke _MDG Technology_ het moet kiezen. De bovenstaande aanpak houdt de werkwijze zuiverder.

 - Klik met de rechtermuisknop op '_Model Technologies_' of '_User Technologies_'.

![](Media/mim_import_choose_type.jpg)

 - Selecteer '_Import technology_'.
 - Zoek het gedownloade XML-bestand van de MIM-toolbox op en kies '_Openen_'.
    - Overigens kun je ook in dit venster nog kiezen tussen '_model_' of '_user_'.
    - Op welke plek je de keuze maakt voor '_model_' of '_user_', maakt geen verschil.
 - De velden '_Technology_', '_Version_' en '_Notes_' worden nu automatisch ingevuld met de juiste informatie.
 - Controleer het versienummer: `Version: 1.1.1`.

![](Media/mim_import_to_model.jpg)

 - Klik '_Ok_'
 - Navigeer in het '_Resources_' naar '_MDG Technologies_' > '_Model Technologies_'.
 - Controleer of hier nu een map met de naam '_MIM_' staat.
 - Controleer ook of het MIM-versienummer klopt bij '_UML Profiles_', '_Diagram Types_' en '_Toolboxes_'.

![](Media/mim_import_to_model_succesful.jpg)

 - Bij een _user import_ zal er nog een venster verschijnen met de tekst '_Copy succesfull_'.
 - De MIM-toolbox is nu beschikbaar  voor gebruik, maar het is raadzaam om eerst de volgende instructies door te nemen: 
 - Instructie voor het [gebruik van het MIM-diagram](#2-toepassen-mim-diagram).
 - Instructie voor het [gebruik van de Quick Linker](#3-toepassen-quick-linker).
 - Instructie voor het [gebruik van toolbox-item «Relatierol»](#4-toepassen-toolbox-item-relatierol).

 > **Warning**<br>
 > De MIM-toolbox heeft een versienummer. Deze staat niet in de naam. Indien je besloten hebt om oudere versies van de MIM-toolbox niet te verwijderen, komt de naam 'MIM' mogelijk meerdere malen voor. Het [beheren van toolboxen](#6-toolboxen-beheren) in Enterprise Architect doe je op deze manier.

## 2: Toepassen MIM-diagram

In voorgaande versies werd de MIM-toolbox toegepast op een standaard UML diagram (`UML::Class`). Dat kan nog steeds. Dit heeft echter één nadelige eigenschap. Als je in je project met meerdere diagrammen werkt, kan het voorkomen dat bij het wisselen tussen diagrammen de toolbox terugspringt op de standaard UML-toolbox. Hierdoor moet je de MIM-toolbox opnieuw opzoeken.

Dit probleem wordt veroorzaakt doordat een diagram en een toolbox aan elkaar gekoppeld zijn. Daarom is in versie 1.1.1 van de MIM-toolbox een speciaal MIM-diagram aangemaakt waaraan de toolbox gekoppeld is. Dit diagram is een directe afgeleide van het standaard '_UML Class diagram_'. Hieronder staat uitgelegd hoe je dit kunt toepassen.

 - Ga in de '_Project Browser_' naar '_Project_'.
 - Selecteer een package.
 - Klik op het diagramlogo om een nieuw diagram aan te maken.

![](Media/mim_diagram_create.jpg)

 > **Warning**<br>
 > Dit kan alleen als je onder model in de _Project browser_ al een package hebt aangemaakt. Als je dat nog niet hebt, maak dan eerst een (nieuw) package aan.

 - Er opent nu een venster.
 - Geef het diagram een naam.
 - Klik op het dropdown-menu bij '_Type_'.
 - Selecteer '_Specialized_' > '_User Technologies_' of '_Model Technologies_' (afhankelijk van de manier waarop je de [toolbox geimporteerd](#1-importeren-mim-toolbox) hebt).

![](Media/mim_diagram_find_mim.jpg)

 - Klik in het deelvenster '_Select From_' op '_MIM 1.1.1_'.

![](Media/mim_diagram_select_tech.jpg)

 - Nu verschijnt in het deelvenster '_Diagram Types_' het '_MIM Diagram_'.
 - Selecteer het diagram en klik op '_Ok_'.

 > **Note**<br>
 > Het is belangrijk dat je het diagram daadwerkelijk selecteert. Je kunt herkennen of dit gelukt is, doordat in het onderste deelvenster een toelichtende tekst op het diagram verschijnt (anders staat er alleen 'MIM').

![](Media/mim_diagram_select_diagram.jpg) 

 - De MIM-toolbox verschijnt nu in het toolbox-menu.

![](Media/mim_diagram_toolbox_menu.jpg)

 - Dubbelklik in de '_Project browser_' op het nieuwe diagram.
 - In het venster '_Properties_' zie je dat het diagram van het type '_MIM_' is.

![](Media/mim_diagram_final_check.jpg)

Het MIM-versienummer komt nu ook terug het veld Stereotype in het venster '_Properties_' van het object.
 - Maak een objecttype "A" aan.
 - Controleer vervolgens in de het venster '_Properties_' of in de naam van het stereotype het betreffende MIM-versienummer verschijnt.
 - Tevens verschijnt er in dit venster een deelmenu met de titel '_«Objecttype» ( from MIM 1.1.1 - Basiselementen )_'
 - Als dit klopt, is de toolbox correct geïmporteerd.

![](Media/mim_modelelement_versienummer.jpg)

## 3: Toepassen Quick Linker

De Quick Linker is een hulpmiddel om snel en eenvoudig relaties te kunnen leggen tussen verschillende elementen. Het voordeel hiervan is dat het de gebruiker inzicht geeft in de volgens MIM toegestane relaties. De Quick Linker is beschikbaar via een icoontje dat rechtsboven een diagramelement verschijnt op het moment dat je het selecteert.

![](Media/mim_ql_icon.jpg)

Je kunt de Quick Linker op drie manieren inzetten, namelijk voor het:

 - [Verbinden van twee bestaande modelelementen](#31-verbinden-bestaande-modelelementen)
 - [Creëren van nieuwe modelelementen](#32-nieuw-modelelement)
 - [Creëren van meerdere modelelemten tegelijk](#33-meerdere-nieuwe-modelelementen)

Hieronder beschrijven we elke methode afzonderlijk.

### 3.1 Verbinden bestaande modelelementen
 - Klik met de muis op het icoon.
 - Houd de muisknop ingedrukt en trek een lijn naar het object waarmee je het wilt verbinden.
 - Er verschijnt een stippellijn en een menu.

![](Media/mim_ql_connect_elements.jpg)

 - Selecteer het gewenste type MIM-relatie (bijvoorbeeld: `«Generalisatie»`.

![](Media/mim_ql_generalization.jpg)

### 3.2 Nieuw modelelement
Je kunt ook vanuit een bestaand element een nieuw modelelement creëren. Dat gaat als volgt:

 - Klik met de muis op het icoon.
 - Houd de muisknop ingedrukt en trek een lijn naar een lege plek in het diagram.
 - Er verschijnt een stippellijn en een menu.

![](Media/mim_ql_draw_relation.jpg)

 - Dit menu ziet er anders uit dan bij het verbinden van twee bestaande elementen.
 - Navigeer naar '_MIM_' en selecteer het gewenste type MIM-relatie (bijvoorbeeld: `«Generalisatie»`)

![](Media/mim_ql_generalization.jpg)

### 3.3 Meerdere nieuwe modelelementen
Ook is het mogelijk om vanuit een bestaand element meerdere én verschillende soorten modelelementen in één keer te creëren. Dat gaat als volgt:

 - Klik met de muis op het icoon.
 - Houd de muisknop ingedrukt en trek een lijn naar een lege plek in het diagram.
 - Er verschijnt een stippellijn en een menu.

![](Media/mim_ql_create_multiple.jpg)

 - Navigeer naar '_Create Multiple Elements_'.
 - Er verschijnt een nieuw venster.

![](Media/mim_ql_define_multiple.jpg)

 - Defineer in dit venster de elementen in de eerste kolom ('_Name_') en selecteer het gewenste type relatie in de derde kolom ('_Type_').
 - Klik op '_Ok_' als je klaar bent.

![](Media/mim_ql_result_multiple.jpg)

## 4: Toepassen toolbox-item 'Relatierol'

Net als alle andere modelelementen uit de MIM-toolbox, kun je ook de `«Relatierol»` in het diagram slepen. Je doet dit door een `«Relatierol»` naar uiteinde van een reeds bestaande `«Relatiesoort»` te slepen. Wanneer je in EA het stereotype `«Relatierol»` toewijst aan een relatie, worden de bijbehorende '_Tagged Values_' automatisch meegenomen.

> **Note**<br>
> In eerdere versies van de MIM1.1.1-toolbox ontbraken de _Tagged Values_ bij de `«Relatierol»` na toewijzing. Dit is opgelost in build 5: [`MDG_MIM_Toolbox_v1.1.1_build05`](https://register.geostandaarden.nl/informatiemodel/mim/1.1.1/).

 - Indien je twee modelelementen met elkaar verbindt door middel van een `«Relatiesoort»`, kun je de `«Relatierol»` aan de _target end_ (of de _source end_) toevoegen door middel van het toolbox-item `«Relatierol»`.
 - Klik op het toolbox-item `«Relatierol»` en sleep het item met de muisknop ingedrukt naar de _target end_ van de associatie en laat hier de muisknop weer los.
 - Er verschijnt een popup-venster.

![](Media/mim_relatierol_name.jpg)

 - Vul bij '_Enter value_' de naam van de `«Relatierol»` in en klik op '_Ok_'.
 - Klik vervolgens in het '_Properties_' venster op het '_Target_' tabblad.
 - Vervolgens zie je de bijbehorende _Tagged Values_ voor [alternatief 1](https://docs.geostandaarden.nl/mim/mim/#relatiesoort-is-leidend-alternatief-1) of [alternatief 2](https://docs.geostandaarden.nl/mim/mim/#relatierol-is-leidend-alternatief-2).

## 5: Updaten MIM-versie in bestaand informatiemodel

Er zijn verschillende situaties denkbaar waarin je één of meerdere type modelelementen van een informatiemodel wilt updaten. Bijvoorbeeld omdat er een bug-fix is geweest. Zoals hierboven beschreven, kreeg een `«Relatierol»` in de eerste versies van de MIM1.1.1-toolbox (build01-build04) geen _Tagged Values_ mee. Maar het kan ook zijn dat je alle modelelementen in een model naar de nieuwste versie van toolbox wilt updaten. Hiervoor moet je het stereotype (het modelelement) synchroniseren. De volgende stappen beschrijven hoe dat werkt.

[Verwijder de oude toolbox](#6-verwijderen-oudere-toolbox) eerst en [importeer vervolgens de nieuwe versie](#1-importeren-mim-toolbox). Doorloop daarna de volgende stappen. Hieronder gebruiken we het updaten van `«Relatierol»` als voorbeeld, maar je kunt dit voor elk gewenst modelelement uit de toolbox toepassen.

![](Media/mim_relatierol_target_menu.jpg)

 - Ga naar het toolbox-item `Relatierol` en klik hier met de rechtermuisknop op.

![](Media/mim_relatierol_sync_select.jpg)

 - Klik op '_Synchronize Stereotype_'.
 - Er opent een nieuw venster
 - Hierin staat in het veld '_stereotype_' `Relatierol` al geselecteerd.
 - Klik op '_Ok_'.

![](Media/mim_relatierol_sync_menu.jpg)

 - Er verschijnt een popup-venster dat vraagt: '_Save latest changes?_', klik '_Ja_'.
 - De tagged values zijn nu gesynchroniseerd.

![](Media/mim_relatierol_sync_saved.jpg)

Herhaal bovenstaande stappen als je ook andere modelelementen wilt updaten. 

## 6: Verwijderen oudere toolbox
Deze instructie is bedoeld voor het verwijderen van toolboxen die je niet meer wilt gebruiken. Bijvoorbeeld oudere versies van de MIM-toolbox.

 - Open Enterprise Architect
 - Open '_Resources_'
 - Kies rechts in beeld op '_Portals_'
 - Selecteer in het dropdown-menu '_Windows_'
 - Kies '_Resources_' (onder '_Explore_')
 - Klik op '_MDG Technologies_'
 
 Controleer nu of er onder '_Model Technologies_' en/of '_User Technologies_' toolboxen staan die je niet meer wilt gebruiken.

 - Verwijderen '_Model Technologies_'
    - Klik met de rechtermuisknop op de toolbox en selecteer '_Remove technology_'
    - Start hierna voor de zekerheid EA opnieuw op.
 - Verwijderen '_User Technologies_'
    - Klik met de rechtermuisknop op de toolbox en selecteer '_Locate Technology_'. 
    - Verwijder het XML-bestand van de toolbox op deze locatie
    - Start hierna voor de zekerheid EA opnieuw op.
    - Ga verder met het [importeren van de MIM-toolbox](#1-importeren-mim-toolbox).

## 7: Toolboxen beheren
 - Ga naar de menubalk boven in beeld en selecteer '_Specialize_' > '_Manage-Tech_'
 - Hier vind je een overzicht van alle aanwezige MDG-technologies.
 - Scroll naar beneden en zoek '_MIM_' op.
 - Indien je meerdere versies van de toolbox geïmporteerd hebt, vind je die hier terug.
 - Klik op één van de versies voor meer informatie.
 - In het informatievenster rechtsboven zie je welke versie het betreft. Tevens vind je hier terug of de toolbox op model- of gebruikersniveau is geïmporteerd.
 - Met het checkbox in de kolom '_Enabled_' kun je ervoor kiezen om bepaalde bepaalde toolboxen uit te zetten. Dit doe je door het vinkje te verwijderen.
 - Ga verder met de laatste stappen van het [importeren van de MIM-toolbox](#1-importeren-mim-toolbox).

 > **Warning**<br>
 > Indien je toolboxen gebruikt met gelijknamige modelelementen, bijvoorbeeld oudere MIM-toolboxen of NEN3610 BRO Grouping-NL (dat een extensie is op MIM), dan kan dit leiden tot een verwijzing naar het 'verkeerde' profiel. Enterprise Architect doet dit automatisch. Hierdoor beschikt het stereotype bijvoorbeeld niet over de gewenste tagged values.

## 8: Workspaces gebruiken

> **Note**<br>
> Onderstaande tekst is nog in concept

> **Warning**<br>
> Dit onderwerp hoort niet in deze handleiding thuis, maar in handleiding over EA. Het kan wel handig zijn om vanuit deze handleiding ernaar te verwijzen.

### 8.1 Overzicht handige vensters bij het modelleren

 - Project Browser
 - Resources
 - Notes
 - Tagged Values
 - Features
 - Pan & Zoom
 - Relationships
 - Relationship Matrix

### 8.2 Waar je ze vindt

Ga allereerst naar
Klik rechtsboven op _Portals_ en selecteer _Windows_.

De venster uit 8.1 vind je terug in de volgende deelmenu's:

Explore
 - _Project Browser_
 - _Resources_

Properties
 - _Properties_
 - _Notes_
 - _Tagged Values_
 - _Features_

Diagram
 - _Pan & Zoom_

Trace
 - _Relationships_
 - _Relationship Matrix_

### 8.3 En hoe je een workspace maakt en waarom dat handig kan zijn


