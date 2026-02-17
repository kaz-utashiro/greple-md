[![Actions Status](https://github.com/kaz-utashiro/greple-md/actions/workflows/test.yml/badge.svg?branch=main)](https://github.com/kaz-utashiro/greple-md/actions?workflow=test) [![MetaCPAN Release](https://badge.fury.io/pl/App-Greple-md.svg)](https://metacpan.org/release/App-Greple-md)
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

Patterns are processed in priority order: code block state machine,
inline code protection, HTML comment protection, links with OSC 8
hyperlinks, headings (cumulative), emphasis (bold, italic,
strikethrough), blockquotes, and horizontal rules.

# MODULE OPTIONS

These options are specified before `--` to separate them from
greple options:

    greple -Mmd --mode=dark --cm h1=RD -- file.md

## **--mode**=_MODE_

Set color mode to `light` (default) or `dark`.

    greple -Mmd --mode=dark -- file.md

## **--base-color**=_COLOR_

Override the base color used for headings, bold, links, etc.
Accepts a color name (e.g., `Crimson`, `DarkCyan`) or a
[Term::ANSIColor::Concise](https://metacpan.org/pod/Term%3A%3AANSIColor%3A%3AConcise) color spec.

    greple -Mmd --base-color=Crimson -- file.md

## **--cm** _LABEL_=_SPEC_

Override the color for a specific label.  Color specs follow
[Term::ANSIColor::Concise](https://metacpan.org/pod/Term%3A%3AANSIColor%3A%3AConcise) format and support `sub{...}` function
specs via [Getopt::EX::Colormap](https://metacpan.org/pod/Getopt%3A%3AEX%3A%3AColormap).

    greple -Mmd --cm h1=RD -- file.md

## **--hashed** _LEVEL_=_VALUE_

Add closing hashes to headings (e.g., `### Title` becomes
`### Title ###`).  Can be set per heading level:

    greple -Mmd --hashed h3=1 --hashed h4=1 -- file.md

## **--show** _LABEL_\[=_VALUE_\]

Control which elements are highlighted.

    greple -Mmd --show bold=0 -- file.md          # disable bold
    greple -Mmd --show all= --show h1 -- file.md  # only h1

`--show LABEL=0` or `--show LABEL=` disables the label.
`--show LABEL` or `--show LABEL=1` enables it.
`all` is a special key that sets all labels at once.

# CONFIGURATION

Module parameters can also be set with the `config()` function
in the module declaration:

    greple -Mmd::config(mode=dark,base_color=Crimson) file.md

Nested hash parameters use dot notation:

    greple -Mmd::config(hashed.h3=1,hashed.h4=1) file.md

## OSC 8 Hyperlinks

By default, links are converted to OSC 8 terminal hyperlinks for
clickable URLs in supported terminals.  Disable with:

    greple -Mmd::config(osc8=0) file.md

# COLOR LABELS

The following color labels are available for `--cm` and `--show`:

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

# SEE ALSO

[App::mdee](https://metacpan.org/pod/App%3A%3Amdee) - Markdown viewer using this module

[App::Greple](https://metacpan.org/pod/App%3A%3AGreple)

[Term::ANSIColor::Concise](https://metacpan.org/pod/Term%3A%3AANSIColor%3A%3AConcise)

[Getopt::EX::Colormap](https://metacpan.org/pod/Getopt%3A%3AEX%3A%3AColormap)

[Getopt::EX::Config](https://metacpan.org/pod/Getopt%3A%3AEX%3A%3AConfig)

# AUTHOR

Kazumasa Utashiro

# LICENSE

Copyright 2025-2026 Kazumasa Utashiro.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.
