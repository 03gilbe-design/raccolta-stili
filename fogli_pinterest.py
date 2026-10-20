"""Fogli di controllo delle foto trovate su Pinterest: una riga per personaggio, nome vero sopra."""
import os, sys
from PIL import Image, ImageDraw, ImageFont, ImageOps

sys.path.insert(0, os.path.expanduser(r"~\.claude\jobs\cd43a522\tmp"))
from figure import PERSONE
import re
NOMI = {re.sub(r"[^a-z0-9]", "", p[2].lower()): p[2] for p in PERSONE}

PIN = os.path.expanduser(r"~\venere-vestiti\references\pinterest")
OUT = os.path.expanduser(r"~\.claude\jobs\cd43a522\tmp")
F = ImageFont.truetype("C:\\Windows\\Fonts\\segoeuib.ttf", 40)
TW, TH, PER = 300, 420, 6
cartelle = sorted(d for d in os.listdir(PIN) if os.path.isdir(os.path.join(PIN, d)))
for k in range(0, len(cartelle), PER):
    gruppo = cartelle[k:k + PER]
    img = Image.new("RGB", (5 * (TW + 10) + 10, len(gruppo) * (TH + 70)), "white")
    d = ImageDraw.Draw(img)
    for r, c in enumerate(gruppo):
        y = r * (TH + 70)
        d.text((10, y + 8), NOMI.get(c, c), font=F, fill="#a3195b")
        fs = sorted(f for f in os.listdir(os.path.join(PIN, c)) if f.endswith(".jpg"))[:5]
        for i, f in enumerate(fs):
            im = Image.open(os.path.join(PIN, c, f)).convert("RGB")
            img.paste(ImageOps.pad(im, (TW, TH), color="#f0f0f0"), (10 + i * (TW + 10), y + 62))
    p = os.path.join(OUT, f"pinterest_{k // PER + 1}.jpg")
    img.save(p, quality=88)
    print(p)
