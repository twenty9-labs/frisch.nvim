# Frisch - Nord Theme for Neovim

An arctic, north-bluish clean and elegant Neovim colorscheme based on the [Nord color palette](https://www.nordtheme.com/docs/colors-and-palettes).

## Features

- 🎨 Based on the official Nord color palette
- 🌓 Automatic light/dark variant selection based on `background` setting
- 🎯 Explicit variant selection (nord-dark, nord-light)
- 🌳 Full Treesitter support
- 💡 LSP diagnostics support
- 🔧 Git signs integration

## Installation

### Using [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
  dir = "~/neovim-plugins/frisch",
  lazy = false,
  priority = 1000,
}
```

### Using [packer.nvim](https://github.com/wbthomason/packer.nvim)

```lua
use { "~/neovim-plugins/frisch" }
```

### Using [vim-plug](https://github.com/junegunn/vim-plug)

```vim
Plug '~/neovim-plugins/frisch'
```

## Usage

### Automatic variant selection

The colorscheme will automatically select the appropriate variant based on your `background` setting:

```lua
-- Will use dark variant if background is 'dark', light variant if 'light'
vim.cmd("colorscheme nord")
```

```vim
" VimScript
colorscheme nord
```

### Explicit variant selection

You can also explicitly select a specific variant:

```lua
-- Always use dark variant
vim.cmd("colorscheme nord-dark")

-- Always use light variant
vim.cmd("colorscheme nord-light")
```

```vim
" VimScript
colorscheme nord-dark
" or
colorscheme nord-light
```

### Changing background

You can change the background setting to switch between light and dark variants:

```lua
vim.opt.background = "dark"
vim.cmd("colorscheme nord")

-- Later, switch to light
vim.opt.background = "light"
vim.cmd("colorscheme nord")
```

## Configuration

Currently, the theme works out of the box without additional configuration. A `setup()` function is provided for future configuration options:

```lua
require("frisch").setup({
  -- Future options will go here
})
```

## Color Palette

The Nord palette consists of four named color palettes:

### Polar Night (Dark backgrounds)
- `nord0`: #2e3440
- `nord1`: #3b4252
- `nord2`: #434c5e
- `nord3`: #4c566a

### Snow Storm (Light/neutral colors)
- `nord4`: #d8dee9
- `nord5`: #e5e9f0
- `nord6`: #eceff4

### Frost (Blue accents)
- `nord7`: #8fbcbb
- `nord8`: #88c0d0
- `nord9`: #81a1c1
- `nord10`: #5e81ac

### Aurora (Vibrant colors)
- `nord11`: #bf616a (Red)
- `nord12`: #d08770 (Orange)
- `nord13`: #ebcb8b (Yellow)
- `nord14`: #a3be8c (Green)
- `nord15`: #b48ead (Purple)

## Accessing Colors Programmatically

You can access the Nord color palette in your own Lua configurations:

```lua
local colors = require("frisch.colors")

-- Use individual colors
print(colors.nord0)  -- "#2e3440"

-- Or use color groups
print(colors.polar_night[1])  -- "#2e3440"
print(colors.aurora[1])       -- "#bf616a"
```

## Supported Plugins

- Treesitter
- LSP (native)
- Git Signs
- And more coming soon!

## Behavior Comparison

This theme works similarly to the [modus-themes](https://protesilaos.stavrou.info/emacs/modus-themes):

- `colorscheme nord` → Auto-select based on `background`
- `colorscheme nord-dark` → Explicit dark variant
- `colorscheme nord-light` → Explicit light variant

## License

This project is inspired by the [Nord color palette](https://www.nordtheme.com/) by Arctic Ice Studio.

## Credits

- [Nord Theme](https://www.nordtheme.com/) - Original color palette
- [Arctic Ice Studio](https://github.com/arcticicestudio) - Nord creators
