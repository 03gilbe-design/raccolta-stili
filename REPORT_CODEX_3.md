# Report Compito Codex 3 — passi 1, 2 e 3

Data: 21 ottobre 2026.

## Vincoli rispettati

- Eseguiti solo i passi 1, 2 e 3 di `COMPITO_CODEX_3.md`.
- Non eseguiti `gen_dati.py`, `temi_astroseek.py` o altri processi con modelli di immagini.
- `dati.json` non modificato.
- Foto salvate in `references/pinterest/<id>/`; 4–5 file decodificabili per ogni persona aggiunta.
- Le fonti puntuali delle foto sono nei rispettivi `sources.json` e provengono da Wikimedia Commons o dalle pagine editoriali indicate.

## Scelte per combinazione

La rosa dei candidati viene da `CANDIDATI_LUNA.md`, generato dal dataset locale Astro-Seek con ora Rodden AA/A. La scelta privilegia notorietà generale e riconoscibilità in Italia; come controllo sono state usate le pageview di Wikipedia. Data di nascita e identità sono state verificate su Wikidata.

| Sole | Venere | Luna | Persona aggiunta | Fonte dati |
|---|---|---|---|---|
| Bilancia | Bilancia | Sagittario | Christopher Reeve | [Wikidata Q174311](https://www.wikidata.org/wiki/Q174311) |
| Bilancia | Bilancia | Scorpione | Michael Ballack | [Wikidata Q11948](https://www.wikidata.org/wiki/Q11948) |
| Bilancia | Leone | Gemelli | Jason Alexander | [Wikidata Q311754](https://www.wikidata.org/wiki/Q311754) |
| Bilancia | Leone | Leone | Anthony Delon | [Wikidata Q573147](https://www.wikidata.org/wiki/Q573147) |
| Bilancia | Sagittario | Toro | Sean Patrick Flanery | [Wikidata Q447967](https://www.wikidata.org/wiki/Q447967) |
| Bilancia | Sagittario | Vergine | Nessuno: il file candidati contiene solo Valeria Golino, già presente | `CANDIDATI_LUNA.md` |
| Bilancia | Scorpione | Ariete | Luca Carboni | [Wikidata Q119422](https://www.wikidata.org/wiki/Q119422) |
| Bilancia | Scorpione | Gemelli | Jimin | [Wikidata Q20947093](https://www.wikidata.org/wiki/Q20947093) |
| Bilancia | Scorpione | Vergine | Serena Williams | [Wikidata Q11459](https://www.wikidata.org/wiki/Q11459) |
| Bilancia | Vergine | Cancro | Scotty McCreery | [Wikidata Q255969](https://www.wikidata.org/wiki/Q255969) |
| Bilancia | Vergine | Pesci | Catherine Zeta-Jones | [Wikidata Q47664](https://www.wikidata.org/wiki/Q47664) |
| Bilancia | Vergine | Vergine | Tchéky Karyo | [Wikidata Q317704](https://www.wikidata.org/wiki/Q317704) |
| Leone | Cancro | Acquario | Gabriele Salvatores | [Wikidata Q55465](https://www.wikidata.org/wiki/Q55465) |
| Leone | Cancro | Cancro | Geri Halliwell | [Wikidata Q19845](https://www.wikidata.org/wiki/Q19845) |
| Leone | Cancro | Leone | Bindi Irwin | [Wikidata Q2423081](https://www.wikidata.org/wiki/Q2423081) |
| Leone | Gemelli | Acquario | Barry Bonds | [Wikidata Q314712](https://www.wikidata.org/wiki/Q314712) |
| Leone | Gemelli | Scorpione | Stéphane Diagana | [Wikidata Q539229](https://www.wikidata.org/wiki/Q539229) |
| Leone | Leone | Ariete | Whitney Houston | [Wikidata Q34389](https://www.wikidata.org/wiki/Q34389) |
| Leone | Leone | Gemelli | Emmanuelle Béart | [Wikidata Q106458](https://www.wikidata.org/wiki/Q106458) |
| Leone | Leone | Scorpione | John Wetteland | [Wikidata Q3182721](https://www.wikidata.org/wiki/Q3182721) |
| Leone | Vergine | Acquario | Andrew Garfield | [Wikidata Q23891](https://www.wikidata.org/wiki/Q23891) |
| Leone | Vergine | Leone | Patrick Swayze | [Wikidata Q49004](https://www.wikidata.org/wiki/Q49004) |
| Leone | Vergine | Scorpione | Roger Federer | [Wikidata Q1426](https://www.wikidata.org/wiki/Q1426) |
| Leone | Vergine | Vergine | Ulrich Tukur | [Wikidata Q697129](https://www.wikidata.org/wiki/Q697129) |
| Vergine | Bilancia | Cancro | Dave Chappelle | [Wikidata Q40321](https://www.wikidata.org/wiki/Q40321) |
| Vergine | Bilancia | Pesci | Paul Walker | [Wikidata Q213864](https://www.wikidata.org/wiki/Q213864) |
| Vergine | Bilancia | Scorpione | Nessuno: il file candidati contiene solo Beyoncé, già presente | `CANDIDATI_LUNA.md` |
| Vergine | Bilancia | Toro | River Phoenix | [Wikidata Q106514](https://www.wikidata.org/wiki/Q106514) |
| Vergine | Cancro | Cancro | Natalia Estrada | [Wikidata Q1089681](https://www.wikidata.org/wiki/Q1089681) |
| Vergine | Leone | Ariete | Benoît Poelvoorde | [Wikidata Q714765](https://www.wikidata.org/wiki/Q714765) |
| Vergine | Leone | Bilancia | Mylène Farmer | [Wikidata Q185002](https://www.wikidata.org/wiki/Q185002) |
| Vergine | Leone | Pesci | Asia Argento | [Wikidata Q232052](https://www.wikidata.org/wiki/Q232052) |
| Vergine | Scorpione | Ariete | Nessuno: nessun candidato elencato oltre ad Alessandro Borghi, già presente | `CANDIDATI_LUNA.md` |
| Vergine | Scorpione | Capricorno | Corbin Bernsen | [Wikidata Q737183](https://www.wikidata.org/wiki/Q737183) |
| Vergine | Scorpione | Sagittario | Jean-Félix Lalanne | [Wikidata Q3165998](https://www.wikidata.org/wiki/Q3165998) |
| Vergine | Vergine | Vergine | Joe Perry | [Wikidata Q313378](https://www.wikidata.org/wiki/Q313378) |

Totale: 33 persone aggiunte. Tre combinazioni non possono ricevere un secondo personaggio dalla rosa fornita.

## File aggiornati

- `C:\Users\Gilberto Bizzo\.claude\jobs\cd43a522\tmp\figure.py`: 33 righe aggiunte a `PERSONE`; query Commons e parole obbligatorie incluse.
- `C:\Users\Gilberto Bizzo\.claude\jobs\cd43a522\tmp\aspetti.py`: 33 righe aggiunte a `NASCITE`; date Wikidata, fusi locali e chiavi dataset incluse.
- `references/pinterest/<id>/`: 33 cartelle, ciascuna con 4–5 foto e `sources.json`.

I due script Python sono esterni al repository Git; per sicurezza sono stati creati i backup `figure.py.codex3-backup-20261021` e `aspetti.py.codex3-backup-20261021` nella stessa cartella temporanea.

## Verifiche

- Parsing AST di entrambi gli script: PASS.
- 33 nomi nuovi presenti una sola volta in `PERSONE`: PASS.
- 33 nomi nuovi presenti in `NASCITE`: PASS.
- 33 chiavi di ricerca trovate nel dataset locale Astro-Seek con anno coerente: PASS.
- Tutte le 33 cartelle foto contengono 4–5 immagini: PASS.
- Apertura/verifica immagini con Pillow: PASS.
- Hash SHA-256: nessun duplicato residuo nella stessa cartella.
- Generazione sito/temi: NON ESEGUITA per istruzione esplicita.
