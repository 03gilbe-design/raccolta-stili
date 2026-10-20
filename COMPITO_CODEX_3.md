# Compito 3 per Codex — almeno 2 personaggi per ogni Sole x Venere x Luna

Oggi 36 combinazioni Sole x Venere x Luna su 40 hanno UN solo personaggio. In `CANDIDATI_LUNA.md` ci sono, per ognuna,
i candidati dal dataset locale Astro-Seek (ora di nascita Rodden AA/A).

1. Per ogni combinazione scegli il candidato PIU' FAMOSO (pageviews Wikipedia via API, o chiedi a Gemini con `agy -p`).
   Preferisci gente riconoscibile in Italia. Niente persone private o note solo per fatti di cronaca.
2. Aggiungilo in `C:\Users\Gilberto Bizzo\.claude\jobs\cd43a522\tmp\figure.py` (PERSONE: sole, venere, nome, query, parola)
   e in `aspetti.py` (NASCITE: anno, mese, giorno, fuso, chiave dataset per prendere l'ora). Data verificata con Wikidata.
3. Foto: 4-5 per persona, criterio ESTREMI + capi ricorrenti, mai scene di film, persona giusta (descrizione col nome).
   Salvale in `references/pinterest/<id>/`.
4. Rigenera (`gen_dati.py`, vedi PER_CODEX.md), rigenera i temi (`temi_astroseek.py`), commit e push.
Il PC ha poca memoria: un solo processo pesante alla volta. Se Windows da' errore 0xC0000142, fermati e scrivilo nel report.
