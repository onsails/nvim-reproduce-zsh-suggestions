set rtp^=./
set packpath=./

packadd lsp-status-nvim
packadd lualine-nvim
packadd nvim-lspconfig

lua require 'reproduce'
