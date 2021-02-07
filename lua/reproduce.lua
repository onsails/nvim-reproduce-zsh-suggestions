local lspconfig = require'lspconfig'
local util = require'lspconfig/util'
local lsp_status = require'lsp-status'

local on_attach = function(client, bufnr)
	lsp_status.on_attach(client)
end

lspconfig.rust_analyzer.setup({
			-- capabilities = capabilities,
	    on_attach = on_attach,
	    settings = {
	        ["rust-analyzer"] = {
	            cargo = {
	                loadOutDirsFromCheck = true,
	                allFeatures = true
	            },
	            procMacro = {
	                enable = true
	            },
	            checkOnSave = {
	                command = "clippy"
	            },
	            diagnostics = {
	                inactiveCode = false,
	            },
	        }
	    },
	    root_dir = util.root_pattern('Cargo.lock', '.git'),
	})

local lualine = require('lualine')
lualine.status()

lsp_status.register_progress()

local function lsp()
		return require('lsp-status').status()
end

lualine.sections.lualine_c = { lsp }

-- lualine.theme = 'forest_night'
lualine.theme = 'onedark'
