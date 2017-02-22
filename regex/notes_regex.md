# RegEx Notes

- characters that must be escaped `$ ^ * + ? . ( ) [ ] { } | \` and `/`?
- regex are built from patterns, not characters or strings
- you can build up complex regex by concatenating a series of patterns and vice versa
- When writing character classes, it's good practice to group characters by type:
  digits, uppercase letters, lowercase letters, whitespace, and non-alphanumeric characters
- inside a character class, only `^ \ - [ ]` need to be escaped

## Regex rules
- concatenation `/cat/`
- alternation `/(cat|dog)/`
- character class `/[abc]/`
- range of characters `/[a-z][0-9A-Fa-f]/`
- negated class `/[^a-z]/`: no lowercase letters
- any character `/./` except for newline
- whitespace `/\s/`
- non-whitespace `/\S/`
- digit `/\d/`
- non-digit `/\D/`
- word `/\w/`, i.e. `[0-9A-Za-z_]
- non-word `/\W/`
- anchors
  - beginning of line: `^`
  - end of line `$`
  - beginning of string `\A`
  - end of string `\z`
  - word boundary `\b`
  - non-word boundary `\B`
- quantifiers
  - `*`: 0 or more occurences, greedy
  - `*?`: 0 or more occurences, lazy
  - `+`: 1 or more occurences, greedy
  - `+?`: 1 or more occurences, lazy
  - `?`: 0 or 1 occurences
- range quantifiers
  - `{m}` : m occurences
  - `{m,}` : m or more occurences
  - `{m,n}` : m to n occurences
- backreference to groups
  - `\1`

## Regex flags (or modifiers)
- `/some.regex/i`: ignore case

## Usage in Ruby
- `String#=~`
- `String#scan`
- `String#split`
- `String#gsub`
- `String#sub`
