# Report Codex 8

## Esito

Completati retro orizzontale delle schede, filtro per tema e ampliamento prudente delle difficoltà documentate. Commit e push eseguiti solo sui file del Compito 8; i PNG già modificati da Codex 7 sono rimasti esclusi.

## Modifiche

- `index.html`: ogni scheda ha due pagine con scroll-snap, swipe, trascinamento PC, frecce e due indicatori.
- Pagina 1: foto, nome e aspetti; nessun segno zodiacale.
- Pagina 2: Luna con glifo, indicazione `incerta` quando l'ora è ignota, difficoltà con tema, anno, contesto e link.
- Filtro `Mostra solo chi ha avuto:` generato dai temi presenti in `difficolta.json`.
- Cache bust aggiornato a `v=10222200`.
- `difficolta.json`: 25 persone, 29 voci, 26 URL unici; temi standardizzati e campi `anno` e `contesto` aggiunti a ogni voce.

## Fonti e criterio

Usate interviste dirette e testate note: The Guardian, Vogue, Corriere, ABC7, Guitar World. Esclusi gossip, diagnosi dedotte e risultati ambigui. Ogni URL inserito è stato richiesto con redirect attivi e user-agent browser.

## Verifiche

- JavaScript inline estratto da `index.html` e controllato con `node --check -`: PASS.
- Parsing JSON, ID presenti in `dati.json`, campi obbligatori `tema/anno/contesto/fonte`: PASS, 0 errori.
- Test avversariale con record falso e campi mancanti: PASS, il validatore rileva 4 errori.
- Fonti: 26/26 risposte HTTP 200.
- Server locale `http://127.0.0.1:8765/`: HTTP 200, 24.707 byte.
- `git diff --check`: PASS; soli avvisi conversione LF/CRLF.
- Test visivo browser: NON ESEGUITO. Il runtime browser integrato non esponeva backend disponibili (`[]`).

## Limiti

- 53 dei 78 personaggi non hanno una voce. Questo non dimostra assenza di difficoltà: significa solo che nel pass svolto non è stata inserita una fonte abbastanza solida e contestualizzata.
- Nessuna pipeline immagini eseguita: C: aveva circa 0,01 GB liberi e 11 PNG risultavano già modificati dal lavoro precedente.
- Swipe, frecce e filtro sono verificati per sintassi e struttura, non visivamente in browser reale.
