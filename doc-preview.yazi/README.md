# doc-preview.yazi

Uses [antiword](https://github.com/grobian/antiword) to enable MS Word (version 2, 6, 7, 97, 2000 and 2003) DOC files preview in [yazi](https://github.com/sxyazi/yazi).

## Requirements

- [antiword](https://github.com/grobian/antiword) - It's probably available in your package manager.
- Yazi 26.5.6 or newer

## Installation

Install with:

```sh
ya pkg add lpanebr/yazi-plugins:doc-preview
```

and enable by adding it to your `yazi.toml` config file:

```toml
[plugin]
prepend_previewers = [
    { name = "*.doc", run = "doc-preview"},
]
```

## Disclaimers

- This plugin was derived from [miller.yazi](https://github.com/Reledia/miller.yazi).
- Tested with Yazi 26.5.6
- Since 2026, all parts of this plugin are edited with AI coding tools such as Codex. All changes remain under my supervision and are reviewed and tested by me before release.
