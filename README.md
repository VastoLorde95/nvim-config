#TODO: Read the following help docs:
# 1. :h insert.txt For shortcuts that can be used inside insert mode.
# 2. :h cmdlint.txt
# 3. :h tips.txt
# 3. :h fzf-tips


How to setup Neovim
===================

Goal: Understand how neovim works so that you can customize and extend it natively in 
Lua.

Key components to understand:

1. How does neovim startup and what files does it source?
2. How do plugins work in neovim?
3. How does the LSP work in neovim?
4. What is a treesitter and how is it useful?

Help is your friend - use `:h query<CTRL>-D` to expand the query to a list of matching
options.


Config Directory Structure
=========================================

See `:h initialization` to learn how nvim starts up.
Run `:lua print(vim.inspect(vim.api.nvim_list_runtime_paths()))` to inspect your 
runtimepath

To learn more about how nvim finds files in the path, see:

`:h runtimepath`
`:h packpath`
`:h package`

While going through these docs, you will probably be curious to print stuff like
`stdpath('config')` - this is available in `:lua vim.fn.stdpath`


Setup your nvim config directory in `~/.config/nvim/` like so

```
.
├── after/
├── init.lua
└── lua/
    ├── maps.lua
    ├── plugins.lua
    └── settings.lua
```

The following files will get sourced automatically:
 - `init.lua`
 - `after/**/*.lua`
The files in the `after` directory will get sourced after all other files have been 
sourced.

The files in the `lua` directory are not sourced automatically, but are available to 
get `require`d in your init.lua file, eg.

```init.lua
require('maps.lua')
require('plugins.lua')
require('settings.lua')
```

Configure tab line numbers
==========================================================

# TODO(apaliwal): Setup tabline and statusline?

`:h tabpagenr()`
`:h setting-tabline`

Install packer.nvim
==========================================================

Install plugin 'wbthomason/packer.nvim' to manage plugins.

To get started, first clone this repository to somewhere on your packpath, e.g.:

`git clone https://github.com/wbthomason/packer.nvim "$env:LOCALAPPDATA\nvim-data\site\pack\packer\start\packer.nvim"`

- How do plugins work in nvim?
`:h package`

- How does require work in nvim/lua?
- Where does nvim look for files to source?
`:h runtimepath`
`:h packpath`


Using packer to change colorscheme.
==========================================================

To install a colorscheme:

Install 'folke/tokyonight.nvim' using packer.

Setup this colorscheme in after/plugin/color.lua


Setting up LSP
==========================================================

Neovim comes with an inbuilt lsp client. See `:h lsp`

We will setup this client and its interaction with the LSP servers through the plugin:
`neovim/nvim-lspconfig` 

- What exactly is lspconfig even doing?

The plugin which provides some APIs to interact with the nvim core LSP client and also 
provides a collection of default configurations to interact with some popular LSP 
servers.

- Install `neovim/nvim-lspconfig` using packer. 
- After installation, you can read the docs at `:h lspconfig`
- Install language servers eg. `pylsp`, `sumneko_lua` - Note that each language server 
  must be installed externally.
- Configure each installed language server through `lspconfig.SERVER_NAME.setup()`, 
  setting up their callbacks like `on_attach`, `capabilities`, etc. See 
  `:h lspconfig-setup` to learn more about how to setup your LSP.
# TODO(apaliwal): Finish setting up LSP keybindings in `after/plugin/lsp.lua`
- See `:h lspconfig-keybindings` for suggested keybinds to use in the `on_attach` 
  section in calls to `setup()`.
- See `:h lsp-buf` for a list of capabilities in the LSP.

# TODO(apaliwal): Learn how to setup pylsp even further - eg, pylint, black, mypy.

Autocomplete
# TODO(apaliwal): Learn how autocomplete would work with LSP:
# TODO(apaliwal): What is omnifunc?
# TODO(apaliwal): How is omnifunc different from the default ctrl-n ctrl-p in ins mode?


Setting up Treesitter
==========================================================

Treesitter provides incremental parsing of buffers to construct syntax trees. A 
"module" can "query" the treesitter syntax tree to implement features such as 
highlighting.

See `:h nvim-treesitter-modules` for a list of available modules.

To setup install the `nvim-treesitter/nvim-treesitter` plugin. All treesitter modules
are disabled out of the box, and should be configured in the init.lua file via a call
to 

`require("nvim-treesitter.configs").setup{}`

Treesitter uses a different parser for every language, which needs to be generated via
tree-sitter-cli from a grammar.js file, then compiled to a .so library that needs to be
placed in neovim's runtimepath (typically under parser/{language}.so). To simplify this,
nvim-treesitter provides commands to automate this process. If the language is already
supported by nvim-treesitter, you can install it with

`:TSInstall <language_to_install>`

This command supports tab expansion. 

You can also get a list of all available languages and their installation status with 
`:TSInstallInfo.` 

To make sure a parser is at the latest compatible version (as specified in
nvim-treesitter's lockfile.json), use :TSUpdate {language}. To update all parsers
unconditionally, use :TSUpdate all or just :TSUpdate.

# TODO(apaliwal): How does it intregrate with LSP?
`:h lsp-vs-treesitter`

# TODO(apaliwal): How to integrate treesitter with the statusline?
