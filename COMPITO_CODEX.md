# Compito per Codex — sito "Venere e i vestiti"

Repo: `C:\Users\Gilberto Bizzo\venere-vestiti` (GitHub Pages: https://03gilbe-design.github.io/venere-vestiti/).
Leggi prima `PER_CODEX.md`. Lavora in ordine, fai commit+push dopo ogni passo riuscito.
Il PC ha poca RAM: un solo processo pesante alla volta, `torch.set_num_threads(2)`.

## 1. Rigenera le foto (priorita')
`set OUT_SITO=C:\Users\Gilberto Bizzo\venere-vestiti` poi
`python C:\astrologia\04_venere_vestiti\pagina\gen_dati.py`
(persona principale nitida, sfondo e altre persone sfocati e schiariti, cache in `references/pinterest/*/sfumato` e
`C:\astrologia\04_venere_vestiti\foto_scelte_utente\sfumato`). Deve stampare 44 persone, 0 senza foto.
Poi aggiorna in `index.html` il parametro `v=` (stessa data a 8 cifre MMDDHHMM in tutte le occorrenze), `git add -A`, commit, push.
Controlla a occhio 3-4 miniature (es. halleberry, keanureeves, danielradcliffe): la persona principale deve essere nitida e intera.

## 2. Difficolta' (`difficolta.json`)
Per ogni personaggio (id come in dati.json) cerca SOLO difficolta' dichiarate pubblicamente dalla persona o documentate
da fonti serie (interviste, testate note): dipendenze, alcol, depressione, ansia, disturbi alimentari, lutti gravi, ecc.
Formato: `"id": [{"tema": "parola breve", "nota": "max 15 parole", "fonte": "URL"}]`. Mai supposizioni o gossip.
Se non trovi niente di solido, non mettere la persona. Puoi usare Gemini via `agy -p "..." --print-timeout 300s`
per cercare, ma verifica ogni URL con una richiesta prima di scriverlo.

## 3. Ore di nascita mancanti
Per chi in `C:\astrologia\04_venere_vestiti\pagina\ore_astroseek.json` e' `null`: prova altri slug Astro-Seek
(es. `nome-cognome-2`, nome completo, nome d'arte) con `ore_astroseek.py` (aggiungi a SLUG). Accetta solo se la data coincide.
Non inventare orari.

Alla fine scrivi un riassunto in `REPORT_CODEX.md` (cosa fatto, cosa no, dubbi) e fai push.
