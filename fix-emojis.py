# -*- coding: utf-8 -*-
import codecs

# Read the file
with codecs.open('C:\\Users\\Arvind\\Downloads\\Prodpro\\trustlens-mvp.html', 'r', encoding='utf-8') as f:
    content = f.read()

# Remove specific emojis by direct replacement
replacements = {
    '🛡️': '⬡',
    '📊': '',
    '🚨': '',
    '🔥': '',
    '✅': '',
    '⚠️': '',
    '🚫': '',
    '🔍': '',
    '📢': '',
    '🔗': '',
    '📄': '',
    '🔄': '',
    '⚡': ''
}

for old, new in replacements.items():
    content = content.replace(old, new)

# Fix tweet-author alignment to prevent timestamp overlap
content = content.replace(
    '        .tweet-author {\r\n            display: flex;\r\n            align-items: center;',
    '        .tweet-author {\r\n            display: flex;\r\n            align-items: flex-start;'
)

# Add flex properties to timestamp CSS if not already there
if 'flex-shrink: 0;' not in content:
    content = content.replace(
        '        .tweet-timestamp {\r\n            color: var(--text-tertiary);\r\n            font-size: 13px;\r\n        }',
        '        .tweet-timestamp {\r\n            color: var(--text-tertiary);\r\n            font-size: 13px;\r\n            flex-shrink: 0;\r\n            align-self: flex-start;\r\n        }'
    )

# Write back
with codecs.open('C:\\Users\\Arvind\\Downloads\\Prodpro\\trustlens-mvp.html', 'w', encoding='utf-8') as f:
    f.write(content)

print('Done: Removed all emojis and fixed timestamp layout')
