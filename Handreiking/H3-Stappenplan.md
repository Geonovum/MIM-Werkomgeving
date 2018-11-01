Stappenplan 
============

Een proces voor de ontwikkeling van een dataspecificatie is ten dele te
generaliseren. In dit hoofdstuk worden de typische onderdelen beschreven

Overzicht.
----------

Als basis voor een stappenplan voor het realiseren van een dataspecificatie
wordt de INSPIRE methode genomen. Hierin wordt sterk gefocust op een use-case
georiënteerde benadering. In principe is dat ook juist, een registratie heeft
immers altijd een doel, een use-case of een werkproces. Deze stelt eisen aan de
semantiek, eisen die leidend zijn voor de ontwikkeling van een dataspecificatie.
Moeilijkheid is vaak dat registraties een zeer algemene use-case hebben zoals
bijvoorbeeld ‘voorzien in basisinformatie binnen een domein die voldoet aan
meervoudig gebruik’, zonder dat het meervoudig gebruik getypeerd kan worden. Een
andere situatie is dat er veelal registraties zijn die al operationeel
gepubliceerd worden maar nog geen of nog geen volledige dataspecificaties
hebben. In dat geval is het maken van een dataspecificatie nog steeds zinvol
maar ziet het proces er anders en korter uit. Onderstaand zijn grofweg de
processtappen beschreven. Enkele stappen worden toegelicht.

Use-case beschrijving.
----------------------

De use-case of werkproces is een beschrijving van het doel waarvoor een
dataspecificatie wordt gemaakt. Het is van belang om de eisen die de aan data
gesteld worden te bepalen aan de hand van de werkprocessen waar ze voor gebruikt
gaan worden. Een use-case onderscheidt typen gebruikers en gebruik en
activiteiten of doelen die worden ondersteund of gerealiseerd. Er kunnen ook
meerdere use-cases van toepassing zijn. Meestal zijn de beschrijvingen van
use-cases voor registraties heel algemeen of kan er met enkele specifieke
voorbeelden een typisch gebruik worden aangegeven. De beschrijving is meestal in
een beschrijvende taal met de termen zoals die in het toepassingsdomein worden
gebruikt.

Gebruikseisen (User requirements)
---------------------------------

De volgende stap is het identificeren van eisen die aan de gegevensset worden
gesteld. Het is een eerste inventarisatie van uitgangspunten waaraan de gegevens
moeten voldoen. Op basis van de use-case(s) worden aspecten bepaald zoals
detail, taal, terminologie, afstemmingsdomein, harmonisatie met domeinen,
hergebruik van gegevens maar ook modelleerprincipes. De lijst met gebruikseisen
is hierna de richtlijn die gebruikt wordt om objecttypen en hun eigenschappen te
bepalen. De gebruikseisen kunnen ook weer leiden tot het aanpassen van de
use-case.

Objecttypen
-----------

Dit is de fase waar een eerste grove vorm van het informatiemodel wordt gemaakt.
De use-case en de gebruikseisen hebben al een beeld geschetst wat het
toepassingsdomein is en de informatie die een rol speelt. Een aantal objecttypen
kunnen al bepaald worden en een eerste contour van een model worden geschetst.
Dit is de eerste presentatie van het toepassingsverhaal in een informatiemodel
in de vorm van een conceptuele taal (in dit geval UML). Het is hierbij van
belang dat domeinexperts meegenomen worden in dit verhaal. De domeinexperts zijn
immers degene die de input leveren voor uitwerken van het model.

Ontwikkeling dataspecificatie
-----------------------------

Voor de documentatie van een dataspecificatie voor geo-informatie is er een
internationale standaard ISO 19131. Op basis van die standaard en de toepassing
daarvan in INSPIRE en in het DSO is een template ontwikkeld (bijlage 4). Dat
template wordt gebruikt om de verschillende onderwerpen in te vullen. Centraal
in dit proces is in deze fase nog het informatiemodel. Het startmodel wordt in
verschillende iteraties met sessies met domeinexperts verder ontwikkeld tot het
niveau waarop het beantwoordt aan alle aspecten van de use-case en de
gebruikseisen. Daarna worden de andere hoofdstukken ingevuld.

Testen en validatie
-------------------

De dataspecificatie is in eerste instantie nog een theoretisch verhaal. Het
beschrijft de kennis die door de domeinexperts is aangeleverd. Afhankelijk van
de complexiteit van de use-case is er een meer of minder complex model ontstaan
en is er meer of minder zicht op de werkelijke implementatie. In deze fase
worden de specificaties getest door het maken van voorbeelddata. De toepassing
in voorbeelddata is een controle op technische haalbaarheid maar leidt meestal
ook tot nieuw inzicht over inhoudelijke beslissingen.

Afhankelijk van het ingerichte proces en de concreetheid van de use-case kan de
test ook een proof of concept omvatten waarbij de voorbeelddata in een
applicatie worden gebruikt die specifiek aan de use-case beantwoord.

In deze fase wordt er ook een consultatie van het werkveld uitgevoerd.
Afhankelijk van de organisatie van het werkveld worden de stakeholders op
verschillende manieren betrokken bij de consultatie. Dit kan éénmaal aan het
einde van de oplevering gebeuren of ook meerdere malen in het proces. Een proof
of concept en ook het maken van de voorbeelddatasets kan eerst door een externe
consultatie worden voorafgegaan. De resultaten van de consultatie kunnen dan al
voorafgaand aan de proof of concept worden verwerkt.

Harmonisatie
------------

Een apart en belangrijk punt van aandacht is harmonisatie van semantiek over de
informatiehuizen heen. Uitgangspunt is dat informatiemodellen voortbouwen op
semantiek die al geformaliseerd is. Waar informatiemodellen nog vaak binnen de
context van het informatiehuis blijven zal middels de toepassing van de
stelselcatalogus relaties met de semantiek van andere huizen eenduidig gelegd
worden. Er ontstaat daarmee een groeiende verzameling van op elkaar afgestemde
begrippen. In de ontwikkelfase van een informatiemodel is inventarisatie van wat
er al is en potentieel hergebruik een belangrijk punt. Voor het leggen van
relaties, het beoordelen van begrippen voor geschiktheid voor hergebruik of het
doen van harmonisatievoorstellen wil een informatiemodelleur graag begrippen met
elkaar kunnen vergelijken[^1]. De stelselcatalogus is daarvoor het middel.

[^1]: Globaal ontwerp en prototype stelselcatalogus

Het rapport Globaal ontwerp en prototype stelselcatalogus adviseert om het
beheer van semantiek over de informatiehuizen heen bij de stelselcatalogus te
leggen. Deze beheerder organiseert het beheer aan de stelselcatalogus in een
beheeroverleg met de betrokkenen zoals de wetgevingsjuristen, regelbeheerders en
modelleurs van de informatiehuizen. Hierdoor kan de stelselcatalogus beheerder
vanuit een neutrale rol komen tot harmonisatie-, verbeter- en
afstemmingsvoorstellen.

Extensies op bestaande modellen.
--------------------------------

Al genoemd is dat een informatiemodel zoveel als mogelijk hergebruik maakt van
bestaande semantiek en bestaande informatiemodellen. Het kan voorkomen dat het
uitbreiden van bestaande informatiemodellen met extra semantiek een wenselijke
methode is. O.a. bij het toepassen van INSPIRE dataspecificaties voor
Nederlandse werkprocessen kan die methode toegepast worden. Een methode daarvoor
is uitgewerkt op: <http://inspire-extensions.wetransform.to/>
