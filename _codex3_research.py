import json
import urllib.parse
import urllib.request

UA = {"User-Agent": "venere-vestiti-codex3/1.0 (research)"}


def get_json(url):
    request = urllib.request.Request(url, headers=UA)
    with urllib.request.urlopen(request, timeout=30) as response:
        return json.load(response)


titles = [
    "Christopher Reeve", "Michael Ballack", "Jason Alexander", "Anthony Delon",
    "Sean Patrick Flanery", "Luca Carboni", "Jimin", "Serena Williams",
    "Scotty McCreery", "Catherine Zeta-Jones", "Tchéky Karyo", "Gabriele Salvatores",
    "Geri Halliwell", "Bindi Irwin", "Barry Bonds", "Stéphane Diagana",
    "Whitney Houston", "Emmanuelle Béart", "John Wetteland", "Andrew Garfield",
    "Patrick Swayze", "Roger Federer", "Ulrich Tukur", "Dave Chappelle",
    "Paul Walker", "River Phoenix", "Natalia Estrada", "Benoît Poelvoorde",
    "Mylène Farmer", "Asia Argento", "Corbin Bernsen", "Jean-Félix Lalanne",
    "Joe Perry (musician)",
]

params = urllib.parse.urlencode({
    "action": "query", "format": "json", "prop": "pageprops",
    "ppprop": "wikibase_item", "redirects": 1, "titles": "|".join(titles),
})
wiki = get_json("https://en.wikipedia.org/w/api.php?" + params)
pages = wiki.get("query", {}).get("pages", {})
normalized = {item["from"]: item["to"] for item in wiki.get("query", {}).get("normalized", [])}
redirects = {item["from"]: item["to"] for item in wiki.get("query", {}).get("redirects", [])}
page_by_title = {page["title"]: page for page in pages.values()}

def resolved_title(title):
    current = normalized.get(title, title)
    return redirects.get(current, current)

title_to_qid = {
    requested: page_by_title.get(resolved_title(requested), {}).get("pageprops", {}).get("wikibase_item")
    for requested in titles
}
qids = [qid for qid in title_to_qid.values() if qid]
params = urllib.parse.urlencode({
    "action": "wbgetentities", "format": "json", "ids": "|".join(qids),
    "props": "claims|sitelinks", "languages": "en|it",
})
entities = get_json("https://www.wikidata.org/w/api.php?" + params).get("entities", {})

out = []
for requested in titles:
    qid = title_to_qid.get(requested)
    entity = entities.get(qid, {})
    birth = None
    try:
        birth = entity["claims"]["P569"][0]["mainsnak"]["datavalue"]["value"]["time"]
    except (KeyError, IndexError, TypeError):
        pass
    out.append({
        "requested": requested, "title": resolved_title(requested), "qid": qid, "birth": birth,
        "wikidata": f"https://www.wikidata.org/wiki/{qid}" if qid else None,
    })

print(json.dumps(out, ensure_ascii=False, indent=2))
