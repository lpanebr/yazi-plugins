# docx-preview.yazi

Use [docx2txt](https://docx2txt.sourceforge.net/) to preview DOCX files in [yazi](https://github.com/sxyazi/yazi).

## Requirements

- [docx2txt](https://docx2txt.sourceforge.net/) - It's probably available in your package manager.
- Yazi 26.5.6 or newer

## Installation

Install with:

```sh
ya pkg add lpanebr/yazi-plugins:docx-preview
```

and enable by adding it to your `yazi.toml` config file:

```toml
[plugin]
prepend_previewers = [
    { name = "*.docx", run = "docx-preview" },
]
```

## Disclaimers

- This plugin was derived from [miller.yazi](https://github.com/Reledia/miller.yazi).
- Tested with Yazi 26.5.6
- Since 2026, all parts of this plugin are edited with AI coding tools such as Codex. All changes remain under my supervision and are reviewed and tested by me before release.
