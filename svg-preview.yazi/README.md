# svg-preview.yazi

Uses [Inkscape](https://inkscape.org/) to render SVG files as PNG previews in [Yazi](https://github.com/sxyazi/yazi).

## Requirements

- [Inkscape](https://inkscape.org/) available as `inkscape`.
- Yazi 26.5.6 or newer.

## Installation

Install with:

```sh
ya pkg add lpanebr/yazi-plugins:svg-preview
```

and enable by adding it to your `yazi.toml` config file:

```toml
[plugin]
prepend_preloaders = [
    { mime = "image/svg+xml", run = "svg-preview" },
    { url = "*.svg", run = "svg-preview" },
]

prepend_previewers = [
    { mime = "image/svg+xml", run = "svg-preview" },
    { url = "*.svg", run = "svg-preview" },
]
```

The plugin uses Yazi's native `ya.file_cache(job)` cache slot as the base path and writes a `.png` file next to it, so Inkscape can infer PNG output from the file extension. Existing cache files are reused.

Recent Yazi previewers receive `job` explicitly, so this plugin implements `peek(job)`, `preload(job)`, and `seek(job)`. Older examples using `peek(self)`/`ya.file_cache(self)` are from the previous previewer shape; passing `job` is the current API style.

## Disclaimers

- Tested target: Yazi 26.5.6 or newer.
- Since 2026, all parts of this plugin are edited with AI coding tools such as Codex. All changes remain under my supervision and are reviewed and tested by me before release.
