"""Prova: Gemini classifica lo stile di un outfit (niente riconoscimento della persona, quello resta locale)."""
import json, os, sys
from google import genai
from google.genai import types

env = dict(l.strip().split("=", 1) for l in open(os.path.expanduser(r"~\.env"), encoding="utf-8") if "=" in l and not l.startswith("#"))
client = genai.Client(api_key=env["GEMINI_API_KEY"].strip().strip('"'))
DOMANDA = """Guarda l'outfit (non identificare la persona). Rispondi SOLO JSON:
{"figura_intera": bool, "piu_persone": bool, "stile": una tra ["elegante","casual","sportivo","streetwear","eccentrico","palco/costume","red carpet"],
 "estremo": 0-10 (quanto e' insolito/audace), "descrizione": max 12 parole in italiano}"""
img = open(sys.argv[1], "rb").read()
r = client.models.generate_content(model=sys.argv[2] if len(sys.argv) > 2 else "gemini-2.5-flash",
                                   contents=[types.Part.from_bytes(data=img, mime_type="image/jpeg"), DOMANDA],
                                   config=types.GenerateContentConfig(response_mime_type="application/json"))
print(r.text)
print("token:", r.usage_metadata.total_token_count)
