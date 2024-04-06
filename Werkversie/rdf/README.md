Vanuit deze map kan de ontologie Respec pagina en de Linked Data plaatjes gegenereerd worden.

Hiervoor zijn de volgende stappen nodig:

1. Voer `import-libs.sh` uit om de juiste libraries te downloaden naar de lokale map 'libs';
2. Voer `copyfiles.sh` uit. Dit zorgt de de graphml bestanden in de map 'media' gekopieerd worden naar de lokale map 'libs';
3. Voer `onto2md.sh` uit. Dit zorgt voor het bestand Ontologie.md in de map "model". Deze map bevat de bestanden die op de http://modellen.mim-standaard.nl webserver geplaatst kunnen worden. Zie ook de README.md in die map.
4. Voer `onto2graphml.sh` uit. Dit zorgt er voor dat de graphml bestanden worden gemaakt, waarbij als basis de "oude" graphml bestanden worden gebruikt (die in stap 2 zijn gekopieerd zodat ze niet verloren raken).
5. Open 1 voor 1 de nieuwe graphml bestanden in de map 'media' en controleer de plaatsing van de elementen. Soms is het nodig om bepaalde elementen nog wat te schuiven.
6. Exporteer het resultaat naar een .png bestand en plaats deze in de map /media in de ROOT van deze Github repository.

Merk op: als er nieuwe metaklassen bij zijn gekomen, dan zullen deze niet automatisch toegevoegd worden, omdat onto2graphml uitgaat van de bestaande diagrammen en dus alle klassen weglaat die niet in de bestaande diagrammen voorkomen. Om toch alle metaklassen te krijgen, dien je in onto2graphml voor het juiste bestand de parameter 'follow' te vervangen door de parameter 'add'. Hierdoor krijg je alle metaklassen, en kun je degenen die je niet nodig hebt weghalen (in stap 5).
