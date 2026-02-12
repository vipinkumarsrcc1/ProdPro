$content = Get-Content 'C:\Users\Arvind\Downloads\Prodpro\trustlens-mvp.html' -Raw -Encoding UTF8

# Remove all emojis
$content = $content -replace '\u{1F6E1}\u{FE0F}','\u{2B21}'  # shield to hexagon
$content = $content -replace '\u{1F4CA}',''  # chart
$content = $content -replace '\u{1F6A8}',''  # siren
$content = $content -replace '\u{1F525}',''  # fire
$content = $content -replace '\u{2705}',''  # check mark
$content = $content -replace '\u{26A0}\u{FE0F}',''  # warning
$content = $content -replace '\u{1F6AB}',''  # prohibited
$content = $content -replace '\u{1F50D}',''  # magnifying glass
$content = $content -replace '\u{1F4E2}',''  # loudspeaker
$content = $content -replace '\u{1F517}',''  # link
$content = $content -replace '\u{1F4C4}',''  # page
$content = $content -replace '\u{1F504}',''  # rotate

# Fix CSS for timestamp - add flex properties
$oldTimestamp = '        .tweet-timestamp {' + [Environment]::NewLine + '            color: var(--text-tertiary);' + [Environment]::NewLine + '            font-size: 13px;' + [Environment]::NewLine + '        }'
$newTimestamp = '        .tweet-timestamp {' + [Environment]::NewLine + '            color: var(--text-tertiary);' + [Environment]::NewLine + '            font-size: 13px;' + [Environment]::NewLine + '            flex-shrink: 0;' + [Environment]::NewLine + '            align-self: flex-start;' + [Environment]::NewLine + '        }'
$content = $content -replace [regex]::Escape($oldTimestamp), $newTimestamp

# Fix CSS for tweet-author - change to flex-start
$oldAuthor = '        .tweet-author {' + [Environment]::NewLine + '            display: flex;' + [Environment]::NewLine + '            align-items: center;'
$newAuthor = '        .tweet-author {' + [Environment]::NewLine + '            display: flex;' + [Environment]::NewLine + '            align-items: flex-start;'
$content = $content -replace [regex]::Escape($oldAuthor), $newAuthor

# Save the file
$content | Set-Content 'C:\Users\Arvind\Downloads\Prodpro\trustlens-mvp.html' -Encoding UTF8 -NoNewline
Write-Host "Removed all emojis and fixed timestamp layout"
