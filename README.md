
# NAME

App::Greple::md - Greple module for Markdown syntax highlighting

# SYNOPSIS

    greple -Mmd file.md

    greple -Mmd --mode=dark -- file.md

    greple -Mmd --hashed h3=1 -- file.md

    greple -Mmd --cm h1=RD -- file.md

# DESCRIPTION

**App::Greple::md** is a [greple](https://metacpan.org/pod/App%3A%3AGreple) module that provides
Markdown syntax highlighting with cumulative coloring for nested
elements (e.g., links inside headings).

All colorization is handled by the `colorize()` function invoked via
`--print`.  Patterns are processed in priority order: code block
state machine, inline code protection, HTML comment protection, links
with OSC 8 hyperlinks, headings (cumulative), emphasis (bold, italic,
strikethrough), blockquotes, and horizontal rules.

Default colors can be overridden by `--cm LABEL=spec` as a module
option (before `--`).  Color specs follow
[Term::ANSIColor::Concise](https://metacpan.org/pod/Term%3A%3AANSIColor%3A%3AConcise) format and support `sub{...}` function
specs via [Getopt::EX::Colormap](https://metacpan.org/pod/Getopt%3A%3AEX%3A%3AColormap).

## Color Labels

The following color labels are available for override:

    code_mark        Code delimiters (fences and backticks)
    code_info        Fenced code block info string
    code_block       Fenced code block body
    code_inline      Inline code body
    comment          HTML comments
    link             Inline links [text](url)
    image            Images ![alt](url)
    image_link       Image links [![alt](img)](url)
    h1 - h6          Headings
    bold             Bold text (**text** or __text__)
    italic           Italic text (*text* or _text_)
    strike           Strikethrough text (~~text~~)
    blockquote       Blockquote marker (>)
    horizontal_rule  Horizontal rules (---, ***, ___)

## Dark Mode

Use `--mode=dark` or `config(mode=dark)` to activate dark mode colors:

    greple -Mmd --mode=dark -- file.md

    greple -Mmd::config(mode=dark) file.md

## Closing Hashes

The `hashed` configuration adds closing hashes to headings
(e.g., `### Title` becomes `### Title ###`).  It is a hash
option that can be set per heading level:

    greple -Mmd::config(hashed.h3=1,hashed.h4=1,hashed.h5=1,hashed.h6=1) file.md

    greple -Mmd --hashed h3=1 --hashed h4=1 -- file.md

## OSC 8 Hyperlinks

By default, links are converted to OSC 8 terminal hyperlinks for
clickable URLs in supported terminals.  Disable with `osc8=0`:

    greple -Mmd::config(osc8=0) file.md

## Field Visibility

The `--show` option controls which elements are highlighted:

    greple -Mmd --show bold=0 -- file.md       # disable bold
    greple -Mmd --show all= --show h1 -- file.md  # only h1

`--show LABEL=0` or `--show LABEL=` disables the label.
`--show LABEL` or `--show LABEL=1` enables it.
`all` is a special key that sets all labels at once.

# SEE ALSO

[App::Greple](https://metacpan.org/pod/App%3A%3AGreple)

[Getopt::EX::Colormap](https://metacpan.org/pod/Getopt%3A%3AEX%3A%3AColormap)

[Getopt::EX::Config](https://metacpan.org/pod/Getopt%3A%3AEX%3A%3AConfig)

# AUTHOR

Kazumasa Utashiro

# LICENSE

Copyright 2025-2026 Kazumasa Utashiro.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.
