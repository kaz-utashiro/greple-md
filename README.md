
# NAME

App::Greple::md - Greple module for Markdown syntax highlighting

# SYNOPSIS

    greple -Mmd file.md

    greple -Mmd::config(mode=dark) file.md

    greple -Mmd --cm h1=RD file.md

# DESCRIPTION

**App::Greple::md** is a [greple](https://metacpan.org/pod/App%3A%3AGreple) module that provides
Markdown syntax highlighting with cumulative coloring for nested
elements (e.g., links inside headings).

All colorization is handled by the `colorize()` function invoked via
`--print`.  Patterns are processed in priority order: code block
state machine, inline code protection, HTML comment protection, links
with OSC 8 hyperlinks, headings (cumulative), emphasis (bold, italic,
strikethrough), blockquotes, and horizontal rules.

Default colors can be overridden by `--cm LABEL=spec` on the command
line.  The module intercepts `--cm` options for its own labels before
greple processes them.

## Color Labels

The following color labels are available for override:

    code_fence      Fenced code block opening/closing fence
    code_lang       Fenced code block language specifier
    code_body       Fenced code block body
    inline_code     Inline code spans
    comment         HTML comments
    link            Inline links [text](url)
    image           Images ![alt](url)
    image_link      Image links [![alt](img)](url)
    h1 - h6         Headings
    bold            Bold text (**text** or __text__)
    italic          Italic text (*text* or _text_)
    strike          Strikethrough text (~~text~~)
    blockquote      Blockquote marker (>)
    horizontal_rule Horizontal rules (---, ***, ___)

## Dark Mode

Use `mode=dark` configuration to activate dark mode colors:

    greple -Mmd::config(mode=dark) file.md

## OSC 8 Hyperlinks

By default, links are converted to OSC 8 terminal hyperlinks for
clickable URLs in supported terminals.  Disable with `osc8=0`:

    greple -Mmd::config(osc8=0) file.md

# SEE ALSO

[App::Greple](https://metacpan.org/pod/App%3A%3AGreple)

[Getopt::EX::Config](https://metacpan.org/pod/Getopt%3A%3AEX%3A%3AConfig)

[Term::ANSIColor::Concise](https://metacpan.org/pod/Term%3A%3AANSIColor%3A%3AConcise)

# AUTHOR

Kazumasa Utashiro

# LICENSE

Copyright 2025-2026 Kazumasa Utashiro.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.
