# Handleiding voor het importeren van de MIM-toolbox in Enterprise Architect
MIM-versie: 1.1.1

Enterprise Architect versie: 15.2



## Importeren MIM-toolbox
 - [Download het XML-bestand](https://register.geostandaarden.nl/informatiemodel/mim/) van de MIM-toolbox: `MDG_MIM_Toolbox_v1.1.1_build01.xml`.
 - Verwijder eventueel eerst de oudere versie van de toolbox als je die niet meer nodig hebt ([Toolbox verwijderen](#verwijderen-oudere-toolboxen)).
 - Open Enterprise Architect
 - Open '_Resources_'
    - Kies rechts in beeld op '_Portals_'
    - Selecteer in het dropdown-menu '_Windows_'
    - Kies '_Resources_' (onder '_Explore_')

      <figure>
         <img src="Media/mim_import_find_resources.jpg" alt="find resources menu">
      </figure>      

 - Klik op '_MDG Technologies_'
      <figure>
         <img src="Media/mim_import_find_mdg_tech.jpg" alt="find mdg Technologies">
      </figure>    

 > **Let op**: hier moet je de keuze maken of je de toolbox op model- of gebruikersniveau importeert. Beide hebben voor- en nadelen: 
 >  - **Model**: alleen te gebruiken in het huidige EA-project. Voor elke nieuw project moet je de toolbox opnieuw importeren.
 >  - **User**: te gebruiken in alle EA-projecten. Je hoeft de toolbox slechts éénmalig te importeren.

 > **Tip!** Indien binnen jouw EA-omgeving ook een toolbox van een extensie op het MIM aanwezig is (bijvoorbeeld voor de BRO), dan is het raadzaam om de toolboxen alleen op model-niveau te importeren. Indien tenminste één van de twee op user-niveau is geïmporteerd, kan dit bij het toewijzen van stereotypen verwarring opleveren. Veel stereotypen hebben exact dezelfde naam en voor EA is het dan onduidelijk welke het moet kiezen. De bovenstaande aanpak houdt de werkwijze zuiverder.  

 - Klik met de rechtermuisknop op '_Model Technologies_' of '_User Technologies_'.
 - Selecteer '_Import technology_'.
 - Zoek het gedownloade XML-bestand van de MIM-toolbox op en kies '_Openen_'.
 - Bij een _user import_ zal er nog een venster verschijnen met de tekst '_Copy succesfull_'.
 - De MIM-toolbox is nu beschikbaar  voor gebruik, maar het is raadzaam om eerst de volgende instructies door te nemen: 
 - Instructie voor het [gebruik van het MIM-diagram](#gebruik-mim-diagram).
 - Instructie voor het [gebruik van de Quick Linker](#gebruik-quick-linker).
 - Instructie voor het [gebruik van toolbox-item «Relatierol»](#gebruik-toolbox-item-relatierol).

 > **Let op**: de MIM-toolbox heeft een versienummer. Deze staat niet in de naam. Indien je besloten hebt om oudere versies van de MIM-toolbox niet te verwijderen, komt de naam 'MIM' mogelijk meerdere malen voor. Het [beheren van toolboxen](#toolboxen-beheren) in Enterprise Architect doe je op deze manier.

## Gebruik MIM-diagram

In voorgaande versies werd de MIM-toolbox toegepast op een standaard UML diagram (`UML::Class`). Dat kan nog steeds. Dit heeft echter één nadelige eigenschap. Als je in je project met meerdere diagrammen werkt, kan het voorkomen dat bij het wisselen tussen diagrammen de toolbox terugspringt op de standaard UML-toolbox. Hierdoor moet je de MIM-toolbox opnieuw opzoeken.

Dit probleem wordt veroorzaakt doordat een diagram en een toolbox aan elkaar gekoppeld zijn. Daarom is in versie 1.1.1 van de MIM-toolbox een MIM-diagram aangemaakt waaraan de toolbox gekoppeld is. Dit diagram is een directe afgeleide van het standaard '_UML Class diagram_'. Hieronder staat uitgelegd hoe je dit kunt toepassen.

 - Ga in de '_Project Browser_' naar '_Project_'.
 - Klik op het diagramlogo om een nieuw diagram aan te maken .

 > **Let op**: dit kan alleen als je onder model al een package hebt aangemaakt. Als je dat nog niet hebt, maak dan eerst een nieuw package aan.

 - Geef het diagram een naam.
 - Klik op het dropdown-menu bij '_Type_'.
 - Selecteer '_Specialized_' > '_User Technologies_' of '_Model Technologies_' (afhankelijk van de manier waarop je de [toolbox geimporteerd](#importeren-mim-toolbox) hebt).
 - Klik in het deelvenster '_Select From_' op de '_MIM-toolbox_'.
 - Nu verschijnt in het deelvenster '_Diagram Types_' het '_MIM-diagram_'.
 - Selecteer het diagram en klik op '_Ok_'.

 > **Let op**: het is belangrijk dat je het diagram daadwerkelijk selecteert. Je kunt herkennen of dit gelukt is, doordat in het onderste deelvenster een toelichtende tekst op het diagram verschijnt (anders staat er alleen 'MIM').

 - De MIM-toolbox verschijnt nu in het toolbox-menu.
 - Dubbelklik in de '_Project browser_' op het nieuwe diagram. 
 - In het venster '_Properties_' zie je dat het diagram van het type '_MIM_' is. 

## Gebruik Quick Linker

De Quick Linker is een handige manier om snel en eenvoudig relaties te leggen tussen verschillende elementen. Je kunt de Quick Linker op drie manieren inzetten. Hieronder beschrijven we elke methode afzonderlijk.

### Verbinden twee bestaande modelelementen
....nog schrijven....

### Nieuw modelelement creëren
....nog schrijven....

### Meerdere nieuwe modelelementen creëren
....nog schrijven....

## Gebruik toolbox-item Relatierol

(korte toelichting schrijven)

 - Indien je twee modelelementen met elkaar verbindt door middel van een «Relatiesoort», kun je de relatierol van de target toevoegen door middel van het toolbox-item «Relatierol».
 - Klik op het toolbox-item «Relatierol» en sleep het item met de muisknop ingedrukt naar de target-kant van de associatie en laat hier de muisknop weer los.
 - Er verschijnt een popup-venster.
 - Vul bij '_Enter value_' de naam van de relatierol in en klik op '_Ok_'.
 - Klik vervolgens in het '_Properties_' venster op het '_Target_' tabblad.
 - Hierin ontbreken de bijbehorende tagged values.
 - Ga naar het toolbox-item Relatierol en klik hier met de rechtermuisknop op.
 - Klik op '_Synchronize Stereotype_'.
 - Klik op '_Ok_'.
 - Er verschijnt een popup-venster dat vraagt: '_Save latest changes?_', klik '_Ja_'.
 - De tagged values zijn nu gesynchroniseerd.

 > **Let op**: dit werkt nog niet!

## Verwijderen oudere toolbox(en)
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
    - Ga verder met het [importeren van de MIM-toolbox](#importeren-mim-toolbox).

## Toolboxen beheren
 - Ga naar de menubalk boven in beeld en selecteer '_Specialize_' > '_Manage-Tech_'
 - Hier vind je een overzicht van alle aanwezige MDG-technologies.
 - Scroll naar beneden en zoek '_MIM_' op.
 - Indien je meerdere versies van de toolbox geïmporteerd hebt, vind je die hier terug.
 - Klik op één van de versies voor meer informatie.
 - In het informatievenster rechtsboven zie je welke versie het betreft. Tevens vind je hier terug of de toolbox op model- of gebruikersniveau is geïmporteerd.
 - Met het checkbox in de kolom '_Enabled_' kun je ervoor kiezen om bepaalde bepaalde toolboxen uit te zetten. Dit doe je door het vinkje te verwijderen.
 - Ga verder met de laatste stappen van het [importeren van de MIM-toolbox](#importeren-mim-toolbox).

 > **Let op**: indien je toolboxen gebruikt met gelijknamige modelelementen, bijvoorbeeld oudere MIM-toolboxen of NEN3610 BRO Grouping-NL, dan kan dit bij het toewijzen van het stereotype «Relatierol» leiden tot een verwijzing naar het 'verkeerde' profiel. Enterprise Architect doet dit automatisch. Hierdoor beschikt het stereotype bijvoorbeeld niet over de gewenste tagged values.