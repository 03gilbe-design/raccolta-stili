# Compito 2 per Codex — tema natale stile Astro-Seek nel sito

Gia' pronto: `temi/<id>.png` (ruota vera di Astro-Seek, composta con le nostre posizioni) e `temi.json`
(`id -> {img, case: bool, pagina: url Astro-Seek o null}`). Generatore: `C:\astrologia\04_venere_vestiti\pagina\temi_astroseek.py`.

1. In `index.html`, nel pannello che si apre toccando un personaggio, sostituisci la ruota SVG disegnata a mano con
   l'immagine `temi/<id>.png` (caricare `temi.json` come gia' si fa con `difficolta.json`). Larghezza max 420px, non tagliarla.
   Sotto: "Case e Ascendente" se `case` e' true, altrimenti "Ora di nascita ignota: niente case". Se `pagina` c'e',
   link "Apri su Astro-Seek". Tieni la tabella dei pianeti.
2. Anteprima per i link condivisi: aggiungi anche `og:image:width`=1200 `og:image:height`=628 accanto a og:image.
3. Aggiorna `v=` (8 cifre MMDDHHMM, tutte le occorrenze), `node --check` sullo script, commit, push.
4. Controlla online che `temi/keanureeves.png` risponda 200 e che la pagina carichi senza errori in console
   (Edge headless: `--screenshot`). Aggiungi l'esito in `REPORT_CODEX.md` e push.
0. **NIENTE LILITH** (richiesta esplicita dell'utente): apri qualche `temi/*.png`; se compare Lilith (⚸) o la Luna nera,
   trova in `temi_astroseek.py` il parametro URL di Astro-Seek che la nasconde (prova `p_lilith` assente, `lilith=0`,
   `no_lilith=1`, guardando le opzioni del loro form "birth chart" online), rigenera le 44 ruote e verifica a occhio.
Non toccare le foto (compito 1) se gia' fatte. Niente simboli dei segni nelle schede (regola dell'utente).
