# Per Codex / Gemini: come aggiungere foto e difficolta

**Foto nuove**: metti i .jpg in `references/pinterest/<id>/` (id = come in dati.json, es. `keanureeves`),
poi rigenera: `OUT_SITO=~/venere-vestiti python C:/astrologia/04_venere_vestiti/pagina/gen_dati.py`
(ritaglia sulla persona principale, sfondo sfumato e schiarito, miniature in `foto/`, aggiorna `dati.json`).
Criterio foto: ESTREMI (look piu' strani/audaci) + PATTERN (capi ricorrenti), evitare look neutri; mai scene di film.

**Difficolta**: modifica solo `difficolta.json`:
`"keanureeves": [{"tema": "lutto", "nota": "...", "fonte": "https://..."}]`
Solo cose dichiarate pubblicamente o documentate da fonti serie. Mai supposizioni. Sempre la fonte.
Nel sito si vedono solo con la casella "Difficolta" nella rotella.

Poi: `git add -A && git commit -m "..." && git push` (GitHub Pages si aggiorna in 1-2 minuti).
