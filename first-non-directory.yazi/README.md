# first-non-directory.yazi

Jump to the first file ignoring directories.

<https://github.com/user-attachments/assets/f759d0be-c3c3-4708-adeb-7d85d0048099>

## Requirements

- Yazi 26.5.6 or newer

## Installation

```sh
ya pkg add lpanebr/yazi-plugins:first-non-directory
```

## Usage

Add this to your `keymap.toml` to set the keymap for the plugin:

```toml
[[mgr.prepend_keymap]]
on   = [ "f", "j" ]
run  = "plugin first-non-directory"
desc = "Jumps to the first file"
```

## Disclaimers

- Tested with Yazi 26.5.6
- Since 2026, all parts of this plugin are edited with AI coding tools such as Codex. All changes remain under my supervision and are reviewed and tested by me before release.
