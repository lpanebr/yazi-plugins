# yatline-symlink.yazi

An addon to show symlink target in your [yatline.yazi](https://github.com/imsi32/yatline.yazi)'s status or header line.

https://github.com/user-attachments/assets/f759d0be-c3c3-4708-adeb-7d85d0048099

## Requirements

- yazi version >= 0.3.0
- [yatline.yazi](https://github.com/imsi32/yatline.yazi)

## Installation

```sh
ya pack -a lpanebr/yazi-plugins:yatline-symlink
```

## Usage

> [!IMPORTANT]
> Add this to your `~/.config/yazi/init.lua` after yatline.yazi's initialization.

```lua
require("yatline-symlink"):setup()
```

Then, add it in one of your sections in the yatline configuration using:

```lua
{ type = "coloreds", custom = false, name = "symlink" }
```

**Optional configuration:**

```lua
require("githead"):setup({
  symlink_color = "white"
}
```
