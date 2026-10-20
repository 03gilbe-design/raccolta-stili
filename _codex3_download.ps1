param([int]$Start = 0, [int]$Count = 6)
$ErrorActionPreference = 'Stop'
$root = Join-Path $PSScriptRoot 'references\pinterest'
$people = @(
    @{Name='Christopher Reeve'; Slug='christopherreeve'; Token='reeve'},
    @{Name='Michael Ballack'; Slug='michaelballack'; Token='ballack'},
    @{Name='Jason Alexander'; Slug='jasonalexander'; Token='jason alexander'},
    @{Name='Anthony Delon'; Slug='anthonydelon'; Token='delon'},
    @{Name='Sean Patrick Flanery'; Slug='seanpatrickflanery'; Token='flanery'},
    @{Name='Luca Carboni'; Slug='lucacarboni'; Token='carboni'},
    @{Name='Jimin'; Slug='jimin'; Token='jimin'},
    @{Name='Serena Williams'; Slug='serenawilliams'; Token='serena'},
    @{Name='Scotty McCreery'; Slug='scottymccreery'; Token='mccreery'},
    @{Name='Catherine Zeta-Jones'; Slug='catherinezetajones'; Token='zeta-jones'},
    @{Name='Tcheky Karyo'; Slug='tchkykaryo'; Token='karyo'},
    @{Name='Gabriele Salvatores'; Slug='gabrielesalvatores'; Token='salvatores'},
    @{Name='Geri Halliwell'; Slug='gerihalliwell'; Token='halliwell'},
    @{Name='Bindi Irwin'; Slug='bindiirwin'; Token='bindi'},
    @{Name='Barry Bonds'; Slug='barrybonds'; Token='barry bonds'},
    @{Name='Stephane Diagana'; Slug='stphanediagana'; Token='diagana'},
    @{Name='Whitney Houston'; Slug='whitneyhouston'; Token='whitney'},
    @{Name='Emmanuelle Beart'; Slug='emmanuellebart'; Token='beart'},
    @{Name='John Wetteland'; Slug='johnwetteland'; Token='wetteland'},
    @{Name='Andrew Garfield'; Slug='andrewgarfield'; Token='andrew garfield'},
    @{Name='Patrick Swayze'; Slug='patrickswayze'; Token='swayze'},
    @{Name='Roger Federer'; Slug='rogerfederer'; Token='federer'},
    @{Name='Ulrich Tukur'; Slug='ulrichtukur'; Token='tukur'},
    @{Name='Dave Chappelle'; Slug='davechappelle'; Token='chappelle'},
    @{Name='Paul Walker'; Slug='paulwalker'; Token='paul walker'},
    @{Name='River Phoenix'; Slug='riverphoenix'; Token='river phoenix'},
    @{Name='Natalia Estrada'; Slug='nataliaestrada'; Token='natalia estrada'},
    @{Name='Benoit Poelvoorde'; Slug='benotpoelvoorde'; Token='poelvoorde'},
    @{Name='Mylene Farmer'; Slug='mylnefarmer'; Token='farmer'},
    @{Name='Asia Argento'; Slug='asiaargento'; Token='asia argento'},
    @{Name='Corbin Bernsen'; Slug='corbinbernsen'; Token='bernsen'},
    @{Name='Jean-Felix Lalanne'; Slug='jeanflixlalanne'; Token='lalanne'},
    @{Name='Joe Perry'; Slug='joeperry'; Token='joe perry'}
)
$people = @($people | Select-Object -Skip $Start -First $Count)
$headers = @{'User-Agent'='venere-vestiti-codex3/1.0 (personal research)'}
$forbidden = '(?i)film|movie|superman|poster|screenshot|screencap|wax|statue|mural|drawing|autograph|signature|logo|grave|memorial|cosplay'

foreach ($person in $people) {
    $dir = Join-Path $root $person.Slug
    New-Item -ItemType Directory -Path $dir -Force | Out-Null
    $queries = @(
        ('intitle:"' + $person.Name + '"')
        ('"' + $person.Name + '" red carpet')
        ('"' + $person.Name + '" event')
        ('"' + $person.Name + '" concert')
    )
    $candidates = [System.Collections.Generic.List[object]]::new()
    $seen = @{}
    foreach ($query in $queries) {
        $params = @{
            action='query'; format='json'; generator='search'; gsrsearch=$query;
            gsrnamespace='6'; gsrlimit='40'; prop='imageinfo';
            iiprop='url|size|mime|extmetadata'; iiurlwidth='1200'
        }
        $encoded = ($params.GetEnumerator() | ForEach-Object {
            "$([uri]::EscapeDataString($_.Key))=$([uri]::EscapeDataString([string]$_.Value))"
        }) -join '&'
        try {
            $response = Invoke-RestMethod -Uri ('https://commons.wikimedia.org/w/api.php?' + $encoded) -Headers $headers -TimeoutSec 30
        } catch {
            Start-Sleep -Seconds 4
            continue
        }
        Write-Output ($person.Name + '|query=' + $query + '|pages=' + @($response.query.pages.PSObject.Properties.Value).Count)
        foreach ($page in $response.query.pages.PSObject.Properties.Value) {
            $info = $page.imageinfo[0]
            $description = [string]$info.extmetadata.ImageDescription.value
            $haystack = ($page.title + ' ' + $description).ToLowerInvariant()
            if ($seen.ContainsKey($info.descriptionurl) -or $haystack -notlike ('*' + $person.Token + '*')) { continue }
            if ($page.title -match $forbidden -or $info.mime -notmatch '^image/(jpeg|png)$') { continue }
            if ($info.width -lt 500 -or $info.height -lt 600) { continue }
            $seen[$info.descriptionurl] = $true
            $portrait = if ($info.height -ge $info.width) { 2 } else { 0 }
            $event = if ($haystack -match '(?i)premiere|festival|awards|gala|concert|fashion|wimbledon|open') { 1 } else { 0 }
            $candidates.Add([pscustomobject]@{
                Score=($portrait + $event); Title=$page.title; Url=$info.thumburl; Original=$info.url;
                Source=$info.descriptionurl; Width=$info.width; Height=$info.height;
                Description=($description -replace '<[^>]+>', ' ' -replace '\s+', ' ').Trim()
            })
        }
        Start-Sleep -Milliseconds 400
    }
    $picked = @($candidates | Sort-Object -Property @{Expression='Score'; Descending=$true}, @{Expression='Height'; Descending=$true})
    Write-Output ($person.Name + '|candidates=' + $candidates.Count + '|picked=' + $picked.Count)
    $manifest = [System.Collections.Generic.List[object]]::new()
    for ($i = 0; $i -lt $picked.Count -and $manifest.Count -lt 5; $i++) {
        $item = $picked[$i]
        $extension = if ($item.Url -match '(?i)\.png(?:\?|$)') { '.png' } else { '.jpg' }
        $destination = Join-Path $dir (('{0}_{1:D2}{2}' -f $person.Slug, ($manifest.Count + 1), $extension))
        try {
            Invoke-WebRequest -UseBasicParsing -Uri $item.Url -Headers $headers -OutFile $destination -TimeoutSec 40
            $manifest.Add($item)
        } catch {
            try {
                Invoke-WebRequest -UseBasicParsing -Uri $item.Original -Headers $headers -OutFile $destination -TimeoutSec 40
                $manifest.Add($item)
            } catch { }
        }
        Start-Sleep -Milliseconds 500
    }
    $manifest | ConvertTo-Json -Depth 4 | Set-Content -LiteralPath (Join-Path $dir 'sources.json') -Encoding UTF8
    Write-Output ($person.Name + '|' + $manifest.Count)
}
